#include "snowflake.h"

Snowflake::Snowflake(uint8_t datacenter_id, uint8_t machine_id)
    : datacenter_id_(datacenter_id), machine_id_(machine_id), sequence_(0), last_timestamp_(0)
{
    if (datacenter_id_ > max_datacenter_id_)
        throw std::runtime_error("datacenter_id exceeds max value");

    if (machine_id_ > max_machine_id_)
        throw std::runtime_error("machine_id exceeds max value");
}

uint64_t Snowflake::current_time_millis() const
{
    using namespace std::chrono;
    auto now = system_clock::now();
    return duration_cast<milliseconds>(now.time_since_epoch()).count();
}
uint64_t Snowflake::wait_next_millis(uint64_t last_timestamp) const
{
    uint64_t timestamp = current_time_millis();
    // 这里加点睡眠避免忙等待过于耗CPU
    while (timestamp <= last_timestamp)
    {
        std::this_thread::sleep_for(std::chrono::microseconds(100));
        timestamp = current_time_millis();
    }
    return timestamp;
}
uint64_t Snowflake::next_id()
{
    std::lock_guard<std::mutex> lock(mutex_);
    uint64_t timestamp = current_time_millis();
    if (timestamp < last_timestamp_)
    {
        throw std::runtime_error("Clock moved backwards. Refusing to generate id");
    }
    if (timestamp == last_timestamp_)
    {
        // 同一毫秒内，序列号自增
        sequence_ = (sequence_ + 1) & sequence_mask_;
        if (sequence_ == 0)
        {
            // 序列号用完，等待下一毫秒
            timestamp = wait_next_millis(last_timestamp_);
        }
    }
    else
    {
        // 不同毫秒，序列号重置
        sequence_ = 0;
    }
    last_timestamp_ = timestamp;

    uint64_t id = ((timestamp - twepoch_) << timestamp_left_shift_) |
                  (static_cast<uint64_t>(datacenter_id_) << datacenter_id_shift_) |
                  (static_cast<uint64_t>(machine_id_) << machine_id_shift_) | sequence_;
    return id;
}