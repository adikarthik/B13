#!/bin/bash
#Author: Vishal Dalawai
#Date:31st March 2026
echo "checking if file exists in the directory"

read file

if [ -f $file ] 
then
echo “$file exists in directory”
fi
