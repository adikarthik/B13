#!/bin/bash

JENKINS_URL="http://192.168.88.6:8080"
JOB_NAME="MB_Proj"

BRANCHES=(
"IB-2080_Login_changes"
"IB-9211_Payment_render"
"IB-Demo_PR"
"PraveenKuberABC-patch-1"
"feature-login-change"
"main"
"master-demo"
)

for BRANCH in "${BRANCHES[@]}"
do

STATUS=$(curl -s \
"$JENKINS_URL/job/$JOB_NAME/job/$BRANCH/api/json" \
| grep -o '"color":"[^"]*"' \
| cut -d':' -f2 \
| tr -d '"')

echo "Branch : $BRANCH"

case "$STATUS" in
blue)
echo "Status : SUCCESS"
;;
red)
echo "Status : FAILED"
;;
yellow)
echo "Status : UNSTABLE"
;;
blue_anime)
echo "Status : RUNNING"
;;
disabled)
echo "Status : DISABLED"
;;
*)
echo "Status : UNKNOWN"
;;
esac

echo "------------------------"

done
