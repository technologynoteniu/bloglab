#!/bin/bash

docker run --privileged -d --network=none --name c1 hwchiu/netutils
docker run --privileged -d --network=none --name c2 hwchiu/netutils

docker ps
docker exec c1 ifconfig
