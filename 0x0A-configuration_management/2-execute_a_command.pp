# Puppet manifest to kill a process named killmenow using pkill

exec { 'killmenow':
  command     => 'pkill killmemow',
  path        => '/usr/bin:/bin',
  onlyif      => 'pgrep killmenow',
  refreshonly => true,
  logoutput   => true,
}
