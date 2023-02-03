#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done


listF="./Data/Final ./Data/ReadyToSort/WeatherT2.csv ./Data/ReadyToSort/WeatherP2.csv"

HelpArg "$@"








if SortArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

exit 0