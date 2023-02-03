#!/usr/local/bin/gnuplot -persist
# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
# set output 'errorbars.10.png'

set datafile separator ';'
set title "Temperature selon station"
set ylabel "Temperature (°C)"
set xlabel "Station"

set key autotitle columnhead
set style line 100 lt 1 lc rgb "grey" lw 0.5 # linestyle for the grid
set grid ls 100 # enable grid with specific linestyle


set xtics rotate
set key left top


set style line 101 lw 2 lt rgb "#07F120" # style for targetValue (1) (pink)
set style line 102 lw 2 lt rgb "#2FF6FF" # style for targetValue (1) (pink)
set style line 103 lw 4 lt rgb "#FC0F0F" # style for secondYAxisValue (3) (limegreen)
Shadecolor = "#80E0A080"

plot './Data/Final/SortWeatherT1.csv' using 1:4 w lines ls 101 title "maximum", '' using 1:($2):($4) with filledcurve fc rgb Shadecolor title "Variation de température", '' using 1:2 w lines ls 102 title "minimum", '' using 1:3 w lines ls 103 title "moyenne" 
