#!/usr/local/bin/gnuplot -persist
# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
# set output 'errorbars.10.png'


set xdata time # tells gnuplot the x axis is time data
set timefmt "%Y-%m-%dT%H:%M:%S+01:00" # specify our time string format
set format x "%Y-%m-%dT%H" # otherwise it will show only MM:SS
set datafile separator ';'
set title "Temperature selon Date"
set ylabel "Temperature "
set xlabel "Date"




set key autotitle columnhead
set style line 100 lt 1 lc rgb "grey" lw 0.5 # linestyle for the grid
set grid ls 100 # enable grid with specific linestyle


set xtics rotate
set key right top

set style line 103 lw 4 lt rgb "#FC0F0F" # style for secondYAxisValue (3) (limegreen)
Shadecolor = "#80E0A080"

plot './Data/Final/SortWeatherT3.csv' using 1:2 w lines ls 103 title "Temperature moyenne"
