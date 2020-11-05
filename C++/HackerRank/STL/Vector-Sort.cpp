/* Problem:
 * You are given N integers. 
 * Sort the N integers and print the sorted order.
 * Store the N integers in a vector.
 * Vectors are sequence containers representing arrays that can change in size.
 *
 * Input Format:
 * The first line of the input contains N where N is the number of integers. 
 * The next line contains N integers.
 *
 * Output Format:
 * Print the integers in the sorted order one by one in a single line followed by a space.
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

    /* Sorting vector */
    sort(myVector.begin(),myVector.end());
    
    /* Print vector. */  
    printVector(myVector);
    
    
    return 0;
}

void printVector(vector<int> vectorToPrint)
{
	for(auto it = begin(vectorToPrint); it != end(vectorToPrint); ++it)
    {
        cout << *it << ' ';
    }
}