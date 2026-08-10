#!/bin/bash
echo "addition of 2 numbers"

sum=$(( $1 + $2))
echo "sum of 2 number is " $sum
total=$(( $sum + $3))
echo "sum of 3 number is " $total
echo "file name is" $0
echo $#
echo $@
echo $?
echo $$
echo $*
echo $!
