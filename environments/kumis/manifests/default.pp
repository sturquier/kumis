exec { 'apt-update':
	command => '/usr/bin/apt-get update',
}

# Create directory
file { '/home/vagrant/my-projects-directory':
	ensure 	=> directory,
	owner	=> vagrant,
	group   => vagrant,
	mode 	=> '755',  
}

include mysql
include php
include tools
