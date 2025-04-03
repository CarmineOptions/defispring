#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if correct number of arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <round_number>"
  exit 1
fi

# Assign positional parameters
ROUND=$1
VERSION="1.$ROUND.0"

# Define Docker image name
IMAGE="europe-west1-docker.pkg.dev/carmine-api-381920/docker-repository/defi-distribution-backend:$VERSION"

# Build the Docker image
echo "Building $IMAGE..."
docker build --platform=linux/amd64 -t "$IMAGE" .

# Push the Docker image
echo "Pushing $IMAGE..."
docker push "$IMAGE"

echo "Defispring round $ROUND has been publsihed as version $VERSION"
