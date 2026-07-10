#!/bin/bash
#watchdog script to monitor a process and restart it if it is not running
PROCESS="nginx"

while true; do
    if ! pgrep -x "$PROCESS" > /dev/null; then
        echo "$(date): $PROCESS not running, restarting..."
        systemctl start $PROCESS
    fi
    sleep 15
done
