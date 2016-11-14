#!/bin/bash

#prompt the user for 2 numbers. 
#Perform each of the 5 arithmetic operations on the numbers,
#display the results in a user-friendly way
secondnum=2

read -p "Give me a number: " firstnum


sum=$(( firstnum + secondnum ))
echo "$firstnum + $secondnum = $sum"

#here is a quicker way to do it:
echo "$firstnum - $secondnum = $(( firstnum - secondnum))"
echo "$firstnum x $secondnum = $(( firstnum * secondnum))"
echo "$firstnum / $secondnum = $(( firstnum / secondnum))"
echo "$firstnum / $secondnum leaves a remainder of = "
    if [ $firstnum % secondnum == 0]
        echo "therefore is Even"
        else
            echo "therefore is Odd"
        fi
        done
        
        