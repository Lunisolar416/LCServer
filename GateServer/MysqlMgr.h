#ifndef _MYSQLMGR_H_
#define _MYSQLMGR_H_
#include "MysqlDao.h"
#include "singleton.h"
class MysqlMgr : public Singleton<MysqlMgr>
{
    friend class Singleton<MysqlMgr>;

   public:
    ~MysqlMgr();
    uint64_t RegUser(const std::string& username, const std::string& email,
                     const std::string& password);

   private:
    MysqlMgr();
    MysqlDao dao_;
};

#endif  // _MYSQLMGR_H_