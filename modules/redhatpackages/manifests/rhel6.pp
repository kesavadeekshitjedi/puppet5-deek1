class redhatpackages::rhel6 {

  service {'iptables' :
  ensure => 'stopped',
  enable => false,
  }
}
