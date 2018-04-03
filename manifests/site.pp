node 'rhel7-pp-agt2.rmt.com' {
  include autosys_ccc_baselibs::download_agent # attempt to download the autosys agent using wget. Also creates a bunch of folders and unzips the file.
user {'testuser':
        ensure => present
        }
}
node 'rhel7-wcc-1.rmt.com','rhel7-wcc-2.rmt.com' {

user {'wcc':
        ensure => present,
       	groups => ['users','wheel'],
	password => '5WpSchGwmOdAw'
	
        }
}


node default {
        include x11packages
        include autosys_ccc_baselibs
        include oracle12201
user {'daddepalli':
        ensure => present,
        comment => 'Auto created by Puppet ',
        groups => ['users','wheel','dba'],
        }
package {'cifs-utils':
       ensure => present,
       }
package {'ntp':
        ensure => present,
        }
package {'PackageKit':
        ensure => absent,
        }
service {'firewalld':
        ensure => 'stopped',
        }
service {'ntpd':
        ensure => 'running',
       require => Package['ntp'],
        }
notify {'Test message':
       }

file {'/RMT':
       ensure => directory,
       }
exec {'mount':
       command => 'mount -t cifs -o username=daddepalli,password=Deek5581,domain=RMT //RMT-FS/Media /RMT',
       path => '/usr/bin:/usr/sbin:/bin',
       require => Package['cifs-utils'],
       }
}
