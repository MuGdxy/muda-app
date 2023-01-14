#include <muda/muda.h>
using namespace muda;
int main()
{
    launch(1, 1)
        .apply(
        [] __device__() 
        {
            print("hello muda!\n"); 
        }).wait();
}