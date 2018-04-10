class linuxpackages::rhel6 {
  if $osfamily == 'Redhat'
  {
    if $operatingsystemrelease=='7.3'
    {
      service {'firewalld' :
      ensure => stopped,
      enabled => false,
      }
    }
  }
}
