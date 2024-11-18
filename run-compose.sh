#!/bin/bash

# Check if arguments were provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [docker-compose arguments]"
    exit 1
fi

COMPOSE_ARGS="$@"
# Cache the sudo credentials
sudo -v


# Find all immediate subdirectories and check for compose files
for dir in */; do
    # Check if directory is not empty and exists
    if [ -d "$dir" ]; then
        # Navigate to the directory
        cd "$dir"
        
        # Check for docker-compose.yml, docker-compose.yaml, or compose.yaml
        if [ -f "docker-compose.yml" ] || [ -f "docker-compose.yaml" ] || [ -f "compose.yaml" ]; then
            echo "Found compose file in $dir"
            sudo docker compose $COMPOSE_ARGS
        fi
        
        # Return to the parent directory
        cd ..
    fi
done
