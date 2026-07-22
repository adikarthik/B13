#!/bin/bash

while true
do
  echo "1. Date"
  echo "2. List files"
  echo "3. Exit"

  read choice

  case $choice in
    1) date ;;
    2) ls ;;
    3) break ;;
    *) echo "Invalid" ;;
  esac
done
