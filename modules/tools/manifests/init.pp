class tools {

	$packages = [
		'terminator',
		'vim',
		'git',
		'unzip'
	]

	# Make sure that previous packages are properly installed
	package { $packages:
		require 	=> Exec['apt-update'],
		ensure 		=> installed,
	}
}