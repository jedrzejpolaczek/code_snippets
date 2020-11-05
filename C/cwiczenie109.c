//
// Created by Jedrzej on 03.07.2018.
//


#import <stdio.h>

void cwiczenie109(void) {
    int c;
    int space_counter = 0;

    while ((c = getchar()) != EOF) {
        if (' ' == c) {
            space_counter++;
            if(space_counter < 2) {
                printf("%c", c);
            }
            continue;
        }
        else
            space_counter = 0;
        printf("%c", c);
    }
}