#define _XOPEN_SOURCE 700
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include <string.h>



typedef struct chainon{
	char *line;
    char *comp;
	struct chainon* suivant;
}Chainon;

int nbrL(FILE *file);
int chrono(char *d1, const char *d2);


Chainon *creationChainon(char *l, char * a);
Chainon * insertDebut(Chainon* pliste, char *l, char * a);
Chainon *ajouterCroissant(Chainon *pliste, char *l, char * a);
Chainon *ajouterCroissantChrono(Chainon *pliste, char *l, char * a);
Chainon *ajouterDecroissant(Chainon *pliste, char *l,char * a);
Chainon *ajouterDecroissantChrono(Chainon *pliste, char *l,char * a);
void createFile(Chainon *pliste,char *path);


void tabM(char *S, char *O);
void tabH(char *S, char *O);
void tabW(char *S, char *O);
void tabT1(char *S, char *O);
void tabP1(char *S, char *O);
void tabT2(char *S, char *O);
void tabP2(char *S, char *O);
void tabT3(char *S, char *O);
void tabP3(char *S, char *O);

