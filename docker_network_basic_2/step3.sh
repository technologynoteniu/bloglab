#!/bin/bash

sudo ip link add dev c1-eth0 type veth
sudo ip link add dev c2-eth0 type veth
sudo ip link | grep veth
