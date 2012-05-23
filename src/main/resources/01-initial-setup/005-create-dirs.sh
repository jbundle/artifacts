. ./set-env.sh $1 $2 $3

su
wget http://www.tourgeek.com/download/software/java/web/glassfish/glassfish-3.0.1-unix.sh
cd /
mkdir space
chown glassfish space
chgrp users space
mkdir -p /usr/local/java/web
chown glassfish /usr/local/java/web
chgrp users /usr/local/java/web
cd /usr/local/java/web
ln -s glassfishv3 glassfish
# Transfer ~/.adminpassword
