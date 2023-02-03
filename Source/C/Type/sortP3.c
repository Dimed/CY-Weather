#include "../header.h"



// sort WeatherP3 by linked list

void tabP3(char *S, char *O){

    int test;
    int cont;
    char ligne[80];
    char ID[30];
    char p[30];
    char p2[30];
    int v=1;
    char ID2[30];
    char ID3[30];
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
        tbM=ajouterDecroissantChrono(tbM,ligne,ID);
    }
    fclose(fp);
    strcpy(p,O);
    strcat(p,"/SortWeatherp3.csv");
    createFile(tbM,p);

    

    strcpy(p2,O);
    strcat(p2,"/SortWeatherP3.csv");

    Chainon *tbP2 = NULL;
    FILE *fd= fopen(p,"r");
    while (fgets(ligne,80,fd) != NULL){
        cont=0;
        for(int i=0;ligne[i]!=';';i++){
            if(ligne[i+1]==';'){ID[cont]=ligne[i];ID[cont+1]='\0';break;}
                else {ID[cont]=ligne[i];cont++;}
        }
        cont=0;
        test=0;
        for(int i=0;ligne[i]!='\0';i++){
            if(test){
                if (ligne[i]==';'){ID2[cont]='\0';break;}
                else {ID2[cont]=ligne[i];cont++;}
            }
            else{
                if (ligne[i]==';'){test=1;}
            }
        }
        if(v){
            tbP2=ajouterCroissant(tbP2,ligne,ID);
            v=0;
            strcpy(ID3,ID2);

        }
        else{
            if(! strcmp(ID3,ID2)){
                tbP2=ajouterCroissant(tbP2,ligne,ID);
                strcpy(ID3,ID2);
            }
            else{
                createFile(tbP2,p2);
                tbP2=NULL;
                tbP2=ajouterCroissant(tbP2,ligne,ID);
                strcpy(ID3,ID2);
            }
        }
        
    }
    fclose(fd);
    
    createFile(tbP2,p2);
    remove(p);
    
}