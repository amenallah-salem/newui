#!/bin/bash
docker compose down --remove-orphans
docker compose -f docker-compose-build-pycli.yml up --build
