#!/bin/bash

read -p "enter a number to check : " num

while [ "$num" -le 10 ]
do
echo $num
num=$((num + 1))
done

