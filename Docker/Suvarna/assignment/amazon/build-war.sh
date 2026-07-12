#!/bin/sh
set -e

git clone https://github.com/SuvarnaNarayanappa/Amazon.git

cd Amazon/Amazon

mvn clean package
