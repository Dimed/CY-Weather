#!/bin/bash

TypeArg(){

    for f in ./Data/ReadyToSort/*.csv ; do  rm -f "$f"; done

    succ=0
    for i in "$@" ; do

        case $i in
            "-t1")
            cut -d ';' -f1,8 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weathert1.csv
            echo "ID OMM station;Température (°C)" >> ./Data/ReadyToSort/Weathert11.csv  
            while IFS=";" read -r c1 c2 
            do
                if [ -z "$c2" ] ; then  
                    continue
                else
                    echo "$c1;$c2" >> ./Data/ReadyToSort/Weathert11.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weathert1.csv)
            rm -f ./Data/ReadyToSort/Weathert1.csv
            declare -a idArr=()
            echo "ID OMM station;Temperature Min;Temperature Moy;Temperature Max" >> ./Data/ReadyToSort/WeatherT1.csv  
            while IFS=";" read -r c1 c2
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    addT=0
                    minT=$c2
                    maxT=$c2
                    con=0
                    while IFS=";" read -r d1 d2
                    do
                        if [[ "$d1" == "$c1" ]] ; then 
                            if (( $(echo "$d2 > $maxT" | bc -l) )) ; then maxT=$d2 ; fi
                            if (( $(echo "$d2 < $minT" | bc -l) )) ; then minT=$d2 ; fi
                            addT=$(awk -v var=$addT -v var2=$d2 'BEGIN{OFMT="%f";print var+var2}')
                            con=$((con+1))  
                        fi
                    done < <(tail -n +2 ./Data/ReadyToSort/Weathert11.csv)
                    moyT=$(awk -v var=$addT -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    echo "$c1;$minT;$moyT;$maxT" >> ./Data/ReadyToSort/WeatherT1.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weathert11.csv)
            rm -f ./Data/ReadyToSort/Weathert11.csv
            chmod 777 "./Data/ReadyToSort/WeatherT1.csv"
            listF+="./Data/ReadyToSort/WeatherT1.csv "
            succ=1 ;;

            "-t2")
            cut -d ';' -f2,8 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weathert2.csv
            echo "Date;Température (°C)" >> ./Data/ReadyToSort/Weathert21.csv  
            while IFS=";" read -r c1 c2 
            do
                if [ -z "$c2" ] ; then  
                    continue
                else
                    echo "$c1;$c2" >> ./Data/ReadyToSort/Weathert21.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weathert2.csv)
            rm -f ./Data/ReadyToSort/Weathert2.csv
            declare -a idArr=()
            echo "Date;Moyenne Temperature" >> ./Data/ReadyToSort/WeatherT2.csv  
            while IFS=";" read -r c1 c2
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    addT=0
                    con=0
                    while IFS=";" read -r d1 d2
                    do
                        if [[ "$d1" == "$c1" ]] ; then 
                        addT=$(awk -v var=$addT -v var2=$d2 'BEGIN{OFMT="%f";print var+var2}')
                        con=$((con+1))  
                        fi
                    done < <(tail -n +2 ./Data/ReadyToSort/Weathert21.csv)
                    moyT=$(awk -v var=$addT -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    echo "$c1;$moyT" >> ./Data/ReadyToSort/WeatherT2.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weathert21.csv)
            rm -f ./Data/ReadyToSort/Weathert21.csv
            chmod 777 "./Data/ReadyToSort/WeatherT2.csv"
            listF+="./Data/ReadyToSort/WeatherT2.csv "
            succ=1 ;;

            "-t3")
            cut -d ';' -f1,2,8 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weathert3.csv
            while IFS=";" read -r c1 c2 c3
            do
                if [ -z "$c3" ] ; then  
                    continue
                else
                    echo "$c1;$c2;$c3" >> ./Data/ReadyToSort/WeatherT3.csv  
                fi
            done < ./Data/ReadyToSort/Weathert3.csv
            rm -f ./Data/ReadyToSort/Weathert3.csv
            chmod 777 "./Data/ReadyToSort/WeatherT3.csv"
            listF+="./Data/ReadyToSort/WeatherT3.csv "
            succ=1 ;;

            "-p1")
            cut -d ';' -f1,6 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherp1.csv
            echo "ID OMM station;Pression station" >> ./Data/ReadyToSort/Weatherp11.csv  
            while IFS=";" read -r c1 c2 
            do
                if [ -z "$c2" ] ; then  
                    continue
                else
                    echo "$c1;$c2" >> ./Data/ReadyToSort/Weatherp11.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherp1.csv)
            rm -f ./Data/ReadyToSort/Weatherp1.csv
            declare -a idArr=()
            echo "ID OMM station;Pression Min;Pression Moy;Pression Max" >> ./Data/ReadyToSort/WeatherP1.csv  
            while IFS=";" read -r c1 c2
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    addP=0
                    minP=$c2
                    maxP=$c2
                    con=0
                    while IFS=";" read -r d1 d2
                    do
                        if [[ "$d1" == "$c1" ]] ; then 
                            if (( $(echo "$d2 > $maxP" | bc -l) )) ; then maxP=$d2 ; fi
                            if (( $(echo "$d2 < $minP" | bc -l) )) ; then minP=$d2 ; fi
                            addP=$(awk -v var=$addP -v var2=$d2 'BEGIN{OFMT="%f";print var+var2}')
                            con=$((con+1))  
                        fi
                    done < <(tail -n +2 ./Data/ReadyToSort/Weatherp11.csv)
                    moyP=$(awk -v var=$addP -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    echo "$c1;$minP;$moyP;$maxP" >> ./Data/ReadyToSort/WeatherP1.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherp11.csv)
            rm -f ./Data/ReadyToSort/Weatherp11.csv
            chmod 777 "./Data/ReadyToSort/WeatherP1.csv"
            listF+="./Data/ReadyToSort/WeatherP1.csv "
            succ=1 ;;

            "-p2")
            cut -d ';' -f2,6 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherp2.csv
            echo "Date;Pression station" >> ./Data/ReadyToSort/Weatherp21.csv  
            while IFS=";" read -r c1 c2 
            do
                if [ -z "$c2" ] ; then  
                    continue
                else
                    echo "$c1;$c2" >> ./Data/ReadyToSort/Weatherp21.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherp2.csv)
            rm -f ./Data/ReadyToSort/Weatherp2.csv
            declare -a idArr=()
            echo "Date;Moyenne Pression" >> ./Data/ReadyToSort/WeatherP2.csv  
            while IFS=";" read -r c1 c2
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    addP=0
                    con=0
                    while IFS=";" read -r d1 d2
                    do
                        if [[ "$d1" == "$c1" ]] ; then 
                        addP=$(awk -v var=$addP -v var2=$d2 'BEGIN{OFMT="%f";print var+var2}')
                        con=$((con+1))  
                        fi
                    done < <(tail -n +2 ./Data/ReadyToSort/Weatherp21.csv)
                    moyT=$(awk -v var=$addP -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    echo "$c1;$moyT" >> ./Data/ReadyToSort/WeatherP2.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherp21.csv)
            rm -f ./Data/ReadyToSort/Weatherp21.csv
            chmod 777 "./Data/ReadyToSort/WeatherP2.csv"
            listF+="./Data/ReadyToSort/WeatherP2.csv "
            succ=1 ;;

            "-p3")
            cut -d ';' -f1,2,6 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherp3.csv
            while IFS=";" read -r c1 c2 c3
            do
                if [ -z "$c3" ] ; then  
                    continue
                else
                    echo "$c1;$c2;$c3" >> ./Data/ReadyToSort/WeatherP3.csv  
                fi
            done < ./Data/ReadyToSort/Weatherp3.csv
            rm -f ./Data/ReadyToSort/Weatherp3.csv
            chmod 777 "./Data/ReadyToSort/WeatherP3.csv"
            listF+="./Data/ReadyToSort/WeatherP3.csv "
            succ=1 ;;

            "-w")
            cut -d ';' -f1,3,4,7 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherw.csv
            echo "ID OMM station;Vecteur vent en X;Vecteur vent en Y;Coordonnees" >> ./Data/ReadyToSort/Weatherw2.csv  
            while IFS=";" read -r c1 c2 c3 c4
            do
                if [ -z "$c2" ] || [ -z "$c3" ]; then  
                    continue
                else
                    vecX=$(awk -v var=$c2 -v var2=$c3 'BEGIN{OFMT="%f";print var2*cos(var*atan2(0,-1)/180)}')
                    vecY=$(awk -v var=$c2 -v var2=$c3 'BEGIN{OFMT="%f";print var2*sin(var*atan2(0,-1)/180)}')
                    echo "$c1;$vecX;$vecY;$c4" >> ./Data/ReadyToSort/Weatherw2.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherw.csv)
            rm -f ./Data/ReadyToSort/Weatherw.csv
            declare -a idArr=()
            echo "ID OMM station;Vecteur vent en X;Vecteur vent en Y;Coordonnees" >> ./Data/ReadyToSort/WeatherW.csv  
            while IFS=";" read -r c1 c2 c3 c4
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    addX=0
                    addY=0
                    con=0
                    while IFS=";" read -r d1 d2 d3 d4
                    do
                        if [[ "$d1" == "$c1" ]] ; then 
                        addX=$(awk -v var=$addX -v var2=$d2 'BEGIN{OFMT="%f";print var+var2}')
                        addY=$(awk -v var=$addY -v var2=$d3 'BEGIN{OFMT="%f";print var+var2}')
                        con=$((con+1))  
                        fi
                    done < <(tail -n +2 ./Data/ReadyToSort/Weatherw2.csv)
                    moyX=$(awk -v var=$addX -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    moyY=$(awk -v var=$addY -v var2=$con 'BEGIN{OFMT="%f";print var / var2}')
                    check=0
                    IFS=',' read -ra ADDR <<< "$c4"
                        for i in "${ADDR[@]}"; do
                            if [ $check -eq 0 ] ; then long=$i; check=1; else lat=$i;fi
                        done
                    echo "$c1;$moyX;$moyY;$long;$lat" >> ./Data/ReadyToSort/WeatherW.csv  
                fi
            done < <(tail -n +2 ./Data/ReadyToSort/Weatherw2.csv)
            rm -f ./Data/ReadyToSort/Weatherw2.csv
            chmod 777 "./Data/ReadyToSort/WeatherW.csv"
            listF+="./Data/ReadyToSort/WeatherW.csv "
            succ=1 ;;

            "-m")
            cut -d ';' -f1,5,7 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherm.csv
            while IFS=";" read -r c1 c2 c3
            do
                if [ -z "$c2" ] ; then  
                    continue
                else
                    echo "$c1;$c2;$c3" >> ./Data/ReadyToSort/Weatherm2.csv  
                fi
            done < ./Data/ReadyToSort/Weatherm.csv
            rm -f ./Data/ReadyToSort/Weatherm.csv
            declare -a idArr=()
            while IFS=";" read -r c1 c2 c3
            do
                a=0
                for i in "${idArr[@]}"
                do
                    if [[ "$c1" == "$i" ]]; then a=1 ; break; fi
                done
                if [ $a -eq 0 ] ; then 
                    idArr+=("$c1")
                    max=$c2
                    while IFS=";" read -r d1 d2 d3
                    do
                        if [[ "$d1" == "$c1" ]] && [[ $d2 > $max ]] ; then max=$d2 ; fi
                    done < ./Data/ReadyToSort/Weatherm2.csv 
                    check=0
                    IFS=',' read -ra ADDR <<< "$c3"
                    for i in "${ADDR[@]}"; do
                        if [ $check -eq 0 ] ; then long=$i; check=1; else lat=$i;fi
                    done
                    echo "$c1;$max;$long;$lat" >> ./Data/ReadyToSort/WeatherM.csv  
                fi
            done < ./Data/ReadyToSort/Weatherm2.csv
            rm -f ./Data/ReadyToSort/Weatherm2.csv
            chmod 777 "./Data/ReadyToSort/WeatherM.csv"
            listF+="./Data/ReadyToSort/WeatherM.csv "
            succ=1 ;;
            "-h")
            cut -d ';' -f1,7,9 ./Data/FirstSelection/WeatherbyT.csv > ./Data/ReadyToSort/Weatherh.csv
            sort -r -u ./Data/ReadyToSort/Weatherh.csv  > ./Data/ReadyToSort/Weatherh2.csv
            while IFS=";" read -r c1 c2 c3
            do
                if [ -z "$c3" ] ; then  
                    continue
                else
                    check=0
                    IFS=',' read -ra ADDR <<< "$c2"
                    for i in "${ADDR[@]}"; do
                        if [ $check -eq 0 ] ; then long=$i; check=1; else lat=$i;fi
                    done
                    echo "$c1;$long;$lat;$c3" >> ./Data/ReadyToSort/WeatherH.csv  
                fi
            done < ./Data/ReadyToSort/Weatherh2.csv
            rm -f ./Data/ReadyToSort/Weatherh.csv
            rm -f ./Data/ReadyToSort/Weatherh2.csv
            chmod 777 "./Data/ReadyToSort/WeatherH.csv"
            listF+="./Data/ReadyToSort/WeatherH.csv "
            succ=1 ;;
        esac
    done
    return $succ
}

