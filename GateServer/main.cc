#include "CServer.h"
#include "MysqlMgr.h"
#include "const.h"
#include "redispool.h"
#include "snowflake.h"
int main()
{
    try
    {
        // 初始化redis
        RedisPool::getInstance()->init("tcp://127.0.0.1:6379", 10);
        // 初始化雪花算法
        Snowflake::getInstance(1, 1);
        unsigned short port = static_cast<unsigned short>(8080);
        net::io_context ioc{1};
        boost::asio::signal_set signals(ioc, SIGINT, SIGTERM);
        signals.async_wait([&ioc](const boost::system::error_code& error, int signal_number) {
            if (error)
            {
                return;
            }
            ioc.stop();
        });
        std::make_shared<CServer>(ioc, port)->start();
        ioc.run();
    }
    catch (std::exception const& e)
    {
        std::cerr << "Error: " << e.what() << std::endl;
        return EXIT_FAILURE;
    }
}