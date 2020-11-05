/* You'll be an given array of N integers and you have to print the integers in the reverse order.
 *
 * Input Format:
 * The first line of the input contains N, where N is the number of integers.
 * The next line contains N integers separated by a space.
 *
 * Constraints:
 * 1 <= N <= 1000
 * 1 <= Ai <= 10000, where Ai is the ith integer in the array.
 *
 * Output Format:
 * Print the N integers of the array in the reverse order in a single line separated by a space.
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

void printVector(vector<int> vectorToPrint);

int main() 
{ 	
    /* Specify vector. */
    int myVectorSize = 0;
	cin >> myVectorSize;
	vector<int> myVector(myVectorSize);
    
    /* Giving values to the vector. */
    for(int index = 0; index < myVectorSize; index ++)
        cin >> myVector[index];    
     
    /* Print vector. */ 
    printVector(myVector);
    
    return 0;
}

void printVector(vector<int> vectorToPrint)
{
	for(int i = vectorToPrint.size()-1; i > 0; i--)
    {
        cout << vectorToPrint[i] << ' ';
    }
    cout << vectorToPrint[0];
}