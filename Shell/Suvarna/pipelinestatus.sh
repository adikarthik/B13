#!/bin/bash

# Jenkins Details
JENKINS_URL="http://localhost:8080"
JOB_NAME="MyPipeline"

# Jenkins Credentials
USER="admin"
TOKEN="your_api_token"

# Branches to check
BRANCHES=("main" "dev" "qa")

echo "Checking Jenkins Pipeline Status..."

for BRANCH in "${BRANCHES[@]}"
do
    STATUS=$(curl -s -u $USER:$TOKEN \
    "$JENKINS_URL/job/$JOB_NAME/job/$BRANCH/lastBuild/api/json" \
    | grep -o '"result":"[^"]*"' | cut -d':' -f2 | tr -d '"')

    echo "$BRANCH : $STATUS"
done
