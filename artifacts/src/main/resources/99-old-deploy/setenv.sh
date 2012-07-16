#!/bin/sh
BINDIR=`dirname $0`
export POLICY_ALL=$BINDIR/policy/policy.all
export APP_HOME=$BINDIR/..
JAVA_DIR=/usr/local/java
export SERVER=$HOSTNAME
# Remember the trailing / on code_base
export CODE_BASE=$SERVER:8080/
export J2EE_HOME=$JAVA_DIR/web/glassfish
CLASSPATH=$APP_HOME/WEB-INF/lib/*
CLASSPATH=$CLASSPATH:$J2EE_HOME/glassfish/lib/javaee.jar
export CLASSPATH

