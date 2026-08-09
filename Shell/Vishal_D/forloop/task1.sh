#!/bin/bash
#Author : Vishal Dalawai
#Date : 2nd April 2026
#Description : Execution of task1 , by applying for loop logic - create 20 files


echo "Create 20 files"

for i in {1..20}
do 
    if (( $i % 3 == 0 ))
    then
        touch file$i.txt
    else
        touch file$i.log
    fi
done