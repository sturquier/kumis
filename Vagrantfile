# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = "environments"
    puppet.environment      = "kumis"
    puppet.module_path      = "modules"
  end

  config.vm.network "private_network", ip: "192.168.33.10"

end
