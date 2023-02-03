#include "../header.h"

void tabH(char *S, char *O){
    int test;
    int test2;
    int cont;
    char ligne[80];
    char ID[30];
    char p[30];
    Chainon *tbM = NULL;
    FILE *fp= fopen(S,"r");
    fscanf(fp, "%*[^\n]\n");
    while (fgets(ligne,80,fp) != NULL){
        test=0;
        test2=0;
        cont=0;
        for(int i=0;ligne[i]!='\0';i++){
            if(test){
                if(test2){
                    if (ligne[i+1]=='\0'){ID[cont]=ligne[i];ID[cont+1]='\0';break;}
                    else {ID[cont]=ligne[i];cont++;}
                }
                else{
                    if (ligne[i]==';'){
                        test2=1;
                    }
                }
            }
            else{
                if (ligne[i]==';'){test=1;}
            }
        }
        tbM=ajouterDecroissant(tbM,ligne,ID);
    }
    fclose(fp);
    strcpy(p,O);
    strcat(p,"/SortWeatherH.csv");
    createFile(tbM,p);

}