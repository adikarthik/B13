#!/bin/bash
#1.How do you check CI/CD pipeline status for multiple branches using the Jenkins  API?
JENKINS_URL="http://localhost:8080"
JOB_NAME="multi branch"

USER="admin"
TOKEN="<token>"

branches=("main" "master-demo" "feature-demo-pr")

echo "===== Jenkins Multibranch Pipeline Status ====="
echo

for branch in "${branches[@]}"
do
    echo "Checking branch: $branch"

    status=$(curl -s \
    -u $USER:$TOKEN \
    "$JENKINS_URL/job/${JOB_NAME// /%20}/job/$branch/lastBuild/api/json" \
    | jq -r '.result')

    building=$(curl -s \
    -u $USER:$TOKEN \
    "$JENKINS_URL/job/${JOB_NAME// /%20}/job/$branch/lastBuild/api/json" \
    | jq -r '.building')


    if [ "$building" == "true" ]
    then
        echo "$branch : BUILDING"

    elif [ "$status" == "SUCCESS" ]
    then
        echo "$branch : SUCCESS"

    elif [ "$status" == "FAILURE" ]
    then
        echo "$branch : FAILED"

    else
        echo "$branch : NO BUILD FOUND"
    fi

    echo "-----------------------------"

done
