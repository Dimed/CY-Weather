#include "../header.h"


void tabP2(char *S, char *O){
    int test;
    int cont;
    char ligne[80];
    char ID[30];
    char p[30];
    Chainon *tbM = NULL;
    FILE *fp= fopen(S,"r");
    fscanf(fp, "%*[^\n]\n");
    while (fgets(ligne,80,fp) != NULL){
        test=0;
        cont=0;
        for(int i=0;ligne[i]!='\0';i++){
            if(test){
                if (ligne[i]==';'){ID[cont]='\0';break;}
                else {ID[cont]=ligne[i];cont++;}
            }
            else{
                if (ligne[i]==';'){test=1;}
            }
        }
        tbM=ajouterCroissantChrono(tbM,ligne,ID);
    }
    fclose(fp);
    strcpy(p,O);
    strcat(p,"/SortWeatherP2.csv");
    createFile(tbM,p);

}