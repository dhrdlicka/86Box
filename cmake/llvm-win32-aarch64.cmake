#
# 86Box     A hypervisor and IBM PC system emulator that specializes in
#           running old operating systems and software designed for IBM
#           PC systems and compatibles from 1981 through fairly recent
#           system designs based on the PCI bus.
#
#           This file is part of the 86Box distribution.
#
#           CMake toolchain file for Clang on Windows builds (ARM64 target).
#
# Authors:  David Hrdlička, <hrdlickadavid@outlook.com>
#
#           Copyright 2021 David Hrdlička.
#

include(${CMAKE_CURRENT_LIST_DIR}/flags-gcc-aarch64.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/llvm-win32.cmake)

# Set the build target
set(CMAKE_C_COMPILER_TARGET     aarch64-pc-windows-msvc)
set(CMAKE_CXX_COMPILER_TARGET   aarch64-pc-windows-msvc)

set(CMAKE_SYSTEM_PROCESSOR ARM64)

# TODO: set the vcpkg target triplet perhaps?