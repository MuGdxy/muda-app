cmake_minimum_required(VERSION 3.20)

project(muda_app LANGUAGES CXX CUDA)
# set MUDA_BUILD_EXAMPLE to OFF for the subdirectory
set(MUDA_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
add_subdirectory("submodules/muda")

set(CMAKE_CUDA_ARCHITECTURES 75)
set(CMAKE_CXX_STANDARD 17)

add_executable(hello_muda)
set_target_properties(hello_muda PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

target_link_libraries(hello_muda PRIVATE muda)

file(GLOB_RECURSE HELLO_MUDA_CU_SOURCE CONFIGURE_DEPENDS "src/*.cu")
target_sources(hello_muda PRIVATE ${HELLO_MUDA_CU_SOURCE})

file(GLOB_RECURSE HELLO_MUDA_CPP_SOURCE CONFIGURE_DEPENDS "src/*.cpp")
target_sources(hello_muda PRIVATE ${HELLO_MUDA_CPP_SOURCE})