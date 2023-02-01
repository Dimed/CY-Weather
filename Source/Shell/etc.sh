#!/bin/bash



checkFile(){

    for (( i=1; i<=$#; i++)) ; do
        if [ ${!i} = "-f" ] ; then 
            j=$((i+1))
            if [[ ${!j} == *".csv" ]] ; then
                path="./${!j}"
                return 1
            fi
        fi
    done
    return 0


}

