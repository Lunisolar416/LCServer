#include "sqlconnpool.h"
#include <mysql/mysql.h>
#include <unistd.h>
#include <chrono>
#include <cstdlib>
#include <iostream>
#include <memory>
#include <mutex>
#include <thread>

SqlConnPool* SqlConnPool::instance_ = nullptr;
std::mutex SqlConnPool::mutex_;
SqlConnPool::SqlConnPool() : freeCount_(0), isRunning_(true)
{
}
SqlConnPool::~SqlConnPool()
{
    closePool();
    if (instance_)
    {
        delete instance_;
        instance_ = nullptr;
    }
}

SqlConnPool* SqlConnPool::getInstance()
{
    if (instance_ == nullptr)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (instance_ == nullptr)
        {
            instance_ = new SqlConnPool();
        }
    }
    return instance_;
}

void SqlConnPool::Init(const char* host, int port, const char* user, const char* password,
                       const char* dbname, int connSize = 20)
{
    std::lock_guard<std::mutex> lock(mutex_);
    maxConn_ = connSize;
    freeCount_ = connSize;
    dbHost_ = host;
    dbPort_ = port;
    dbUser_ = user;
    dbPass_ = password;
    dbName_ = dbname;

    for (int i = 0; i < connSize; i++)
    {
        MYSQL* conn = mysql_init(nullptr);
        if (!conn || !mysql_real_connect(conn, host, user, password, dbname, port, nullptr, 0))
        {
            std::cerr << "Failed to connect to mysql" << std::endl;

            exit(EXIT_FAILURE);
        }
        connQueue_.push(conn);
    }
    std::thread(&SqlConnPool::heartCheck, this).detach();
}

std::shared_ptr<MYSQL> SqlConnPool::getConn()
{
    std::unique_lock<std::mutex> lock(mutex_);
    if (!cond_.wait_for(lock, std::chrono::seconds(3), [this] { return !connQueue_.empty(); }))
    {
        std::cout << "Sql connection get timeout" << std::endl;

        return nullptr;
    }
    MYSQL* conn = connQueue_.front();
    connQueue_.pop();
    freeCount_--;
    return std::shared_ptr<MYSQL>(conn, [this](MYSQL* conn) {
        std::lock_guard<std::mutex> lock(mutex_);
        connQueue_.push(conn);
        freeCount_++;
        cond_.notify_one();
    });
}

int SqlConnPool::getFreeConnCount()
{
    return freeCount_.load();
}
void SqlConnPool::closePool()
{
    std::lock_guard<std::mutex> lock(mutex_);
    isRunning_ = false;
    cond_.notify_all();
    while (!connQueue_.empty())
    {
        MYSQL* conn = connQueue_.front();
        connQueue_.pop();
        mysql_close(conn);
    }
    mysql_library_end();
}

void SqlConnPool::heartCheck()
{
    while (isRunning_)
    {
        std::this_thread::sleep_for(std::chrono::seconds(10));
        std::lock_guard<std::mutex> lock(mutex_);
        for (size_t i = 0; i < connQueue_.size(); i++)
        {
            MYSQL* conn = connQueue_.front();
            connQueue_.pop();
            if (mysql_ping(conn) != 0)
            {
                std::cerr << "Mysql Connection lost,reconnecting..." << std::endl;

                mysql_close(conn);
                conn = mysql_init(nullptr);
                if (!conn || !mysql_real_connect(conn, dbHost_, dbUser_, dbPass_, dbName_, dbPort_,
                                                 nullptr, 0))
                {
                    std::cerr << "Mysql reconnection failed" << std::endl;

                    continue;
                }
            }
            connQueue_.push(conn);
        }
    }
}

std::string SqlConnPool::mysql_real_escape_string(MYSQL* conn, const std::string& input)
{
    char* buffer = new char[input.length() * 2 + 1];  // worst-case
    ::mysql_real_escape_string(conn, buffer, input.c_str(), input.length());
    std::string result(buffer);
    delete[] buffer;
    return result;
}