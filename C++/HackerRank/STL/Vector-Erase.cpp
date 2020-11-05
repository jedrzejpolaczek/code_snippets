/* Problem:
 * You are given N integers.Then you are given 2 queries.
 * First query consists of 1 integer denoting the position which should be removed.
 * Next query consists of 2 integers denoting the range that should be removed.
 *
 * Input Format:
 * The first line of the input contains an integer N. The next line contains N space separated integers (1-based index).
 * The third line contains a single integer x, denoting the position of an element that should be removed from the vector.
 * The fourth line contains two integers a and b denoting the range that should be erased from the vector 
 * inclusive of a and exclusive of b.
 *
 * Output Format:
 * Print the size of the vector in the first line and the elements of the vector 
 * after the two erase operations in the second line separated by space.
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
    
    /* Remove value from vector. */
    {
		int myVectorRemovePosition = 0;
        cin >> myVectorRemovePosition;
        myVectorRemovePosition -= 1; 
        myVector.erase(myVector.begin()+myVectorRemovePosition);
    }

    /* Remove values in range from vector. */
    {
		int myVectorRemoveBegin = 0;
		int myVectorRemoveEnd = 0;
        cin >> myVectorRemoveBegin;
        myVectorRemoveBegin -= 1;
        cin >> myVectorRemoveEnd;  
        myVectorRemoveEnd -= 1;
	    myVector.erase(myVector.begin() + myVectorRemoveBegin, \
                       myVector.begin() + myVectorRemoveEnd);
    }
     
    /* Print vector. */ 
    cout << myVector.size() << endl;
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