#!/bin/bash

sudo brctl addif hwchiu0 veth0
sudo brctl addif hwchiu0 veth1
sudo ifconfig veth0 up
sudo ifconfig veth1 up
sudo brctl show

