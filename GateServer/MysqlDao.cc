#include "MysqlDao.h"
#include <openssl/evp.h>
#include <openssl/rand.h>
#include <openssl/sha.h>
#include <iomanip>
#include <sstream>
#include "ConfigMgr.h"
#include "snowflake.h"
#include "sqlconnpool.h"
// 函数：将字节数组转换为十六进制字符串
std::string bytesToHex(const unsigned char* bytes, size_t len)
{
    std::stringstream ss;
    for (size_t i = 0; i < len; ++i)
    {
        ss << std::hex << std::setw(2) << std::setfill('0') << (int) bytes[i];
    }
    return ss.str();
}

// 函数：生成随机盐值
std::string generateSalt(size_t length)
{
    unsigned char salt[length];
    RAND_bytes(salt, length);  // 使用 OpenSSL 生成随机盐值
    return bytesToHex(salt, length);
}

// 函数：计算 SHA-256 哈希值
std::string sha256(const std::string& input)
{
    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hashLen;

    EVP_MD_CTX* ctx = EVP_MD_CTX_new();
    if (!ctx)
    {
        throw std::runtime_error("Failed to create EVP_MD_CTX");
    }

    if (1 != EVP_DigestInit_ex(ctx, EVP_sha256(), nullptr))
    {
        EVP_MD_CTX_free(ctx);
        throw std::runtime_error("Failed to initialize digest");
    }

    if (1 != EVP_DigestUpdate(ctx, input.c_str(), input.size()))
    {
        EVP_MD_CTX_free(ctx);
        throw std::runtime_error("Failed to update digest");
    }

    if (1 != EVP_DigestFinal_ex(ctx, hash, &hashLen))
    {
        EVP_MD_CTX_free(ctx);
        throw std::runtime_error("Failed to finalize digest");
    }

    EVP_MD_CTX_free(ctx);

    return bytesToHex(hash, hashLen);
}

// 函数：计算带盐值的 SHA-256 哈希值
std::string hashPasswordWithSalt(const std::string& password, const std::string& salt)
{
    std::string saltedPassword = password + salt;
    return sha256(saltedPassword);
}

MysqlDao::MysqlDao()
{
    auto& cfg = ConfigMgr::Inst();
    const auto& host = cfg["Mysql"]["Host"];
    const auto& port = cfg["Mysql"]["Port"];
    const auto& user = cfg["Mysql"]["User"];
    const auto& passwd = cfg["Mysql"]["Password"];
    const auto& db = cfg["Mysql"]["dbName"];
    std::cout << "host: " << host << " port: " << port << " user: " << user << " passwd: " << passwd
              << " db: " << db << std::endl;
    SqlConnPool::getInstance()->Init(host.c_str(), std::stoi(port), user.c_str(), passwd.c_str(),
                                     db.c_str(), 20);
}
MysqlDao::~MysqlDao()
{
}

uint64_t MysqlDao::RegUser(const std::string& username, const std::string& email,
                           const std::string& password)
{
    std::cout << "[LOG_INFO] mysqldao reguser" << std::endl;
    std::string salt = generateSalt(16);
    std::string encryptedPassword = hashPasswordWithSalt(password, salt);
    std::cout << "username: " << username << " salt: " << salt
              << " encryptedPassword: " << encryptedPassword << std::endl;
    auto conn = SqlConnPool::getInstance()->getConn();
    if (!conn)
    {
        std::cerr << "Can't get database connection" << std::endl;
        return 0;  // 0 表示失败
    }

    // 查询用户名/邮箱是否重复
    std::string check_sql =
        "SELECT COUNT(*) FROM user WHERE name = '" + username + "' OR email = '" + email + "'";
    if (mysql_query(conn.get(), check_sql.c_str()) != 0)
    {
        std::cerr << "Query Error: " << mysql_error(conn.get()) << std::endl;
        return 0;
    }

    MYSQL_RES* result = mysql_store_result(conn.get());
    if (!result)
    {
        std::cerr << "Result Error: " << mysql_error(conn.get()) << std::endl;
        return 0;
    }

    MYSQL_ROW row = mysql_fetch_row(result);
    if (row && std::stoi(row[0]) > 0)
    {
        std::cerr << "Username or email already exists." << std::endl;
        mysql_free_result(result);
        return 0;
    }
    mysql_free_result(result);

    // 生成 uid
    uint64_t uid = Snowflake::getInstance(1, 1)->next_id();

    // 插入语句（简单拼接方式；生产建议改为 prepared statement）
    std::string insert_sql = "INSERT INTO user(uid, name, email, pwd, salt) VALUES(" +
                             std::to_string(uid) + ", '" + username + "', '" + email + "', '" +
                             encryptedPassword + "', '" + salt + "')";

    if (mysql_query(conn.get(), insert_sql.c_str()) != 0)
    {
        std::cerr << "Insert Error: " << mysql_error(conn.get()) << std::endl;
        return 0;
    }

    return uid;  // 返回生成的用户ID
}
