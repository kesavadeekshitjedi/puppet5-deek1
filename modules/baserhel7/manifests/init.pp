# == Class: baserhel7
#
# Full description of class baserhel7 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'baserhel7':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class baserhel7 {
$baserhel7packageList = [ 'cifs-utils', 'vim', 'xorg-x11-apps', 'xorg-x11-utils', 'xorg-x11-xauth' ]
$baseuserlist = [ 'daddepalli', 'pp_admin']
$baseuserAdminGroups = [ 'users', 'wheel' ]

user { $baseuserlist:
	ensure => present,
	password => '$1$QGJmGPou$b6YcoskLemHYYr00eyf/n/',
	groups => $baseuserAdminGroups,
	}

package { $baserhel7packageList:
	ensure => present,
	}


}
