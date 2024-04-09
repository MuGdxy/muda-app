#pragma once
#include <memory>

namespace muda
{
class Logger;
}

class Program
{
    std::unique_ptr<muda::Logger> m_logger;
  public:
    Program();
    ~Program();
    void main();
};
