#!/bin/bash
#Author: Vishal Dalawai
#Date : 30th April 2026
#Description : Use read commad to create file and give all permissions
echo "Enter the file name"
read filename

touch $filename
chmod 777 $filename
echo "The file name is " $filename