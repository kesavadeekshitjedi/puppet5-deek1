class autosys_ccc_baselibs::download_agent {
  $fileserverhostname="http://rh7-sq1/"
  $fileserver_agent_media_loc = "agent_media/"
  $agent_media_targz_name="linux_agent_114_x86.tar.Z"
  $agent_media_tar_name="linux_agent_114_x86.tar"
  $fileserverbase_dwnld_loc = "http://${fileserverhostname}/${fileserver_agent_media_loc}/${agent_media_targz_name}"
  $agent_unzip_directory = "/opt/agent_installer/"


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
  'getAgentZ':
  command => "wget -v ${fileserverhostname}/agent_media/$agent_media_targz_name",
  path => ['/usr/bin','/usr/sbin'],
  cwd => $agent_unzip_directory


}
file {'agentgzFile':
path => '${agent_unzip_directory}/${agent_media_targz_name}',
ensure => present,
checksum => "md5",
checksum_value => "7631aff173b52a994de7891b57c28f46",
require => Exec['getAgentZ']
}




}
