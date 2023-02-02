#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done




HelpArg "$@"




if [ ! -r ./Data/Origin ] || [ ! -w ./Data/Origin ] ; then  exit 3 ; fi

if checkFile "$@" ; then 
    echo "Erreur veuillez donnez un argument -f correct"
    exit 2
fi




if [ ! -r ./Data/FirstSelection ] || [ ! -w ./Data/FirstSelection ] ; then  exit 3 ; fi

if SpaceArg "$@" ; then 

    echo "Erreur veuillez donnez soit aucun soit 1 seul argument de lieux"
    exit 1
fi

if TimeArg "$@" ; then 
    echo "Erreur veuillez donnez soit aucun soit 1  argument de temps correct"
    exit 1
fi




if [ ! -r ./Data/ReadytoSort ] || [ ! -w ./Data/ReadytoSort ] ; then  exit 3 ; fi

if TypeArg "$@" ; then 
    echo "Erreur veuillez donnez au moins 1 type de donné"
    exit 1
fi




if [ ! -r ./Data/Final ] || [ ! -w ./Data/Final ] ; then  exit 3 ; fi

if SortArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

exit 0