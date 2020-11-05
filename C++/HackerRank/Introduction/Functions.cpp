/*
 * You have to write a function int max_of_four(int a, int b, int c, int d) 
 * which reads four arguments and returns the greatest of them.
 * 
 * Input Format:
 * Input will contain four integers -a,b,c,d, one in each line.
 *
 * Output Format:
 * Print the greatest of the four integers. 
 * PS: I/O will be automatically handled.
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int max_of_four(int a, int b, int c, int d)
{
    vector<int> v;
    
    v.push_back(a);
    v.push_back(b);
    v.push_back(c);
    v.push_back(d);
    
    sort(v.begin(), v.end());
    
    return v[v.size()-1];
}

int main() {
    int a, b, c, d;
    scanf("%d %d %d %d", &a, &b, &c, &d);
    int ans = max_of_four(a, b, c, d);
    printf("%d", ans);
    
    return 0;
}