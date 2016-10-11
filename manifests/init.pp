# == Class: dns_win
#
#   Manage DNS for a specified network interface in Windows. Leverage puppetlabs dsc
#   (specifically the  PowerShell/xNetworking/xDnsServerAddress resource to manage the 
#	change.
#
# === Parameters
#
# [*dnsservers*]
#   An array of servers to set as DNS, in order from Primary, Secondary and so on. 
#  [*interfacealias*]
#   The alias of the adapter you want to manage.
#
# === Examples
#
#  class { ::dns_win:
#    dnsservers		= ['1.1.1.1','2.2.2.2','3.3.3.3'],
#    interfacealias	= 'Ethernet'
#  }
#
# === Authors
#
# Joey Piccola <joey@joeypiccola.com>
#
# === Copyright
#
# Copyright (C) 2016 Joey Piccola.
#
class dns_win (

  $dnsservers,
  $interfacealias,

){

  # parameter validatoin
  validate_array($dnsservers)
  validate_string($interfacealias)

  dsc_xdnsserveraddress { $interfacealias:
    dsc_address        => $dnsservers,
    dsc_interfacealias => $interfacealias,
    dsc_addressfamily  => 'IPv4',
  }   

}