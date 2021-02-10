# Cfront 3.0.3
## AT&T/Bell Labs C++ to C translator from 1994, modified to build on modern hardware

This repo contains the source of `cfront` and the `c++filt` demangler. It's currently being used to research how [Kirby 64](https://github.com/farisawan-2000/kirby64) implemented its C++ code, and will eventually be integrated into the project as a middleman translator.

`cfront` currently depends on an ancient version of `yacc` to build correctly, since the syntax has changed since 1994, and using a version from that era is a lot easier than learning `yacc` syntax and rewriting the 3000 line file in a way that both works and is still compatible with the rest of the codebase


## Build Instructions

 - Install `g++`, `gcc`, and `make`
 - Get SGI `yacc` and qemu-irix (cloning and building Kirby 64 decomp will get you both of these)
 - Build with `make IRIX_ROOT=path/to/kirby64/tools/ido7.1/`


## Contributing

 - Pull requests are welcome, since I definitely missed things when converting the ancient pre-standard C++. My test cases work, but there's still a possibility of an uncaught segfault. If you want to try converting files yourself, knock yourself out by getting the original source [here](https://www.softwarepreservation.org/projects/c_plus_plus/cfront/release_3.0.3/source/src/). However, be sure to run `clang-format -i` on the files you change to have them follow a sane coding style.
