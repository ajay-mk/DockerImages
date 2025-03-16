#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed or not found in PATH. Please install Docker to proceed."
    exit 1
fi

# Check if the correct number of arguments is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 FOLDER_NAME [NAME_FOR_IMAGE]"
    exit 1
fi

# Assign arguments to variables
FOLDER_NAME=$1
IMAGE_NAME=${2:-$FOLDER_NAME} # Default to FOLDER_NAME if NAME_FOR_IMAGE is not provided

# Check if the folder exists
if [ ! -d "$FOLDER_NAME" ]; then
    echo "Error: Folder '$FOLDER_NAME' does not exist."
    exit 1
fi

# Check if a Dockerfile exists in the folder
DOCKERFILE_PATH="$FOLDER_NAME/Dockerfile"
if [ ! -f "$DOCKERFILE_PATH" ]; then
    echo "Error: No Dockerfile found in the folder '$FOLDER_NAME'."
    exit 1
fi

# Build the Docker image
echo "Building Docker image '$IMAGE_NAME' from folder '$FOLDER_NAME'..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" "$FOLDER_NAME"

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' built successfully."
else
    echo "Error: Failed to build Docker image '$IMAGE_NAME'."
    exit 1
fi