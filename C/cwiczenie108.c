//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

void cwiczenie108(void) {
    int c;
    int nl;
    int tab;
    int space;

    nl = 0;
    tab = 0;
    space = 0;

    while((c = getchar()) != EOF) {
        if(c == '\n')
            nl++;
        if(c == '\t')
            tab++;
        if(c == ' ')
            space++;
    }
    printf("Nowe linie: %d\tTabulacje: %d\t Spacje: %d", nl, tab, space);
}