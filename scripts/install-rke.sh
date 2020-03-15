#!/bin/bash
curl  https://github.com/rancher/rke/releases/download/v1.0.4/rke_linux-amd64 >rke_linux-amd64 \
&& chmod +x rke_linux-amd64 \
&& sudo mv rke_linux-amd64 /usr/local/bin/rke
