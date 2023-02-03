#include "../header.h"


// sort WeatherW by linked list

void tabW(char *S, char *O){
    int cont;
    char ligne[80];
    char ID[30];
    char p[30];
    Chainon *tbM = NULL;
    FILE *fp= fopen(S,"r");
    fscanf(fp, "%*[^\n]\n");
    while (fgets(ligne,80,fp) != NULL){
        cont=0;
        for(int i=0;ligne[i]!=';';i++){
            if(ligne[i+1]==';'){ID[cont]=ligne[i];ID[cont+1]='\0';break;}
                else {ID[cont]=ligne[i];cont++;}
        }
        tbM=ajouterCroissant(tbM,ligne,ID);
    }
    fclose(fp);
    strcpy(p,O);
    strcat(p,"/SortWeatherW.csv");
    createFile(tbM,p);

}