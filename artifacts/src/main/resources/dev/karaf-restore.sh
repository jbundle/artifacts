KARAF_DIST=apache-karaf-2.3.0
cd /usr/local/java/web
rm -fr $KARAF_DIST
cp -r $KARAF_DIST.bu $KARAF_DIST
cd $KARAF_DIST
bin/karaf $1

