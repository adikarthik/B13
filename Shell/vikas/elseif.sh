#!/bin/bash


#criteria 
# above 90 - A
# above 70 - B
# above 50 - C
# else fail

echo " enter your marks"
read mark

if [ $mark -gt 90 ]; then
	echo "Grade A"
elif [ $mark -gt 70 ]; then
	echo "Grade B"
else 
	echo " fail "
fi
