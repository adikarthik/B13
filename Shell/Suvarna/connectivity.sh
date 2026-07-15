#!/bin/bash

# List of critical hosts
HOSTS=("google.com" "github.com" "8.8.8.8")

echo "Checking Network Connectivity..."

for HOST in "${HOSTS[@]}"
do
    echo "Checking $HOST..."

    if ping -c 2 $HOST > /dev/null
    then
        LATENCY=$(ping -c 2 $HOST | grep "rtt" | awk -F'/' '{print $5}')
        echo "$HOST is Reachable | Average Latency: ${LATENCY} ms"
    else
        echo "$HOST is NOT Reachable"
    fi

    echo "-----------------------------"
done
