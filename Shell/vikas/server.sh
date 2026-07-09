#!/bin/bash

read -p "enter hostname or ip addess : " hostname
read -p "enter port number : " port


while true
do

	nc -zv $hostname $port

	if [ $? == 0 ] 
	then
		echo " port is open"
		break
		else
			echo "port is not open"
			echo "retrying in 5 seconds"
			sleep 5s
	fi
done
