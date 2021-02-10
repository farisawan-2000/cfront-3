# Cfront 3.0.3
## AT&T/Bell Labs C++ to C translator from 1994, modified to build on modern hardware

This repo contains the source of `cfront` and the `c++filt` demangler. It's currently being used to research how [Kirby 64](https://github.com/farisawan-2000/kirby64) implemented its C++ code, and will eventually be integrated into the project as a middleman translator.

`cfront` currently depends on an ancient version of `yacc` to build correctly, since the syntax has changed since 1994, and using a version from that era is a lot easier than learning `yacc` syntax and rewriting the 3000 line file in a way that both works and is still compatible with the rest of the codebase


## Build Instructions

 - Install `g++-7`, `g++-7-multilib`, and `make`
 - Get SGI `yacc` and qemu-irix (cloning and building Kirby 64 decomp will get you both of these)
 - Build with `make IRIX_ROOT=path/to/kirby64/tools/ido7.1/`


## Contributing

 - Pull requests are welcome, especially to get these files compatible with modern g++. Be sure to run `clang-format -i` on the files you change to have them follow a sane coding style. Original non-formatted source files are [here](http://www.softwarepreservation.org/projects/c_plus_plus/cfront/release_3.0.3/source/).
