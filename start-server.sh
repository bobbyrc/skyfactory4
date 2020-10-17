#!/bin/bash

# Check if the wold folder exists
if [ ! -d ./world ]; then
    mkdir world
fi

# Check if the setting files exists
if [ ! -f ./ops.json ]; then
    touch ops.json
fi

if [ ! -f ./whitelist.json ]; then
    touch whitelist.json    
fi

if [ ! -f ./server.properties ]; then
    touch server.properties
fi

# Stop running instances and update the image if needed
docker stop sf4
docker rm sf4
docker pull cochief/skyfactory4

# Start server again
docker run -d --name sf4 \
           -v $(pwd)/world:/minecraft/world \
           -v $(pwd)/ops.json:/minecraft/ops.json \
           -v $(pwd)/server.properties:/minecraft/server.properties \
           -v $(pwd)/whitelist.json:/minecraft/whitelist.json \
           --restart unless-stopped \
           -p 25565:25565 \
           cochief/skyfactory4
