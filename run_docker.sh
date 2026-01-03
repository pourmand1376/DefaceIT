#!/bin/bash

# DefaceIT Docker Runner Script
# This script provides an easy way to run DefaceIT using Docker

echo "=========================================="
echo "  DefaceIT - Docker Runner"
echo "=========================================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker is not installed"
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✓ Docker found"
echo ""

# Create videos directory if it doesn't exist
if [ ! -d "videos" ]; then
    echo "Creating videos directory..."
    mkdir -p videos
    echo "✓ Videos directory created"
else
    echo "✓ Videos directory exists"
fi
echo ""

# Allow X11 connections
echo "Allowing X11 connections..."
echo "Note: This grants X11 access to all local Docker containers."
echo "      For enhanced security, consider using xhost with specific IDs."
xhost +local:docker &> /dev/null
if [ $? -eq 0 ]; then
    echo "✓ X11 connections allowed"
else
    echo "⚠️  Warning: Could not set X11 permissions (xhost not found)"
    echo "   The GUI may not display properly"
fi
echo ""

# Check if image exists, if not build it
if ! docker image inspect defaceit &> /dev/null; then
    echo "Building DefaceIT Docker image..."
    echo "This may take a few minutes on first run..."
    echo ""
    docker build -t defaceit .
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to build Docker image"
        exit 1
    fi
    echo ""
    echo "✓ Docker image built successfully"
else
    echo "✓ Docker image exists"
fi
echo ""

echo "Starting DefaceIT..."
echo "Place your videos in the 'videos' folder to access them"
echo ""

# Get absolute path to current directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Run the container
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "${SCRIPT_DIR}/videos:/videos" \
  --network host \
  defaceit

echo ""
echo "DefaceIT has been closed"
