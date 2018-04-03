define apache::vhost($port,$docroot){
"/etc/apache2/conf/$name":
source =>"puppet://modules/apache/apache2.conf",
owner => apache,
group => apache,
mode => 0755,
require => [Class["apache::install"]],
notify => [Class["apache::service"]]
}
