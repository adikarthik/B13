#!/bin/bash

echo "Enter the IP address or Server Name:"
read address

ping -c 10 "$address" > file.txt

count=$(wc -l < file.txt)

if [ "$count" -gt 10 ]
then
    echo "The server is reachable"
    echo "The latency of the host is: $(grep 'rtt' file.txt)"
else
    echo "The server is unreachable"
fi

echo "Line count: $count"
