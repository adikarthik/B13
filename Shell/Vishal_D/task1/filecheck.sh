#!/bin/bash
#Author : Vishal Dalawai
#Date : 1st April 2026
#Description : write a program , check file or directory
echo "Enter file or directory name:"
read name

if [ -f "$name" ]; 
then
    echo "it is file"
elif [ -d "$name" ]; 
then
    echo "it is directory"
else
    echo "file doesnt exist"
fi