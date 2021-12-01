include(${CMAKE_CURRENT_LIST_DIR}/flags-gcc-arm64.cmake)

set(CMAKE_C_FLAGS	"-target aarch64-pc-windows-msvc ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS	"-target aarch64-pc-windows-msvc ${CMAKE_CXX_FLAGS}")