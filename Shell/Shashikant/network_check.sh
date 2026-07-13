#!/bin/bash

HOSTS=(
    "google.com"
    "github.com"
    "8.8.8.8"
)

for HOST in "${HOSTS[@]}"
do
    echo "Checking $HOST..."

    ping -c 4 "$HOST" > /tmp/ping_result.txt

    if [ $? -eq 0 ]
    then
        LATENCY=$(grep "rtt" /tmp/ping_result.txt | awk -F '/' '{print $5}')

        echo "$HOST is reachable"
        echo "Average Latency: ${LATENCY} ms"
    else
        echo "$HOST is unreachable"
    fi

    echo "-------------------------"
done
