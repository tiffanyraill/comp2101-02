#!/bin/bash
# this script will ask the user for a random number
#    between one and ten and will keep asking
#    until they get it right

# Generate a Random number between 1 and 10
myNum=$(($RANDOM % 10 + 1))

# Initialize the value of "yourNum"
yourNum=0

# use a while loop until the number is guessed correctly or until an error is generated
while [ $yourNum -ne $myNum ]; do
    # get a number from them
    #asks user to select a number
    read -p "Pick a number from 1 to 10: " yourNum  #the number the user selects is evaluated as "yourNum"
    if [ -z $yourNum ]; then   #if user leaves it empty and hit zero 
        echo "You LOSE by default, Can you live with that?"
        exit
    fi
    if [[ "$yourNum" =~ ^[1-9]$ || "$yourNum" = "10" ]]; then
    # user's guess is within the correct range
        if [ $yourNum -eq $myNum ]; then
        #User guessed correctly
            echo "Great Choice, You guessed correctly!"
            exit
        else
            echo "Sorry!" #incorrect guess
            if [ $yourNum -lt $myNum ]; then #if user's number is lower than (lt) myNum
                echo "Too low, try again"
            else
                echo "Too high, try again" #otherwise it must be too high
            fi
        fi
    else
        echo "Number is not within the 1-10 range" #if the number is not 1-10- error
        exit
    fi
done

# loop ended, they guessed it correctly
echo "You win!"



     
    trap 'restart' 2
    # read CTRL+C from keyboard, restart timer
    read $yourTime -p  "I'm restarting the timer..."


# capture a terminate or quit signal # 15 3 (SIGTERM SIGQUIT)
trap endScript SIGTERM SIGQUIT

    trap 'endScript' 15 3
    # read end signal & end timer
    read -p  "You're impatient! Goodbye..."
