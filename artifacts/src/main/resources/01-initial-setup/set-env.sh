#!bin
# BINDIR=`dirname $0`
ASADMIN=/usr/local/java/web/glassfish/bin/asadmin
WEB=/web
VERSION=0.7.7-SNAPSHOT
DEPLOY_COMMAND=deploy

HOST=localhost
if [ "$1" != "" ] ; then
HOST=$1
fi

USER=admin
PASSWORDFILE=~/.asadminpass

DEV_DIR=/home/don/workspace/jbundle-workspace
JBUNDLE_ROOT=$DEV_DIR/jbundle-util/jbundle-util-webapp-root

