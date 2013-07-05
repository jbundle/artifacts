#!/bin/sh
# Start all the java processes

BINDIR=`dirname $0`
ASADMIN=/usr/local/java/web/glassfish/bin/asadmin
WEB=/space/web
VERSION=0.7.2-SNAPSHOT
DEPLOY_COMMAND=deploy

HOST=www.tourgeek.com
if [ "$1" != "" ] ; then
HOST=$1
fi

USER=admin
PASSWORDFILE=/home/don/.asadminpassword

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options -- -Xmx1024m
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options -- -Xms512m
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options "-XX\:PermSize=256m"
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options "-XX\:MaxPermSize=192m"
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options "-XX\:MaxPermSize=512m"
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE delete-jvm-options -- -Xmx512m
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-jvm-options -- -Xmx1024m
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-jvm-options -- -Xms512m
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-jvm-options "-XX\:PermSize=256m"
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-jvm-options "-XX\:MaxPermSize=512m"
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.access-log.format=%client.name%\ %datetime%\ %request%\ %status%\ %response.length%\ %header.referer%\ %header.user-agent%
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.access-logging-enabled=true
# Need to restart since I need the ram to load tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE stop-domain
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name tourgeek --contextroot / --upload false $WEB/tourgeek
sleep 2
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts donandann.com,www.donandann.com --httplisteners http-listener-1,http-listener-2 donandann

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.tourgeek.com,tourgeek.com --httplisteners http-listener-1,http-listener-2 tourgeek
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.jbundle.org,www.jbundle.com,jbundle.org,jbundle.com --httplisteners http-listener-1,http-listener-2 jbundle
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.tourgeek.com,tourgeek.com --httplisteners http-listener-1,http-listener-2 tourgeek
sleep 2
# scp -r ../target/tourgeek-config-web-webapp-$VERSION/ glassfish@$HOST://space/web/tourgeek

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name demo --contextroot /demo --upload false $WEB/tourgeek/docs/com/tourgeek/www/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name jbundle --contextroot /jbundle --upload false $WEB/jbundle/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name download --contextroot /download --upload false $WEB/download/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name notes --contextroot /notes --upload false $WEB/notes/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name pictures --contextroot /pictures --upload false $WEB/pictures/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name upload --contextroot /upload --upload false $WEB/upload/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name awstats --contextroot /awstats --upload false /usr/local/awstats/wwwroot
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE redeploy --name tourgeek --contextroot /dance --upload false /home/don/workspace/jbundle-workspace/jbundle-app-dance-root/jbundle-app-dance-webapp/target/jbundle-app-dance-webapp-$VERSION.war

# ********** Add this back - HUDSON does not work with glassfish 3.1 ************
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name hudson --virtualservers tourgeek,jbundle --contextroot /hudson --upload false /space/web/download/software/java/war/hudson.war
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name biorhythm --contextroot /bio --upload false /space/web/download/software/java/war/bio.war
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.network-config.protocols.protocol.http-listener-1.http.default-virtual-server=donandann
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.network-config.protocols.protocol.http-listener-2.http.default-virtual-server=donandann
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.jbundle.default-web-module=jbundle

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name calendarpanel --contextroot /calendarpanel/jnlp ../../../../../jbundle-calendarpanel/jbundle-calendarpanel-sample/jbundle-calendarpanel-sample-site/jbundle-calendarpanel-sample-site-jnlp/target/jbundle-calendarpanel-sample-site-jnlp-${VERSION}.war

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5

