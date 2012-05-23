. ./set-env.sh $1 $2 $3

cd $DEV_DIR
mvn clean
mvn install
cd $DEV_DIR/jbundle-root/jbundle-config/jbundle-config-web/jbundle-config-web-site
mvn site
cd $JBUNDLE_ROOT/jbundle-util-webapp-site
mvn site
cd $DEV_DIR/jbundle-jcalendarbutton
mvn site
cd $DEV_DIR/jbundle-calendarpanel/jbundle-calendarpanel-core
mvn site

