#!/bin/bash
#Author: Vishal Dalawai
#Date:31st March 2026
#Description: Performing all Arithmetic operations
echo “Performing all Arithmetic operations”
echo “ Enter num1”
read num1
echo “ Enter num2”
read num2
sum=$(($num1 + $num2))
diff=$(($num1 - $num2))
multi=$(($num1 * $num2))
div=$(($num1 / $num2))
mod=$(($num1 % $num2))

echo “Sum of ‘2’ numbers is” $sum
echo “Diff of ‘2’ numbers is” $diff
echo “Product of ‘2’ numbers is” $multi
echo “Division of ‘2’ numbers is” $div
echo “Modulus of ‘2’ numbers is” $mod
echo $0
echo $#
echo $@
echo $?
echo $$
echo $!
echo $*