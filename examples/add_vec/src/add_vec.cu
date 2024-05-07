#include <muda/muda.h>
#include "vecadder.h"
#include <muda/container.h>
#include <thrust/host_vector.h>
using namespace muda;

void add_vec(const std::vector<float> &a, const std::vector<float> &b, std::vector<float> &c){
    auto N = a.size();
    DeviceBuffer<float> dA(N), dB(N), dC(N);
    dA = a;
    dB = b;
    ParallelFor(256)
        .apply(N,
               [dC = dC.viewer(), dA = dA.cviewer(), dB = dB.cviewer()]
               __device__ (int i) mutable {
                   dC(i) = dA(i) + dB(i);
               })
        .wait();
    dC.copy_to(c);
}