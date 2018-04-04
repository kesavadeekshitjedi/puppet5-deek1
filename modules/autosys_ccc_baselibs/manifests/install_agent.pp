class autosys_ccc_baselibs::install_agent
{
  $fileserverhostname="http://rh7-sq1"
  $fileserver_agent_media_loc = "agent_media/"
  $agent_media_targz_name="linux_agent_114_x86.tar.Z"
  $agent_media_tar_name="linux_agent_114_x86.tar"
  $fileserverbase_dwnld_loc = "http://${fileserverhostname}/${fileserver_agent_media_loc}/${agent_media_targz_name}"
  $agent_unzip_directory = "/opt/agent_installer/"

define file_compare($source_file=undef, $target_file=undef)
{
  exec{'diff_2_files':
command => 'diff $source_file $target_file',
path => ['/usr/bin','/usr/sbin'],
cwd => $agent_unzip_directory
      }
}

  file
  {
    $agent_unzip_directory:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755'
  }
->

exec
{
  'getAgenttar':
  command => "wget -v ${fileserverhostname}/agent_media/$agent_media_tar_name",
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory


}
exec
{
  'getMD5':
  command => "wget -v ${fileserverhostname}/agent_media/agent.md5",
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory,
  require => Exec['getAgenttar']
}

exec
{
  'getLocalMD5':
  command => "md5sum ${agent_media_tar_name} > localagent.md5",
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory,
  require => Exec['getMD5']
}

exec {
  'localMD5':
  command => 'cat localagent.md5 | awk \'{print $1}\' > local.md5',
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory,
  require => Exec['getLocalMD5']
}

exec {
  'untarFile':
  command => 'tar -xvf linux_agent_114_x86.tar',
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory,
  require => Exec['getLocalMD5','getAgenttar']
}

->

  file {'checkAgentFile':
  path => "/opt/agent_installer/linux_x86_64",
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode => '0755',
  require=> Exec['untarFile']
  }
->
  exec {'agentInstall':
  command => "/opt/agent_installer/linux_x86_64/setup.bin -r /opt/agent_installer/unix_installer.properties",
  user => 'root',
  returns => 0,
  require => Exec['untarFile','getAgenttar']
  }


}
