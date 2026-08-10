#!/bin/bash
#Author
#Date
#Description

echo "enter the your input to check whether it is file or dir"
read name

if [ -f "$name" ];
then
 echo "it is file"
elif [ -d "$name" ];
then
echo "it is directory"
else
echo "file doesn't exist"
fi