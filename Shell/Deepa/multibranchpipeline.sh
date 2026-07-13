#! /bin/bash
JENKINS_URL="http://localhost:8089"




JOB_NAME="Multibranch%20Pipeline"
USERNAME="admin"
API_TOKEN="11f6828209c783c5e033e3e65906b5141f"
branches=("IB-2080_Login_changes" "IB-9211_Payment_render" "IB-Demo_PR" "main" "master-demo")
for branch in "${branches[@]}"
do
    status=$(curl -s -u "$USERNAME:$API_TOKEN" \
    "$JENKINS_URL/job/$JOB_NAME/job/$branch/api/json" | jq -r '.color')

    echo "$branch : $status"
done
