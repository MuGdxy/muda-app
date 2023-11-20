# MUDA App

this is an example for integerating muda-app. (about [muda](https://github.com/MuGdxy/muda))

## Integrate MUDA

Firstly, you need to pull MUDA.

```shell
git submodule update --init
```

which will be placed at `./submodules/muda/`

### Xmake

build scripts: [xmake.lua](./xmake.lua)

build:

```shell
$ xmake
```

run:

```shell
$ xmake run
```

### CMake

build scripts: [CMakeLists.txt](./CMakeLists.txt)

build:

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

Example for xmake:

```lua
add_cuflags("--extended-lambda")        
add_cuflags("--expt-relaxed-constexpr") 
add_cuflags("-rdc=true")
```

Example for cmake:

```cmake
target_compile_options(hello_muda PRIVATE
  $<$<COMPILE_LANGUAGE:CUDA>:--expt-relaxed-constexpr>
  $<$<COMPILE_LANGUAGE:CUDA>:--extended-lambda>
  $<$<COMPILE_LANGUAGE:CUDA>:-rdc=true>
)
```



