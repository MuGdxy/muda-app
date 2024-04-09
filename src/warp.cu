#include <program.h>
#include <cub/warp/warp_reduce.cuh>
#include <muda/debug.h>
using namespace muda;

constexpr uint32_t mask_all = 0xffffffff;

void Program::main()
{
    muda::Debug::debug_sync_all(true);

    Launch(1, 32).apply(
        [] __device__() mutable
        {
            int  i = threadIdx.x;
            auto j = cub::ShuffleIndex<32>(i, 0, mask_all);
            muda::cout << "ShuffleIndex i: " << i << ", j: " << j << "\n";
            auto k = cub::ShuffleDown<32>(i, 1, 31, mask_all);
            muda::cout << "ShuffleDown i: " << i << ", k: " << k << "\n";
        });
}
