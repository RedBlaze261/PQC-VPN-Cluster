#!/bin/bash
# VM 16 (Standard OpenVPN Server) Configuration

# Enable IP Forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Enable NAT for the VPN subnet (Assuming standard 10.8.0.0/24)
sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
