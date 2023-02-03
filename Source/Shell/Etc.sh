#!/bin/bash





# check if file argument is correct and return 0 if not, otherwis return 1 and create from the file another file who only keep useful column

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

# check argument and display help if needed

HelpArg(){
    for i in "$@" ; do
        if [[ "$i" == "--help" ]] ; then 
            echo -e "\nMain.sh: ./Main.sh -t1 -F ...\n"
            echo -e "      Argument obligatoire :\n\n"
            echo -e "               -f  <file.csv> : chemin vers le fichier \"meteo_filtered_data_v1.csv\" "
            echo -e "               --tab | --abr | --avl : methode de trie 1 seul obligatoirement"
            echo -e "               -t1 | -t2 | -t3 | -p1 | -p2 | -p3 | -w | -m | -h | : au moins un typde de donnée a trié obligatoirement\n\n"

            echo -e "      Argument optionelles :\n\n"
            echo -e "               -F | -G | -S | -A | -O | -Q : au maximum 1 region a choisir"
            echo -e "               -d  <min>  <max> : tri s'effectura sur la periode choisie, le format des dates doit etre : \"YYYY-MM-DD\""
            echo -e "               --help : affiche un ecran d'aide sur Main.sh\n"
            echo -e "\n\n\nPour plus d'information voir : https://drive.google.com/file/d/1b7KFJtJ5EfPHIbNoQVgvELa5dNpfodbX/view?usp=sharing\n"
        fi
    done
}


