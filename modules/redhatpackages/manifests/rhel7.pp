class linuxpackages::rhel7
{
  service {'firewalld':
  ensure => stopped,
  }
}
