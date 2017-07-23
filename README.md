LAMP made with Vagrant & Puppet
===============================

### Details

##### Ubuntu 14.4-64
* Apache/2.4.7 (Ubuntu)
* PHP Version 5.5.9-1ubuntu4.21
* MySQL Version 14.14

### Requirements
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

### Table of Contents

* [Packages, services & tools included](#packages-services-tools-included)
* [Commands](#commands)
  * [vagrant up](#vagrant-up)
  * [vagrant provision](#vagrant-provision)
  * [vagrant halt](#vagrant-halt)
  * [vagrant ssh](#vagrant-ssh)
  * [vagrant reload](#vagrant-reload)

Packages, services & tools included
===================================

* apache2
* apache2-utils
* composer
* mysql
* mysql-server
* php5
* php5-cli
* libapache2-mod-php5
* php5-mysql
* php5-curl
* php5-xdebug
* php5-gd
* php5-mcrypt
* php5-dev
* php-pear
* terminator
* vim
* git
* unzip

Commands
========

vagrant up
----------

Creates and configures guest machine according to the Vagrantfile

vagrant provision
-----------------

Run configured provisioner (Puppet here)

vagrant halt
------------

Shuts down the running VM 

vagrant ssh
-----------

Run VM and give access on a shell

vagrant reload
--------------

Equivalent of halt + up. Required after any modification on the Vagrantfile