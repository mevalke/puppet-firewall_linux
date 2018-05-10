class firewall_linux::linux_pre {
  Firewall {
    require => undef,
  }

# Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  } ->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  } ->
  firewall { '002 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  } ->
  firewall_multi { '003 allow SSH access':
    dport  => 22,
    proto  => tcp,
    source => $firewall_linux::ssh_access,	 	
    action => accept,
  }
}
