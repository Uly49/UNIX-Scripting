#!bin/bash

rpm -Uvh https://repo.zabbix.com/zabbix/6.4/rhel/8/x86_64/zabbix-release-6.4-1.el8.noarch.rpm
dnf clean all

dnf install zabbix-agent

sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent