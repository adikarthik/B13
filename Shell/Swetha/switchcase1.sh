#!/bin/bash
#switch case

echo "1.display name"
echo "2.display id no"
echo "3.display validation code"
echo "Enter number between 1-3: $number"
read number

	case $number in
		1)
			echo "Swetha"
			;;
		2)
			echo "456"
			;;
		3)
			echo "123456789990"
			;;
		*)
			echo "Invalid code"
			;;
	esac
