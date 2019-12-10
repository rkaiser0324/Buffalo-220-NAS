#!/bin/sh
#
# This script executes commands on the NAS, after you configure the IP, admin password, and MAC address of the NAS.
#
# Syntax:
#	./nas.sh <command>
#	./nas.sh ls -l

# Set the IP address of the NAS
IP=192.168.1.127

# Set the password for the "admin" user on the web UI
ADMIN_PASS=password

# Set, and if necessary, change the MAC of the NAS (may only need to change the last 3 bytes)
MAC=cc:e1:d5:a6:0d:5d

if [ -n "$MAC" ]; then
	java -jar acp_commander.jar  -q -t ${IP} -m ${MAC} -pw ${ADMIN_PASS} -c "$*"
else
	echo "NOTE: MAC not defined. If this doesn't work try to define your NAS' MAC address above."
	java -jar acp_commander.jar  -q -t ${IP} -pw ${ADMIN_PASS} -c "$*"
fi

