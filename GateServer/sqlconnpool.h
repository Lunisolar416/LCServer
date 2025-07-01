#ifndef SQLCONNPOOL_H_
#define SQLCONNPOOL_H_

#include <mysql/mysql.h>
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <memory>
#include <mutex>
#include <queue>
#include <string>
class SqlConnPool
{
   public:
    static SqlConnPool* getInstance();
    void Init(const char* host, int port, const char* user, const char* pwd, const char* dbName,
              int connSize);
    std::shared_ptr<MYSQL> getConn();
    void closePool();
    int getFreeConnCount();
    std::string mysql_real_escape_string(MYSQL* conn, const std::string& input);

   private:
    SqlConnPool();
    ~SqlConnPool();

    void heartCheck();

    static SqlConnPool* instance_;
    static std::mutex mutex_;
    std::queue<MYSQL*> connQueue_;

    std::condition_variable cond_;
    std::atomic<int> maxConn_;
    std::atomic<int> freeCount_;
    std::atomic<bool> isRunning_;

    const char* dbHost_;
    int dbPort_;
    const char* dbUser_;
    const char* dbPass_;
    const char* dbName_;
};

#endif  // SQLCONNPOOL_H_