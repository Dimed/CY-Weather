#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done


listF="./Data/Final "

HelpArg "$@"


if checkFile "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

if SpaceArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

if TimeArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

if TypeArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

if SortArg "$@" ; then 
    echo "Erreur veuillez donnez 1 seul trie"
    exit 1
fi

FinalGraph "$@"

exit 0