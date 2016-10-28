file {'/home/arya':
	ensure => directory
}

file {'/home/arya/.vimrc':
	#ensure => present,
	group => stark,
	owner => arya,
	mode => 600,
	content => "syn on\nset -o vi\n",
	require => File ['/home/arya'],
}

file {'/etc/motd':
	source => [
	"/root/motd_${fqdn}",
	"/root/motd",
	],
	owner => root,
	group => root,
	mode => 644,
}	
