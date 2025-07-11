#ifndef LOGICSYSTEM_H
#define LOGICSYSTEM_H

#include "const.h"
#include "singleton.h"
class HttpConnection;
typedef std::function<void(std::shared_ptr<HttpConnection>)> HttpHandler;
class LogicSystem : public Singleton<LogicSystem>
{
    friend class Singleton<LogicSystem>;

   public:
    ~LogicSystem();
    bool HandleGet(std::string, std::shared_ptr<HttpConnection>);
    bool HandlePost(std::string path, std::shared_ptr<HttpConnection> con);
    void RegGet(std::string, HttpHandler handler);
    void RegPost(std::string url, HttpHandler handler);

   private:
    // funcs
    // get varify code
    bool handlerGetVarifyCode(std::shared_ptr<HttpConnection> conn);
    // register user
    bool handlerRegisterUser(std::shared_ptr<HttpConnection> conn);

   private:
    LogicSystem();
    void initFuncs();
    std::map<std::string, HttpHandler> _post_handlers;
    std::map<std::string, HttpHandler> _get_handlers;
};

#endif  // LOGICSYSTEM_H