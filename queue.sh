#!/bin/bash
HOSTNAME="${COLLECTD_HOSTNAME:-`hostname -f`}"
INTERVAL="${COLLECTD_INTERVAL:-10}"

while sleep "$INTERVAL"
do
qdir=`/usr/sbin/postconf -h queue_directory`
total=`/usr/bin/mailq | /usr/bin/tail -n1 | /usr/bin/gawk  '{print $5}'`
total=`expr $total + 0`
incoming=`find $qdir/incoming -type f  -regex ".*" | wc -l`
active=`find $qdir/active -type f  -regex ".*" | wc -l`
deferred=`find $qdir/deferred -type f  -regex ".*" | wc -l`
bounce=`find $qdir/bounce -type f  -regex ".*" | wc -l`
hold=`find $qdir/hold -type f  -regex ".*" | wc -l`
corrupt=`find $qdir/corrupt -type f  -regex ".*" | wc -l`

echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-total_msg\" interval=$INTERVAL N:$total"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-incoming\" interval=$INTERVAL N:$incoming"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-active\" interval=$INTERVAL N:$active"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-deferred\" interval=$INTERVAL N:$deferred"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-bounce\" interval=$INTERVAL N:$bounce"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-hold\" interval=$INTERVAL N:$hold"
echo "PUTVAL \"$HOSTNAME/exec-postfix/gauge-corrupt\" interval=$INTERVAL N:$corrupt"

done
