# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.27.9/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.27.9/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lunisolar/cpp/LCServer/GateServer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lunisolar/cpp/LCServer/GateServer/build

# Include any dependencies generated for this target.
include CMakeFiles/GateServer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/GateServer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/GateServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/GateServer.dir/flags.make

CMakeFiles/GateServer.dir/main.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/main.cc.o: /home/lunisolar/cpp/LCServer/GateServer/main.cc
CMakeFiles/GateServer.dir/main.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/GateServer.dir/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/main.cc.o -MF CMakeFiles/GateServer.dir/main.cc.o.d -o CMakeFiles/GateServer.dir/main.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/main.cc

CMakeFiles/GateServer.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/main.cc > CMakeFiles/GateServer.dir/main.cc.i

CMakeFiles/GateServer.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/main.cc -o CMakeFiles/GateServer.dir/main.cc.s

CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o: /home/lunisolar/cpp/LCServer/GateServer/AsioIOServicePool.cc
CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o -MF CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o.d -o CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/AsioIOServicePool.cc

CMakeFiles/GateServer.dir/AsioIOServicePool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/AsioIOServicePool.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/AsioIOServicePool.cc > CMakeFiles/GateServer.dir/AsioIOServicePool.cc.i

CMakeFiles/GateServer.dir/AsioIOServicePool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/AsioIOServicePool.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/AsioIOServicePool.cc -o CMakeFiles/GateServer.dir/AsioIOServicePool.cc.s

CMakeFiles/GateServer.dir/ConfigMgr.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/ConfigMgr.cc.o: /home/lunisolar/cpp/LCServer/GateServer/ConfigMgr.cc
CMakeFiles/GateServer.dir/ConfigMgr.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/GateServer.dir/ConfigMgr.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/ConfigMgr.cc.o -MF CMakeFiles/GateServer.dir/ConfigMgr.cc.o.d -o CMakeFiles/GateServer.dir/ConfigMgr.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/ConfigMgr.cc

CMakeFiles/GateServer.dir/ConfigMgr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/ConfigMgr.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/ConfigMgr.cc > CMakeFiles/GateServer.dir/ConfigMgr.cc.i

CMakeFiles/GateServer.dir/ConfigMgr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/ConfigMgr.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/ConfigMgr.cc -o CMakeFiles/GateServer.dir/ConfigMgr.cc.s

CMakeFiles/GateServer.dir/CServer.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/CServer.cc.o: /home/lunisolar/cpp/LCServer/GateServer/CServer.cc
CMakeFiles/GateServer.dir/CServer.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/GateServer.dir/CServer.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/CServer.cc.o -MF CMakeFiles/GateServer.dir/CServer.cc.o.d -o CMakeFiles/GateServer.dir/CServer.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/CServer.cc

CMakeFiles/GateServer.dir/CServer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/CServer.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/CServer.cc > CMakeFiles/GateServer.dir/CServer.cc.i

CMakeFiles/GateServer.dir/CServer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/CServer.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/CServer.cc -o CMakeFiles/GateServer.dir/CServer.cc.s

CMakeFiles/GateServer.dir/HttpConnection.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/HttpConnection.cc.o: /home/lunisolar/cpp/LCServer/GateServer/HttpConnection.cc
CMakeFiles/GateServer.dir/HttpConnection.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/GateServer.dir/HttpConnection.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/HttpConnection.cc.o -MF CMakeFiles/GateServer.dir/HttpConnection.cc.o.d -o CMakeFiles/GateServer.dir/HttpConnection.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/HttpConnection.cc

CMakeFiles/GateServer.dir/HttpConnection.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/HttpConnection.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/HttpConnection.cc > CMakeFiles/GateServer.dir/HttpConnection.cc.i

CMakeFiles/GateServer.dir/HttpConnection.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/HttpConnection.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/HttpConnection.cc -o CMakeFiles/GateServer.dir/HttpConnection.cc.s

CMakeFiles/GateServer.dir/LogicSystem.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/LogicSystem.cc.o: /home/lunisolar/cpp/LCServer/GateServer/LogicSystem.cc
CMakeFiles/GateServer.dir/LogicSystem.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/GateServer.dir/LogicSystem.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/LogicSystem.cc.o -MF CMakeFiles/GateServer.dir/LogicSystem.cc.o.d -o CMakeFiles/GateServer.dir/LogicSystem.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/LogicSystem.cc

