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
    // VecAdder类的实现细节放置在该前向声明的实现类中。
    struct Impl;
    // 指向实现类Impl的私有指针
    std::unique_ptr<Impl> pimpl_;
};