#include "../header.h"


void tabP1(char *S, char *O){
    int cont;
    char ligne[80];
    char ID[30];
    char p[30];
    Chainon *tbP1 = NULL;
    FILE *fp= fopen(S,"r");
    fscanf(fp, "%*[^\n]\n");
    while (fgets(ligne,80,fp) != NULL){
        cont=0;
        for(int i=0;ligne[i]!=';';i++){
            if(ligne[i+1]==';'){ID[cont]=ligne[i];ID[cont+1]='\0';break;}
                else {ID[cont]=ligne[i];cont++;}
        }
        tbP1=ajouterCroissant(tbP1,ligne,ID);
    }
    fclose(fp);
    strcpy(p,O);
    strcat(p,"/SortWeatherP1.csv");
    createFile(tbP1,p);

}