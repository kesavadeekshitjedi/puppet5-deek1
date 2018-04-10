class linuxpackages::rhel6 {

  service {'iptables' :
  ensure => stoppped,

  }
}
