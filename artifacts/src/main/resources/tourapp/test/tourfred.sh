#!/bin/sh
# Run tour
BINDIR=`dirname $0`
. $BINDIR/../setenv.sh
cd $APP_HOME
if [ "$1" = "debug" ] ; then
  DEBUG='-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n'
else
  DEBUG=''
fi
java $DEBUG -Xms256m -Xmx512m org.jbundle.Main url=http://fred.demo.tourgeek.com:8181/tourgeek baseURL=fred.demo.tourgeek.com:8181/ domain=fred.demo.tourgeek.com background=backgrounds/worldmapalpha.gif backgroundcolor=#FFEEEE remotehost=fred.demo.tourgeek.com codebase=fred.demo.tourgeek.com:8181/ connectionType=proxy
