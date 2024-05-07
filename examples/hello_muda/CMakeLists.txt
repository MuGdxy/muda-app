add_executable(hello_muda)
set_target_properties(hello_muda PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

target_link_libraries(hello_muda PRIVATE muda)

file(GLOB_RECURSE HELLO_MUDA_CU_SOURCE CONFIGURE_DEPENDS "src/*.cu")
target_sources(hello_muda PRIVATE ${HELLO_MUDA_CU_SOURCE})

file(GLOB_RECURSE HELLO_MUDA_CPP_SOURCE CONFIGURE_DEPENDS "src/*.cpp")
target_sources(hello_muda PRIVATE ${HELLO_MUDA_CPP_SOURCE})