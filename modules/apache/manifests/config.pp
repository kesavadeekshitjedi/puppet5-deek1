class apache::config {
file {'/etc/apache2/conf/apache2.conf':
	ensure => present,
	require => [Class["apache::install"]],
	notify => [Class["apache::service"]],
	}
}
