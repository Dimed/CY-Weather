#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done

path="./"



if checkFile "$@" ; then 
    echo "Erreur veuillez donnez l'argument -f"
    exit 1
fi

if SpaceArg "$@" ; then 
    echo "Erreur veuillez donnez soit aucun soit 1 seul argument de lieux"
    exit 2
fi


if TimeArg "$@" ; then 
    echo "Erreur veuillez donnez soit aucun soit 1  argument de temps correct"
    exit 3
fi


