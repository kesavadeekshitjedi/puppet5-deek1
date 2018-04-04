class autosys_ccc_baselibs::download_agent {
  $fileserverhostname="rh7-sq1"
  $fileserver_agent_media_loc = "agent_media"
  $agent_media_targz_name="linux_agent_114_x86.tar.Z"
  $agent_media_tar_name="linux_agent_114_x86.tar"
  $fileserverbase_dwnld_loc = "http://$fileserverhostname/$fileserver_agent_media_loc/$agent_media_targz_name"
  $download_directory = "/opt"
  $agent_unzip_directory = "/opt/agent_installer"


  file {$download_directory:
    ensure => directory,
    owner => root,
    group => root,
    mode => '0755'
  }
->
  file {$agent_unzip_directory:
    ensure => directory,
    owner => root,
    group => root,
    mode => '0755',
  }
->
  exec {'getAgentMedia':
  command => "/usr/bin/wget $fileserverbase_dwnld_loc",
  cwd => $agent_unzip_directory,

  }
->
  exec {'deflateMedia-gunzip':
  require => Exec['getAgentMedia'],

  command => '/usr/bin/gunzip $agent_media_targz_name',
  cwd => $agent_unzip_directory
  }
  ->
  exec {'deflateMedia-tar':
  require => Exec['deflateMedia-gunzip'],
  command => "/usr/bin/tar -xvf $agent_media_tar_name",
  cwd => $agent_unzip_directory
}

}
