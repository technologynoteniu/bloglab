#!/bin/bash

docker run --network=host -d --name host hwchiu/netutils
docker exec -it host ip link
ip link
