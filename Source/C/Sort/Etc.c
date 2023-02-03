#include "../header.h"


// Take a file and return its number of lines

int nbrL(FILE *file){

    int i =0;
    char c;

    while ((c=getc(file))!=EOF){

		if (c=='\n'){
            i++;
        }
	}

    rewind(file);
    return i+1;
}


// Take two date and return 1 if the first is older, 0 otherwise

int chrono(char *d1, const char *d2) {

    struct tm t1, t2;

    strptime(d1, "%Y-%m-%dT%H:%M:%S%z", &t1);
    strptime(d2, "%Y-%m-%dT%H:%M:%S%z", &t2);

    time_t T1 = mktime(&t1);
    time_t T2 = mktime(&t2);

    if (T1 < T2){return 1;} else {return 0;}
}