// To export hello_muda() function
// so that we could use it in main.cpp
#include "hello_muda.h"
#include <iostream>
#include <muda/muda.h>



void hello_muda()
{
    std::cout << "Muda Runtime Check:" << muda::RUNTIME_CHECK_ON  << std::endl;

    using namespace muda;
    DeviceVar<int> var = 1;

    Launch(1, 1)
        .kernel_name(__FUNCTION__)
        .apply(
        [
            var = var.viewer().name("var")
        ] __device__ () mutable
        {
            print("hello muda!\n"); 
            print("var = %d\n", var);
            print("var.kernel_name = %s\n", var.kernel_name());
            print("var.name = %s\n", var.name());
        }).wait();
}