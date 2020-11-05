/*
 * You are given a positive integer, N,:
 * If 1<= N <= 9, then print the English representation of it. That is "one" for 1, "two" for 2, and so on.
 * Otherwise print "Greater than 9" (without quotes).
 * 
 * Input Format:
 * Input will contain only one integer, .
 *
 * Constraints:
 * 1<= N <= 10^9
 *
 * Output Format:
 * Print the output as described above.
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int x;
    cin >> x;
    switch(x)
    {
        case 1:
            cout << "one"; break;
        case 2:
            cout << "two"; break;
        case 3:
            cout << "three"; break;    
        case 4:
            cout << "four"; break; 
        case 5:
            cout << "five"; break;
        case 6:
            cout << "six"; break;
        case 7:
            cout << "seven"; break;
        case 8:
            cout << "eight"; break;
        case 9:
            cout << "nine"; break;
        default:
            cout << "Greater than 9";
   }
   return 0;
}