CMakeFiles/GateServer.dir/LogicSystem.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/LogicSystem.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/LogicSystem.cc > CMakeFiles/GateServer.dir/LogicSystem.cc.i

CMakeFiles/GateServer.dir/LogicSystem.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/LogicSystem.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/LogicSystem.cc -o CMakeFiles/GateServer.dir/LogicSystem.cc.s

CMakeFiles/GateServer.dir/message.pb.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/message.pb.cc.o: /home/lunisolar/cpp/LCServer/GateServer/message.pb.cc
CMakeFiles/GateServer.dir/message.pb.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/GateServer.dir/message.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/message.pb.cc.o -MF CMakeFiles/GateServer.dir/message.pb.cc.o.d -o CMakeFiles/GateServer.dir/message.pb.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/message.pb.cc

CMakeFiles/GateServer.dir/message.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/message.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/message.pb.cc > CMakeFiles/GateServer.dir/message.pb.cc.i

CMakeFiles/GateServer.dir/message.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/message.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/message.pb.cc -o CMakeFiles/GateServer.dir/message.pb.cc.s

CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: /home/lunisolar/cpp/LCServer/GateServer/message.grpc.pb.cc
CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/GateServer.dir/message.grpc.pb.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/message.grpc.pb.cc.o -MF CMakeFiles/GateServer.dir/message.grpc.pb.cc.o.d -o CMakeFiles/GateServer.dir/message.grpc.pb.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/message.grpc.pb.cc

CMakeFiles/GateServer.dir/message.grpc.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/message.grpc.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/message.grpc.pb.cc > CMakeFiles/GateServer.dir/message.grpc.pb.cc.i

CMakeFiles/GateServer.dir/message.grpc.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/message.grpc.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/message.grpc.pb.cc -o CMakeFiles/GateServer.dir/message.grpc.pb.cc.s

CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o: /home/lunisolar/cpp/LCServer/GateServer/VarifyGrpcClient.cc
CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o -MF CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o.d -o CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/VarifyGrpcClient.cc

CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/VarifyGrpcClient.cc > CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.i

CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/VarifyGrpcClient.cc -o CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.s

CMakeFiles/GateServer.dir/redispool.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/redispool.cc.o: /home/lunisolar/cpp/LCServer/GateServer/redispool.cc
CMakeFiles/GateServer.dir/redispool.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/GateServer.dir/redispool.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/redispool.cc.o -MF CMakeFiles/GateServer.dir/redispool.cc.o.d -o CMakeFiles/GateServer.dir/redispool.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/redispool.cc

CMakeFiles/GateServer.dir/redispool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/redispool.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/redispool.cc > CMakeFiles/GateServer.dir/redispool.cc.i

CMakeFiles/GateServer.dir/redispool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/redispool.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/redispool.cc -o CMakeFiles/GateServer.dir/redispool.cc.s

CMakeFiles/GateServer.dir/sqlconnpool.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/sqlconnpool.cc.o: /home/lunisolar/cpp/LCServer/GateServer/sqlconnpool.cc
CMakeFiles/GateServer.dir/sqlconnpool.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/GateServer.dir/sqlconnpool.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/sqlconnpool.cc.o -MF CMakeFiles/GateServer.dir/sqlconnpool.cc.o.d -o CMakeFiles/GateServer.dir/sqlconnpool.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/sqlconnpool.cc

CMakeFiles/GateServer.dir/sqlconnpool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/sqlconnpool.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/sqlconnpool.cc > CMakeFiles/GateServer.dir/sqlconnpool.cc.i

CMakeFiles/GateServer.dir/sqlconnpool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/sqlconnpool.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/sqlconnpool.cc -o CMakeFiles/GateServer.dir/sqlconnpool.cc.s

CMakeFiles/GateServer.dir/MysqlDao.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/MysqlDao.cc.o: /home/lunisolar/cpp/LCServer/GateServer/MysqlDao.cc
CMakeFiles/GateServer.dir/MysqlDao.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/GateServer.dir/MysqlDao.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/MysqlDao.cc.o -MF CMakeFiles/GateServer.dir/MysqlDao.cc.o.d -o CMakeFiles/GateServer.dir/MysqlDao.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/MysqlDao.cc

