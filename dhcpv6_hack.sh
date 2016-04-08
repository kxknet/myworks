#!/bin/sh
### BEGIN INIT INFO
# Provides:       dhcp 6 hack
# Required-Start:    mountkernfs 
# Required-Stop:     
# Default-Start:     S
# Default-Stop:
# Short-Description: Start udevd, populate /dev and load drivers.
### END INIT INFO

DHCP6CCTLKEY=/etc/wide-dhcpv6/dhcp6cctlkey

# The key mustn\'t be world readable
umask 066

echo "Generating ${DHCP6CCTLKEY}..." >&2
dd if=/dev/random bs=32 count=1 2>/dev/null | 	uuencode -m ${DHCP6CCTLKEY} | 	head -n 2 | tail -n 1 > ${DHCP6CCTLKEY}

umask 022
rm -f /etc/init.d/dhcpv6_hack.sh
rm -f /etc/rc2.d/S11dhcpv6hack

