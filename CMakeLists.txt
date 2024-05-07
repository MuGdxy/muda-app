cmake_minimum_required(VERSION 3.20)

project(muda_app LANGUAGES CXX CUDA)
# set MUDA_BUILD_EXAMPLE to OFF for the subdirectory
set(MUDA_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
add_subdirectory("submodules/muda")

set(CMAKE_CUDA_ARCHITECTURES 75)
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(examples)