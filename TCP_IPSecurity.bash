standards
IETF
Internet Engineering Task Force
publishes RFC (Request For Comment) documents
example: RFC 3439
layers
TCP/IP uses a flexible 4-layer model. The 4 layers do not exactly correspond to the 7 more rigorously defined OSI layers.

Application
programs using network communication
Transport
end-to-end communication
software ports
Internet
moves packets between networks
Link
network hardware and drivers
IPv4 protocols
MAC
Media Access Control
hardware addressing
ARP
Address Resolution Protocol
translates between hardware-dependent and hardware-independent formats
IP
Internet Protocol
routes IP datagrams to destination address
fragments and defragments IP datagrams to fit hardware frame size limits
routes IP datagrams to destination IP address (connectionless)
destroys outdated IP datagrams
ICMP
Internet Control Message Protocol
Internet layer diagnostics, etc.
UDP
User Datagram Protocol
stateless
low overhead
TCP
Transmission Control Protocol
stateful
reliable virtual circuit
DHCP
Dynamic Host Configuration Protocol
automatic addressing
DNS
Domain Name System
resolves names to addresses
unique host_name.domain_name
original top-level domains: .com, .edu, .gov, .mil, .net, .org, .arpa
2-character country code top-level domains: .us, etc.
newer top-level domains: .info, .me, etc.
arbitrary lower-level domains, e.g. .dvc.edu
DNS servers resolve hostnames
NAT
Network Address Translation
IPv4 addresses
length
32 bits, unique for each interface
representation
4 groups of 8 bits written as 1-3 decimal digits separated by dots
Class A
8 bits network, 24 bits hosts
begins with bit 0 (decimal 1..126)
Class B
16 bits network, 16 bits hosts
begins with bits 10 (decimal 128..191)
Class C
24 bits network, 8 bits hosts
begins with bits 110 (decimal 192..223)
Class D
multicast, 28 bits group
begins with bits 1110 (decimal 224..239)
Class E
reserved, IPv6
begins with bits 11110 (decimal 240..247)
CIDR
Classless Inter Domain Routing
x.x.x.x/n where n is the number of network bits
loopback
localhost
127.x.x.x (127.0.0.0/8)
private
not routed
10.x.x.x (10.0.0.0/8)
172.16.x.x - 172.31.x.x (172.16.0.0/12)
192.168.x.x(192.168.0.0/16)
link-local
for auto configuration
169.254.x.x (169.254.0.0/16)
network
all host bits 0 (e.g. 192.168.1.0)
broadcast
all host bits 1 (e.g. 192.168.1.255)
subnet mask
32 bits, determines whether a host is on the same local network
all network bits 1, all host bits 0
IPv6 protocols
NDP
Neighbor Discovery Protocol
auto addressing, uniqueness
PMTUD
Path MTU Discovery (maximun transmission unit)
avoids fragmentation
IPv6 addresses
length
128 bits
NAT not needed
representation
8 groups of 16 bits written as 4 hex digits separated by colons
leading zeros within a group may be eliminated
consecutive 0000 groups may be replaced with an empty group (once)
subnet
64 bits standard
CIDR not needed
auto addressing
SLAAC, Stateless Address Autoconfiguration
DHCP not needed
scope
interface-local spans one interface (for loopback)
link-local spans local network
global
others (administratively defined)
unicast
defines one interface
multicast
defines a group of interfaces
packets delivered to all
used instead of broadcast
anycast
defines a group of interfaces
packets delivered to one
used instead of broadcast
assignment
optimized for routing efficiency
UNIX utilities
PATH=$PATH:/sbin:/usr/sbin   # facilitate access to system commands

ifconfig   # information on active interfaces
ifconfig eth0   # a particular interface
ifconfig -a   # all interfaces
route   # kernel routing table
route -n   # shows IP addresses not hostnames
cat /etc/resolv.conf   # first nameserver entry is primary
                       # search is default domain for unqualified hostnames

netstat | less   # shows current connections
q   # quit less

ping 8.8.8.8   # tests for connectivity
^C   # terminate ping
ping -c2 8.8.8.8   # count
arp   # show ARP cache
arp -n   # shows IP addresses not hostnames
traceroute 8.8.8.8   # shows route

host google-public-dns-a.google.com   # shows IP address
host 8.8.8.8   # reverse lookup, shows hostname
host -a slackware.com   # all
whois slackware.com | less   # administrative info
q   # quit less
