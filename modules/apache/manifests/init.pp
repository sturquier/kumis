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

	# Make sure that apache is running
	service { 'apache2':
		require 	=> Package['apache2'],
		ensure      => running,
	}
}