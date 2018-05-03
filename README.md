LAMP made with Vagrant & Puppet
===============================

### Details

##### Ubuntu 16.04
* Apache/2.4.18 (Ubuntu)
* PHP 7.2
* MySQL 14.14

### Requirements
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

### Instructions
* Clone this repository
* Create directory `webroot` in the root directory of the clone.
* Type this command (and take a coffee) :
```bash
$ vagrant up --provision
```
* The webserver is now accessible from http://localhost:8080 
Create a file/directory in the `webroot` directory, save it and reload the web page. If you see your change, everything is working. 

### Notes
* The `webroot` directory is a shared folder & act as your web root folder. Any change under `webroot` directory on host is instantly viewable on VM by reloading the webpage in your browser
* The default mysql password for root is "g2gaqut"

### Table of Contents

* [Commands](#commands)
  * [vagrant up](#vagrant-up)
  * [vagrant provision](#vagrant-provision)
  * [vagrant halt](#vagrant-halt)
  * [vagrant ssh](#vagrant-ssh)
  * [vagrant reload](#vagrant-reload)
  * [vagrant destroy](#vagrant-destroy)

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

vagrant destroy
---------------

Shuts down the running VM + destroys all resources created during the VM creation