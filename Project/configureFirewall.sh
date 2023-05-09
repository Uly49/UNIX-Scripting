#!/bin/bash

# This script sets up a basic firewall on the machine by allowing
# incoming SSH, HTTP, HTTPS traffic, NFS, MySQL, and Zabbix monitoring
# on ports 22, 80, 443, 2049, 3306, and 10050 and 10051 respectfully,
# and dropping all other incoming traffic. This also allows traffic
# from a specific IP Address for the NFS server.
# It also allows all outgoing traffic.


echo Configuring Firewall...

# Set default policy to drop incoming traffic
iptables -P INPUT DROP
ip6tables -P INPUT DROP

# Allow incoming traffic from Mike's IP Address (NFS)
iptables -A INPUT -s 131.210.23.156 -j ACCEPT
#iptables -A INPUT -s fe80::20c:29ff:fe9c:29ce -j ACCEPT

# Allow incoming SSH connections on port 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow incoming HTTP connections on port 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT

# Allow incoming HTTPS connections on port 443
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow incoming NFS connections on port 2049
iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 2049 -j ACCEPT
iptables -A INPUT -p udp --dport 2049 -j ACCEPT
ip6tables -A INPUT -p udp --dport 2049 -j ACCEPT

# Allow incoming MySQL connections on port 3306
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 3306 -j ACCEPT

# Allow incoming Zabbix connections on port 10050
iptables -A INPUT -p tcp --dport 10050 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 10050 -j ACCEPT
iptables -A INPUT -p udp --dport 10050 -j ACCEPT
ip6tables -A INPUT -p udp --dport 10050 -j ACCEPT

# Allow incoming Zabbix connections on port 10051
iptables -A INPUT -p tcp --dport 10051 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 10051 -j ACCEPT
iptables -A INPUT -p udp --dport 10051 -j ACCEPT
ip6tables -A INPUT -p udp --dport 10051 -j ACCEPT

# Set default policy to drop forwarded traffic
iptables -P FORWARD DROP
ip6tables -P FORWARD DROP

# Set default policy to accept outgoing traffic
iptables -P OUTPUT ACCEPT
ip6tables -P OUTPUT ACCEPT

# Allow outgoing traffic from Mike's IP Address (NFS)
iptables -A OUTPUT -d 131.210.23.156 -j ACCEPT
#ip6tables -A OUTPUT -d fe80::20c:29ff:fe9c:29ce -j ACCEPT

# Allow outgoing SSH connections on port 22
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 22 -j ACCEPT

# Allow outgoing HTTP connections on ports 80
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 80 -j ACCEPT

# Allow outgoing HTTPS connections on port 443
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 443 -j ACCEPT

# Allow outgoing NFS connections on port 2049
iptables -A OUTPUT -p tcp --sport 2049 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 2049 -j ACCEPT
iptables -A OUTPUT -p udp --sport 2049 -j ACCEPT
ip6tables -A OUTPUT -p udp --sport 2049 -j ACCEPT

# Allow outgoing MySQL connections on port 3306
iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 3306 -j ACCEPT

# Allow outgoing Zabbix connections on port 10050
iptables -A OUTPUT -p tcp --sport 10050 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 10050 -j ACCEPT
iptables -A OUTPUT -p udp --sport 10050 -j ACCEPT
ip6tables -A OUTPUT -p udp --sport 10050 -j ACCEPT

# Allow outgoing Zabbix connections on port 10051
iptables -A OUTPUT -p tcp --sport 10051 -j ACCEPT
ip6tables -A OUTPUT -p tcp --sport 10051 -j ACCEPT
iptables -A OUTPUT -p udp --sport 10051 -j ACCEPT
ip6tables -A OUTPUT -p udp --sport 10051 -j ACCEPT



# Save firewall rules to correct file
iptables-save > /etc/sysconfig/iptables-config
ip6tables-save > /etc/sysconfig/ip6tables-config

# Save firewall rules to boot
iptables-restore < /etc/sysconfig/iptables-config
ip6tables-restore < /etc/sysconfig/ip6tables-config

echo Finished configuring firewall!
