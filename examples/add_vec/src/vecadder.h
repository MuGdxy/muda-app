#include <memory>
#include <vector>

class VecAdder
{
public:
    VecAdder(std::vector<float> &a, std::vector<float> &b, int N);
    ~VecAdder();
    VecAdder(VecAdder &&rhs);
    VecAdder(const VecAdder &rhs);
    VecAdder &operator=(VecAdder &&rhs);
    VecAdder &operator=(const VecAdder &rhs);
    void add();
    std::vector<float> get();

private:
    // The implementation details of the VecAdder class are placed in the implementation class declared here.
    struct Impl;
    // The private pointer to the implementation class Impl
    std::unique_ptr<Impl> pimpl_;
};