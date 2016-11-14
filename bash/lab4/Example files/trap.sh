#!/bin/bash

#Create a script that waits for a user-specified number of seconds, done
#print out an update each second showing how many seconds are left, done
#and catches the interrupt and the quit signals. 
#If it gets the interrupt signal (like from a ^C), have it reset the timer to the initial number of seconds
#print out a message saying it is doing that. 
#It should simply exit with a message if it receives the quit signal (like from a ^\).


   ##Functions
    function showUsage {
    echo "Usage: $0 [-h] [-c #] [-s #]"          
    }
    function errorMessage {
    # echo "***ERROR: $@" >&2
    prog=`basename $0`
      echo "${prog}: ${1: -Unknown Error: Now partitioning Hard Drive... Just Kidding} >&2"
    }
    ## Process the command line
    while [ $# -gt 0 ]; do
	case "$1" in
	-h )
		showUsage
		exit 0
		;;
	-c )
    if [[ "$2" =~ ^[1-60]$ ]]; then
      yourTime=$2
      shift
    else
      errorMessage "Number required for -c, from 1 to 60" >&2
      exit 2
    fi
    ;;
	* )
		showUsage
		errorMessage "Argument '$1' not recognized">&2
		exit 2
		;;
	esac
	shift
    done

    
    # starting timer 
    echo "starting timer script ..."
    sleep 1 # seconds
    
    
    ### Variables 
    yourTime=0

    # get a valid yourTime from the user
    # use a while loop to receive input from the user for the specified range
    while [ "$yourTime" -lt 1 -o "$yourTime" -gt 60 ]; do
     #the user selects the number to countdown from
     read -p "Timer for how many Seconds (1-60)? " -e yourTime  
    done
    
    
    
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





# capture a terminate or quit signal # 15 3 (SIGTERM SIGQUIT)
trap endScript SIGTERM SIGQUIT

    trap 'endScript' 15 3
    # read end signal & end timer
    read -p  "You're impatient! Goodbye..."
done