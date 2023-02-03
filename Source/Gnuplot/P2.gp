#!/usr/local/bin/gnuplot -persist



# Display a Line graphique from SortWeatherP2

set xdata time 
set timefmt "%Y-%m-%dT%H:%M:%S+01:00"  
set format x "%Y-%m-%dT%H" 
set datafile separator ';'
set title "Pression selon Date"
set ylabel "Pression "
set xlabel "Date"




set key autotitle columnhead
set style line 100 lt 1 lc rgb "grey" lw 0.5 
set grid ls 100 


set xtics rotate
set key left bottom

set style line 103 lw 4 lt rgb "#FC0F0F" 
Shadecolor = "#80E0A080"

plot './Data/Final/SortWeatherP2.csv' using 1:2 w lines ls 103 title "Pression moyenne"
