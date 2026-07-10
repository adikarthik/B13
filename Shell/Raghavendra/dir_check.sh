#!/bin/bash
#check if the given path is a directory or a file
echo "Enter the path to check:"
read path

if [ -d "$path" ]
then
 echo "$path is a directory"
elif [ -f "$path" ]
then
 echo "$path is a file"
else
 echo "Path does not exist or is neither a file nor a directory"
fi