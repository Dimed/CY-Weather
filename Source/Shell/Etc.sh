#!/bin/bash







checkFile(){

    for (( i=1; i<=$#; i++)) ; do
        if [ ${!i} = "-f" ] ; then 
            j=$((i+1))
            if [[ ${!j} == *".csv" ]] ; then
                path="./${!j}"
                cut -d ';' -f1,2,3,4,5,6,11,14,15 $path > ./Data/Start/Weather.csv
                return 1
            fi
        fi
    done
    return 0


}

