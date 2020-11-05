//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

#define IN  1
#define OUT 0

void cwiczenie111(void) {
    char c;
    int state = OUT;
    int words = 0;

    while ((c = getchar()) != EOF) {
        if ('\n' == c || ' ' == c || '\t' == c)
            state = OUT;
        else if (state == OUT) {
            state = IN;
            words++;
        }
    }
    printf("%d", words);
}