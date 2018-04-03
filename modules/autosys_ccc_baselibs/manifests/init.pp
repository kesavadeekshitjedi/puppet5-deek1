# == Class: autosys_ccc_baselibs
#
# Full description of class autosys_ccc_baselibs here.
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
#  class { 'autosys_ccc_baselibs':
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
class autosys_ccc_baselibs {
$autosys_ccc_prereqPackages = ['compat-libstdc++-33.i686','bzip2-libs.i686','ncurses-devel.i686','libstdc++.i686','nss-softokn-freebl.i686','cracklib.i686','libuuid.i686','audit-libs.i686','ed']

package {$autosys_ccc_prereqPackages:
	ensure => present,
	}

}
