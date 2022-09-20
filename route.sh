#!/bin/bash

sudo /sbin/ip addr add 10.10.10.3/24 dev enp2s1
sudo /sbin/ip link set enp2s1 up
sudo route add default gw 10.10.10.1
