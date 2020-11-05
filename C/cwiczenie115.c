//
// Created by Jędrzej Polaczek on 15.10.2018.
//

#import <stdio.h>


void farenhaitToCelsius(int lower, int upper, int step);

void cwiczenie115(int argc, char * argv[]) {

    if(argc < 4) {
        int lower;
        int upper;
        int step;

        lower = 0;
        upper = 300;
        step = 20;

        farenhaitToCelsius(lower, upper, step);
    }
    else {
        farenhaitToCelsius(argv[1], argv[2], argv[3]);
    }
}

void farenhaitToCelsius(int lower, int upper, int step){
    float fahr;
    float celsius;

    fahr = (float)lower;
    printf("Stopnie Farenhaita\tStopnie Celsiusza\n");
    while(fahr < upper) {
        celsius = (5.0/9.0) * (fahr-32.0);
        printf("%3.0f \t\t\t%6.1f\n", fahr, celsius);
        fahr = fahr + step;
    }
}