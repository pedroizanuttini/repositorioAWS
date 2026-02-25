#!/bin/bash
set -e

echo "Running BeforeInstall..."

# Stop and remove existing containers
cd /home/ec2-user/app || true
if [ -f docker-compose.prod.yml ]; then
  echo "Stopping existing containers..."
  docker-compose -f docker-compose.prod.yml down || true
fi

# Clean up old application files (but keep docker-compose.prod.yml)
echo "Cleaning up old application files..."
cd /home/ec2-user
rm -rf app.bak
if [ -d app ]; then
  mv app app.bak
fi
mkdir -p app

echo "BeforeInstall completed successfully"
