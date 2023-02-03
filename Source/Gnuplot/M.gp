#!/usr/local/bin/gnuplot -persist



# Display a interpolée graphique from SortWeatherM

set datafile separator ";"
set xlabel "Longitude (Ouest-Est)"
set ylabel "Latitude (Sud-Nord)"
set view map
set dgrid3d 200,200,20
set pm3d at b
unset key
unset surface
set size ratio 1
set title "Humidité selon coordoné "
splot "./Data/Final/SortWeatherM.csv" using 2:3:4  




