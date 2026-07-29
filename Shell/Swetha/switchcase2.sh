#!/bin/bash

echo "Enter num1 $num1"
read num1
echo "Enter num2 $num2"
read num2
echo "Enter arithemetic choice +,-,*,/ : $choice"
read choice

case "$choice"	in
	"+")
		result=$(( $num1 + $num2 ))
		echo "sum of 2 numbers: $result"
		;;
	"-")
		result=$(( $num1 - $num2 ))
		echo "minus $result"
		;;
	"*")
		result=$(( $num1 * $num2 ))
		echo "multi of 2 numbers: $result"
		;;
	"/")
		result=$(( $num1 / $num2 ))
		echo "division of two $result"
		;;
	*)
		echo "Invalid code"
		;;


esac
