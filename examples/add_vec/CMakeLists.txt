add_executable(add_vec)
set_target_properties(add_vec PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

target_link_libraries(add_vec PRIVATE muda)

file(GLOB_RECURSE ADD_VEC_CU_SOURCE CONFIGURE_DEPENDS "src/*.cu")
target_sources(add_vec PRIVATE ${ADD_VEC_CU_SOURCE})

file(GLOB_RECURSE ADD_VEC_CPP_SOURCE CONFIGURE_DEPENDS "src/*.cpp")
target_sources(add_vec PRIVATE ${ADD_VEC_CPP_SOURCE})