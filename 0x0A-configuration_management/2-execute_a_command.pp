# Puppet manifest to kill a process named killmenow using pkill

exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/usr/bin:/bin',
  onlyif      => 'pgrep killmenow',
  refreshonly => true,
  logoutput   => true,
}
