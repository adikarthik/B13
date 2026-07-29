#!/bin/bash

#3. How do you check network connectivity and latency to a list of critical hosts?
# List of critical hosts
hosts=("google.com" “8.8.8.8” "20.214.4.35" "74.162.57.206")

echo "Network Connectivity and Latency Check"
echo "---------------------------------------"

for host in "${hosts[@]}"
do
    echo "Checking $host"

    # Check connectivity and capture latency
    result=$(ping -c 2 $host 2>/dev/null)

    if [ $? -eq 0 ]
    then
        latency=$(echo "$result" | tail -1 | awk -F '/' '{print $5}')
        packet_loss=$(echo "$result" | grep "packet loss" | awk '{print $6}')

        echo "Status: Reachable"
        echo "Latency: ${latency} ms"
        echo "Packet Loss: ${packet_loss}"
    else
        echo "Status: Not Reachable"
    fi

done

