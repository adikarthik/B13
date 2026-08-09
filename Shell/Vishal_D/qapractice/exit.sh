#!/bin/bash
#Author : Vishal Ddalawai
#Date : 7th April 2026
#description : writing scrpit to come out of program , if error occured.
cp file1.txt /tmp/
if [ $? -ne 0 ]; then
    echo "Error occurred! Exiting..."
    exit 1
fi
echo "This will not run if error happens”

