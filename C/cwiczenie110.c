//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

void cwiczenie110(void) {
    int c;

    while ((c = getchar()) != EOF) {
        if ('\b' == c)
            c = '\\b';
        if ('\t' == c)
            c = '\\t';
        if ('\\' == c)
            c = '\\\\';
        printf("%c", c);
    }
}