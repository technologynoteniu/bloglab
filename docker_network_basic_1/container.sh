#!/bin/bash

docker run --network=bridge -d --name bridge hwchiu/netutils || true
docker run --network=container:$(docker ps --filter name=bridge -q) -d --name co_container hwchiu/netutils

docker exec co_container ifconfig
docker exec bridge ifconfig
