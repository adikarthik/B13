#!/bin/bash

HOSTS=("google.com" "github.com" "8.8.8.8")

for host in "${HOSTS[@]}"
do
    echo "Checking $host..."

    ping -c 4 $host > /dev/null 2>&1

    if [ $? -eq 0 ]
    then
        latency=$(ping -c 4 $host | tail -1 | awk -F '/' '{print $5}')
        echo "$host is reachable"
        echo "Average latency: ${latency} ms"
    else
        echo "$host is unreachable"
    fi

    echo "----------------------"
done
