#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done


listF="./Data/Final "

HelpArg "$@"




if checkFile "$@" ; then 
    echo "Erreur veuillez donnez 1 fichier correcte"
    exit 2
fi

if SpaceArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul ou aucun lieu"
    exit 1
fi
if TimeArg "$@" ; then 
    echo "Erreur veuillez donnez aucune ou un format correcte de date"
    exit 1
fi

if TypeArg "$@" ; then 
    echo "Erreur veuillez donnez au moins 1 type"
    exit 1
fi


if SortArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

exit 0