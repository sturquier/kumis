# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = "environments"
    puppet.environment      = "kumis"
    puppet.module_path      = "modules"
  end

  # Host:8080 corresponds to VM:80
  config.vm.network "forwarded_port", guest: 80, host: 8080
  
  # Configure shared folders between host & VM
  config.vm.synced_folder "webroot/", "/vagrant/webroot/", :owner => "www-data"

end
