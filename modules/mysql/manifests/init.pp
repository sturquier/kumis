class mysql {

	$rootPassword = "g2gaqut"

	# Make sure that mysql-server package is properly installed
	package { 'mysql-server':
		require 	=> Exec['apt-update'], # reference to apt-update in default.pp
		ensure 		=> installed,
	}

	# Make sure that mysql is running
	service { 'mysql': 
		require    	=> Package['mysql-server'],
		ensure 		=> running,
	}

	# Set mysql root password
	exec { 'set-mysql-password':
		require		=> Service['mysql'],
		command     => "/usr/bin/mysqladmin -uroot password $rootPassword",
		unless 		=> "/usr/bin/mysqladmin -uroot -p$rootPassword status",
	}
}
