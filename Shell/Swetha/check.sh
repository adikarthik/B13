#!/bin/bash
#date:03-04-2026
#author:swetha
#description:task4

echo "Enter name:"
read name

if [ -f "$name" ]; then
    echo "$name is a file"
elif [ -d "$name" ]; then
    echo "$name is a directory"
else
    echo "$name does not exist"
fi
