cmake_minimum_required(VERSION 3.20)

project(muda_app LANGUAGES CXX CUDA)
# set MUDA_BUILD_EXAMPLE to OFF for the subdirectory
set(MUDA_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
add_subdirectory("submodules/muda")

set(CMAKE_CUDA_ARCHITECTURES 75)
set(CMAKE_CXX_STANDARD 17)

file(GLOB_RECURSE SOURCES "src/*.cpp" "src/*.cu" "src/*.h")
add_executable(hello_muda ${SOURCES})

target_link_libraries(hello_muda PRIVATE muda)

set_target_properties(hello_muda PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
