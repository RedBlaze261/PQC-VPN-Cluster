#!/bin/bash
# Configuration for VM 11 (Server)
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
# Note: Ensure VM 12 has a static route to 10.10.10.11 to prevent loops.
