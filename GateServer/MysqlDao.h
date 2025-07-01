#ifndef _MYSQLDAO_H_
#define _MYSQLDAO_H_
#include <memory>
#include <string>
#include "sqlconnpool.h"
class MysqlDao
{
   public:
    MysqlDao();
    ~MysqlDao();
    uint64_t RegUser(const std::string& username, const std::string& email,
                     const std::string& password);
};

#endif  // _MYSQLDAO_H_