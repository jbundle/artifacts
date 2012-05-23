. ./set-env.sh $1 $2 $3

rm -fr $WEB/jbundle

cp -r $JBUNDLE_ROOT/jbundle-util-webapp-website/target/jbundle-util-webapp-website-$VERSION/ $WEB/jbundle
cp -r $DEV_DIR/jbundle-root/jbundle-config/jbundle-config-web/jbundle-config-web-site/target/site/* $WEB/jbundle
mkdir -p $WEB/download/software/java/war/
cd $WEB/jbundle
jar cf $WEB/download/software/java/war/jbundle.war -C $WEB/jbundle .

cp -r $JBUNDLE_ROOT/jbundle-util-webapp-website/target/jbundle-util-webapp-website-$VERSION/ $WEB/simpleservlets
cp -r $JBUNDLE_ROOT/jbundle-util-webapp-site/target/site/* $WEB/simpleservlets
cd $WEB/simpleservlets
jar cf $WEB/download/software/java/war/simpleservlets.war -C $WEB/simpleservlets .

cp -r $JBUNDLE_ROOT/jbundle-util-webapp-website/target/jbundle-util-webapp-website-$VERSION/ $WEB/jbundle-jcalendarbutton
cp -r $DEV_DIR/jbundle-jcalendarbutton/target/site/* $WEB/jbundle-jcalendarbutton
cd $WEB/jbundle-jcalendarbutton
jar cf $WEB/download/software/java/war/jbundle-jcalendarbutton.war -C $WEB/jbundle-jcalendarbutton .

cp -r $JBUNDLE_ROOT/jbundle-util-webapp-website/target/jbundle-util-webapp-website-$VERSION/ $WEB/calendarpanel
cp -r $DEV_DIR/jbundle-calendarpanel/jbundle-calendarpanel-core/target/site/* $WEB/calendarpanel
cd $WEB/calendarpanel
jar cf $WEB/download/software/java/war/calendarpanel.war -C $WEB/calendarpanel .
# NOTE: The previous war requires the installation of the jnlp war at calendarpanel/jnlp

