#!/bin/bash

echo "===== USERS WITH SUDO ACCESS ====="
getent group sudo

echo
echo "===== USERS WITH EMPTY PASSWORDS ====="
sudo awk -F: '($2==""){print $1}' /etc/shadow

echo
echo "===== LOCKED / INACTIVE ACCOUNTS ====="
sudo passwd -Sa
