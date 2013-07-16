. ./set-env.sh $1 $2 $3

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name tourgeek --contextroot / --upload false $WEB/tourgeek
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 2
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.tourgeek.com,tourgeek.com --httplisteners http-listener-1,http-listener-2 tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts donandann.com,www.donandann.com --httplisteners http-listener-1,http-listener-2 donandann
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.tourgeek.com,tourgeek.com --httplisteners http-listener-1,http-listener-2 tourgeek

# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.network-config.protocols.protocol.http-listener-1.http.default-virtual-server=tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.network-config.protocols.protocol.http-listener-2.http.default-virtual-server=tourgeek
sleep 2
# scp -r ../target/tourgeek-config-web-webapp-$VERSION/ glassfish@$HOST://web/tourgeek

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name demo --contextroot /demo --upload false $WEB/tourgeek/docs/com/tourgeek/www/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name download --contextroot /download --upload false $WEB/download/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name notes --contextroot /notes --upload false $WEB/notes/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name pictures --contextroot /pictures --upload false $WEB/pictures/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name upload --contextroot /upload --upload false $WEB/upload/
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name awstats --contextroot /awstats --upload false /usr/local/awstats/wwwroot
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE redeploy --name tourgeek --contextroot /dance --upload false /home/don/workspace/jbundle-workspace/jbundle-app-dance-root/jbundle-app-dance-webapp/target/jbundle-app-dance-webapp-$VERSION.war

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name biorhythm --contextroot /bio --upload false /web/download/software/java/war/bio.war

APP=dance
APP_NAME=jbundle-app-$APP-webapp
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name $APP --contextroot /$APP $DEV_DIR/jbundle-app-$APP-root/$APP_NAME/target/$APP_NAME-$VERSION.war
APP=contact
APP_NAME=jbundle-app-$APP-webapp
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name $APP --contextroot /$APP $DEV_DIR/jbundle-app-$APP-root/$APP_NAME/target/$APP_NAME-$VERSION.war
APP=picture
APP_NAME=jbundle-app-$APP-webapp
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name $APP --contextroot /$APP $DEV_DIR/jbundle-app-$APP-root/$APP_NAME/target/$APP_NAME-$VERSION.war

# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.server.default-web-module=tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.tourgeek.default-web-module=tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.donandann.default-web-module=tourgeek
# $ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.tourgeek.default-web-module=tourgeek

sleep 5
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5

