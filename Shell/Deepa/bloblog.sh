#!/bin/bash

# Source and backup directories
LOG_DIR="/var/log"
BACKUP_DIR="$HOME/log_backup"

# Azure Storage details
STORAGE_ACCOUNT="deepalogstorage123"
CONTAINER_NAME="applicationlogs"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup file name
BACKUP_FILE="$BACKUP_DIR/logs_$(date +%F).tar.gz"

echo "Creating compressed log archive..."

# Compress logs
sudo tar -czf "$BACKUP_FILE" "$LOG_DIR"

if [ $? -eq 0 ]; then
    echo "Logs compressed successfully."
else
    echo "Error: Log compression failed."
    exit 1
fi

echo "Uploading archive to Azure Blob Storage..."

# Upload to Azure Blob Storage
az storage blob upload \
    --account-name "$STORAGE_ACCOUNT" \
    --container-name "$CONTAINER_NAME" \
    --file "$BACKUP_FILE" \
    --name "$(basename "$BACKUP_FILE")" \
      --auth-mode login \
    --overwrite

if [ $? -eq 0 ]; then
    echo "Logs uploaded successfully to Azure Blob Storage."
else
    echo "Error: Azure Blob upload failed."
    exit 1
fi

echo "Removing local backups older than 7 days..."

# Delete backups older than 7 days
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete

echo "Old backups removed."

echo "Backup process completed successfully."
