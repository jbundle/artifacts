#!/bin/sh
# Run tour
BINDIR=`dirname $0`
. $BINDIR/setenv.sh
cd $APP_HOME
if [ "$1" = "debug" ] ; then
  DEBUG='-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n'
else
  DEBUG=''
fi

java $DEBUG -Xms256m -Xmx512m org.jbundle.Main \
background=backgrounds/worldmapalpha.gif \
backgroundcolor=#CCCCFF \
remotehost=$SERVER \
codebase=$CODE_BASE \
mainUserDBName=main \
programSharedDBName=program_app \
programUserDBName=program_app \
local=Jdbc table=Jdbc remote=Jdbc
