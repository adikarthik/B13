#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=85

LOG_DIR="/home/shashi/Desktop/QA_Tasks/logs"
MONITOR_LOG="$LOG_DIR/monitor.log"

mkdir -p "$LOG_DIR"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
CPU=${CPU%.*}

MEM=$(free | awk '/Mem:/ {print $3/$2 * 100}')
MEM=${MEM%.*}

DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "$(date)" >> "$MONITOR_LOG"
echo "CPU Usage: $CPU%" >> "$MONITOR_LOG"
echo "Memory Usage: $MEM%" >> "$MONITOR_LOG"
echo "Disk Usage: $DISK%" >> "$MONITOR_LOG"

if [ "$CPU" -gt "$CPU_THRESHOLD" ]
then
    echo "ALERT: CPU usage is $CPU%" >> "$MONITOR_LOG"
fi

if [ "$MEM" -gt "$MEM_THRESHOLD" ]
then
    echo "ALERT: Memory usage is $MEM%" >> "$MONITOR_LOG"
fi

if [ "$DISK" -gt "$DISK_THRESHOLD" ]
then
    echo "ALERT: Disk usage is $DISK%" >> "$MONITOR_LOG"

    find "$LOG_DIR" -name "*.log" -mtime +7 -exec rm -f {} \;

    echo "Old logs cleaned successfully" >> "$MONITOR_LOG"
fi

echo "--------------------------------" >> "$MONITOR_LOG"
