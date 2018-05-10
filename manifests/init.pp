# Class: firewall_linux
# ===========================
#
# Full description of class firewall_linux here.
#
# Parameters
# ----------
# ssh_access: An array of individual or range of allowed IP addresses.
#
# Authors
# -------
#
# mevalke@gmail.com
#
# Copyright
# ---------
#
# Copyright 2018 Miikka Valkeapää
#
class firewall_linux (
  $ssh_access
){
  resources { 'firewall':
    purge => true
  }
	
  Firewall {
    before  => Class['firewall_linux::linux_post'],
    require => Class['firewall_linux::linux_pre'],
  }

  include firewall

  include firewall_linux::linux_pre

  include firewall_linux::linux_post
}

