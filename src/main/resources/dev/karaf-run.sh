export KARAF_DIST=apache-karaf-full-3.0.0-SNAPSHOT
export KARAF_DIST=apache-karaf-2.2.1
export KARAF_DIST=apache-servicemix-4.4.1-fuse-01-06

export KARAF_LOCATION=~/workspace-karaf/karaf/assemblies/apache-karaf-full/target/apache-karaf-full-3.0.0-SNAPSHOT-bin.tar.gz
export KARAF_LOCATION=/space/download/software/karaf/$KARAF_DIST.tar.gz
export KARAF_LOCATION=/space/download/software/dev/soa/servicemix/$KARAF_DIST.tar.gz

export DEV_LOCATION=~/workspace/workspace
export DEV_LOCATION=/space/download/workspace

export INSTALL_LOCATION=/usr/local/java/web

cd $INSTALL_LOCATION

export JAVA_MIN_MEM=512M
export JAVA_MAX_MEM=2048M
export JAVA_PERM_MEM=256M
export JAVA_MAX_PERM_MEM=512M

echo Remember to increase the memory params before restarting karaf

cd $KARAF_DIST/
# bin/karaf $1
bin/servicemix $1

