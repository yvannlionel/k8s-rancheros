#!/bin/bash
# Update /etc/hosts about other hosts
cat >> /etc/hosts <<EOF
172.22.101.101  server-01
172.22.101.110  node-01
172.22.101.111  node-02
172.22.101.130  rke-01
172.22.101.131  rke-02
EOF
