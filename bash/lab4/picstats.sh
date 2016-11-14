#!/bin/bash

#accept a help option to display command help, 
#a directory on the command line to search for pictures,
#and a count of how many of the biggest files to display# (-c or --count #). 
#Default to ~/Pictures and the biggest 3 files if the user doesn't give parameters for those on the command line.

#variables
declare -i numFiles
#set default of files to show to 3
numFiles=3
#set default directory to the "pictures" directory
directory=~/Pictures

#function
function errorMessage {
  prog=`basename $0`
  echo "${prog}: ${1: -Unknown Error: Now partitioning Hard Drive... Just Kidding} >&2"
}

##Process command line
haveDirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
        -h )
            echo "Usage: $0 [-h] [-c #] [directory]"
            exit 0
            ;;
        -c )
            if [[ "$2" =~ ^[1-9][0-9]* ]]; then
                filecount=$2
                shift
            else
        
              errorMessage "-c option requires a count" >&2
                 echo "Usage: $0 [-h] [-c #] [directory]" >&2
              exit 2
            fi
            ;;
        * )
            if [$haveDirectory = "no" ]; then
                directory=$1
                haveDirectory=yes
            else
                echo "Usage: $0 [-h] [-c #] [directory]" >&2
                errorMessage "What is $1" >&2
                exit 1
            fi    
            ;;
    esac
    shift
done

    if [ ! -d "$directory" ]; then
    errorMessage "Directory does not exist: $directory" >&2
    exit 2
    fi  
    
    # output
    # starting script 
    echo "starting script ..."
    echo "++++++++++++++++++++++++++++"
    sleep 1 # seconds

    filecount=`find  "$directory" -type f | wc -l`
    echo "In the $directory directory, there are $filecount files."
    echo "++++++++++++++++++++++++++++"

    totalspaceused=`du -sh "$directory" | awk '{print $1}'`
    echo "the $directory directory uses $totalspaceused "
    echo "++++++++++++++++++++++++++++"

    echo "The $numFiles largest files in the $directory directory are: "
    echo "      "
    du -h "$directory"/* | sort -h |tail -"$numFiles"
