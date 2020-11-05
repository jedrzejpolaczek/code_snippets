/*
 * Objective :
 * In this challenge, we're practicing reading input from stdin and printing output to stdout.
 *
 * Task:
 * Read 3 numbers from stdin and print their sum to stdout.
 *
 * Input Format:
 * A single line containing 3 space-separated integers: a, b, and c.
 *
 * Constrains:
 * 1 <= a,b,c <= 1000
 *
 * Output Format
 * Print the sum of the three numbers on a single line.
 */

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() 
{
    int a, b, c;
    
    cin >> a;
    if(a < 1)
        a = 1;
    else if(a > 1000)
        a = 1000;
    cin >> b;
    if(b < 1)
        b = 1;
    else if(b > 1000)
        b = 1000;
    cin >> c;
    if(c < 1)
        c = 1;
    else if(c > 1000)
        c = 1000;
    
    cout << a + b + c;
    
    return 0;
}