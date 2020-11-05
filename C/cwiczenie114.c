//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>
#include <string.h>

void cwiczenie114(void) {
    int tab[128];
    for(int i = 0; i < 128; ++i)
        tab[i] = 0;
    char input_word[30];

    printf("Wprowadz slowo: ");
    scanf("%s", input_word);

    for(int i = 0; i < strlen(input_word); ++i)
        tab[input_word[i]]++;

    printf("\nHistogram slowa: %s \n", input_word);
    for(int i = 0; i < 128; ++i) {
        if(tab[i] > 0) {
            printf("%d|", i);
            for(int j = 0; j < tab[i]; ++j)
                printf("-");
            printf("\n");
        }
    }
}