#!/bin/bash

#this is a command for generating  random number
myNum=$(($RANDOM % 10 + 1))
echo "your random number is: $RANDOM"


declare –A myhash
#enter your objects into the array where it says "data1, or data2"
myhash=([key1]=“data1” [key2]=“data2”)