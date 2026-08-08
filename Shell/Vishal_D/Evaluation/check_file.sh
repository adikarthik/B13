#!/bin/bash
echo "enter file or dir to check"
read file
if [ -d "$file" ]
then
echo "it is dir"
elif [ -f "$file" ]
then
echo "it is file"
else
echo "file doen't exists"
fi