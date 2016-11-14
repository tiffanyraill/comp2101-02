#!/bin/bash
# this script prompts the user for a count of dice, number of sides the dice
# should have, and then rolls them

# Initialize the value of "yourNum"
numOfDice=0
numOfSides=0

# use a while loop to receive input or until an error is generated
    while [ 1 ]; do
    # get a number from them
    #asks user to select a number
    read -p "How many dice shall I roll[1-5]? " numOfDice  #the user selects number of dice to roll
    if [ -z $numOfDice ]; then   #if user leaves it empty and hit zero 
        echo "You LOSE by default, Can you live with that?"
         exit
    fi
  done    
      while [ "$numOfSides" -lt 4 -o "$numOfSides" -gt 20 ]; do
      
       read -p "How many sides should the dice have[4-20]? " numOfSides
      
    #  if [[ "$yourNum" =~ ^[1-9]$ || "$yourNum" = "10" ]]; then
        exit
    fi
  done  


# do the dice roll as many times as the user asked for
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM %6 +1))
  die2=$(($RANDOM %6 +1))
  rolled=$(($die1 + $die2))
# show the roll results
  echo "Rolled $die1,$die2 for $rolled"
done