#!/bin/bash

sudo brctl addbr hwchiu0
sudo brctl show
sudo ifconfig hwchiu0 up
