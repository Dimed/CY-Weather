#!/bin/bash







checkFile(){
    
    rm -f ./Data/Origin/Weather.csv

    for (( i=1; i<=$#; i++)) ; do
        if [ ${!i} = "-f" ] ; then 
            j=$((i+1))
            if [[ ${!j} == *".csv" ]] ; then
                path="./${!j}"
                cut -d ';' -f1,2,7,4,5,6,10,11,14,15 $path > ./Data/Origin/Weather.csv
                return 1
            fi
        fi
    done
    return 0


}

