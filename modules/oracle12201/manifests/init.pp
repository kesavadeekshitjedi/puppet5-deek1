# == Class: oracle12201
#
# Full description of class oracle12201 here.
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
#  class { 'oracle12201':
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
class oracle12201 {

$oracleprereq12201 = ['binutils','compat-libstdc++-33.x86_64','gcc','gcc-c++','glibc','glibc.i686','glibc-devel','glibc-devel.i686','ksh','libgcc','libgcc.i686','libstdc++','libstdc++-devel','libstdc++-devel.i686','libaio','libaio.i686','libaio-devel','libaio-devel.i686','libXext','libXext.i686','libXtst','libXtst.i686','libX11','libX11.i686','libXau','libXau.i686','libxcb','libxcb.i686','libXi','libXi.i686','make','sysstat','unixODBC','unixODBC.i686','unixODBC-devel','unixODBC-devel.i686','zlib-devel','zlib-devel.i686','libXrender','libXrender.i686','compat-libcap1-1.10']

$oracleprereqgroups = ['oinstall','dba']
$oracleuser = ['oracle']
$oraclebase = ['/opt/12c']

group {$oracleprereqgroups:
	ensure => present,
	}
user {$oracleuser:
	ensure => present,
	groups => $oracleprereqgroups,
	home => $oraclebase,
	password => '$1$QT.iTQq.$ULM1V8i/qzPc32dhwHWjj1',
	}
file {$oraclebase:
	ensure => directory,
	owner => $oracleuser,
	group => 'oinstall',
	}

package {$oracleprereq12201:
	ensure => present,
	}
}

