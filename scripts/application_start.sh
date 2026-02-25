#!/bin/bash
set -e

echo "Running ApplicationStart..."

cd /home/ec2-user/app

# Load IMAGE_TAG from .env
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Start the application using docker-compose
echo "Starting application with docker-compose..."
docker-compose -f docker-compose.prod.yml up -d

# Wait for container to be healthy
echo "Waiting for container to start..."
sleep 5

# Clean up old images
echo "Cleaning up old Docker images..."
docker image prune -f

echo "ApplicationStart completed successfully"
