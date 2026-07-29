#!/bin/bash

echo "enter marks to display grade: $marks"
read marks

if [ $marks -ge 25 ];then 
	echo "Just pass"
elif [ $marks -ge 50 ];then
	echo "second class"
elif [ $marks -ge 70 ];then 
	echo "first class"
else 
	echo "Distinction"
fi
