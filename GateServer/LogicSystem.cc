#include "LogicSystem.h"

#include <boost/beast/core/buffers_to_string.hpp>
#include <iostream>
#include <optional>
#include "HttpConnection.h"
#include "MysqlMgr.h"
#include "VarifyGrpcClient.h"
#include "const.h"
#include "message.pb.h"
#include "redispool.h"
LogicSystem::LogicSystem()
{
    RegGet("/get_test", [](std::shared_ptr<HttpConnection> connection) {
        beast::ostream(connection->_response.body()) << "receive get_test req " << std::endl;
        int i = 0;
        for (auto& elem : connection->_get_params)
        {
            i++;
            beast::ostream(connection->_response.body())
                << "param" << i << " key is " << elem.first;
            beast::ostream(connection->_response.body())
                << ", "
                << " value is " << elem.second << std::endl;
        }
    });

    RegPost("/get_varifycode", [](std::shared_ptr<HttpConnection> connection) {
        auto body_str = boost::beast::buffers_to_string(connection->_request.body().data());
        std::cout << "receive body is " << body_str << std::endl;
        connection->_response.set(http::field::content_type, "text/json");

        json root;
        try
        {
            json src_root = json::parse(body_str);

            auto email = src_root.value("email", "");  // 安全提取
            std::cout << "email is " << email << std::endl;
            message::GetVarifyResp response = VarifyGrpcClient::getInstance()->GetVarifyCode(email);
            std::cout << "response error is " << response.error() << std::endl;
            root["error"] = response.error();
            root["email"] = email;
        }
        catch (const json::parse_error& e)
        {
            std::cout << "Failed to parse JSON data: " << e.what() << std::endl;
            root["error"] = ErrorCodes::Error_Json;
        }
        std::string jsonstr = root.dump(4);  // 格式化输出
        beast::ostream(connection->_response.body()) << jsonstr;
        return true;
    });

    RegPost("/user_register",
            std::bind(&LogicSystem::handlerRegisterUser, this, std::placeholders::_1));
}

void LogicSystem::initFuncs()
{
    // 处理系统功能
    // 获取验证码
    RegPost("/get_varifycode",
            std::bind(&LogicSystem::handlerGetVarifyCode, this, std::placeholders::_1));

    // 用户注册
    RegPost("/user_register",
            std::bind(&LogicSystem::handlerRegisterUser, this, std::placeholders::_1));
    //用户登陆
}
bool LogicSystem::handlerGetVarifyCode(std::shared_ptr<HttpConnection> connection)
{
    // 处理获取验证码的逻辑
    // 这里可以调用 VarifyGrpcClient 来获取验证码
    // 并将结果写入 conn->_response.body()
    auto body_str = boost::beast::buffers_to_string(connection->_request.body().data());
    std::cout << "receive body is " << body_str << std::endl;
    connection->_response.set(http::field::content_type, "text/json");

    json root;
    try
    {
        json src_root = json::parse(body_str);

        auto email = src_root.value("email", "");  // 安全提取
        std::cout << "email is " << email << std::endl;
        message::GetVarifyResp response = VarifyGrpcClient::getInstance()->GetVarifyCode(email);
        root["error"] = response.error();
        root["email"] = email;
    }
    catch (const json::parse_error& e)
    {
        std::cout << "Failed to parse JSON data: " << e.what() << std::endl;
        root["error"] = ErrorCodes::Error_Json;
    }
    std::string jsonstr = root.dump(4);  // 格式化输出
    beast::ostream(connection->_response.body()) << jsonstr;
    return true;
}
bool LogicSystem::handlerRegisterUser(std::shared_ptr<HttpConnection> connection)
{
    std::cout << "register func has active" << std::endl;
    // 处理用户注册的逻辑
    // 解析http
    auto body_str = boost::beast::buffers_to_string(connection->_request.body().data());
    std::cout << "receive body is " << body_str << std::endl;
    connection->_response.set(http::field::content_type, "text/json");
    json root;
    try
    {
        json src_root = json::parse(body_str);
        auto username = src_root.value("username", "");
        auto password = src_root.value("password", "");
        auto email = src_root.value("email", "");
        auto varifycode = src_root.value("varifycode", "");

        // 先判断验证码是否正确
        auto redis_conn = RedisPool::getInstance()->getConnection();
        if (!redis_conn)
        {
            // redis 连接失败
            std::cerr << "redis connect failed" << std::endl;
            root["error"] = ErrorCodes::RPCFailed;
            std::string jsonstr = root.dump(4);
            beast::ostream(connection->_response.body()) << jsonstr;
            return true;
        }
        std::optional<std::string> confirmVarifyCode = redis_conn->get("code_" + email);

        if (!confirmVarifyCode.has_value())
        {
            // 验证码过期或者不存在
            std::cerr << "varifycode expired or not exist" << std::endl;
            root["error"] = ErrorCodes::VarifyExpired;
            std::string jsonstr = root.dump(4);
            beast::ostream(connection->_response.body()) << jsonstr;
            return true;
        }

        if (varifycode != confirmVarifyCode.value())
        {
            // 验证码错误
            root["error"] = ErrorCodes::VarifyFailed;
            std::string jsonstr = root.dump(4);
            beast::ostream(connection->_response.body()) << jsonstr;
            return true;
        }
        std::cout << "confirmVarifyCode is " << confirmVarifyCode.value() << std::endl;
        // 验证码正确，开始注册
        // 先判断用户是否已经存在
        uint64_t uid = MysqlMgr::getInstance()->RegUser(username, email, password);
        if (uid == 0)
        {
            std::cerr << "user or email already exist" << std::endl;
            root["error"] = ErrorCodes::UserExist;
            std::string jsonstr = root.dump(4);
            beast::ostream(connection->_response.body()) << jsonstr;
            return true;
        }

        std::cout << "register success, uid is " << uid << std::endl;

        root["error"] = 0;
        root["uid"] = uid;
        root["email"] = email;
        root["username"] = username;
        root["password"] = password;
        root["varifycode"] = varifycode;
        std::string json_str = root.dump(4);
        beast::ostream(connection->_response.body()) << json_str;
        return true;
    }
    catch (const json::parse_error& e)
    {
        std::cout << "Failed to parse JSON data: " << e.what() << std::endl;
        root["error"] = ErrorCodes::Error_Json;
        std::string jsonstr = root.dump(4);
        beast::ostream(connection->_response.body()) << jsonstr;
        return true;
    }
}
LogicSystem::~LogicSystem()
{
    _post_handlers.clear();
    _get_handlers.clear();
}
void LogicSystem::RegGet(std::string url, HttpHandler handler)
{
    _get_handlers.insert(make_pair(url, handler));
}
void LogicSystem::RegPost(std::string url, HttpHandler handler)
{
    _post_handlers.insert(make_pair(url, handler));
}
bool LogicSystem::HandleGet(std::string path, std::shared_ptr<HttpConnection> con)
{
    if (_get_handlers.find(path) == _get_handlers.end())
    {
        return false;
    }

    _get_handlers[path](con);
    return true;
}
bool LogicSystem::HandlePost(std::string path, std::shared_ptr<HttpConnection> con)
{
    if (_post_handlers.find(path) == _post_handlers.end())
    {
        return false;
    }

    _post_handlers[path](con);
    return true;
}
