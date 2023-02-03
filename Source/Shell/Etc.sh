#!/bin/bash







checkFile(){
    
    rm -f ./Data/Origin/Weather.csv

    for (( i=1; i<=$#; i++)) ; do
        if [ ${!i} = "-f" ] ; then 
            j=$((i+1))
            if [[ ${!j} == *".csv" ]] ; then
                path="./${!j}"
                if [ ! -r $path ] ; then  return 0 ; fi
                cut -d ';' -f1,2,7,4,5,6,10,11,14,15 $path > ./Data/Origin/Weather.csv
                return 1
            fi
        fi
    done
    return 0


}

exeC(){
    if [ ! -f ./Cy-Weather ] ; then 
        (cd ./Source/C && make > /dev/null )
        for f in ./Source/C/*.o ; do  rm -f "$f"; done
    fi
    ./Cy-Weather "$@"
}


HelpArg(){
    for i in "$@" ; do
        if [[ "$i" == "--help" ]] ; then 
            echo "aide"
        fi
    done
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