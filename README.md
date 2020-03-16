# Vagrant Quickstart

This folder contains Vagrant code to stand up a single Rancher server instance with a node cluster attached to it.
This folder contains Vagrant code to stand up a Rancher RKE cluster.

## Requirements

- [Vagrant](https://www.vagrantup.com)
- [VirtualBox](https://www.virtualbox.org)
- 6GB unused RAM

## Deploy

0. Clone this repository and go into the vagrant subfolder
0. Run `vagrant up`

When provisioning is finished the Rancher UI will become accessible on [](http://172.22.101.101).
The default password is `admin`, but this can be updated in the config.yaml file.

## Remove

To remove the VMs that have been deployed run `vagrant destroy -f`


##Grid5000

0. Installation steps of VirtualBox 6.0 on CentOS 8 / RHEL 8
Step:1) Enable VirtualBox and EPEL Repository
Login to your CentOS 8 or RHEL 8 system and open terminal and execute the following commands to enable VirtualBox and EPEL package repository.
 
[root@linuxtechi ~]# dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
Use below rpm command to import Oracle VirtualBox Public Key

[root@linuxtechi ~]# rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
Enable EPEL repo using following dnf command,

[root@linuxtechi ~]# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
Step:2) Install VirtualBox Build tools and dependencies
Run the following command to install all VirtualBox build tools and dependencies,

[root@linuxtechi ~]# dnf install binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms -y
Once above dependencies and build tools are installed successfully then proceed with VirtualBox installation using dnf command,
 
Step:3) Install VirtualBox 6.0 on CentOS 8 / RHEL 8
If wish to list available versions of VirtualBox before installing it , then execute the following dnf command,

[root@linuxtechi ~]# dnf search virtualbox
Last metadata expiration check: 0:14:36 ago on Sun 17 Nov 2019 04:13:16 AM GMT.
=============== Summary & Name Matched: virtualbox =====================
VirtualBox-5.2.x86_64 : Oracle VM VirtualBox
VirtualBox-6.0.x86_64 : Oracle VM VirtualBox
[root@linuxtechi ~]#
Let’s install latest version of VirtualBox 6.0 using following dnf command,

[root@linuxtechi ~]# dnf install VirtualBox-6.0 -y

0. Clone this repository and go into the vagrant subfolder
0. Run `vagrant up`
0. Access to Rancher Server UI
ssh -L 8888:orion-4.lyon.grid5000.fr:443 lyon.g5k
