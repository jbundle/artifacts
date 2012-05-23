rm -fr /space/web/jbundle
cd ~/workspace/workspace/
cd jbundle/jbundle/config/web/site/
mvn clean;mvn site;mv target/site /space/web/jbundle
cd ../../../../util/osgi-webstart/webstart/
mvn clean;mvn site;mv target/site /space/web/jbundle/osgi-webstart
cd ../../webapp/site/
mvn clean;mvn site;mv target/site /space/web/jbundle/webapp

cd ~/workspace/workspace/jbundle/util/webapp/webstart
mvn clean;mvn install;mv target/org.jbundle.util.webapp.webstart-1.1.0-SNAPSHOT.war /usr/local/java/web/servicemix/deploy/

