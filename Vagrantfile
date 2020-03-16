# -*- mode: ruby -*-
# vi: set ft=ruby :
require_relative 'vagrant_rancheros_guest_plugin.rb'
require 'ipaddr'
require 'yaml'

x = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yaml'))
puts "Config: #{x.inspect}\n\n"

$private_nic_type = x.fetch('net').fetch('private_nic_type')

Vagrant.configure(2) do |config|

     # SSH Configuration
    config.ssh.username = "rancher"
    config.ssh.keys_only = true
    #config.ssh.private_key_path="./keys/vagrant"
###On-prem Rancher Cluster###
    config.vm.define "server-01" do |server|
     c = x.fetch('server')
      server.vm.box= "walidsaad/RancherOS_1.5.5"
      server.vm.box_version = x.fetch('ROS_version')
      server.vm.guest = :linux
      server.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.cpus = c.fetch('cpus')
        v.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0') and x.fetch('linked_clones')
        v.memory = c.fetch('memory')
        v.name = "server-01"
      end
      server.vm.network x.fetch('net').fetch('network_type'), ip: x.fetch('ip').fetch('server') , nic_type: $private_nic_type
      server.vm.network "forwarded_port", guest: 443, host: "443"
      server.vm.hostname = "server-01"
      server.vm.provision "shell", path: "scripts/configure_rancher_server.sh", args: [x.fetch('admin_password'), x.fetch('version'), x.fetch('k8s_version')]
      server.vm.provision "install-kubectl", type: "shell", :path => "scripts/install-kubectl.sh"
      server.vm.provision "install-rke", type: "shell", :path => "scripts/install-rke.sh"
      server.vm.provision "install-helm3", type: "shell", :path => "scripts/install-helm.sh"
      server.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
          s.args = ["eth1"]
        end
      #server.vm.provision "install-rancherui", type: "shell", :path => "scripts/install-rancherui.sh"
    
  end

  node_ip = IPAddr.new(x.fetch('ip').fetch('node'))
  (1..x.fetch('node').fetch('count')).each do |i|
    c = x.fetch('node')
    hostname = "node-%02d" % i
    config.vm.define hostname do |node|
      node.vm.box   = "walidsaad/RancherOS_1.5.5"
      node.vm.box_version = x.fetch('ROS_version')
      node.vm.guest = :linux
      node.vm.provider "virtualbox" do |v|
        v.cpus = c.fetch('cpus')
        v.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0') and x.fetch('linked_clones')
        v.memory = c.fetch('memory')
        v.name = hostname
      end
      node.vm.network x.fetch('net').fetch('network_type'), ip: IPAddr.new(node_ip.to_i + i - 1, Socket::AF_INET).to_s, nic_type: $private_nic_type
      node.vm.hostname = hostname
      node.vm.provision "shell", path: "scripts/configure_rancher_node.sh", args: [x.fetch('ip').fetch('server'), x.fetch('admin_password')]
      node.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
          s.args = ["eth1"]
        end
    end
  end

###On-prem RKE Cluster###
  rke_ip = IPAddr.new(x.fetch('ip').fetch('rke'))
  (1..x.fetch('rke').fetch('count')).each do |i|
    c = x.fetch('rke')
    hostname = "rke-%02d" % i
    config.vm.define hostname do |node|
      node.vm.box   = "walidsaad/RancherOS_1.5.5"
      node.vm.box_version = x.fetch('ROS_version')
      node.vm.guest = :linux
      node.vm.provider "virtualbox" do |v|
        v.cpus = c.fetch('cpus')
        v.linked_clone = true if Gem::Version.new(Vagrant::VERSION) >= Gem::Version.new('1.8.0') and x.fetch('linked_clones')
        v.memory = c.fetch('memory')
        v.name = hostname
      end
      node.vm.network x.fetch('net').fetch('network_type'), ip: IPAddr.new(rke_ip.to_i + i - 1, Socket::AF_INET).to_s, nic_type: $private_nic_type
      node.vm.hostname = hostname
      #node.vm.provision "shell", path: "scripts/configure_rancher_node.sh", args: [x.fetch('ip').fetch('server'), x.fetch('admin_password')]
      node.vm.provision "setup-hosts", :type => "shell", :path => "scripts/setup-hosts.sh" do |s|
          s.args = ["eth1"]
        end
    end
  end

end
