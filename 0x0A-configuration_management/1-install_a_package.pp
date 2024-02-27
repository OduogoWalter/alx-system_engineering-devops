# Puppet manifest to install Flask version 2.1.0 using pip3

package { 'flask':
  ensure   => present,
  provider => 'pip3',
}
