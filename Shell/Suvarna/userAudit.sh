#!/bin/bash

echo "===== Linux User Audit ====="

echo ""
echo "1. Users with Sudo Access:"
getent group sudo

echo ""
echo "2. Users with Empty Passwords:"
sudo awk -F: '($2==""){print $1}' /etc/shadow

echo ""
echo "3. Inactive/Locked User Accounts:"
sudo passwd -S $(cut -d: -f1 /etc/passwd) | grep "L"

echo ""
echo "===== Audit Completed ====="
