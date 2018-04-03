class apache {

include apache::install,
	apache::service,
	apache::config

apache::vhost{"apache2.conf":
	$port => 9090,
	$docroot => "/var/www/html/mysite",
	}
}
