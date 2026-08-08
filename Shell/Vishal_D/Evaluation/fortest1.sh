#!/bin/bash
for i in {1..5}
do
fact=1
for ((j=1;j<=i;j++))
do
fact=$(( fact * j ))
done
echo "factorial of $i is $fact"
done