#!/bin/bash

read -n 1 -p "enter a num / charac / digit :" value

case "$value" in
	[a-zZ-A])
	echo "alphabets" ;;
[1-9])
	echo "numericals" ;;
*)
	echo "others" ;;
esac