CMakeFiles/GateServer.dir/MysqlDao.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/MysqlDao.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/MysqlDao.cc > CMakeFiles/GateServer.dir/MysqlDao.cc.i

CMakeFiles/GateServer.dir/MysqlDao.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/MysqlDao.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/MysqlDao.cc -o CMakeFiles/GateServer.dir/MysqlDao.cc.s

CMakeFiles/GateServer.dir/MysqlMgr.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/MysqlMgr.cc.o: /home/lunisolar/cpp/LCServer/GateServer/MysqlMgr.cc
CMakeFiles/GateServer.dir/MysqlMgr.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/GateServer.dir/MysqlMgr.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/MysqlMgr.cc.o -MF CMakeFiles/GateServer.dir/MysqlMgr.cc.o.d -o CMakeFiles/GateServer.dir/MysqlMgr.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/MysqlMgr.cc

CMakeFiles/GateServer.dir/MysqlMgr.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/MysqlMgr.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/MysqlMgr.cc > CMakeFiles/GateServer.dir/MysqlMgr.cc.i

CMakeFiles/GateServer.dir/MysqlMgr.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/MysqlMgr.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/MysqlMgr.cc -o CMakeFiles/GateServer.dir/MysqlMgr.cc.s

CMakeFiles/GateServer.dir/snowflake.cc.o: CMakeFiles/GateServer.dir/flags.make
CMakeFiles/GateServer.dir/snowflake.cc.o: /home/lunisolar/cpp/LCServer/GateServer/snowflake.cc
CMakeFiles/GateServer.dir/snowflake.cc.o: CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/GateServer.dir/snowflake.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/GateServer.dir/snowflake.cc.o -MF CMakeFiles/GateServer.dir/snowflake.cc.o.d -o CMakeFiles/GateServer.dir/snowflake.cc.o -c /home/lunisolar/cpp/LCServer/GateServer/snowflake.cc

CMakeFiles/GateServer.dir/snowflake.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/snowflake.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lunisolar/cpp/LCServer/GateServer/snowflake.cc > CMakeFiles/GateServer.dir/snowflake.cc.i

CMakeFiles/GateServer.dir/snowflake.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/snowflake.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lunisolar/cpp/LCServer/GateServer/snowflake.cc -o CMakeFiles/GateServer.dir/snowflake.cc.s

# Object files for target GateServer
GateServer_OBJECTS = \
"CMakeFiles/GateServer.dir/main.cc.o" \
"CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o" \
"CMakeFiles/GateServer.dir/ConfigMgr.cc.o" \
"CMakeFiles/GateServer.dir/CServer.cc.o" \
"CMakeFiles/GateServer.dir/HttpConnection.cc.o" \
"CMakeFiles/GateServer.dir/LogicSystem.cc.o" \
"CMakeFiles/GateServer.dir/message.pb.cc.o" \
"CMakeFiles/GateServer.dir/message.grpc.pb.cc.o" \
"CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o" \
"CMakeFiles/GateServer.dir/redispool.cc.o" \
"CMakeFiles/GateServer.dir/sqlconnpool.cc.o" \
"CMakeFiles/GateServer.dir/MysqlDao.cc.o" \
"CMakeFiles/GateServer.dir/MysqlMgr.cc.o" \
"CMakeFiles/GateServer.dir/snowflake.cc.o"

# External object files for target GateServer
GateServer_EXTERNAL_OBJECTS =

