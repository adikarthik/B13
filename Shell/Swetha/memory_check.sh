#!/bin/bash
#date:03-04-2026
#author:swetha
#description:task3

# Get memory values (in MB)
total=$(free -m | awk '/Mem:/ {print $2}')
used=$(free -m | awk '/Mem:/ {print $3}')

# Calculate free memory
free_mem=$((total - used))

# Convert to percentage
free_per=$((free_mem * 100 / total))

echo "Free Memory: $free_per%"

# Set threshold
threshold=70

# Check condition
if [ $free_per -lt $threshold ]; then
    echo "ALERT: Free memory is below $threshold%"
else
    echo " Memory is sufficient"
fi
