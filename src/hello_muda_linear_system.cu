#include "hello_muda_linear_system.h"
#include <iostream>
#include <muda/muda.h>
#include <muda/ext/linear_system.h>

using namespace muda;

void hello_linear_system()
{
    int N = 3;

    DeviceTripletMatrix<float, 1> A;
    DeviceDenseVector<float> b(N);
    DeviceDenseVector<float> x(N);
    DeviceDenseVector<float> y(N);

    A.resize_triplets(N * N);
    A.reshape(N, N);

    std::cout << "sizes:\n";
    std::cout << A.row_indices().size()
        << "  " << A.col_indices().size()
        << "  " << A.values().size() << std::endl;

    ParallelFor(256).apply(N * N, [row_idx = A.row_indices().viewer(),
        col_idx = A.col_indices().viewer(),
        val = A.values().viewer(),
        b = b.viewer(), N]__device__(int i)mutable {

        row_idx(i) = i % N;
        col_idx(i) = i / N;
        val(i) = static_cast<float>(i * i);

        if (i < N) {
            b(i) = static_cast<float>(i);
        }

    });

    std::cout << "Filled A and b\n";

    LinearSystemContext ctx;

    std::cout << "Context created\n";

    DeviceCOOMatrix<float> A_coo;
    ctx.convert(A, A_coo); // cuda error triggers here
}