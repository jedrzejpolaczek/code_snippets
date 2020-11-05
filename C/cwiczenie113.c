//
// Created by Jedrzej on 02.07.2018.
//

#import <stdio.h>


void cwiczenie113(void) {
    int tab[30];
    for(int i = 0; i < 30; ++i)
        tab[i] = 0;
    char input_word[30];
    input_word[0] = 'A';
    int counter = 0;

    while(input_word[0] != 'X') {
        scanf("%s", input_word);

        //counting word length
        for(counter = 0; input_word[counter] != '\0'; ++counter);
        tab[counter]++;

    }
    for(int i = 0; i < 30; ++i) {
        if(tab[i] > 0) {
            printf("%d|", i+1);
            for(int j = 1; j <= tab[i]; ++j)
                printf("-");
            printf("\n");
        }
    }
}