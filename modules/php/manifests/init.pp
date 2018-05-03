class php {

	$packages = [
		'php7.2',
		'php-pear',
		'php7.2-curl',
		'php7.2-dev',
		'php7.2-gd',
		'php7.2-mbstring',
		'php7.2-zip',
		'php7.2-mysql',
		'php7.2-xml'	
	]

	# Add PHP repository
	exec { 'add-ondrej-repo':
		require		=> Exec['apt-update'],
		command		=> "add-apt-repository ppa:ondrej/php && apt-get update",
	}

	# Make sure that PHP is properly installed
	package { $packages:
		require 	=> Exec['add-ondrej-repo'],
		ensure 		=> installed,
	}
}