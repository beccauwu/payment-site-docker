#!/bin/bash

if ! [ -x "$(command -v docker)" ]; then
    read -p "Docker is not installed. Would you like to install it now?. (y/n):" install_docker
    if [ "$install_docker" == "y" ]; then
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        rm get-docker.sh
    else
        printf "Docker is required to build the production environment. Please install it and try again.\n"
        exit 1
    fi
fi

printf "Printing default configuration...\n\n"
sleep 1
printf "docker-compose.prod.yml:"
sleep 1
printf "\n\n"
cat docker-compose.prod.yml
printf "\n\n\n\n"
read -p "press any key to continue..."
printf "\n\n\n\n"
printf "nginx.conf:"
sleep 1
printf "\n\n"
cat nginx/nginx.conf
printf "\n"
printf "if you want to change the default configuration, please edit the files above and run ./build.sh again.\n"
read -p "Do you want to continue? (y/n):" continue_build
if [ "$continue_build" == "y" ]; then
    docker compose -f docker-compose.prod.yml up -d --build
else
    printf "\n"
    printf "Build cancelled.\n\n"
    exit 1
fi
