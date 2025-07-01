#include "MysqlMgr.h"
#include "MysqlDao.h"

MysqlMgr::MysqlMgr()
{
}

MysqlMgr::~MysqlMgr()
{
}

uint64_t MysqlMgr::RegUser(const std::string& username, const std::string& email,
                           const std::string& password)
{
    return dao_.RegUser(username, email, password);
}