class apache {

	$packages = [
		'apache2',
		'apache2-utils'
	]

	# Make sure to install apache server & tools
	package { $packages:
		require 	=> Exec['apt-update'],
		ensure 		=> installed,
	}

	# Delete default index.html in /var/www/html folder
	exec { 'delete-index':
		require 	=> Package['apache2'],
		command     => 'sudo rm /var/www/html/index.html',
		before 		=> File["/etc/apache2/sites-enabled/vagrant_webroot"],
	}

	# Create a symlink for rewrite module
	file { "/etc/apache2/mods-enabled/rewrite.load":
		require 	=> Package['apache2'],
		target 		=> "/etc/apache2/mods-available/rewrite.load",
		ensure 		=> link,
	}

 	# Create a new sites-enabled directory, purging the old one
 	file { "/etc/apache2/sites-enabled":
 		require 	=> Package['apache2'],
 		recurse 	=> true,
 		purge 		=> true,
 		force 		=> true,
 		before  	=> File["/etc/apache2/sites-enabled/vagrant_webroot"],
 		ensure 		=> directory,
 	}

	# Create default vhost conf
 	file { "/etc/apache2/sites-available/vagrant_webroot":
 		require 	=> Package['apache2'],
 		source 		=> "/vagrant/templates/vhost",
 		ensure 		=> present,
 	}
 
 	# Create a symlink to the vagrant_webroot directory
 	file { "/etc/apache2/sites-enabled/vagrant_webroot":
    	require 	=> File["/etc/apache2/sites-available/vagrant_webroot"],
    	target 		=> "/etc/apache2/sites-available/vagrant_webroot",
    	ensure 		=> link,
  }
 
  	# Make sure that apache is running. Reload if necessary
  	service { 'apache2':
  		require 	=> Package['apache2'],
  		ensure      => running,
  		subscribe 	=> [
  			File["/etc/apache2/mods-enabled/rewrite.load"],
  			File["/etc/apache2/sites-available/vagrant_webroot"]
  		],
  	}
}