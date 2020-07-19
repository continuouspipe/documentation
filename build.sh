#!/bin/bash
set -e
docker-compose -f docker-compose.yml build --pull
docker-compose -f docker-compose.yml up -d
rm -rf docs/ || true
docker cp documentation_web_1:/usr/share/nginx/html/docs/ docs/
