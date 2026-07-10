#!/bin/bash
#monitor system resources and alert if they exceed certain thresholds
#includes cpu, memory, and disk usage monitoring
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

while true; do
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
    MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
    DISK=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

    [ "$CPU" -gt "$CPU_THRESHOLD" ] && echo "ALERT: CPU usage $CPU%"
    [ "$MEM" -gt "$MEM_THRESHOLD" ] && echo "ALERT: Memory usage $MEM%"
    [ "$DISK" -gt "$DISK_THRESHOLD" ] && echo "ALERT: Disk usage $DISK%"

    sleep 30
done
