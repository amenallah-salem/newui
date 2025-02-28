#!/bin/bash

# Stop and remove orphaned containers
docker compose down --remove-orphans

# Build and start the containers in detached mode
docker compose up -d --build

chmod +x scripts/pull_models.sh 
chmod +x scripts/build_start_front.sh
chmod +x scripts/init_back.sh
chmod +x scripts/start_back.sh
chmod +x scripts/start_servers.sh


./scripts/pull_models.sh  
./scripts/build_start_front.sh
./scripts/init_back.sh
./scripts/start_back.sh
./scripts/start_servers.sh

