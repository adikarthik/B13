#!/bin/bash
#Author :Vishal
#Date : 2nd April 2026
#Description : Display the factorial till 5

echo "Factorial from 1 to 5"

for i in {1..5}
do
    fact=1
    for (( j=1; j<=i; j++ ))
    do
        fact=$((fact * j))
    done
    echo "Factorial of $i is $fact"
done