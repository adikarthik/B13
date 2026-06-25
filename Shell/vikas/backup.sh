#!/bin/bash

SOURCE="/home/user/data"
DEST="/home/user/backup"

# Create timestamp (date + time)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file name
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Create backup
tar -czf "$DEST/$BACKUP_NAME" "$SOURCE"

echo "Backup created: $BACKUP_NAME"
