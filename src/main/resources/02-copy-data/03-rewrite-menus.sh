mkdir -p data/archive/main_shared/org/jbundle/main/db/
mv Menus.xml data/archive/main_shared/org/jbundle/main/db/
. bin/set-env.sh
mysql -u tourapp -p
export TOURAPP=/space/web/tourapp
export CLASSPATH=$TOURAPP/WEB-INF/lib/jbundle-base-screen-control-servlet-$VERSION.jar:$TOURAPP/WEB-INF/lib/*:/usr/local/java/web/glassfish/glassfish/lib/javaee.jar
java -classpath $CLASSPATH -Xms256m -Xmx512m org.jbundle.base.db.xmlutil.XmlInOut record=org.jbundle.main.db.Menus archiveFile=/main_shared/org/jbundle/main/db/Menus.xml

