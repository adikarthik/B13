#!/bin/bash
currentcount=1
endcount=5
until [ $currentcount -ge $endcount ]
do
 touch file$currentcount.txt
 currentcount=$(( $currentcount + 1 ))
done
