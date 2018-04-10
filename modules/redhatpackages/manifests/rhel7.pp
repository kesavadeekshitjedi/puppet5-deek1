class redhatpackages::rhel7
{
  service {'firewalld':
  ensure => stopped,
  }
}
