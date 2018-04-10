class apache::templatetest
{
  $firstname='Deekshit'
  $webaddress="google.com"
  file {'tmp/myfile.txt':
  content => template("apache2/myfile.txt.erb"),
  }
}
