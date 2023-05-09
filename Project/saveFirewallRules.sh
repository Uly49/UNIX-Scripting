#!/bin/bash

# This script will save the current firewall rules to boot


echo Saving Firewall Rules...

# Save firewall rules to correct file
iptables-save > /etc/sysconfig/iptables-config
ip6tables-save > /etc/sysconfig/ip6tables-config

# Save firewall rules to boot
iptables-restore < /etc/sysconfig/iptables-config
ip6tables-restore < /etc/sysconfig/ip6tables-config

echo Finished Saving Firewall Rules!
