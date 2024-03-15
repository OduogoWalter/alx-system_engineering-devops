# 100-puppet_ssh_config.pp

# Define SSH client configuration file path
$ssh_config_file = '/etc/ssh/ssh_config'

# Ensure SSH client configuration is set to use the private key and refuse password authentication
file_line { 'Declare identity file':
  ensure => present,
  path   => $ssh_config_file,
  line   => '    IdentityFile ~/.ssh/school',
}

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => $ssh_config_file,
  line   => '    PasswordAuthentication no',
}

