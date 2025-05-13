# toolchain-linux-arm.cmake
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER /tools/Xilinx/Vitis/2024.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER /tools/Xilinx/Vitis/2024.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-g++)
