#!/bin/bash -e

exec /sbin/init
exec /bin/su bluedata -c "/home/bluedata/start_dss.sh"
