# toolchain-baremetal.cmake
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER /tools/Xilinx/Vitis/2024.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER /tools/Xilinx/Vitis/2024.2/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-g++)

# Set the linker script path (relative or absolute)
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/ldscripts/dummy_baremetal.ld")

# Pass it as a linker flag
set(CMAKE_EXE_LINKER_FLAGS "-T${LINKER_SCRIPT}" CACHE STRING "Linker script" FORCE)

# Skip compiler/linker sanity checks (they will fail for bare-metal)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Optional: suppress CMake's compiler feature checks
set(CMAKE_C_COMPILER_WORKS TRUE CACHE INTERNAL "")
set(CMAKE_CXX_COMPILER_WORKS TRUE CACHE INTERNAL "")