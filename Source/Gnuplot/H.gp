#!/usr/local/bin/gnuplot -persist


# Display a interpolée graphique from SortWeatherH

set datafile separator ";"
set xlabel "Longitude (Ouest-Est)"
set ylabel "Latitude (Sud-Nord)"
set view map
set dgrid3d 200,200,20
set pm3d at b
unset key
unset surface
set size ratio 1
set title "Altitude selon coordoné "
splot "./Data/Final/SortWeatherH.csv" using 2:3:4  



