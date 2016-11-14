#!/bin/bash

    # starting timer 
    echo "starting timer script ..."
    sleep 1 # seconds

    # get input from user
    read -p "Timer for how many Seconds?" -e yourTime
    sleep 1 
    
    # get start time
    startup=$(date +%s)

   while [ -1 ]; do
        clear 


    currentTime=$(date +%s) # get time now in seconds
    math=$(( $currentTime-$startup - 1 ))  # compute diff in seconds
    elapsed=$(( $yourTime-$math ))    # compute elapsed time in seconds
    secs=$(( $elapsed - 1))

        if [ $secs == 0 ] # if time expired
        then # blink screen
        for i in `seq 1 180`; # for i = 1:180 (i.e. 180 seconds)
            do
            clear 
            
            echo "Time is up! "

        sleep 1

            clear

            echo "Time is Up!" 
            sleep 1
            done # end for loop
            break   # end script

            else 
            echo "$secs"  # display time
            sleep 1 
            fi  
            done  