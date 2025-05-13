add_library(simple_ops STATIC
    src/add.c
    src/sub.c
    src/multiply.c
    src/divide.c
)

target_include_directories(simple_ops PUBLIC
    inc
    cfg
)