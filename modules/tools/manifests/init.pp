class tools {

	$packages = [
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