/*
 * Some C++ data types, their format specifiers, and their most common bit widths are as follows:
 * Int ("%d"): 32 Bit integer
 * Long ("%ld"): 32 bit integer (same as Int for modern systems)
 * Long Long ("%lld"): 64 bit integer
 * Char ("%c"): Character type
 * Float ("%f"): 32 bit real value
 * Double ("%lf"): 64 bit real value
 *
 * Input Format:
 * Input consists of the following space-separated values: int, long, long long, char, float, and double, respectively.
 *
 * Output Format:
 * Print each element on a new line in the same order it was received as input. 
 * Note that the floating point value should be correct up to 3 decimal places and the double to 9 decimal places.
 */
#include <iostream>
#include <cstdio>
using namespace std;

int main() 
{
    int x;
    long lx;
    long long llx;
    char cx;
    float fx;
    double dx;
        
    scanf("%d %ld %lld %c %f %lf", &x, &lx, &llx, &cx, &fx, &dx);
    
    printf("%d \n%ld \n%lld \n%c \n%f \n%lf", x, lx, llx, cx, fx, dx);
    
    return 0;
}
