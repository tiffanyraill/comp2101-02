#!/bin/bash

# This script saves me from remembering git commands

read -p "Update Message? " message
git add -A
git commit -m "$message"
git push
