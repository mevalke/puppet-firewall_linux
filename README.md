# firewall_linux

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with firewall_linux](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with firewall_linux](#beginning-with-firewall_linux)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module attempts to simplify the management of iptables with the [puppetlabs/firewall](https://forge.puppet.com/puppetlabs/firewall) and [alexharvey/firewall_multi](https://forge.puppet.com/alexharvey/firewall_multi) modules.

## Setup

### Setup Requirements

Install the required modules:

```
https://github.com/puppetlabs/puppetlabs-firewall.git
https://github.com/alexharv074/puppet-firewall_multi.git
```

## Usage

Declaring the module and specifying the allowed SSH sources:

``` 
class { 'firewall_linux':
  ssh_access => [ '192.168.0.0/24' ]
}
```

Inserting additional rules from within another module. For example accepting access to samba ports:

```
firewall_multi {'10 allow samba access':
  dport   => [ 137, 138, 139, 445 ],
  proto   => tcp,
  source  => [ '192.168.0.166', '192.168.0.174' ],
  action  => accept,
}
```

## Limitations

This module is intended as a UI for a simplified use case. Therefore it only implements a subset of features provided by the puppetlabs/firewall module. 
The module is tested with:
Debian 8 Jessie

## Development

Any form of contribution is welcomed.

## Release Notes

0.1.0: First release
