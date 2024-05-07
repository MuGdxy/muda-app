#include <muda/muda.h>
#include "vecadder.h"
#include <muda/container.h>
using namespace muda;


struct VecAdder::Impl {
    DeviceBuffer<float> dA, dB, dC;
    int N;
}; 


void VecAdder::add(){
    auto &dA = pimpl_->dA;
    auto &dB = pimpl_->dB;
    auto &dC = pimpl_->dC;
    auto N = pimpl_->N;
    ParallelFor(256)
        .apply(N,
               [dC = dC.viewer(), dA = dA.cviewer(), dB = dB.cviewer()]
               __device__ (int i) mutable {
                   dC(i) = dA(i) + dB(i);
               })
        .wait();
}


VecAdder::~VecAdder() = default;


VecAdder::VecAdder(VecAdder &&rhs) = default;


VecAdder &VecAdder::operator=(VecAdder &&rhs) = default;


VecAdder::VecAdder(const VecAdder &rhs)
    : pimpl_{std::make_unique<Impl>(*rhs.pimpl_)} {}


VecAdder &VecAdder::operator=(const VecAdder &rhs) {
    *pimpl_ = *rhs.pimpl_;
    return *this;
};


VecAdder::VecAdder(std::vector<float> &a, std::vector<float> &b, int N) : pimpl_{std::make_unique<Impl>()} {
    pimpl_->dA = a;
    pimpl_->dB = b;
    pimpl_->dC = std::vector<float>(N);
    pimpl_->N = N;
}


std::vector<float> VecAdder::get() {
    std::vector<float> c(pimpl_->N);
    pimpl_->dC.copy_to(c);
    return c;
}