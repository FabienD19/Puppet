file {'/etc/ma-machine':
	content => "$hostname"
}

#$arch = $architecture ? {
#        i386 => '/etc/32',
#        amd64 => '/etc/64',
#        }

case $architecture {
  i386: { $arch = '/etc/32' }
  amd64: { $arch = '/etc/64' }
  default:  { fail("$architecture not supported")}
}

if $architecture in ['amd64','i386'] {
	file { '/etc/plateforme-x86':
		ensure => present,
	     }
}
elsif $architecture in ['autre'] {
	file { '/etc/ptf-bizarre': 
		ensure => present
	     }
}
else { fail("$architecture not supported")}
	

file {"$arch":
	ensure => present,
	mode => 777,
}

if $fqdn != $hostname {
	notify {'OK':}
}
else {
	notify {'KO':}
}
