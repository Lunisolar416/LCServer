#ifndef SNOWFLAKE_H
#define SNOWFLAKE_H

#include <chrono>
#include <cstdint>
#include <mutex>
#include <stdexcept>
#include <thread>
#include "singleton.h"
class Snowflake : public Singleton<Snowflake>
{
    friend class Singleton<Snowflake>;

   public:
    uint64_t next_id();

   private:
    Snowflake(uint8_t datacenter_id, uint8_t machine_id);
    // 获取当前时间（毫秒）基于系统时钟
    uint64_t current_time_millis() const;

    // 等待直到下一毫秒
    uint64_t wait_next_millis(uint64_t last_timestamp) const;

   private:
    // 起始时间戳（2021-01-01 00:00:00 UTC）
    static constexpr uint64_t twepoch_ = 1609459200000ULL;

    // 机器ID和数据中心ID
    const uint8_t datacenter_id_;
    const uint8_t machine_id_;

    // 序列号和上次时间戳
    uint16_t sequence_;
    uint64_t last_timestamp_;

    // 各部分位数定义
    static constexpr uint8_t datacenter_id_bits_ = 5;
    static constexpr uint8_t machine_id_bits_ = 5;
    static constexpr uint8_t sequence_bits_ = 12;

    // 最大取值
    static constexpr uint8_t max_datacenter_id_ = (1 << datacenter_id_bits_) - 1;
    static constexpr uint8_t max_machine_id_ = (1 << machine_id_bits_) - 1;
    static constexpr uint16_t sequence_mask_ = (1 << sequence_bits_) - 1;

    // 各部分左移位数
    static constexpr uint8_t machine_id_shift_ = sequence_bits_;
    static constexpr uint8_t datacenter_id_shift_ = machine_id_bits_ + machine_id_shift_;
    static constexpr uint8_t timestamp_left_shift_ = datacenter_id_bits_ + datacenter_id_shift_;

    mutable std::mutex mutex_;
};

#endif  // SNOWFLAKE_H