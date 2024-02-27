# Puppet manifest to kill a process named killmenow uisng pkill

exec { 'killmenow':
  command     => 'pkill killmemow',
  path        => '/usr/bin:/bin',
  onlyif      => 'pgrep killmenow',
  refreshonly => true,
  logoutput   => true,
}
