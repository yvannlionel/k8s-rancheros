#!/bin/bash
dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo \
&& rpm --import https://www.virtualbox.org/download/oracle_vbox.asc \
&&  dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y \
&& dnf install binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms -y \
&& dnf install VirtualBox-6.0 -y \
&& yum install git vim -y \
&& yum install https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.rpm -y

