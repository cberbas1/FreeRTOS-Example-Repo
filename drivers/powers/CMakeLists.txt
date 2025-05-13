add_library(powers STATIC
    src/sqrt.c
    src/square.c
)

target_include_directories(powers PUBLIC
    inc
    cfg
)