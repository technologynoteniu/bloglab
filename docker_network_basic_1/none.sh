#!/bin/bash

docker run --network=none -d --name none hwchiu/netutils
docker exec none ifconfig -a
