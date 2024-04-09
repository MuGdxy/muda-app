#pragma once
#include <program.h>

namespace muda
{
__device__ LoggerViewer cout;
}

Program::Program()
{
    muda::LoggerViewer* viewer_ptr = nullptr;
    checkCudaErrors(cudaGetSymbolAddress((void**)&viewer_ptr, muda::cout));
    m_logger = std::make_unique<muda::Logger>(viewer_ptr);

    muda::Debug::set_sync_callback([this] { m_logger->retrieve(); });
}

Program::~Program() {}