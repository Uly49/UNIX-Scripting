#!/bin/bash

# This script removes current firewall rules and saves to boot

echo Removing Firewall Rules...

# Allow all incoming traffic
iptables -P INPUT ACCEPT

# Remove(flush) all firewall rules
iptables -F

# Save firewall rules to correct file
iptables-save > /etc/sysconfig/iptables-config
ip6tables-save > /etc/sysconfig/ip6tables-config

# Save firewall rules to boot
iptables-restore < /etc/sysconfig/iptables-config
ip6tables-restore < /etc/sysconfig/ip6tables-config

echo Finished Removed  Firewall Rules!
