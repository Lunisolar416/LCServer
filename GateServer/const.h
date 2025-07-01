#ifndef CONST_H
#define CONST_H
#include <boost/asio.hpp>
#include <boost/beast/core.hpp>
#include <boost/beast/http.hpp>
#include <functional>
#include <iostream>
#include <map>
#include <memory>
#include <nlohmann/json.hpp>
#include "MysqlMgr.h"
#include "redispool.h"
#include "snowflake.h"
#include "sqlconnpool.h"
namespace beast = boost::beast;    // from <boost/beast.hpp>
namespace http = beast::http;      // from <boost/beast/http.hpp>
namespace net = boost::asio;       // from <boost/asio.hpp>
using tcp = boost::asio::ip::tcp;  // from <boost/asio/ip/tcp.hpp>
using json = nlohmann::json;
enum ErrorCodes
{
    Success = 0,
    Error_Json = 1001,       // Json解析错误
    RPCFailed = 1002,        // RPC请求错误
    VarifyExpired = 1003,    // 验证码过期
    VarifyFailed = 1004,     // 验证码错误
    UserExist = 1005,        // 用户已存在
    UserNotExist = 1006,     // 用户不存在
    UserOrPassError = 1007,  // 用户名或密码错误
    EmailNotMatch = 1008,    // 邮箱不匹配
};

#endif  // CONST_H