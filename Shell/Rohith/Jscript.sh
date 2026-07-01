#!/bin/bash

JENKINS_URL="http://localhost:8080"
JOB_NAME="GitMultiBranchRepo"
USER="$USER"
PASSWORD="$PASS"

BRANCH=("main" "IB-2080_Login_changes" "IB-9211_Payment_render" "feature_A")

for BRANCH in "${BRANCH[@]}"
do
    STATUS=$(curl -s -u "$USER:$PASSWORD" \
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
