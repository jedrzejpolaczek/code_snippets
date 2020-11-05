/* A for loop is a programming language statement which allows code to be repeatedly executed.
 * The syntax for this is:
 *      for ( <expression_1> ; <expression_2> ; <expression_3> )
 *              <statement>
 * expression_1 is used for intializing variables which are generally used for controlling terminating flag for the loop.
 * expression_2 is used to check for the terminating condition. If this evaluates to false, then the loop is terminated.
 * expression_3 is generally used to update the flags/variables.
 *
 * Input Format:
 * You will be given two positive integers, a and b (a <= b), separated by a newline.
 *
 * Output Format:
 * For each integer n in [a, b] (so all numbers in that range):
 * If 1 <= n <= 9, then print the English representation of it. That is "one" for 1, "two" for 2, and so on.
 * Else if n > 9 and it is even, then print "even".
 * Else if n > 9 and it is odd, then print "odd".
 * Note: [a, b] represents the interval, i.e., [a, b] = {x in Z | a <= x <= b} = {a, a+1, ..., b}
 */
#include <iostream>
#include <cstdio>
using namespace std;

int main() 
{
    int a, b;
    
    cin >> a;
    cin >> b;
    
    for(int i = a; i <= b; i++)
    {
        switch(i)
        {
            case 1:
                cout << "one\n"; break;
            case 2:
                cout << "two\n"; break;
            case 3:
                cout << "three\n"; break;    
            case 4:
                cout << "four\n"; break; 
            case 5:
                cout << "five\n"; break;
            case 6:
                cout << "six\n"; break;
            case 7:
                cout << "seven\n"; break;
            case 8:
                cout << "eight\n"; break;
            case 9:
                cout << "nine\n"; break;
            default:
            {
                if((i%2) == 0)
                    cout << "even\n";
                else
                    cout << "odd\n";
            }
       }
    }
    return 0;
}