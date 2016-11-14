#!/bin/bash

### Variables definitions
declare -i numOfDice
declare -i numOfSides

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
    if [[ "$2" =~ ^[1-5]$ ]]; then
      numOfDice=$2
      shift
    else
      errorMessage "Number required for -c, from 1 to 5" >&2
      exit 2
    fi
    ;;
  -s )
    if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
      if [ "$2" -ge 4 -a "$2" -le 20 ]; then
        numOfSides=$2
        shift
      else
        errorMessage "Number required for -s, from 4 to 20" >&2
        exit 2
      fi
    else
      errorMessage "Number required for -s, from 4 to 20" >&2
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

### Variables 
numOfDice=0
numOfSides=0

# get a valid numOfDice from the user
# use a while loop to receive input from the user for the specified range
    while [ "$numOfDice" -lt 1 -o "$numOfDice" -gt 5 ]; do
     #the user selects number of dice to roll
     read -p "How many dice shall I roll[1-5]? " numOfDice  
    done
    
# get a valid numOfSides from the user for the specified range
    while [ "$numOfSides" -lt 4 -o "$numOfSides" -gt 20 ]; do
        # dice will have up to number 20 on it
        read -p "How many sides should the dice have[4-20]? " numOfSides
        echo "----------------------------------------"
       
# specified sides must have a number between 4-20  
      if [[ "$numOfSides" =~ ^[1-9][0-9]*$ ]]; then
        if [ "$numOfSides" -ge 4 -a "$numOfSides" -le 20 ]; then
        break
        fi
        fi
    done

# do the dice roll as many times as the user asked for
for (( rolls=0 ; rolls < numOfDice ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM %numOfSides +1))
  die2=$(($RANDOM %numOfSides +1))
  rolled=$(($die1 + $die2))
# show the roll results
  echo "Rolled $die1 & $die2 equalling $rolled"
  echo "---------------------"
done