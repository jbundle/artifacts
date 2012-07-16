export SERVER=$HOST
export TOURAPP=/space/web/tourapp
export POLICY_ALL=$TOURAPP/bin/policy/policy.all
export VERSION=0.7.7-SNAPSHOT
export CLASSPATH=$TOURAPP/WEB-INF/lib/jbundle-base-screen-control-servlet-$VERSION.jar:$TOURAPP/WEB-INF/lib/*:/usr/local/java/web/glassfish/glassfish/lib/javaee.jar
export COMMAND="java -classpath \
$CLASSPATH \
-Xms256m -Xmx512m \
org.jbundle.base.db.xmlutil.XmlInOut allFiles=true
"$COMMAND" &

