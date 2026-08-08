#!/bin/bash
#Author: Vishal Dalawai
#Date:31st March 2026
#Description: Performing all Arithmetic operations - By passing parameters
echo “Performing all Arithmetic operations”
sum=$(($1 + $2))
diff=$(($1 - $2))
multi=$(($1 * $2))
div=$(($1 / $2))
mod=$(($1 % $2))

echo “Sum of ‘2’ numbers is” $sum
echo “Diff of ‘2’ numbers is” $diff
echo “Product of ‘2’ numbers is” $multi
echo “Division of ‘2’ numbers is” $div
echo “Modulus of ‘2’ numbers is” $mod
echo "print the exit code " $?
echo $0
echo $#
echo $@
echo $?
echo $$
echo $!
echo $*