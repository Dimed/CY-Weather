#!/bin/bash


placeArg(){

    for i in "$@" ; do

        case $i in 
            "-F")
                for j in "$@" ; do
                    if [ "$j" = "-G" ] || [ "$j" = "-S" ]  || [ "$j" = "-A" ] || [ "$j" = "-O" ] || [ "$j" = "-Q" ] ; then   
                        return 0
                    fi
                done
                return 1;;
                

            "-G")
                for j in "$@" ; do
                    if [ "$j" = "-F" ] || [ "$j" = "-S" ]  || [ "$j" = "-A" ] || [ "$j" = "-O" ] || [ "$j" = "-Q" ] ; then   
                        return 0
                    fi
                done
                return 1;;

            "-S")
                for j in "$@" ; do
                    if [ "$j" = "-G" ] || [ "$j" = "-F" ]  || [ "$j" = "-A" ] || [ "$j" = "-O" ] || [ "$j" = "-Q" ] ; then   
                        return 0
                    fi
                done
                return 1;;

            "-A")
                for j in "$@" ; do
                    if [ "$j" = "-G" ] || [ "$j" = "-S" ]  || [ "$j" = "-F" ] || [ "$j" = "-O" ] || [ "$j" = "-Q" ] ; then   
                        return 0
                    fi
                done
                return 1;;

            "-O")
                for j in "$@" ; do
                    if [ "$j" = "-G" ] || [ "$j" = "-S" ]  || [ "$j" = "-A" ] || [ "$j" = "-F" ] || [ "$j" = "-Q" ] ; then   
                        return 0
                    fi
                done
                return 1;;

            "-Q")
                for j in "$@" ; do
                    if [ "$j" = "-G" ] || [ "$j" = "-S" ]  || [ "$j" = "-A" ] || [ "$j" = "-O" ] || [ "$j" = "-F" ] ; then   
                        return 0
                    fi
                done
                return 1;;
        esac

    done
    return 1

}


if placeArg "$@" ; then

    echo "Erreur"
    return 1
fi
