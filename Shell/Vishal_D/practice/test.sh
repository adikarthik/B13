#!/bin/bash
#Author
#Date :
#Description:

echo "enter the file name"
read file
echo "enter the directory name"
read dir
touch $file
mkdir $dir
chmod 777 $file
chmod 777 $dir