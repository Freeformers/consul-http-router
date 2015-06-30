#!/bin/sh
if [ -f /var/run/nginx.pid ] ; then
	read PID </var/run/nginx.pid
fi

if [ -n "$PID" -a -n "$(ps --no-headers $PID)" ] ; then
	exec nginx -s reload
else
	echo "Starting nginx"
	exec nginx 
fi
