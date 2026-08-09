#!/bin/bash

echo "Stopping existing container..."

docker stop amazon-container 2>/dev/null
docker rm amazon-container 2>/dev/null

echo "Building Docker image..."

docker build -t amazon-app:latest -f amazon.Dockerfile .

echo "Starting container..."

docker run -d \
--name amazon-container \
-p 8080:8080 \
amazon-app:latest

echo "Deployment completed."

docker ps
