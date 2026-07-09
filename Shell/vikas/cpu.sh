#!/bin/bash

#top -bn1 refers to batch 1 and 1 iteration

THRESHOLD=70
EMAIL="mvik.143.007@Gmail.com"
for i in {1..10}
do

CPU_IDLE=$(top -bn1 | grep Cpu | awk '{print int($8)}')

#CPU USAGE = 100 -idle value
CPU_USAGE=$(( 100 - $CPU_IDLE))


if [ $CPU_USAGE -ge $THRESHOLD ]; then
        echo "CPU Usage has gone above $CPU_USAGE" | mail -s "CPU Above threshold" $EMAIL
else
        echo "CPU USage in track"
        sleep 5s
fi
done
