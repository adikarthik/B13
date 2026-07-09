#!/bin/bash
#author
#date
#description


read -p "Enter your score:" value
echo 

if [ $value -ge 101 ]; then
	echo "wrong input"
elif [ $value -ge 90 ]; then
	echo "Good"
elif [ $value -ge 40 ]; then
	echo "Bad" 
else 
      echo "fail"
fi

