#!/bin/sh
# Run tour
BINDIR=`dirname $0`
. ../bin/setenv.sh
cd $APP_HOME
java com.tourgeek.Main menu=MainDon background=backgrounds/worldmapalpha.gif backgroundcolor=#FFFFCC remotehost=$SERVER language=es

