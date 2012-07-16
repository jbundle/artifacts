#!/bin/sh
JAVA_DIR=/usr/local/java
# export JAVA_HOME=$JAVA_DIR/jdk

export USER_DIR=/home/don

export VERSION=0.8.0-SNAPSHOT
export CODE_HOME=$USER_DIR/workspace/workspace
export TOURAPP_HOME=$CODE_HOME/tourapp
export APP_HOME=$CODE_HOME/tourapp/config/web/webapp/target/tourapp-config-web-webapp-$VERSION

# Usually you want to set this to $HOSTNAME! NOTE: IT IS VERY IMPORTANT THAT $HOSTNAME is the host and is the host's actual IP
export SERVER=$HOSTNAME
# Remember the trailing / on code_base
export CODE_BASE=$SERVER:8181/
export J2EE_HOME=$JAVA_DIR/web/glassfish
export POLICY_ALL=$CODE_HOME/bin/tourapp/policy/policy.all

export TOURAPP=tourapp
CLASSPATH=$TOURAPP_HOME/config/web/webapp/target/$TOURAPP-config-web-webapp-$VERSION/WEB-INF/lib/*
CLASSPATH=$CLASSPATH:$TOURAPP_HOME/config/web/webapp/target/$TOURAPP-config-web-webapp-$VERSION/lib/*
CLASSPATH=$CLASSPATH:$J2EE_HOME/glassfish/lib/javaee.jar
CLASSPATH=$CLASSPATH:$TOURAPP_HOME/config/web/webapp/target/$TOURAPP-config-web-webapp-$VERSION/
CLASSPATH=$CLASSPATH:/usr/local/java/util/jaxe/lib/*
CLASSPATH=$CLASSPATH:/usr/local/java/util/junit/junit.jar
CLASSPATH=$CLASSPATH:$CODE_HOME/jbundle/app/dance/dance/target/classes/
CLASSPATH=$CLASSPATH:$CODE_HOME/jbundle/app/contact/contact/contact/target/classes/
CLASSPATH=$CLASSPATH:$CODE_HOME/jbundle/app/picture/picture/target/classes/
export CLASSPATH

