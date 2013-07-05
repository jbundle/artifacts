export SERVER=$HOST
export TOURGEEK=/space/web/tourgeek
export POLICY_ALL=$TOURGEEK/bin/policy/policy.all
export VERSION=0.7.7-SNAPSHOT
export CLASSPATH=$TOURGEEK/WEB-INF/lib/jbundle-base-screen-control-servlet-$VERSION.jar:$TOURGEEK/WEB-INF/lib/*:/usr/local/java/web/glassfish/glassfish/lib/javaee.jar
export COMMAND="java -classpath \
$CLASSPATH \
-Xms256m -Xmx512m \
org.jbundle.base.db.xmlutil.XmlInOut allFiles=true
"$COMMAND" &

