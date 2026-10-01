#!/bin/bash

### DHCPD configuration
apt-get install -y isc-dhcp-server
cp /vagrant/config/resources/dhcpd.conf      /etc/dhcp/dhcpd.conf
cp /vagrant/config/resources/isc-dhcp-server /etc/default/isc-dhcp-server
systemctl restart isc-dhcp-server

### TFTPD configuration
apt-get install -y tftpd-hpa
cp /vagrant/config/resources/tftpd-hpa /etc/default/tftpd-hpa

#mkdir /tftpboot
#cp -R /config/resources/pxelinux.cfg /tftpboot
#cp -R /config/resources/syslinux /tftpboot
#cp /config/resources/pxelinux.0 /tftpboot

#mkdir /srv/tftp
cp -R /vagrant/config/resources/pxelinux.cfg /srv/tftp
cp -R /vagrant/config/resources/syslinux     /srv/tftp
cp    /vagrant/config/resources/pxelinux.0   /srv/tftp
systemctl restart tftpd-hpa

### PXE configuration
# apt-get install -y pxe

# apt-get install -y dns-root-data dnsmasq dnsmasq-base libnetfilter-conntrack3 mtools pxe syslinux syslinux-common tftpd-hpa
# apt-get install   -y dns-root-data dnsmasq dnsmasq-base libnetfilter-conntrack3 mtools      syslinux syslinux-common tftpd-hpa
