#!/bin/bash

#look up animals by their colours using an index

# Variables
#create an array with some colours in it
colours=("red" "green" "blue" "yellow")

echo "The colours array has ${colours[0]}, ${colours[1]}, ${colours[2]} in it. "
echo "The @ symbol shows us the colours are: ${colours[@]}."

#creating an associative array
declare -A animals
animals=(["red"]="cardinal" ["green"]="frog" ["blue"]="bluejay" ["yellow"]="duckling")

#Main
#Display the colours and animals arrays
echo "The red animal is a ${animals[red]}. "
echo "The green animal is a ${animals[green]}. "
echo "The blue animal is a ${animals[blue]}. "
echo "The yellow animal is a ${animals[yellow]}. "
echo "The animals hash contains: ${animals[@]}. "
echo "Their colours are:  ${!animals[@]}. "

# get a number frm the user to look up a specific animal and display that
read -p "Give me a number from 0 to 3: " num
colour=${colours[$num]}
animal=${animals[$colour]}
echo "Index $num gives us a $colour $animal. " 