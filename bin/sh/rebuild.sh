#!/bin/bash
printf "Rebuilding web services...\n"
docker compose -f docker-compose.prod.yml up -d --build web nginx
printf "Web services rebuilt.\n"
printf "Done.\n"
exit 0
