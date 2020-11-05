//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

void cwiczenie105(void) {
    float fahr;
    float celsius;

    int lower;
    int upper;
    int step;

    lower = -20;
    upper = 140;
    step = 5;

    celsius = (float)upper;
    printf("Stopnie Celsiusza\tStopnie Farenhaita\n");
    while(celsius > lower) {
        fahr = celsius/(5.0/9.0) + 32.0;
        printf("%6.1f \t\t\t%3.0f\n", celsius, fahr);
        celsius = celsius - step;
    }
}