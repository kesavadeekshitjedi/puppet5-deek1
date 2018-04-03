class autosys_ccc_baselibs::download_agent {
  $fileserverhostname="rh7-sq1"
  $fileserver_agent_media_loc = "agent_media"
  $agent_media_tar_name="linux_agent_114_x86.tar.Z"
  $fileserverbase_dwnld_loc = "http://$fileserverhostname/$fileserver_agent_media_loc/$agent_media_tar_name"
  $download_directory = "/opt"
  $agent_unzip_directory = "/opt/agent_installer"


  file {$download_directory:
    ensure => directory,
    owner => root,
    group => root,
    mode => 0755
  }
->
  file {$agent_unzip_directory:
    ensure => directory,
    owner => root,
    group => root,
    mode => 0755,
  }
->
  exec {'getAgentMedia':
  command => "wget $fileserverbase_dwnld_loc",
  cwd => $download_directory,

  }

  exec {'deflateMedia':
  require => Exec['getAgentMedia'],
  command => 'gzip -dc $agent_media_tar_name',
  cwd => $agent_unzip_directory
  }


}
