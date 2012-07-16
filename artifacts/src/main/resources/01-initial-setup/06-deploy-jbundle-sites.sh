. ./set-env.sh $1 $2 $3

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE create-virtual-server --hosts www.jbundle.org,www.jbundle.com,jbundle.org,jbundle.com --httplisteners http-listener-1,http-listener-2 jbundle

cd $JBUNDLE_ROOT
PROJECT=jbundle-util-webapp-website
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-files
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-webdav
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-upload
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-redirect
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-proxy
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-cgi
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./$PROJECT/target/$PROJECT-$VERSION.war

PROJECT=jbundle-util-webapp-webstart-jnlp
CONTEXT=/util/webapp/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT ./jbundle-util-webapp-webstart/$PROJECT/target/$PROJECT-$VERSION.war
sleep 5

$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE set configs.config.server-config.http-service.virtual-server.jbundle.default-web-module=jbundle

# ********** Note: HUDSON does not work with glassfish 3.1 ************
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --name hudson --virtualservers jbundle --contextroot /hudson --upload false /space/web/download/software/java/war/hudson.war

PROJECT=jbundle
CONTEXT=/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT $WEB/download/software/java/war/$PROJECT.war

PROJECT=simpleservlets
CONTEXT=/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT $WEB/download/software/java/war/$PROJECT.war

PROJECT=jbundle-jcalendarbutton
CONTEXT=/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT $WEB/download/software/java/war/$PROJECT.war

PROJECT=calendarpanel
CONTEXT=/$PROJECT
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT $WEB/download/software/java/war/$PROJECT.war
CONTEXT=/$PROJECT/jnlp
PROJECT=calendarpaneljnlp
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE $DEPLOY_COMMAND --virtualservers jbundle --name $PROJECT --contextroot $CONTEXT $DEV_DIR/jbundle-calendarpanel/jbundle-calendarpanel-sample/jbundle-calendarpanel-sample-site/jbundle-calendarpanel-sample-site-jnlp/target/jbundle-calendarpanel-sample-site-jnlp-0.7.6.war

sleep 5
$ASADMIN --user=$USER --host=$HOST --passwordfile=$PASSWORDFILE restart-domain
sleep 5

