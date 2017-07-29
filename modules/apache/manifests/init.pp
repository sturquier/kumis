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

	# Create a symlink for rewrite module
	file { "/etc/apache2/mods-enabled/rewrite.load":
		require 	=> Package['apache2'],
		target 		=> "/etc/apache2/mods-available/rewrite.load",
		ensure 		=> link,
	}

	# Create default vhost conf
 	file { "/etc/apache2/sites-available/webroot.conf":
 		require 	=> File["/etc/apache2/mods-enabled/rewrite.load"],
 		source 		=> "/vagrant/templates/vhost",
 		ensure 		=> present,
 	}
 
 	# Enable vhost conf
 	exec { "a2ensite webroot":
 		require 	=> File["/etc/apache2/sites-available/webroot.conf"],
 		command 	=> "sudo a2ensite webroot",
 	}
 
  	# Make sure that apache is running. Reload if necessary
  	service { 'apache2':
  		require 	=> Package['apache2'],
  		ensure      => running,
  		subscribe 	=> [
  			File["/etc/apache2/mods-enabled/rewrite.load"],
  			File["/etc/apache2/sites-available/webroot.conf"]
  		],
  	}
}