#!/bin/bash

rm -rf /usr/local/tomcat/webapps/*

cp /tmp/Amazon.war /usr/local/tomcat/webapps/Amazon.war


exec catalina.sh run
