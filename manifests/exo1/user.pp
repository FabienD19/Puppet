package { 'zsh':
	ensure => installed
}

group { 'stark':
	ensure => present,
}

user { 'arya':
	ensure => present,
	comment => 'Arya Stark',
	shell => '/bin/zsh',
	groups => stark,
	require => [ Package ['zsh'], Group ['stark'] ],
}	
