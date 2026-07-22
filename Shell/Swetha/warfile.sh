#!/bin/bash

set -e

WAR_FILE="Amazon.war"
TOMCAT_WEBAPPS="/opt/tomcat/webapps"

echo "Stopping Tomcat..."

sudo systemctl stop tomcat || true

echo "Removing old deployment..."

sudo rm -rf ${TOMCAT_WEBAPPS}/Amazon*

echo "Copying WAR..."

sudo cp ${WAR_FILE} ${TOMCAT_WEBAPPS}/

echo "Starting Tomcat..."

sudo systemctl start tomcat

echo "Deployment Successful"

sleep 5

curl http://localhost:8001/Amazon
