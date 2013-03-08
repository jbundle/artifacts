export KARAF_DIST=apache-karaf-full-3.0.0-SNAPSHOT
export KARAF_DIST=apache-servicemix-4.4.1-fuse-01-06
KARAF_DIST=apache-karaf-2.3.1
# export KARAF_DIST=apache-servicemix-4.4.1
# export KARAF_DIST=apache-servicemix-4.4.2

export KARAF_LOCATION=~/workspace-karaf/karaf/assemblies/apache-karaf-full/target/apache-karaf-full-3.0.0-SNAPSHOT-bin.tar.gz
export KARAF_LOCATION=/var/lib/jbundle/download/software/dev/osgi/karaf/$KARAF_DIST.tar.gz
# export KARAF_LOCATION=/space/download/software/dev/soa/servicemix/$KARAF_DIST.tar.gz

export DEV_LOCATION=~/workspace/workspace
export DEV_LOCATION=/space/download/workspace

export INSTALL_LOCATION=/usr/local/java/web

cd $INSTALL_LOCATION
rm -fr $KARAF_DIST
tar zxvf $KARAF_LOCATION

cd $KARAF_DIST/etc/
#  cp $DEV_LOCATION/bin/tourapp/policy/policy.all all.policy
#  echo -e '\norg.osgi.framework.security=osgi\n' >> custom.properties
#  echo -e '\njava.security.policy=${karaf.base}/etc/all.policy\n' >> system.properties
#  echo -e '\norg/apache/felix/org.apache.felix.security/1.4.2/org.apache.felix.framework.security-1.4.2.jar=1\n' >> startup.properties
# Change ssh user and password
#  sed -i 's/smx=smx,admin/don=donwpp,admin/g' users.properties
sed -i 's/karaf=karaf,admin/don=donwpp,admin/g' users.properties
# Change default heap size
cd ../bin
sed -i 's/JAVA_MIN_MEM=128M/JAVA_MIN_MEM=512M/g' servicemix
sed -i 's/JAVA_MAX_MEM=512M/JAVA_MAX_MEM=2048M/g' servicemix
sed -i 's/JAVA_PERM_MEM=16M/JAVA_PERM_MEM=256M/g' servicemix
sed -i 's/JAVA_MAX_PERM_MEM=128M/JAVA_MAX_PERM_MEM=512M/g' servicemix
sed -i 's/JAVA_MIN_MEM=128M/JAVA_MIN_MEM=512M/g' karaf
sed -i 's/JAVA_MAX_MEM=512M/JAVA_MAX_MEM=2048M/g' karaf
sed -i 's/JAVA_PERM_MEM=16M/JAVA_PERM_MEM=256M/g' karaf
sed -i 's/JAVA_MAX_PERM_MEM=128M/JAVA_MAX_PERM_MEM=512M/g' karaf
cd ..
#  mkdir -p system/org/apache/felix/org.apache.felix.security/1.4.2
#  cp ~/.m2/repository/org/apache/felix/org.apache.felix.framework.security/1.4.2/org.apache.felix.framework.security-1.4.2.jar system/org/apache/felix/org.apache.felix.security/1.4.2/

export JAVA_MIN_MEM=512M
export JAVA_MAX_MEM=2048M
export JAVA_PERM_MEM=256M
export JAVA_MAX_PERM_MEM=512M

echo Remember to increase the memory params before restarting karaf

bin/karaf $1
# bin/servicemix $1

