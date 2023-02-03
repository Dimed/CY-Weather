#!/usr/local/bin/gnuplot -persist


set datafile separator ';'
set title "wind_vectors.png"
set xlabel "Latitude (Ouest-Est)"
set ylabel "Longitude(Sud-Nord)"
plot "./Data/Final/SortWeatherW.csv" using 4:5:2:3 with vectors head filled size 1,45 title "Vecteur Vitesse du vent"

