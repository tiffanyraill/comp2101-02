#!/bin/bash

#This is step 1 of lab 2
#This script outputs the following text using variables:
#           Welcome to planet hostname, title name!
#           today is weekday

export MYNAME="Tiffany Raill"
mytitle="Your Excellence"
myhostname=`hostname`
#this is the command to pull todays day example: Monday
weekday=`date +%A`
 
echo "Welcome to planet $myhostname, $mytitle $MYNAME"
echo "Today is $weekday."