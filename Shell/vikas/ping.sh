#!/bin/bash

while true
do

read -p "echo enter the server hostname :" server 

ping -c 4 $server 

if [ $? -eq 0 ]; then
	echo "connected successfuklly"
	break
else
	echo "not connected"
	echo "retry in 5 seconds"
	sleep 5s
fi

done

