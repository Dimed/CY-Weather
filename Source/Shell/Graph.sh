#!/bin/bash



FinalGraph(){

    for i in "$@" ; do

        case $i in
            "-t1") gnuplot ./Source/Gnuplot/T1.gp -platform=wayland > /dev/null ;;
            "-t2") gnuplot ./Source/Gnuplot/T2.gp -platform=wayland > /dev/null ;;
            "-t3") gnuplot ./Source/Gnuplot/T3.gp -platform=wayland > /dev/null ;;
            "-p1") gnuplot ./Source/Gnuplot/P1.gp -platform=wayland > /dev/null ;;
            "-p2") gnuplot ./Source/Gnuplot/P2.gp -platform=wayland > /dev/null ;;
            "-p3") gnuplot ./Source/Gnuplot/P3.gp -platform=wayland > /dev/null ;;
            "-w") gnuplot  ./Source/Gnuplot/W.gp -platform=wayland > /dev/null ;;
            "-m") gnuplot ./Source/Gnuplot/M.gp -platform=wayland > /dev/null ;;
            "-h") gnuplot ./Source/Gnuplot/H.gp -platform=wayland > /dev/null ;;
        esac
    done
}

