#!/bin/bash

echo "=== Users with sudo access ==="
getent group sudo | cut -d: -f4

echo
echo "=== Accounts with empty passwords ==="
sudo awk -F: '($2==""){print $1}' /etc/shadow

echo
echo "=== Last login information ==="
lastlog
