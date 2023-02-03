#!/bin/bash


for f in ./Source/Shell/*.sh ; do source "$f"; done


listF="./Data/Final "



# launch all function who navigate through argument to execute the program and senderror message if needed


HelpArg "$@"

if checkFile "$@" ; then 
    echo "Veuillez entré un fichier d'entrée correcte !"
    exit 2
fi

if SpaceArg "$@" ; then 
    echo "Veuillez donnez soint aucun argument de lieux, soit un seul !"
    exit 1
fi

if TimeArg "$@" ; then 
    echo "Veuillez donnez soint aucun argument de Temps, soit un avec des dates correctes !"
    exit 1
fi

if TypeArg "$@" ; then 
    echo "Veuillez donnez au moins un type de donnée a trier"
    exit 1
fi

if SortArg "$@" ; then 
    echo "Veuillez donnez un type de tri"
    exit 1
fi


FinalGraph "$@"

exit 0