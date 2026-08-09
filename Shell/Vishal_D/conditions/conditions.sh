#!/bin/bash
THRESHOLD=70
TOTAL=$(free -m | awk '/Mem:/ {print $2}')
USED=$(free -m | awk '/Mem:/ {print $3}')
FREE=$((TOTAL - USED))
FREE_PERCENT=$((FREE * 100 / TOTAL))
echo "Total Memory: ${TOTAL}MB"
echo "Used Memory: ${USED}MB"
echo "Free Memory: ${FREE}MB"
echo "Free Memory Percentage: ${FREE_PERCENT}%"

if [ "$FREE_PERCENT" -lt "$THRESHOLD" ]; then
    echo "ALERT: Free memory is below threshold (${THRESHOLD}%)!"
else
    echo "Memory is healthy."
fi
