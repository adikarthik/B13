#!/bin/bash

echo "===== Admin Users ====="
dscl . -read /Groups/admin GroupMembership

echo ""
echo "===== Inactive Users ====="
last | head
