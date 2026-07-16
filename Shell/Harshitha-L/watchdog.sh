#!/bin/bash

SERVICE="tomcat9"

if systemctl is-active --quiet "$SERVICE"; then
    echo "$(date): $SERVICE is running normally."
else
    echo "$(date): $SERVICE is down. Restarting..."
    sudo systemctl restart "$SERVICE"

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$(date): $SERVICE restarted successfully."
    else
        echo "$(date): Failed to restart $SERVICE."
    fi
fi













