. ./set-env.sh $1 $2 $3

rm -fr $WEB/tourgeek
SRC_DIR=$DEV_DIR/tourgeek-root/tourgeek-config/tourgeek-config-web/tourgeek-config-web-webapp/target/tourgeek-config-web-webapp-$VERSION
cp -r $SRC_DIR $WEB/tourgeek

rm -fr $WEB/download
cp -r $JBUNDLE_ROOT/jbundle-util-webapp-files/target/jbundle-util-webapp-files-$VERSION $WEB/download

rm -fr $WEB/upload
cp -r $JBUNDLE_ROOT/jbundle-util-webapp-upload/target/jbundle-util-webapp-upload-$VERSION $WEB/upload

rm -fr $WEB/notes
cp -r $JBUNDLE_ROOT/jbundle-util-webapp-webdav/target/jbundle-util-webapp-webdav-$VERSION $WEB/notes

rm -fr $WEB/pictures
cp -r $JBUNDLE_ROOT/jbundle-util-webapp-files/target/jbundle-util-webapp-files-$VERSION $WEB/pictures

mkdir -p $WEB/download/software/java/war
cp $DEV_DIR/jbundle-biorhythm/jbundle-biorhythm-jnlp/target/jbundle-biorhythm-jnlp-$VERSION.war $WEB/download/software/java/war/bio.war

mkdir -p $WEB/download/software/java/war/
cp ~/Download/hudson.war $WEB/download/software/java/war
