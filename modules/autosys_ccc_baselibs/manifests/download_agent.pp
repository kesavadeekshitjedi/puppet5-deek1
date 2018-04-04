class autosys_ccc_baselibs::download_agent {
  $fileserverhostname="http://rh7-sq1/"
  $fileserver_agent_media_loc = "agent_media/"
  $agent_media_targz_name="linux_agent_114_x86.tar.Z"
  $agent_media_tar_name="linux_agent_114_x86.tar"
  $fileserverbase_dwnld_loc = "http://${fileserverhostname}/${fileserver_agent_media_loc}/${agent_media_targz_name}"
  $agent_unzip_directory = "/opt/agent_installer/"

define get_remote_file($remote_file=undef,$mode='0755')
{
  exec{'retrieve_${title}':
  command => "wget -v ${fileserverhostname}/${fileserver_agent_media_loc}/${remote_file} -O ${title}",
  path => ['/usr/bin'],
  creates => $title,
      }

  file {${title}:
        mode => $mode,
        require => Exec['retrieve_${title}'],
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

exec {'getAgentZ':

command => "/usr/bin/wget -v ${fileserverhostname}${fileserver_agent_media_loc}${agent_media_targz_name} -O /opt/agent_installer/linux_agent_114_x86.tar.Z"
owner => 'root',
require => File[$agent_unzip_directory],
}





}
