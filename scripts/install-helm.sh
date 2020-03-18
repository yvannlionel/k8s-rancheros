#!/bin/bash
wget https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz \
&& tar -zxvf helm-v3.1.2-linux-amd64.tar.gz \
&& chmod +x ./linux-amd64/helm \
&& sudo mv ./linux-amd64/helm /usr/local/bin/helm
