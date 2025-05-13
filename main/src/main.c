#include <stdio.h>
#include "add.h"
#include "sub.h"
#include "multiply.h"
#include "divide.h"
#include "square.h"
#include "sqrt.h"

// Global variables to store the results
double add_result, subtract_result, multiply_result, divide_result;
double square_result, square_root_result;
// double power_result, root_result;  // Uncomment if using power and root functions

void _exit(int status)
{
    // In a bare-metal system, you don't need to do anything here.
    // You can just loop forever to "end" the program.
    while (1)
        ;
}

int main()
{
    double a = 9.0, b = 3.0;

    // Perform calculations and assign the results to global variables
    add_result = add(a, b);
    subtract_result = subtract(a, b);
    multiply_result = multiply(a, b);
    divide_result = divide(a, b);
    square_result = square(a);
    square_root_result = square_root(a);

    // Optionally, you can print or use the results in other parts of your program

    return 0;
}
