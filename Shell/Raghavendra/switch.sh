#!/bin/bash

echo "Choose an option:"
echo "1. free -m"
echo "2. df -h"
echo "3. du -h"
echo "4. uname -a"
echo "*) man --help"

read -p "Enter your choice (1-4): " opr

case $opr in
    1)
        free -m
        ;;
    2)
        df -h
        ;;
    3)
        du -h
        ;;
    4)
        uname -a
        ;;
    *)
        man --help
        ;;
esac