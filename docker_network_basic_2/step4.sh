#!/bin/bash

sudo ln -s /var/run/docker/netns /var/run/netns
sudo ip netns show

c1_ns=$(docker inspect c1 | jq -r '.[0].NetworkSettings.SandboxID' | cut -c1-12)
c2_ns=$(docker inspect c2 | jq -r '.[0].NetworkSettings.SandboxID' | cut -c1-12)

sudo ip link set c1-eth0 netns ${c1_ns} name eth0
sudo ip link set c2-eth0 netns ${c2_ns} name eth0

sudo docker exec c2 ifconfig -a
sudo docker exec c1 ifconfig -a
ip link | grep veth
