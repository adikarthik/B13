#!/bin/bash

echo "Arithmetic of 2 operations" 
read -p " Enter 1st value : " value1
read -p " Enter 2nd value : " value2
read -n 1 -p " Enter the arithmetic symbol: " symbol

case "$symbol" in
	"+")total=$(($value1 + $value2))
		echo "addition of 2 numbers are :" $total ;;
	"-")total=$(($value1 - $value2))
		echo " sub of 2 numbaer are : " $total ;;
	*)
		echo " select other values" ;;
esac





