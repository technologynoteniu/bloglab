#!/bin/bash


docker exec -it c1 ping 10.55.66.3 -c1
sudo iptables --policy FORWARD ACCEPT
docker exec -it c1 ping 10.55.66.3 -c5
