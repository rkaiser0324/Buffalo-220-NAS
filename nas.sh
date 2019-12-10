#!/bin/sh
#
# This script executes commands on the NAS, and requires that
# you configure the two details:
#
#  1.  The IP address of the NAS
#
#  2.  The password for the "admin" user.
#
#  3.  Uncomment (#) and change the MAC of the NAS. (Possibly just change the last 3 bytes)
#


IP=192.168.1.127

ADMIN_PASS=password

MAC=cc:e1:d5:a6:0d:5d

if [ -n "$MAC" ]; then
	java -jar acp_commander.jar  -q -t ${IP} -ip ${IP} -m ${MAC} -pw ${ADMIN_PASS} -c "$*"
else
	echo NOTE: MAC not defined. If this doesn't work try to define your NAS' MAC address above.
	java -jar acp_commander.jar  -q -t ${IP} -ip ${IP} -pw ${ADMIN_PASS} -c "$*"
fi

