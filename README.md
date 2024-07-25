# MUDA App

This is an example of integrating muda-app. (about [muda](https://github.com/MuGdxy/muda))

The program just prints `hello muda` from GPU kernel. 

The structure of the project is as following:

```shell
muda-app
- src
  - main.cpp
  - hello_muda.cu
  - hello_muda.h
```

We define the `hello muda` things in `hello_muda.cu` and export the function in a `hello_muda.h`  header. Thus we could use the function in a normal cpp program (in `main.cpp`).

## Integrate MUDA

Firstly, you need to pull MUDA.

```shell
git submodule update --init
```

The MUDA submodule will be placed at `./submodules/muda/`

### CMake

Build scripts location: [CMakeLists.txt](./CMakeLists.txt)

Build:

```shell
$ mkdir build && cd build
$ cmake -S .. -B . -DCMAKE_BUILD_TYPE=Debug
$ cmake --build . --config Debug
```


