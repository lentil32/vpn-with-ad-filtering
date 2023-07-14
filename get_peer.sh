#!/bin/bash
# Usage: `./get_peer.sh <number>`
docker exec -it wireguard /app/show-peer $1
