#!/bin/bash





# compile the C part if needed then launch the exe

exeC(){
    if [ ! -f ./Cy-Weather ] ; then 
        (cd ./Source/C && make > /dev/null )
        for f in ./Source/C/*.o ; do  rm -f "$f"; done
    fi
    ./Cy-Weather "$@"
}



# check argument and lauch the exe  with the appropriate argument

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
            "--abr") # not implemented
                for j in "$@" ; do
                    if [ "$j" = "--avl" ] || [ "$j" = "--tab" ] ; then   
                        return 0
                    fi
                done
                exeC "--tab" $listF 
                return 1;;
            "--avl") # not implemented
                for j in "$@" ; do
                    if [ "$j" = "--tab" ] || [ "$j" = "--abr" ] ; then   
                        return 0
                    fi 
                done
                exeC "--tab" $listF
                return 1;;
        esac
    done
    exeC "--tab"  $listF
    return 1

}