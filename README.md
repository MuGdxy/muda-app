# muda-app

this is an example for muda-app.

```shell
$ xmake
```

```shell
$ xmake run
hello muda!
```

## integrate muda

in xmake.lua:

```lua
add_rules("mode.debug", "mode.release")

add_requires("muda",{ optional = false })
set_languages("c++17")
target("use_muda")
    add_includedirs("src")
    set_kind("binary")
    add_files("src/*.cu")
    add_packages("muda")
    add_cuflags("--extended-lambda") -- must be set for muda paradigm
    add_cuflags("--expt-relaxed-constexpr")
target_end()
```

