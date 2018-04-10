class redhatpackages::rhel6 {

  service {'iptables' :
  ensure => stoppped,

  }
}
