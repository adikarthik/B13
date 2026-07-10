#!/bin/bash

read -p "please enter a number : " num

until [ $num -gt 10 ]
do
	echo $num
	num=$((num+2))

done
