#!/bin/bash

HOSTS="hosts.txt"

echo "----- Network Connectivity Check -----"

while read HOST
do
    echo "Checking $HOST..."

    if ping -c 4 "$HOST" > /dev/null 2>&1; then
        LATENCY=$(ping -c 4 "$HOST" | tail -1 | awk -F'/' '{print $5}')
        echo "Status : Reachable"
        echo "Average Latency : ${LATENCY} ms"
    else
        echo "Status : Unreachable"
    fi
done < "$HOSTS"

echo "Network Check Completed."
