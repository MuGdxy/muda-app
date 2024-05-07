#include "vecadder.h"
#include <stdio.h>
#include <algorithm>
#include "add_vec.h"
int main()
{
    std::vector<float> a = {1, 2, 3};
    std::vector<float> b = {4, 5, 6};
    std::vector<float> c;
    VecAdder adder(a, b, 3);
    adder.add();
    c = adder.get();
    std::for_each(c.begin(), c.end(), [](float i)
                  { printf("%f\n", i); });

    std::vector<float> d(3);
    add_vec(a, b, d);
    std::for_each(d.begin(), d.end(), [](float i)
                  { printf("%f\n", i); });
    return 0;
}