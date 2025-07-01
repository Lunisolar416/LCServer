
cmake_minimum_required(VERSION 3.16)
project(GateServer LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 1. 依赖
find_package(Boost REQUIRED COMPONENTS system filesystem)
find_package(Threads REQUIRED)
find_package(Protobuf CONFIG REQUIRED)
find_package(gRPC CONFIG REQUIRED)
find_package(hiredis REQUIRED)
find_package(redis++ REQUIRED)
find_package(OpenSSL REQUIRED)
# ① 先找头文件 <mysql/mysql.h>
find_path(MYSQL_INCLUDE_DIR
          NAMES mysql/mysql.h
          PATH_SUFFIXES include
          DOC "MySQL C API header directory")

# ② 再找 libmysqlclient（Linux）或 libmysql.dll / libmysql.lib（Windows）
if (WIN32)
    # Windows：尝试找 import lib （一般位于 libmysql.lib）
    find_library(MYSQL_LIBRARY
                 NAMES libmysql mysql
                 PATH_SUFFIXES lib
                 DOC "MySQL client library")
else()
    # Linux / macOS
    find_library(MYSQL_LIBRARY
                 NAMES mysqlclient
                 PATH_SUFFIXES lib lib64
                 DOC "MySQL client library")
endif()

# ③ 验证
if (NOT MYSQL_INCLUDE_DIR OR NOT MYSQL_LIBRARY)
    message(FATAL_ERROR
      "Could not find MySQL client development files.\n"
      "  • 确认已安装:  sudo apt install libmysqlclient-dev    # Debian/Ubuntu\n"
      "  • 或在 CMake 命令行加 -DMYSQL_INCLUDE_DIR=... -DMYSQL_LIBRARY=...")
endif()
# 如果 gRPC 没自动把 absl 导出来，就取消下一行注释：

# find_package(absl CONFIG REQUIRED)
# ─── 复制 config.ini ─────────────────────────────────────────────────
# 这行要放在 *add_executable* 之前或之后都行，只要在 configure 阶段执行即可
configure_file(
  ${CMAKE_SOURCE_DIR}/config.ini   # 源文件（项目根目录）
  ${CMAKE_BINARY_DIR}/config.ini   # 目标文件（build 目录）
  COPYONLY                         # 不做占位符替换，纯复制
)
# 2. 源文件
add_executable(GateServer
    main.cc
    AsioIOServicePool.cc
    ConfigMgr.cc
    CServer.cc
    HttpConnection.cc
    LogicSystem.cc
    message.pb.cc
    message.grpc.pb.cc
    VarifyGrpcClient.cc
    redispool.cc
    sqlconnpool.cc
    MysqlDao.cc
    MysqlMgr.cc
    snowflake.cc
)

# 3. 链接
target_link_libraries(GateServer PRIVATE
    gRPC::grpc++          
    protobuf::libprotobuf
    Boost::system Boost::filesystem
    Threads::Threads
    hiredis
    redis++::redis++
    pthread
    OpenSSL::SSL     
    OpenSSL::Crypto  
    ${MYSQL_LIBRARY}
)

# 4. 头文件搜索路径（Boost 已经自动提供；若有自定义 include 可在这里加）
# target_include_directories(GateServer PRIVATE ${CMAKE_SOURCE_DIR}/include)
