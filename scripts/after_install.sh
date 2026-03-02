#!/bin/bash
set -e

echo "Running AfterInstall..."

cd /home/ec2-user/app

# Always use the latest tag regardless of the artifact
IMAGE_TAG=latest
export IMAGE_TAG

echo "Forcing use of tag: $IMAGE_TAG" > .env

echo "IMAGE_TAG=$IMAGE_TAG"

# Login to ECR
echo "Logging into ECR..."
aws ecr get-login-password --region ap-southeast-2 | sudo docker login --username AWS --password-stdin 307553794930.dkr.ecr.ap-southeast-2.amazonaws.com

# Force pull the new image by removing any existing copy first
echo "Pulling Docker image with tag: $IMAGE_TAG..."
sudo docker image rm -f 307553794930.dkr.ecr.ap-southeast-2.amazonaws.com/node-example:$IMAGE_TAG || true
docker pull 307553794930.dkr.ecr.ap-southeast-2.amazonaws.com/node-example:$IMAGE_TAG

echo "AfterInstall completed successfully"
