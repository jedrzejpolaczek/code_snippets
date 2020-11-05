//
// Created by Jedrzej on 03.07.2018.
//

#import <stdio.h>

void cwiczenie103(void) {
    float fahr;
    float celsius;

    int lower;
    int upper;
    int step;

    lower = 0;
    upper = 300;
    step = 20;

    fahr = (float)lower;
    printf("Stopnie Farenhaita\tStopnie Celsiusza\n");
    while(fahr < upper) {
        celsius = (5.0/9.0) * (fahr-32.0);
        printf("%3.0f \t\t\t%6.1f\n", fahr, celsius);
        fahr = fahr + step;
    }
}