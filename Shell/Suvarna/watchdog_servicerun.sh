#!/bin/bash

SERVICE="nginx"

# Check whether the service is running
if systemctl is-active --quiet $SERVICE
then
    echo "$SERVICE is running."
else
    echo "$SERVICE is stopped. Restarting..."
    sudo systemctl restart $SERVICE
    echo "$SERVICE restarted successfully."
fi
