#! /bin/bash
#########################################################
# yum-autodown
# yum-cron compatible "yum downloadonly" script
# Version 1.10
# Copyright 2016 HOLLY&Co.,Ltd.
#########################################################

if [ -f /etc/sysconfig/yum-cron ]; then
    source /etc/sysconfig/yum-cron
fi

TMPF=/tmp/yum-adown.$$

echo "New updates available for host "$HOSTNAME > $TMPF
yum -q check-update >> $TMPF

case "$?" in
    "0") /bin/rm $TMPF;
	exit 0;;
    "100") yum -q -y --downloadonly update;
	echo "Updates downloaded, use \"yum -C update\" manually to install them." >> $TMPF;
	SUBJECT="System update: "$HOSTNAME;
	if [ "$MAILTO" == "" ]; then
	    MAILTO="root";
	fi
	echo "mail -s "$SUBJECT" "$MAILTO;
	mail -s "$SUBJECT" "$MAILTO" < $TMPF;;
esac
/bin/rm $TMPF;

	    
