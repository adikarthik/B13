#!/bin/bash

read -n 1 -p "Enter a input : " input

case "$input" in
	[a-zA-Z])
		echo "Entered value was:"  "$input" 
		echo "Entered value was alphabet" ;;
	[0-9])
		echo "Entered value was:"  "$input" 
		echo "Entered value was numerical" ;;
	*)

		echo "Entered value was invalid as it was $input and incorrect" ;;
esac
