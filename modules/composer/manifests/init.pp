class composer {

	# First, make sure to dl composer installer
	exec { 'composer-download':
		command 	=> "wget https://getcomposer.org/installer",
	}

	# Then, make sure to generate a composer.phar file
	exec { 'composer-install':
		require 	=> Exec['composer-download'],
		command 	=> "mv installer setup.php && sudo php setup.php && sudo rm setup.php"
	}

	# At last, make sure to move composer.phar into /usr/local/bin folder 
	exec { 'composer-setup':
		require     => Exec['composer-install'],
		command 	=> "sudo mv composer.phar /usr/local/bin/composer",
	}
}