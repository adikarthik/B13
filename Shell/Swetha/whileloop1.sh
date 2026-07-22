#!/bin/bash

i=1

while [ $i -le 10 ]
do  
	echo "i+1 = $i"
	(( i++ ))
done

