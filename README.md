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

### Xmake

Build scripts location: [xmake.lua](./xmake.lua)

Build:

```shell
$ xmake
```

Run:

```shell
$ xmake run
```

### CMake

Build scripts location: [CMakeLists.txt](./CMakeLists.txt)

Build:

```shell
$ mkdir CMakeBuild
$ cd CMakeBuild
$ cmake -S ..
$ cmake --build .
```

### Copy Headers

If you're going to copy and include muda headers, don't forget to add these compile flags:

```
--extended-lambda          // must be set for muda
--expt-relaxed-constexpr   // must be set for muda
-rdc=true                  // optional
```

Example for Xmake:

```lua
add_cuflags("--extended-lambda")        
add_cuflags("--expt-relaxed-constexpr") 
add_cuflags("-rdc=true")
```

Example for Cmake:

```cmake
target_compile_options(hello_muda PRIVATE
  $<$<COMPILE_LANGUAGE:CUDA>:--expt-relaxed-constexpr>
  $<$<COMPILE_LANGUAGE:CUDA>:--extended-lambda>
  $<$<COMPILE_LANGUAGE:CUDA>:-rdc=true>
)
```



