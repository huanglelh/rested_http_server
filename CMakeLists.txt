cmake_minimum_required(VERSION 3.14)
project(rested_http_server)


option( BUILD_SSL      "Build secure socket layer support."  OFF )


set( INCLUDE_DIR "${PROJECT_SOURCE_DIR}/source" )

set( SOURCE_DIR  "${PROJECT_SOURCE_DIR}/source/corvusoft/restbed" )

set(CMAKE_CXX_STANDARD 14)


file( GLOB_RECURSE MANIFEST "${SOURCE_DIR}/*.cpp" )

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake" )


find_package( asio REQUIRED )
if ( BUILD_SSL )
    find_package( openssl REQUIRED )
endif ( )

include_directories( ${INCLUDE_DIR} SYSTEM ${asio_INCLUDE}  ${ssl_INCLUDE} )


add_executable(rested_http_server main.cpp ${MANIFEST})

if(MINGW)
    target_link_libraries(rested_http_server ws2_32 wsock32)
endif()