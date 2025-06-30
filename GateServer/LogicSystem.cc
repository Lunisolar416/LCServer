#include "LogicSystem.h"

#include <iostream>
#include "HttpConnection.h"
#include "VarifyGrpcClient.h"
#include "message.pb.h"
LogicSystem::LogicSystem()
{
    RegGet("/get_test", [](std::shared_ptr<HttpConnection> connection) {
        beast::ostream(connection->_response.body()) << "receive get_test req " << std::endl;
        int i = 0;
        for (auto& elem : connection->_get_params)
        {
            i++;
            beast::ostream(connection->_response.body())
                << "param" << i << " key is " << elem.first;
            beast::ostream(connection->_response.body())
                << ", "
                << " value is " << elem.second << std::endl;
        }
    });

    RegPost("/get_varifycode", [](std::shared_ptr<HttpConnection> connection) {
        auto body_str = boost::beast::buffers_to_string(connection->_request.body().data());
        std::cout << "receive body is " << body_str << std::endl;
        connection->_response.set(http::field::content_type, "text/json");

        json root;
        try
        {
            json src_root = json::parse(body_str);

            auto email = src_root.value("email", "");  // 安全提取
            std::cout << "email is " << email << std::endl;
            message::GetVarifyResp response = VarifyGrpcClient::getInstance()->GetVarifyCode(email);
            root["error"] = response.error();
            root["email"] = email;
        }
        catch (const json::parse_error& e)
        {
            std::cout << "Failed to parse JSON data: " << e.what() << std::endl;
            root["error"] = ErrorCodes::Error_Json;
        }
        std::string jsonstr = root.dump(4);  // 格式化输出
        beast::ostream(connection->_response.body()) << jsonstr;
        return true;
    });
}
LogicSystem::~LogicSystem()
{
    _post_handlers.clear();
    _get_handlers.clear();
}
void LogicSystem::RegGet(std::string url, HttpHandler handler)
{
    _get_handlers.insert(make_pair(url, handler));
}
void LogicSystem::RegPost(std::string url, HttpHandler handler)
{
    _post_handlers.insert(make_pair(url, handler));
}
bool LogicSystem::HandleGet(std::string path, std::shared_ptr<HttpConnection> con)
{
    if (_get_handlers.find(path) == _get_handlers.end())
    {
        return false;
    }

    _get_handlers[path](con);
    return true;
}
bool LogicSystem::HandlePost(std::string path, std::shared_ptr<HttpConnection> con)
{
    if (_post_handlers.find(path) == _post_handlers.end())
    {
        return false;
    }

    _post_handlers[path](con);
    return true;
}
