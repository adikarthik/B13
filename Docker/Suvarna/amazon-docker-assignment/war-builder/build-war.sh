#!/bin/bash

set -e

echo "========== Cloning Repository =========="

git clone https://github.com/SuvarnaNarayanappa/Amazon.git

cd Amazon/Amazon

echo "========== Current Directory =========="
pwd

echo "========== Building WAR =========="

mvn clean package

echo "========== Copying WAR =========="

cp Amazon-Web/target/Amazon.war /shared/Amazon.war

echo "========== WAR copied successfully =========="

ls -l /shared

echo "========== Build Successful =========="
