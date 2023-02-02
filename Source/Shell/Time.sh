#!/bin/bash

checkDate(){

    var=$1
    if [ ${#var} -ne 10 ] ; then return 0; fi
    if [ "${var:4:1}" != '-' ] || [ "${var:7:1}" != '-' ] ; then return 0; fi
    if date  -d "$var" > /dev/null ; then return 1 ;else return 0;fi


}

TimeArg(){

    rm -f ./Data/FirstSelection/WeatherbyT.csv


    for (( i=1; i<=$#; i++)) ; do

        if [[ ${!i} == "-d"* ]] ; then 
            j=$((i+1))
            k=$((i+2))
            valJ=${!j}
            valK=${!k}
            if checkDate ${!j} || checkDate ${!k}; then return 0; fi
            if [[ $valJ > $valK ]] ; then return 0; fi
            echo "ID OMM station;Date;Direction du vent moyen 10 mn;Vitesse du vent moyen 10 mn;Humidité;Pression station;Coordonnees;Température (°C);Altitude;communes (code)" >> ./Data/FirstSelection/WeatherbyT.csv
            while IFS=";" read -r c1 c2 c3 c4 c5 c6 c7 c8 c9 c10
            do
                
                if [ -z "$c2" ] ; then  continue ; fi
                dataDate="${c2:0:10}"
                if [[ ( "$dataDate" > $valJ || "$dataDate" == "$valJ" ) && ( "$dataDate" < $valK || "$dataDate" == "$valK" ) ]] ; then
                    echo "$c1;$c2;$c3;$c4;$c5;$c6;$c7;$c8;$c9;$c10" >> ./Data/FirstSelection/WeatherbyT.csv
                fi
            done < ./Data/FirstSelection/WeatherbyP.csv
            return 1
        fi
    done
    cp ./Data/FirstSelection/WeatherbyP.csv ./Data/FirstSelection/WeatherbyT.csv
    return 1 

}