#!/bin/bash
servers=("server -1" "db-server -1 " "webserver -1")

#Getting or displaying all the values
echo "All servers : ${servers[@]}"

#Getting or displaying 1st values
echo "First servers : ${servers[0]}"

#Getting or displaying 2nd values
echo "Second servers : ${servers[1]}"

 echo "connecting to $servers"