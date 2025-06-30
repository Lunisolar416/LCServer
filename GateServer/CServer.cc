#include "CServer.h"
#include <boost/asio/io_context.hpp>
#include <boost/beast/core/error.hpp>
#include <exception>
#include "HttpConnection.h"
CServer::CServer(net::io_context& ioc, unsigned short& port)
    : acceptor_(ioc, tcp::endpoint(tcp::v4(), port)), ioc_(ioc), socket_(ioc)
{
}

void CServer::start()
{
    auto self = shared_from_this();
    acceptor_.async_accept(
        socket_,
        [self](beast::error_code ec)
        {
            try
            {
                // 出错则放弃该链接，等待新连接
                if (ec)
                {
                    self->start();
                    return;
                }

                // 处理新连接
                std::make_shared<HttpConnection>(std::move(self->socket_))->Start();
                // 继续监听
                self->start();
            }
            catch (std::exception& e)
            {
                std::cerr << "Error :" << e.what() << std::endl;
                self->start();
            }
        });
}