#ifndef SINGLETON_H
#define SINGLETON_H

#include <iostream>
#include <memory>
#include <mutex>
template <typename T>
class Singleton
{
   public:
    static std::shared_ptr<T> getInstance()
    {
        std::call_once(flag_, []() { instance_ = std::shared_ptr<T>(new T()); });
        return instance_;
    }
    void printAddress()
    {
        std::cout << "Singleton instance address: " << instance_.get() << std::endl;
    }

   protected:
    Singleton() = default;
    Singleton(const Singleton&) = delete;
    Singleton& operator=(const Singleton&) = delete;

    static std::shared_ptr<T> instance_;
    static std::once_flag flag_;
};
template <typename T>
std::shared_ptr<T> Singleton<T>::instance_ = nullptr;
template <typename T>
std::once_flag Singleton<T>::flag_;
#endif  // SINGLETON_H