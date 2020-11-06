#!/bin/bash

docker run --network=bridge -d --name bridge hwchiu/netutils
docker exec bridge ip addr
brctl show | grep veth980af09
