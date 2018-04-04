class autosys_ccc_baselibs::install_agent
{
  file {'checkAgentFile':
  path => "/opt/agent_installer/linux_x86_64",
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode => '0755'
  }

  exec {'agentInstall':
  command => "/opt/agent_installer/linux_x86_64/setup.bin -r /opt/agent_installer/unix_installer.properties",
  user => 'root',
  returns => 0
  }


}
