#!/bin/bash
#check the disk usage and alert if it exceeds a certain threshold
THRESHOLD=80   # percent

while true; do
    USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo "ALERT: Root filesystem usage is ${USAGE}%"
    fi

    sleep 60
done
