#!/bin/bash

set -e

echo "Starting Kubernetes Deployment ..."

# Variables
NAMESPACE=devops
APP_NAME=backend
IMAGE_NAME=devops-backend
REGISTRY=my-registry
IMAGE_TAG=${BUILD_NUMBER}

echo "Using Image: $REGISTRY/$IMAGE_NAME:$IMAGE_TAG"

# create namespace, if does not exist
kubectl apply -f k8s/namespace.yaml

# apply configmaps
kubectl apply -f k8s/configmap.yaml -n $NAMESPACE

# update deployment image
kubectl set image deployment/$APP_NAME $APP_NAME=$REGISTRY/$IMAGE_NAME:$IMAGE_TAG \
-n $NAMESPACE || true

#apply deployment
kubectl apply -f k8s/backend-deployment.yaml -n $NAMESPACE

#apply service
kubectl apply -f k8s/service.yaml -n $NAMESPACE

# apply network policy
kubectl apply -f k8s/networkpolicy.yaml -n $NAMESPACE

# apply auto-scaling
kubectl apply -f k8s/hpa.yaml -n $NAMESPACE

# check deployment status
kubectl rollout status deployment/$APP_NAME -n $NAMESPACE

echo "Deployment completed successfully"