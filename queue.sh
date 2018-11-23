#!/bin/bash

HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
INTERVAL="${COLLECTD_INTERVAL:-10}"

while sleep "$INTERVAL"
do
qdir=`postconf -h queue_directory`
total=`/usr/bin/mailq | /usr/bin/tail -n1 | /usr/bin/gawk  '{print $5}'`
total=`expr $total + 0`
incoming=`find /var/spool/postfix/incoming -type f  -regex ".*" | wc -l`
active=`find /var/spool/postfix/active -type f  -regex ".*" | wc -l`
deferred=`find /var/spool/postfix/deferred -type f  -regex ".*" | wc -l`
bounce=`find /var/spool/postfix/bounce -type f  -regex ".*" | wc -l`
hold=`find /var/spool/postfix/hold -type f  -regex ".*" | wc -l`
corrupt=`find /var/spool/postfix/corrupt -type f  -regex ".*" | wc -l`

echo "PUTVAL $HOSTNAME/postfix/total_msg interval=$INTERVAL N:$total"
echo "PUTVAL $HOSTNAME/postfix/incoming interval=$INTERVAL N:$incoming"
echo "PUTVAL $HOSTNAME/postfix/active interval=$INTERVAL N:$active"
echo "PUTVAL $HOSTNAME/postfix/deferred interval=$INTERVAL N:$deferred"
echo "PUTVAL $HOSTNAME/postfix/bounce interval=$INTERVAL N:$bounce"
echo "PUTVAL $HOSTNAME/postfix/hold interval=$INTERVAL N:$hold"
echo "PUTVAL $HOSTNAME/postfix/corrupt interval=$INTERVAL N:$corrupt"

done
