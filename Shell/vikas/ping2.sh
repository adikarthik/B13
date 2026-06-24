#!/bin/bash

read -p "enter the server name to check : " server


while true
do
	ping -c 1 $server
	
	if [ $? -eq 0 ]
	then
               echo "connection successfull to $server"
		break
	else
	    echo "connnection unsuccesfull to $server"
            echo "Retrying in 5 seconds ....$server"
	    sleep 5s
            fi

	    done

