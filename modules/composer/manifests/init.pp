# 'creates' checks if composer file doesnt not alreay exists in usr/ folder

class composer {

	# First, make sure to dl composer installer
	exec { 'composer-download':
		command 	=> "wget https://getcomposer.org/installer",
		creates  	=> '/usr/local/bin/composer',
	}

	# Then, make sure to generate a composer.phar file
	exec { 'composer-install':
		require 	=> Exec['composer-download'],
		command 	=> "mv installer setup.php && sudo php setup.php && sudo rm setup.php",
		creates  	=> '/usr/local/bin/composer',
	}

	# At last, make sure to move composer.phar into /usr/local/bin folder 
	exec { 'composer-setup':
		require     => Exec['composer-install'],
		command 	=> "sudo mv composer.phar /usr/local/bin/composer",
		creates  	=> '/usr/local/bin/composer',
	}
}