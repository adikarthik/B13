#!/bin/bash

#4.How do you write a watchdog script that checks if a service is running and restarts it if stopped?
# Service to monitor
SERVICE="nginx"

# Check service status
if systemctl is-active --quiet $SERVICE
then
    echo "$(date): $SERVICE is running"
else
    echo "$(date): $SERVICE is stopped. Restarting..."
    
    systemctl restart $SERVICE

    # Verify restart
    if systemctl is-active --quiet $SERVICE
    then
        echo "$(date): $SERVICE restarted successfully"
    else
        echo "$(date): Failed to restart $SERVICE"
    fi
fi
