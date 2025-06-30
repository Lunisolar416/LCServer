#include "CServer.h"
#include <boost/asio/io_context.hpp>
#include <boost/beast/core/error.hpp>
#include <exception>
#include "AsioIOServicePool.h"
#include "HttpConnection.h"
CServer::CServer(net::io_context& ioc, unsigned short& port)
    : acceptor_(ioc, tcp::endpoint(tcp::v4(), port)), ioc_(ioc), socket_(ioc)
{
}

void CServer::start()
{
    auto self = shared_from_this();
    auto& io_context = AsioIOServicePool::getInstance()->GetIOService();
    std::shared_ptr<HttpConnection> new_con = std::make_shared<HttpConnection>(io_context);
    acceptor_.async_accept(new_con->GetSocket(), [self, new_con](beast::error_code ec) {
        try
        {
            // 出错则放弃该链接，等待新连接
            if (ec)
            {
                self->start();
                return;
            }

            // 处理新连接
            new_con->Start();
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