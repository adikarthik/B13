#!bin/bash
echo "This script is to check if two numbers are equal or not"
echo "read 1st number"
read num1
echo "read 2nd number"
read num2

if  [ $num1 -eq $num2 ]
then
echo "given numbers are equal"
fi

