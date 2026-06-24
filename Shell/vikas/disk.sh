#!/bin/bash

DISK_USAGE=$(df -h | grep sda5 | awk '{print $5}' | sed 's/%//')
THRESHOLD=70
EMAIL="mvik.143.007@Gmail.com"

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]
then
        echo " Disk Usage has surpassed above $THRESHOLD "
        echo " issue with disk usage " | mail -s "disk alert" $EMAIL
fi


