cmake_minimum_required(VERSION 3.20)

project(muda_app LANGUAGES CXX CUDA)
# set MUDA_BUILD_EXAMPLE to OFF for the subdirectory
set(MUDA_BUILD_EXAMPLE OFF CACHE BOOL "" FORCE)
add_subdirectory("submodules/muda")

set(CMAKE_CUDA_ARCHITECTURES 75)
set(CMAKE_CXX_STANDARD 17)

find_package(Eigen3 REQUIRED)

file(GLOB CU_SOURCE CONFIGURE_DEPENDS "src/*.cu")
file(GLOB_RECURSE HEADER_FILES CONFIGURE_DEPENDS "src/*.h" "src/*.hpp" "src/*.cuh")
set(COMMON_SOURCE 
    "src/main.cpp"
    "src/program/program.cu"
)

# for every .cu file in "./src", create a target
foreach(CU_FILE ${CU_SOURCE})
    get_filename_component(FILE_NAME ${CU_FILE} NAME)
    string(REPLACE ".cu" "" TARGET_NAME ${FILE_NAME})
    add_executable(${TARGET_NAME})
    target_sources(${TARGET_NAME} PRIVATE ${CU_FILE} ${COMMON_SOURCE} ${HEADER_FILES})
    set_target_properties(${TARGET_NAME} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
    target_link_libraries(${TARGET_NAME} PRIVATE muda)
    target_include_directories(${TARGET_NAME} PRIVATE "src")
    target_link_libraries(${TARGET_NAME} PRIVATE Eigen3::Eigen)
    message(STATUS "add target: ${TARGET_NAME}")
endforeach()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${COMMON_SOURCE} ${CU_SOURCE} ${HEADER_FILES})