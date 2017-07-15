class php {

	$packages = [
		# Required
		'php5',
		'php5-cli',
		'libapache2-mod-php5',
		'php5-mysql',

		# Additionnal but really usefull
		'php5-curl',
		'php5-xdebug',
		'php5-gd',
		'php5-mcrypt',
		'php5-dev',
		'php-pear'
	]

	# Make sure that PHP is properly installed
	package { $packages:
		require 	=> Exec['apt-update'],
		ensure 		=> installed,
	}
}