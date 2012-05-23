export KARAF_DIST=apache-servicemix-4.4.1-fuse-01-06
cd /usr/local/java/web
rm -fr $KARAF_DIST
cp -r $KARAF_DIST.bu $KARAF_DIST
cd servicemix
bin/servicemix $1

