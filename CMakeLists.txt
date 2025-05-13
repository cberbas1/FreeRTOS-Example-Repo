cmake_minimum_required(VERSION 3.15)
project(sdk_test LANGUAGES C)

# Enable C11 and binary output
set(CMAKE_C_STANDARD 11)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_compile_options(-save-temps=obj)

# Option to switch between host and embedded build
option(USE_BARE_METAL "Use ARM bare-metal compiler (arm-none-eabi-gcc)" OFF)

# Add drivers and main
add_subdirectory(drivers)
add_subdirectory(main)

## DOXYGEN
find_package(Doxygen QUIET)

if(DOXYGEN_FOUND)
    set(DOXYGEN_IN ${CMAKE_SOURCE_DIR}/tools/doxygen/settings/Doxyfile.in)
    set(DOXYGEN_OUT ${CMAKE_SOURCE_DIR}/tools/doxygen/output/DoxyFile)

    configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)

    add_custom_target(doc
        COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_SOURCE_DIR}/build/doxygen/output
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM
    )
else()
    message(STATUS "Doxygen not found, 'doc' target will not be available.")
endif()

# Define executable
add_executable(dummyApp.elf )

# Link libraries
target_link_libraries(dummyApp.elf
    powers
    simple_ops
    main_app
)

# Set sources manually for the main app
target_sources(dummyApp.elf PRIVATE main/src/main.c)

add_custom_command(TARGET dummyApp.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${CMAKE_BINARY_DIR}/bin/dummyApp.elf ${CMAKE_BINARY_DIR}/bin/dummyApp.hex
    COMMENT "Generating hex file"
)