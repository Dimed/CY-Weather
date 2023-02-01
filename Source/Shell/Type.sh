#!/bin/bash


TypeArg(){
    
    succ=0
    for i in "$@" ; do

        case $1 in
            "-t1")
            succ=1 ;;
            "-t2")
            succ=1 ;;
            "-t3")
            succ=1 ;;
            "-p1")
            succ=1 ;;
            "-p2")
            succ=1 ;;
            "-p3")
            succ=1 ;;
            "-w")
            succ=1 ;;
            "-m")
            succ=1 ;;
            "-h")
            succ=1 ;;
        esac
    done
    return $succ



}

