#!/bin/bash
set -e

echo "Running ValidateService..."

# Check if container is running
if ! docker ps | grep -q repositorioaws-app; then
  echo "ERROR: Container is not running!"
  exit 1
fi

# Check if application is responding
echo "Checking if application is responding..."
sleep 2

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000 || echo "000")

if [ "$HTTP_CODE" = "200" ]; then
  echo "Application is responding successfully (HTTP $HTTP_CODE)"
  echo "ValidateService completed successfully"
  exit 0
else
  echo "ERROR: Application is not responding correctly (HTTP $HTTP_CODE)"
  exit 1
fi
