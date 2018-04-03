class autosys_ccc_baselibs::install{

$autosys_ccc_prereqPackages = ['compat-libstdc++-33.i686','bzip2-libs.i686','ncurses-devel.i686','libstdc++.i686','nss-softokn-freebl.i686','cracklib.i686','libuuid.i686','audit-libs.i686','ed']

package {'$autosys_ccc_rereqPackages':
	ensure => present
	}

}

