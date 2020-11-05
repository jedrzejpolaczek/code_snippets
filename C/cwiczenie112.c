//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

#define IN  1
#define OUT 0

void cwiczenie112(void) {
    char c;
    int state = OUT;
    int blanks_counter = 0;

    while ((c = getchar()) != EOF) {
        if (' ' == c || '\t' == c) {
            state = OUT;
            blanks_counter++;
            if (blanks_counter < 2)
                printf("\n");
        }
        else if ('\n' == c) {
            state = OUT;
            blanks_counter = 0;
        }
        else if (state == OUT) {
            state = IN;
            blanks_counter = 0;
        }
        if(' ' != c)
            printf("%c", c);
    }

}