# ip2as
## usage
- for arguments
  ```bash
  $ ruby ip2as.rb hoge 8.8.8.8 hohoho
  hoge [AS15169*] hohoho
  ```
- for standard output
  ```bash
  $ ifconfig en0 | ip2as.rb
  en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
  ether xx:xx:xx:xx:xx
  inet6 fe80::xxxx:xxxx:xxxx:xxxx%en0 prefixlen 64 secured scopeid 0x4
  inet 172.31.255.128 netmask 0xffffff00 broadcast 172.31.255.255
  inet6 [AS55391] prefixlen 64 autoconf secured
  inet6 [AS55391] prefixlen 64 autoconf temporary
  nd6 options=201<PERFORMNUD,DAD>
  media: autoselect
  ```

## output format
- `*`: appended when there are multiple answer

## TODO
- whois server selection?
- RDAP protocol
