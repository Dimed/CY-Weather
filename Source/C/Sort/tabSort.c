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

int chrono(char *d1, const char *d2) {

    struct tm t1, t2;

    strptime(d1, "%Y-%m-%dT%H:%M:%S%z", &t1);
    strptime(d2, "%Y-%m-%dT%H:%M:%S%z", &t2);

    time_t T1 = mktime(&t1);
    time_t T2 = mktime(&t2);

    if (T1 < T2){return 1;} else {return 0;}
}



Chainon *creationChainon(char *l, char *a){
	Chainon * c = malloc(sizeof(Chainon));
	if(c==NULL){
		exit(1);
	}
	c->line=malloc(strlen(l)+1);
	strcpy(c->line,l);
	c->suivant=NULL;
    c->comp=malloc(strlen(a)+1);
	strcpy(c->comp,a);
	return c;
}

void createFile(Chainon *pliste,char *path){
	Chainon* p1=pliste;
	FILE *fp = fopen(path, "a");
	while(p1!=NULL){
		fprintf(fp, "%s",p1->line);
		p1=p1->suivant;
	}
	fclose(fp);
}

Chainon * insertDebut(Chainon* pliste, char *l,char * a){
	Chainon* nouveau=creationChainon(l,a);
	nouveau -> suivant = pliste;
	pliste=nouveau;
	return pliste;
}


Chainon *ajouterCroissant(Chainon *pliste, char *l,char * a){
	Chainon *nouveau=creationChainon(l,a);
	Chainon *p1 =pliste;
	if(pliste==NULL){// si la liste est vide
		pliste=nouveau;
	}
	else if (atoi(pliste -> comp) > atoi(a)) { // dans ce cas il faut placer l'element au début
		pliste=insertDebut(pliste,l,a);
	}
	else{
		//on parcours la liste jusqu'à trouver où doit aller le nouveau élément
		while(p1->suivant!= NULL && atoi(p1->suivant->comp) < atoi(a)){ 
			p1=p1->suivant;
		}
		if(p1->suivant==NULL){ // s'il faut placer le nouvel élément en fin de chaîne
			p1->suivant=nouveau;
		}
		else{ // il faut inserer le maillon en millieu de chaîne, après p1
			nouveau->suivant=p1->suivant;
			p1->suivant = nouveau;
		}
	}
	return pliste;
}



Chainon *ajouterDecroissant(Chainon *pliste, char *l,char * a){
	Chainon *nouveau=creationChainon(l,a);
	Chainon *p1 =pliste;
	if(pliste==NULL){// si la liste est vide
		pliste=nouveau;
	}
	else if (atoi(pliste -> comp) < atoi(a)) { // dans ce cas il faut placer l'element au début
		pliste=insertDebut(pliste,l,a);
	}
	else{
		//on parcours la liste jusqu'à trouver où doit aller le nouveau élément
		while(p1->suivant!= NULL && atoi(p1->suivant->comp) > atoi(a)){ 
			p1=p1->suivant;
		}
		if(p1->suivant==NULL){ // s'il faut placer le nouvel élément en fin de chaîne
			p1->suivant=nouveau;
		}
		else{ // il faut inserer le maillon en millieu de chaîne, après p1
			nouveau->suivant=p1->suivant;
			p1->suivant = nouveau;
		}
	}
	return pliste;
}




Chainon *ajouterCroissantChrono(Chainon *pliste, char *l,char * a){
	Chainon *nouveau=creationChainon(l,a);
	Chainon *p1 =pliste;
	if(pliste==NULL){// si la liste est vide
		pliste=nouveau;
	}
	else if (chrono(pliste -> comp , a)) { // dans ce cas il faut placer l'element au début
		pliste=insertDebut(pliste,l,a);
	}
	else{
		//on parcours la liste jusqu'à trouver où doit aller le nouveau élément
		while(p1->suivant!= NULL && chrono(p1->suivant->comp , a)){ 
			p1=p1->suivant;
		}
		if(p1->suivant==NULL){ // s'il faut placer le nouvel élément en fin de chaîne
			p1->suivant=nouveau;
		}
		else{ // il faut inserer le maillon en millieu de chaîne, après p1
			nouveau->suivant=p1->suivant;
			p1->suivant = nouveau;
		}
	}
	return pliste;
}

