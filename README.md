# dns_win

Manage the IPv4 client DNS servers on Windows systems. 

## Parameters

* ```dnsservers```			- An array of DNS servers to use in order or Primary, Secondary and so on.
* ```interfacealias```		- The interface alias of the network adapter to manage DNS for.

## Usage
This module leverages puppetlabs/dsc to set the IPv4 client DNS servers. It requires PowerShell v5.

## Example
```ruby
class { '::dns_win':
  dnsservers		=> [ '1.1.1.1', '2.2.2.2', '3.3.3.3', ],
  interfacealias	=> 'Ethernet',
}
```

## Finding your interface alias

For Server 2012. 

```
PS C:\Windows\system32> Get-NetAdapter | select name
name
----
dmz
Ethernet
```

For Server 2008

```
PS C:\Windows\system32> ipconfig /all | findstr 'Ethernet adapter'
Ethernet adapter dmz:
Ethernet adapter Ethernet:
Tunnel adapter isatap.{EF48C043-47D6-4FA8-8F26-70F362026790}:
Tunnel adapter isatap.{2856B367-2784-46A3-84C6-3CD06749C4CB}:
````