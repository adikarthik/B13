#!/bin/bash
echo "while condition demo"
currentcount=1
endcount=10

until [ $currentcount -ge $endcount ]
do
touch file_$currentcount.txt
currentcount=$(( $currentcount + 1))
done

