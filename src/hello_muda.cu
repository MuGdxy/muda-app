// To export hello_muda() function
// so that we could use it in main.cpp
#include "hello_muda.h"

#include <muda/muda.h>
#include <muda/syntax_sugar.h> // for $(...)


void hello_muda()
{
    using namespace muda;
    Launch(1, 1)
        .apply(
        [] $()
        {
            print("hello muda!\n"); 
        }).wait();
}