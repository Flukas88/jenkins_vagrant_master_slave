# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
require 'net/http'
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.8.0"

# Configuration

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # To update Virtualbox Guest Additions to the one on the host
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = true
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    config.cache.scope = :box
  end

  config.vm.define "slave" do |slave|
    slave.vm.box = "ubuntu/trusty64"
    slave.vm.hostname = "jenkinslave.local"
    slave.vm.network "private_network", ip: "192.168.100.11"
    slave.vm.provision :shell, :path => "bootstrap_slave.sh"
    slave.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      v.memory = 512
      v.cpus = 1
      v.gui = false
      v.name = "jenkinslave"
    end
end

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/trusty64"
    master.vm.hostname = "jenkins.local"
    master.vm.network "private_network", ip: "192.168.100.21"
    master.vm.network "forwarded_port", guest: 8080, host: 8090
    master.vm.provision :shell, :path => "bootstrap_master.sh"
    master.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      v.memory = 1024
      v.cpus = 2
      v.gui = false
      v.name = "jenkinsmaster"
    end
  end


end
