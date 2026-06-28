#!/bin/bash

# Thresholds
CPU_LIMIT=80
MEM_LIMIT=80
DISK_LIMIT=90

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

# Memory Usage
MEM=$(free | awk '/Mem/ {print int($3/$2 * 100)}')

# Disk Usage
DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU Usage : $CPU%"
echo "Memory Usage : $MEM%"
echo "Disk Usage : $DISK%"

# CPU Alert
if [ $CPU -gt $CPU_LIMIT ]
then
    echo "ALERT: CPU usage is high!"
fi

# Memory Alert
if [ $MEM -gt $MEM_LIMIT ]
then
    echo "ALERT: Memory usage is high!"
fi

# Disk Alert and Cleanup
if [ $DISK -gt $DISK_LIMIT ]
then
    echo "Disk almost full!"
    echo "Deleting logs older than 7 days..."

    find /var/log -name "*.log" -mtime +7 -delete

    echo "Old logs deleted."
fi
