#!/bin/bash

echo "1) Users with Sudo Access"
if getent group sudo >/dev/null; then
    getent group sudo
else
    echo "No sudo group found."
fi

echo
echo "2) Users with Empty Passwords"
EMPTY_USERS=$(sudo awk -F: '($2==""){print $1}' /etc/shadow)

if [ -z "$EMPTY_USERS" ]; then
    echo "No users with empty passwords."
else
    echo "$EMPTY_USERS"
fi

echo
echo "3) Inactive Users (Never Logged In)"
INACTIVE_USERS=$(lastlog | grep "Never logged in")

if [ -z "$INACTIVE_USERS" ]; then
    echo "No inactive users found."
else
    echo "$INACTIVE_USERS"
fi

echo "Audit Completed Successfully"

