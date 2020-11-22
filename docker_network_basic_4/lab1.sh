#!/bin/bash

docker run --privileged -d --network=none --name c1 hwchiu/netutils

sudo brctl addbr hwchiu0
sudo ifconfig hwchiu0 up
sudo ip link add dev c1-eth0 type veth

sudo ln -s /var/run/docker/netns /var/run/netns

c1_ns=$(docker inspect c1 | jq -r '.[0].NetworkSettings.SandboxID' | cut -c1-12)
sudo ip link set c1-eth0 netns ${c1_ns} name eth0
sudo docker exec c1 ifconfig -a

sudo brctl addif hwchiu0 veth0
sudo ifconfig veth0 up

sudo docker exec c1 ifconfig eth0 10.55.66.2 netmask 255.255.255.0 up

sudo ifconfig hwchiu0 10.55.66.1 netmask 255.255.255.0
sudo docker exec -it c1 ip route add default via 10.55.66.1
sudo iptables -t nat -I POSTROUTING -s 10.55.66.2/32 -o eth0 -j MASQUERADE
sudo iptables -t filter -I FORWARD -i hwchiu0 -o eth0 -j ACCEPT
sudo iptables -t filter -I FORWARD -i eth0 -o hwchiu0 -j ACCEPT
