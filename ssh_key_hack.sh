#!/bin/sh

### BEGIN INIT INFO
# Provides:		sshd
# Required-Start:	$remote_fs $syslog
# Required-Stop:	$remote_fs $syslog
# Default-Start:	2 3 4 5
# Default-Stop:		
# Short-Description:	OpenBSD Secure Shell server
### END INIT INFO


rm -f etc/ssh/ssh_host_*
/usr/bin/ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key
/usr/bin/ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key
/usr/bin/ssh-keygen -t rsa1 -N '' -f /etc/ssh/ssh_host_key
/usr/sbin/service ssh restart
rm -f /etc/init.d/ssh_key_hack.sh
rm -f /etc/rc2.d/S11sshhack

