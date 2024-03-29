set_project("muda_app")
add_rules("mode.debug", "mode.release", "mode.releasedbg")

set_languages("c++17")
set_config("example", false)
includes("submodules/muda")
target("hello_muda")
    add_includedirs("src")
    add_deps("muda")
    set_kind("binary")
    add_files("src/*.cu", "src/*.cpp")
    add_cugencodes("compute_75")
target_end()
