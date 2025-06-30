#pragma once

#include <sw/redis++/redis++.h>
#include <chrono>
#include <condition_variable>
#include <memory>
#include <mutex>
#include <queue>
#include <string>
#include "singleton.h"

class RedisPool : public Singleton<RedisPool>
{
    friend class Singleton<RedisPool>;  // 允许 Singleton 调用 RedisPool 的构造函数

   public:
    void init(const std::string& uri, size_t poolSize, bool allowExpand = false);
    std::shared_ptr<sw::redis::Redis> getConnection(int timeoutMs = 5000);
    void releaseConnection(std::shared_ptr<sw::redis::Redis> conn);

   private:
    struct RedisDeleter
    {
        void operator()(sw::redis::Redis* conn);
    };

    std::string redisURI_;
    size_t maxSize_ = 0;
    size_t currentSize_ = 0;
    bool allowExpand_ = false;

    std::queue<std::shared_ptr<sw::redis::Redis>> pool_;
    std::mutex mutex_;
    std::condition_variable cond_;
};
