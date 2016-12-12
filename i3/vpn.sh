#!/usr/bin/env bash

################################
# Shows ip address of a given interface
#
# @param {String} interface: The network interface to check
################################

full=""
short=""
color=""
status=0

interface="${BLOCK_INSTANCE:-"ppp0"}"
netPath=/sys/class/net
interfacePath=`echo $netPath/$interface`
# Expand wildcard interfaces
interface=${interfacePath#$netPath/}


state="$(cat $interfacePath/operstate)"


if [ "$state" == "unknown" ]; then
	ipaddr="$(ip addr show $interface | awk '/192\.168\./ && /inet/{print $2}')"
	ipaddr="${ipaddr}"
	#ipaddr="YES"
else
	ipaddr="down"
	status=33
fi


full="$ipaddr"
short=$full


echo $full
echo $short
echo $color
exit $status
