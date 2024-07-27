# MUDA Linear System

This is an example of using muda linear system. (about [muda](https://github.com/MuGdxy/muda))

## Requirement

You should install `Eigen3` by yourself.

```shell
$ vcpkg install eigen3
```

And pull `muda` submodule

```shell
$ git submodule update --init
```

### CMake

Build scripts location: [CMakeLists.txt](./CMakeLists.txt)

Build:

```shell
$ mkdir build && cd build
$ cmake -S .. -B . -DCMAKE_BUILD_TYPE=Debug
$ cmake --build . --config Debug
```

### Tested

- Windows
  -  MSVC 19.39.33522.0/CUDA 12.3.52
