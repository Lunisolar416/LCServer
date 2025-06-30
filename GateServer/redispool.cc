#include "redispool.h"
#include <iostream>

void RedisPool::init(const std::string& uri, size_t poolSize, bool allowExpand)
{
    std::unique_lock<std::mutex> lock(mutex_);

    // if (currentSize_ > 0)
    // {
    //     throw std::runtime_error("RedisPool has already been initialized.");
    // }

    redisURI_ = uri;
    maxSize_ = poolSize;
    allowExpand_ = allowExpand;
    currentSize_ = 0;

    for (size_t i = 0; i < poolSize; ++i)
    {
        try
        {
            auto conn = std::make_unique<sw::redis::Redis>(redisURI_);
            pool_.push(std::move(conn));
            ++currentSize_;
        }
        catch (const sw::redis::Error& e)
        {
            std::cerr << "Failed to create Redis connection: " << e.what() << std::endl;
            throw;
        }
    }
}

std::shared_ptr<sw::redis::Redis> RedisPool::getConnection(int timeoutMs)
{
    std::unique_lock<std::mutex> locker(mutex_);

    if (!cond_.wait_for(locker, std::chrono::milliseconds(timeoutMs),
                        [this]() { return !pool_.empty(); }))
    {
        if (allowExpand_ && currentSize_ < maxSize_)
        {
            try
            {
                auto conn = std::make_unique<sw::redis::Redis>(redisURI_);
                ++currentSize_;
                return std::shared_ptr<sw::redis::Redis>(conn.release(), RedisDeleter());
            }
            catch (const sw::redis::Error& e)
            {
                std::cerr << "Failed to expand Redis connection: " << e.what() << std::endl;
                return nullptr;
            }
        }
        return nullptr;
    }

    auto conn = std::move(pool_.front());
    pool_.pop();
    return conn;
}

void RedisPool::releaseConnection(std::shared_ptr<sw::redis::Redis> conn)
{
    if (!conn)
        return;

    std::lock_guard<std::mutex> locker(mutex_);
    pool_.push(conn);
    cond_.notify_one();
}

void RedisPool::RedisDeleter::operator()(sw::redis::Redis* conn)
{
    if (!conn)
        return;

    try
    {
        conn->ping();
        RedisPool::getInstance()->releaseConnection(std::unique_ptr<sw::redis::Redis>(conn));
    }
    catch (const sw::redis::Error& e)
    {
        std::cerr << "Redis connection unhealthy, discarding: " << e.what() << std::endl;
        delete conn;
    }
}
