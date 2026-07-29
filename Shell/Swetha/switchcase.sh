#!/bin/bash

echo "1. start"
echo "2. stop"
echo "3. go "
echo "Enter choice (1-3): "
read choice 

case "$choice" in
	1)
	       	echo "start"
	;;
2)
	echo "stop"
	;;
3) echo "go"
	;;
*)
	echo " invalid choice"
	;;





esac
