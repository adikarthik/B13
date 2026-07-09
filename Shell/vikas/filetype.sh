#!/bin/bash

#System monitor menu
echo "1. Display Free Memory (MB)"
echo "2. Disk Usage (Human Readable)"
echo "3. Directory Usage"
echo "4. System Information (Uname)"
read -p "Enter a choice from above  : " choice

case $choice in
	1)
		free -m ;;
	2)
		df -h ;;
	3) 
		du -h ;;
	4) 
		uname -a ;;
	*) 
		man --help ;;
esac

