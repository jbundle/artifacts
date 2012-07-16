#!bin
# First param is the target machine (default=localhost)

. ./set-env.sh $1 $2 $3

# cd /usr/local/java/web
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE stop-domain
sleep 5
rm -fr /usr/local/java/web/glassfish3
~/Download/glassfish-3.1-b33-unix.sh -s -a silent-3.1.config

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE start-domain
sleep 5
# + $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE change-admin-password
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
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.access-log.format=combined
#$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.access-log.format=%client.name%\ %datetime%\ %request%\ %status%\ %response.length%\ %header.referer%\ %header.user-agent%
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.access-logging-enabled=true
# Need to restart since I need the ram to load tourapp
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5

