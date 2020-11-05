//
// Created by Jędrzej Polaczek on 15.10.2018.
//

//
// Created by Jedrzej on 04.07.2018.
//

#import <stdio.h>


#define MAXLINE 1000 /* maksymalny rozmiar wiersza */


int getLine(char line[], int max_line);
void copy(char to[], char from[]);

/* Wypisz najdłuższy wiersz. */
int cwiczenie116(int argc, char * argv[]) {
    int len;                /* Długość bierzącego wiersza. */
    int max;                /* Poprzednia maksymalna długość. */
    char line[MAXLINE];     /* Bieżący wiersz z wejścia. */
    char longest[MAXLINE];  /* Przechowywany maksymalny wiersz. */

    max = 0;
    while((len = getLine(line, MAXLINE)) > 0) {
        if(len > max) {
            max = len;
            copy(longest, line);
        }
    }

    if(max > 0) { /* Znaleziono wiersz */
        printf("Najdluzsze slowo ma dlugosc %d i jest to: %s", max-1, longest);
    }

    return 0;
}

/* getline: wczytaj wiersz do s, podaj jego długość. */
int getLine(char line[], int max_line) {
    int c;
    int i;

    for(i=0; i < max_line-1 && (c = getchar()) != EOF && c != '\n'; ++i) {
        line[i] = c;
    }
    if(c == '\n') {
        line[i] = c;
        ++i;
    }
    line[i] = '\0';
    return i;
}

/* copy: przepisz from do to; */
void copy(char to[], char from[]) {
    int i = 0;

    while((to[i] = from[i]) != '\0') {
        ++i;
    }
}