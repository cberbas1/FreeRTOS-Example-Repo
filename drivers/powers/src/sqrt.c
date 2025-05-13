#include "sqrt.h"

double square_root(double x)
{
    double result = 0.0;
    double increment = 0.1;

    while (result * result < x)
    {
        result += increment;
    }

    return result;
}