cmake_minimum_required(VERSION 2.8)
project(adnroidtest)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

add_subdirectory(android)
add_subdirectory(src)
