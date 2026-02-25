#!/bin/bash
set -e

echo "Running AfterInstall..."

cd /home/ec2-user/app

# Read IMAGE_TAG from artifact
if [ -f imagedefinitions.json ]; then
  echo "Reading image tag from imagedefinitions.json..."
  IMAGE_URI=$(cat imagedefinitions.json | jq -r '.[0].imageUri')
  export IMAGE_TAG=$(echo $IMAGE_URI | cut -d':' -f2)
  echo "IMAGE_TAG=$IMAGE_TAG"
  echo "IMAGE_TAG=$IMAGE_TAG" > .env
else
  echo "No imagedefinitions.json found, using latest tag"
  export IMAGE_TAG=latest
  echo "IMAGE_TAG=latest" > .env
fi

# Login to ECR
echo "Logging into ECR..."
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 307553794930.dkr.ecr.ap-southeast-2.amazonaws.com

# Pull the new image
echo "Pulling Docker image with tag: $IMAGE_TAG..."
docker pull 307553794930.dkr.ecr.ap-southeast-2.amazonaws.com/node-example:$IMAGE_TAG

echo "AfterInstall completed successfully"
