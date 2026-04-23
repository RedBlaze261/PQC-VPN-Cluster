# Post-Quantum vs Classical OpenVPN Cluster

## Overview
This repository contains the configuration files and deployment scripts for a 4-node Virtual Private Network (VPN) cluster. The infrastructure is designed to benchmark and compare **Post-Quantum Cryptography (PQC)** integrated OpenVPN against a standard **Classical OpenVPN** implementation.

All nodes are interconnected via a ZeroTier overlay network to provide a unified testing environment for evaluating routing, handshake latency, and CPU overhead (e.g., PQC vs ECC resource consumption).

## Cluster Architecture

The infrastructure is split into two distinct testing pairs:

### Pair A: Post-Quantum VPN (OQS / liboqs)
* **Node 11 (Server):** Runs a PQC-enabled OpenVPN server inside a Docker container.
* **Node 12 (Client):** Connects to Node 11 using quantum-resistant cryptographic algorithms.

### Pair B: Classical OpenVPN (Baseline)
* **Node 16 (Server):** Runs a standard, native OpenVPN server (ECC/RSA based).
* **Node 17 (Client):** Connects to Node 16 to establish the baseline performance metrics.

## Repository Structure
```text
PQC-VPN-Cluster/
├── nodes/
│   ├── node11/       # PQC Server config (server.conf) & routing script
│   ├── node12/       # PQC Client config (client.ovpn)
│   ├── node16/       # Standard Server config & routing script
│   └── node17/       # Standard Client config & routing script
├── shared/           # ZeroTier overlay network configurations
└── README.md


Security Notice
For security and compliance, all active cryptographic material (Private Keys, Certificates, and TLS Auth/Crypt keys) within these configuration files have been scrubbed and replaced with [PLACEHOLDER].
These files represent the structural logic and routing parameters of the network, not the live cryptographic identities.

Network Routing Details
To prevent recursive VPN routing loops over the ZeroTier interface (eth0), the client nodes utilize static host routes.
Setup scripts (setup_vmX.sh) are included in each node's directory to demonstrate the necessary iptables NAT masquerading and ip route adjustments.

***
