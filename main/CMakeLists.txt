add_library(main_app STATIC
    src/main.c
)

target_include_directories(main_app PUBLIC)

target_link_libraries(main_app
    powers
    simple_ops
)