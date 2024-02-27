# install flask from pip3 -v 2.1..

exec { 'puppet-lint':
  command => '/usr/bin/apt-get -y install flask -v 2.1.0',
}
