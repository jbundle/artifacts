#!/bin/sh
# Run tour
BINDIR=`dirname $0`
. /data/java/bin/setenv.sh
cd /data/java/tour
# java com.tourgeek.Main appname=appserver2 menu=MainDon background=backgrounds/worldmapalpha.gif backgroundcolor=#FFCCFF"
java com.tourgeek.Main remotehost=$SERVER:8002 codebase=$SERVER menu=MainDon background=backgrounds/worldmapalpha.gif backgroundcolor=#FFCCFF

