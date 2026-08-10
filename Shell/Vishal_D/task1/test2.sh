#!/bin/bash
#Author : Vishal Dalawai
#Date : 30th March 2026
#Description : Use read command twice to create a file and create a directory, read and write permission.
echo "Enter file name to create file"
read filename
echo "Enter directory name to create directory"
read directory
touch $filename
mkdir $directory
chmod 666 $filename
chmod 666 $directory
