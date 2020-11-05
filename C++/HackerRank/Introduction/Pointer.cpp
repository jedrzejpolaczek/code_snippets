/* You have to complete the function void update(int *a,int *b), 
 * which reads two integers as argument, and sets a with the sum of them, 
 * and b with the absolute difference of them.
 * a' = a + b
 * b' = |a - b|
 *
 * Input Format:
 * Input will contain two integers, a and b, separated by a newline.
 *
 * Output Format:
 * You have to print the updated value of a and b, on two different lines.
 * P.S.: Input/ouput will be automatically handled. 
 * You only have to complete the void update(int *a,int *b) function.
 */
#include <stdio.h>

void update(int *a,int *b) 
{
    int pom = *a;
    *a = *a + *b;
    *b = (pom - *b);
    if(*b < 0)
        *b = *b * (-1);
}

int main() 
{
    int a, b;
    int *pa = &a, *pb = &b;
    
    scanf("%d %d", &a, &b);
    update(pa, pb);
    printf("%d\n%d", a, b);

    return 0;
}