#!/bin/bash


exeC(){
    if [ ! -f ./Cy-Weather ] ; then 
        (cd ./Source/C && make > /dev/null )
        for f in ./Source/C/*.o ; do  rm -f "$f"; done
    fi
    ./Cy-Weather "$@"
}



SortArg(){

    for f in ./Data/Final/*.csv ; do  rm -f "$f"; done

    for i in "$@" ; do

        case $i in 
            "--tab")
                for j in "$@" ; do
                    if [ "$j" = "--abr" ] || [ "$j" = "--avl" ] ; then   
                        return 0
                    fi
                done
                exeC "--tab" $listF
                return 1;;
            "--abr")
                for j in "$@" ; do
                    if [ "$j" = "--avl" ] || [ "$j" = "--tab" ] ; then   
                        return 0
                    fi
                done
                exeC "--abr" $listF
                return 1;;
            "--avl") 
                for j in "$@" ; do
                    if [ "$j" = "--tab" ] || [ "$j" = "--abr" ] ; then   
                        return 0
                    fi 
                done
                exeC "--avl" $listF
                return 1;;
        esac
    done
    exeC "--avl"  $listF
    return 1

}