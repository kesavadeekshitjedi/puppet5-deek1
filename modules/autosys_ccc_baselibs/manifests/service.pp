class autosys_ccc_baselibs::service{

  file {'/etc/init.d/waae_agent-WA_AGENT':
  ensure => present,
  mode => '0755',
  owner => 'root',
  group => 'root',
  source => "puppet://${servername}/modules/${module_name}/waae_agent-WA_AGENT",
  require => [Class["autosys_ccc_baselibs::install_agent"]]
  }

  file {'/opt/CA/WorkloadAutomationAE/SystemAgent/WA_AGENT/cryptkey.txt':
  ensure => present,
  owner => 'autosys',
  group => 'autosys',
  mode => '0644',
  source => "puppet://${servername}/modules/${module_name}/cryptkey.txt",
  require => [Class["autosys_ccc_baselibs::install_agent"]]
  }

  service {'waae_agent-WA_AGENT' :
  ensure => running,
  enable => 'true',
  name => 'waae_agent-WA_AGENT',
  require => File['/etc/init.d/waae_agent-WA_AGENT']
  }

  file {'/opt/CA/WorkloadAutomationAE/SystemAgent/WA_AGENT/agentparm.txt':
  ensure => present,
  source => "puppet://${servername}/modules/${module_name}/agentparm.txt",
  owner => 'autosys',
  group => 'autosys',
  mode => '0664',
  require => [Class["autosys_ccc_baselibs::install_agent"]],
  notify => Service['waae_agent-WA_AGENT']

  }
}
