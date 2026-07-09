#!/bin/bash

echo "Arithmetic of 2 operations"
read -p "Enter 1st value :" num1
read -p "Enter 2nd value :" num2
read -p "Enter Arithmetic operator : " oper

case $oper in
	
	"+")sum=$(($num1 + $num2))
		echo "addition of 2 numbers are :" $sum ;;
	"-")sub=$(($num1 - $num2))
		echo "sub of 2 numbers are : " $sub ;;
	*)
		echo "NIL" ;;
esac

