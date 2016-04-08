#!/bin/bash
### BEGIN INIT INFO
# Provides: ssh gen keys
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: ssh gen keys
# Description: Enable
if test ! -e /etc/ssh/lock_gen_keys ; then
rm -f /etc/ssh/ssh_host_*
ssh-keygen -A
touch /etc/ssh/lock_gen_keys
fi
