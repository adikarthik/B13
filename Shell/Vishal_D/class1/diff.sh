#!/bin/bash
#Author: Vishal Dalawai
#Date:31st March 2026
#Description: Difference of 2 numbers
echo “Difference of ‘2’ numbers”
echo “ Enter num1”
read num1
echo “ Enter num2”
read num2
diff=$(($num1 - $num2))
echo “sum of ‘2’ numbers is” $diff
