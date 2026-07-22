#!/bin/bash

echo "Enter any number between 1-100 $number "
read number

if [ $number -eq 100 ] ; then
	echo "the value is equal to 100"
elif [ $number -lt 100 ] ; then
	echo "the value is less than 100"
elif [ $number -gt 100 ] ; then
	echo "value greater than 100"
else
	echo "not a valid numer"

fi

