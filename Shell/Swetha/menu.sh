#!/bin/bash
#date:03-04-2026
#author:swetha
#description:task

echo "Choose option:"
echo "1. free -m"
echo "2. df -h"
echo "3. du -h"
echo "4. uname -a"

read opr

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
    echo "Invalid option"
    ;;
esac