GateServer: CMakeFiles/GateServer.dir/main.cc.o
GateServer: CMakeFiles/GateServer.dir/AsioIOServicePool.cc.o
GateServer: CMakeFiles/GateServer.dir/ConfigMgr.cc.o
GateServer: CMakeFiles/GateServer.dir/CServer.cc.o
GateServer: CMakeFiles/GateServer.dir/HttpConnection.cc.o
GateServer: CMakeFiles/GateServer.dir/LogicSystem.cc.o
GateServer: CMakeFiles/GateServer.dir/message.pb.cc.o
GateServer: CMakeFiles/GateServer.dir/message.grpc.pb.cc.o
GateServer: CMakeFiles/GateServer.dir/VarifyGrpcClient.cc.o
GateServer: CMakeFiles/GateServer.dir/redispool.cc.o
GateServer: CMakeFiles/GateServer.dir/sqlconnpool.cc.o
GateServer: CMakeFiles/GateServer.dir/MysqlDao.cc.o
GateServer: CMakeFiles/GateServer.dir/MysqlMgr.cc.o
GateServer: CMakeFiles/GateServer.dir/snowflake.cc.o
GateServer: CMakeFiles/GateServer.dir/build.make
GateServer: /usr/local/lib/libgrpc++.a
GateServer: /usr/local/lib/libprotobuf.a
GateServer: /usr/local/lib/libboost_filesystem.so.1.88.0
GateServer: /usr/local/lib/libredis++.so.1.3.15
GateServer: /usr/lib/x86_64-linux-gnu/libssl.so
GateServer: /usr/lib/x86_64-linux-gnu/libcrypto.so
GateServer: /usr/lib/x86_64-linux-gnu/libmysqlclient.so
GateServer: /usr/local/lib/libabsl_log_internal_check_op.a
GateServer: /usr/local/lib/libabsl_leak_check.a
GateServer: /usr/local/lib/libabsl_die_if_null.a
GateServer: /usr/local/lib/libabsl_log_initialize.a
GateServer: /usr/local/lib/libutf8_validity.a
GateServer: /usr/local/lib/libgrpc.a
GateServer: /usr/lib/x86_64-linux-gnu/libssl.so
GateServer: /usr/lib/x86_64-linux-gnu/libcrypto.so
GateServer: /usr/local/lib/libabsl_statusor.a
GateServer: /usr/local/lib/libupb_json_lib.a
GateServer: /usr/local/lib/libupb_textformat_lib.a
GateServer: /usr/local/lib/libutf8_range_lib.a
GateServer: /usr/local/lib/libupb_message_lib.a
GateServer: /usr/local/lib/libupb_base_lib.a
GateServer: /usr/local/lib/libupb_mem_lib.a
GateServer: /usr/local/lib/libre2.a
GateServer: /usr/lib/x86_64-linux-gnu/libz.so
GateServer: /usr/local/lib/libcares.a
GateServer: /usr/local/lib/libgpr.a
GateServer: /usr/local/lib/libabsl_flags_internal.a
GateServer: /usr/local/lib/libabsl_flags_reflection.a
GateServer: /usr/local/lib/libabsl_raw_hash_set.a
GateServer: /usr/local/lib/libabsl_hashtablez_sampler.a
GateServer: /usr/local/lib/libabsl_flags_config.a
GateServer: /usr/local/lib/libabsl_flags_program_name.a
GateServer: /usr/local/lib/libabsl_flags_private_handle_accessor.a
GateServer: /usr/local/lib/libabsl_flags_commandlineflag.a
GateServer: /usr/local/lib/libabsl_flags_commandlineflag_internal.a
GateServer: /usr/local/lib/libabsl_status.a
GateServer: /usr/local/lib/libabsl_cord.a
GateServer: /usr/local/lib/libabsl_cordz_info.a
GateServer: /usr/local/lib/libabsl_cord_internal.a
GateServer: /usr/local/lib/libabsl_cordz_functions.a
GateServer: /usr/local/lib/libabsl_exponential_biased.a
GateServer: /usr/local/lib/libabsl_cordz_handle.a
GateServer: /usr/local/lib/libabsl_crc_cord_state.a
GateServer: /usr/local/lib/libabsl_crc32c.a
GateServer: /usr/local/lib/libabsl_crc_internal.a
GateServer: /usr/local/lib/libabsl_crc_cpu_detect.a
GateServer: /usr/local/lib/libabsl_log_internal_conditions.a
GateServer: /usr/local/lib/libabsl_log_internal_message.a
GateServer: /usr/local/lib/libabsl_strerror.a
GateServer: /usr/local/lib/libabsl_log_internal_nullguard.a
GateServer: /usr/local/lib/libabsl_examine_stack.a
GateServer: /usr/local/lib/libabsl_log_internal_format.a
GateServer: /usr/local/lib/libabsl_log_internal_proto.a
GateServer: /usr/local/lib/libabsl_log_internal_log_sink_set.a
GateServer: /usr/local/lib/libabsl_log_globals.a
GateServer: /usr/local/lib/libabsl_hash.a
GateServer: /usr/local/lib/libabsl_bad_variant_access.a
GateServer: /usr/local/lib/libabsl_city.a
GateServer: /usr/local/lib/libabsl_low_level_hash.a
GateServer: /usr/local/lib/libabsl_log_internal_globals.a
GateServer: /usr/local/lib/libabsl_log_sink.a
GateServer: /usr/local/lib/libabsl_log_entry.a
GateServer: /usr/local/lib/libabsl_vlog_config_internal.a
GateServer: /usr/local/lib/libabsl_synchronization.a
GateServer: /usr/local/lib/libabsl_stacktrace.a
GateServer: /usr/local/lib/libabsl_symbolize.a
GateServer: /usr/local/lib/libabsl_debugging_internal.a
GateServer: /usr/local/lib/libabsl_demangle_internal.a
GateServer: /usr/local/lib/libabsl_graphcycles_internal.a
GateServer: /usr/local/lib/libabsl_kernel_timeout_internal.a
GateServer: /usr/local/lib/libabsl_time.a
GateServer: /usr/local/lib/libabsl_civil_time.a
GateServer: /usr/local/lib/libabsl_time_zone.a
GateServer: /usr/local/lib/libabsl_malloc_internal.a
GateServer: /usr/local/lib/libabsl_log_internal_fnmatch.a
GateServer: /usr/local/lib/libabsl_flags_marshalling.a
GateServer: /usr/local/lib/libabsl_str_format_internal.a
GateServer: /usr/local/lib/libabsl_random_distributions.a
GateServer: /usr/local/lib/libabsl_random_seed_sequences.a
GateServer: /usr/local/lib/libabsl_random_internal_pool_urbg.a
GateServer: /usr/local/lib/libabsl_random_internal_randen.a
GateServer: /usr/local/lib/libabsl_random_internal_randen_hwaes.a
GateServer: /usr/local/lib/libabsl_random_internal_randen_hwaes_impl.a
GateServer: /usr/local/lib/libabsl_random_internal_randen_slow.a
GateServer: /usr/local/lib/libabsl_random_internal_platform.a
GateServer: /usr/local/lib/libabsl_random_internal_seed_material.a
GateServer: /usr/local/lib/libabsl_bad_optional_access.a
GateServer: /usr/local/lib/libabsl_strings.a
GateServer: /usr/local/lib/libabsl_int128.a
GateServer: /usr/local/lib/libabsl_strings_internal.a
GateServer: /usr/local/lib/libabsl_string_view.a
GateServer: /usr/local/lib/libabsl_base.a
GateServer: /usr/local/lib/libabsl_spinlock_wait.a
GateServer: /usr/local/lib/libabsl_throw_delegate.a
GateServer: /usr/local/lib/libabsl_raw_logging_internal.a
GateServer: /usr/local/lib/libabsl_log_severity.a
GateServer: /usr/local/lib/libabsl_random_seed_gen_exception.a
GateServer: /usr/local/lib/libaddress_sorting.a
GateServer: /usr/local/lib/libboost_system.so.1.88.0
GateServer: /usr/local/lib/libboost_atomic.so.1.88.0
GateServer: /usr/local/lib/libhiredis.so.1.3.0
GateServer: CMakeFiles/GateServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX executable GateServer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GateServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/GateServer.dir/build: GateServer
.PHONY : CMakeFiles/GateServer.dir/build

CMakeFiles/GateServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/GateServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/GateServer.dir/clean

CMakeFiles/GateServer.dir/depend:
	cd /home/lunisolar/cpp/LCServer/GateServer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lunisolar/cpp/LCServer/GateServer /home/lunisolar/cpp/LCServer/GateServer /home/lunisolar/cpp/LCServer/GateServer/build /home/lunisolar/cpp/LCServer/GateServer/build /home/lunisolar/cpp/LCServer/GateServer/build/CMakeFiles/GateServer.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/GateServer.dir/depend

