#!/bin/bash

threshold=80

usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $usage -gt $threshold ]
then
    echo "Disk usage exceeded $threshold%"
else
    echo "Disk usage is normal"
fi