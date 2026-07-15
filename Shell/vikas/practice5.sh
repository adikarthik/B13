#!/bin/bash

echo " Number Magic"
echo "sum of 2 numbers, diff of 2 numbers and % & / "
sum=$(( $1 + $2 ))
diff=$(( $1 - $2 ))
mul=$(( $1 / $2 ))
div=$(( $1 % $2 ))


echo "sum of add is" $sum
echo "diff of num is " $diff
echo "mul of num is" $mul
echo "div of num is" $div
echo "file name is" $0
echo "1st parameter is" $1
echo "2md parameter is" $2
echo "count of parameter passed" $#
echo " show in one line" $@
echo " show in one line" $*
echo " process id" $$
echo "beackground id" $!
echo : "last command status" $?
