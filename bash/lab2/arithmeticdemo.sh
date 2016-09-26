#!/bin/bash

#prompt the user for 2 numbers. 
#Perform each of the 5 arithmetic operations on the numbers,
#display the results in a user-friendly way

read -p "Give me a number: " firstnum
read -p "Give me a second number: " secondnum

sum=$(( firstnum + secondnum ))
echo "$firstnum + $secondnum = $sum"

#here is a quicker way to do it:
echo "$firstnum - $secondnum = $(( firstnum - secondnum))"
echo "$firstnum x $secondnum = $(( firstnum * secondnum))"
echo "$firstnum / $secondnum = $(( firstnum / secondnum))"
echo "$firstnum / $secondnum leaves a remainder of = $(( firstnum % secondnum))"