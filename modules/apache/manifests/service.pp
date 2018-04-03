class apache::service {
service {'apache2':
	ensure => running,
	require => [Class["apache::install"]],
	}
}
