#!/bin/bash

sudo docker exec c1 ifconfig eth0 10.55.66.2 netmask 255.255.255.0 up
sudo docker exec c2 ifconfig eth0 10.55.66.3 netmask 255.255.255.0 up
sudo docker exec c1 ifconfig
sudo docker exec c2 ifconfig
