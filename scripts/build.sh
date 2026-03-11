#!/bin/bash

set -e

echo "Starting build process..."

# Variables

APP_NAME=backend
IMAGE_NAME=devops-backend
REGISTRY=123456789.dkr.ecr.ap-south-1.amazonaws.com
IMAGE_TAG=${BUILD_NUMBER}

echo "Building Docker image: $IMAGE_NAME:$IMAGE_TAG"

docker build -t $IMAGE_NAME:$IMAGE_TAG ./app

echo "Tagging image for registry"

docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY/$IMAGE_NAME:$IMAGE_TAG

echo "Logging into registry"

aws ecr get-login-password --region ap-south-1 \
| docker login \
--username AWS \
--password-stdin $REGISTRY

echo "Pushing image to registry"

docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG

echo "Build completed successfully"