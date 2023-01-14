# muda-app

this is an example for muda-app.

1. add the repository of muda package to your xrepo (muda has not been in the xrepo official repo yet, so now we still need to add our own repo to contain the muda package):

```shell
$ xrepo add-repo muda-repo https://github.com/MuGdxy/xmake-repo
```

2. install muda:

```shell
$ xrepo install muda
```

3. build muda-app:

```shell
$ xmake
```
4. run muda-app:

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

