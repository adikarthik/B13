#!/bin/bash
echo "Choose an option:"
echo "1. Show Memory (free -m)"
echo "2. Show Disk Usage (df -h)"
echo "3. Show Directory Size (du -h)"
echo "4. Show System Info (uname -a)"
echo "Any other key → Help (man --help)"
read -p "Enter option (1-4): " opr
case $opr in
    1)
        echo "Memory Details:"
        free -m
        ;;
    2)
        echo "Disk Usage:"
        df -h
        ;;
    3)
        echo "Directory Usage:"
        du -h
        ;;
    4)
        echo "System Information:"
        uname -a
        ;;
    *)
        echo "Invalid option. Showing help:"
        man --help
        ;;
esac
