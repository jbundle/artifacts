#!/bin/bash

export BINDEX=/opt/osgi/bindex/bindex.jar
export REPOSITORY=~/.m2/repository

export JBUNDLE_VERSION=0.8.0
export TOURGEEK_VERSION=0.8.0
export JBUNDLE_SNAPSHOT_VERSION=0.8.0-SNAPSHOT
export TOURGEEK_SNAPSHOT_VERSION=0.8.0-SNAPSHOT
export REPO_VERSION=1.0.3
mkdir ~/temp
cd ~/temp

# ---------------- external -----------------
rm -fr repository maven2
mkdir repository
cd repository

PACKAGE='A'
VERSION='B'

sync_package () {
  echo "Inside function: var1: $PACKAGE, var2: $VERSION"
  mkdir -p $PACKAGE
  rsync -r $REPOSITORY/$PACKAGE/$VERSION $PACKAGE
}

#PACKAGE=mysql/mysql-connector-java
#VERSION=5.1.48
#sync_package
#
#PACKAGE=biz/source_code/base64coder
#VERSION=/2010-12-19
#sync_package

#PACKAGE=javax/mail/mail
#VERSION=1.4.4
#sync_package

#PACKAGE=org/json/json
#VERSION=20190722
#sync_package
#
#PACKAGE=org/apache/derby/derby
#VERSION=10.14.2.0
#sync_package

#PACKAGE=commons-collections/commons-collections
#VERSION=3.2.1
#sync_package
#
#PACKAGE=jakarta/xml/soap/jakarta.xml.soap-api
#VERSION=1.4.1
#sync_package
#
#PACKAGE=com/sun/xml/messaging/saaj/saaj-impl
#VERSION=1.5.1
#sync_package
#
#PACKAGE=jakarta/activation/jakarta.activation-api
#VERSION=1.2.1
#sync_package
#
#PACKAGE=com/sun/activation/jakarta.activation
#VERSION=1.2.1
#sync_package

#PACKAGE=org/jvnet/mimepull/mimepull
#VERSION=1.9.11
#sync_package

#PACKAGE=org/jvnet/staxex/stax-ex
#VERSION=1.8.1
#sync_package
#
#PACKAGE=jakarta/xml/bind/jakarta.xml.bind-api
#VERSION=2.3.2
#sync_package

#PACKAGE=org/apache/httpcomponents/httpclient-osgi
#VERSION=4.5.10
#sync_package

# ----

#PACKAGE=javax/xml/soap/javax.xml.soap-api
#VERSION=1.4.0
#sync_package

#PACKAGE=org/apache/servicemix/bundles/org.apache.servicemix.bundles.saaj-impl
#VERSION=1.5.1_1
#VERSION=1.3.20_1
#sync_package

#PACKAGE=com/sun/activation/jakarta.activation
#VERSION=1.2.1
#sync_package
#
#PACKAGE=org/jvnet/staxex/stax-ex
#VERSION=1.7.4
#sync_package
#
#PACKAGE=javax/xml/stream/stax-api
#VERSION=1.0-2
#sync_package

PACKAGE=
VERSION=
# sync_package


cd ..
rm -f ~/workspace/workspace/artifacts/artifacts/src/main/resources/obr/repository/jbundle-external-repository-$REPO_VERSION.xml
java -jar $BINDEX -quiet -r ~/.m2/jbundle-external-repository.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
mv repository maven2
java -jar $BINDEX -quiet -r ~/workspace/workspace/artifacts/artifacts/src/main/resources/obr/repository/jbundle-external-repository-$REPO_VERSION.xml -t https://repo.maven.apache.org/%p/%f  ~/temp/maven2
# rm -fr maven2


# ---------------- jbundle snapshot -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' $REPOSITORY/org/jbundle org/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-repository-$JBUNDLE_SNAPSHOT_VERSION.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- tourgeek snapshot -----------------
mkdir repository
cd repository
mkdir com
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' --filter='- **/*archetype*.jar' $REPOSITORY/com/tourgeek com/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/tourgeek-repository-$TOURGEEK_SNAPSHOT_VERSION.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- util snapshot -----------------
mkdir repository
cd repository
mkdir -p org/jbundle
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' --filter='- **/*archetype*.jar' $REPOSITORY/org/jbundle/util org/jbundle
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-util-repository-SNAPSHOT.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- jbundle release -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='- **/*SNAPSHOT*.jar' $REPOSITORY/org/jbundle org/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-repository-$JBUNDLE_VERSION.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
rm -fr repository
# ---------------- tourgeekp release -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='- **/*SNAPSHOT*.jar' $REPOSITORY/com/tourgeek com/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/tourgeek-repository-$TOURGEEK_VERSION.xml -t file:/home/dcorley/.m2/%p/%f ~/temp/repository
rm -fr repository

