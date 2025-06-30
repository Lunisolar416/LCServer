
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

# 如果 gRPC 没自动把 absl 导出来，就取消下一行注释：
# find_package(absl CONFIG REQUIRED)

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
)

# 4. 头文件搜索路径（Boost 已经自动提供；若有自定义 include 可在这里加）
# target_include_directories(GateServer PRIVATE ${CMAKE_SOURCE_DIR}/include)
