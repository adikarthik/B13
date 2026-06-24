#!/bin/bash


TOTAL_SPACE=$(free -mt | grep Total | awk '{print $2}')
USED_SPACE=$(free -mt | grep Total | awk '{print $3}')
PERCENTAGE=$(($USED_SPACE * 100 / $TOTAL_SPACE))
THRESHOLD=70


if [ $PERCENTAGE -gt $THRESHOLD ]
then
        echo " Warning, RAM is running low : "
else
        echo " RAM space is sufficient "
fi
