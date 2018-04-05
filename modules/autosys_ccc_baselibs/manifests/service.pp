class autosys_ccc_baselibs::service{

  file {'/etc/init.d/waae_agent-WA_AGENT':
  ensure => present,
  mode => '0755',
  owner => 'root',
  group => 'root',
  source => "puppet://${servername}/modules/${module_name}/waae_agent-WA_AGENT"
        }

  file {'/opt/CA/WorkloadAutomationAE/SystemAgent/WA_AGENT/cryptkey.txt':
  ensure => present,
  owner => 'autosys',
  group => 'autosys',
  mode => '0755',
  source => "puppet://${servername}/modules/${module_name}/cryptkey.txt"
  }

  service {'waae_agent-WA_AGENT' :
  ensure => running,
  enable => 'true',
  name => 'waae_agent-WA_AGENT'
  }
}
