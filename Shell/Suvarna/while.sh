#!/bin/bash
echo "while condition demo"
currentcount=1
endcount=10

while [ $currentcount -le $endcount ]
do
touch file_$currentcount.txt
currentcount=$(( $currentcount + 1))
done
