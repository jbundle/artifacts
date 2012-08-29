export BINDEX=/usr/local/java/dev/bindex/bindex.jar
export REPOSITORY=~/.m2/repository

export JBUNDLE_VERSION=0.8.0
export TOURAPP_VERSION=0.8.0
export JBUNDLE_SNAPSHOT_VERSION=0.8.0-SNAPSHOT
export TOURAPP_SNAPSHOT_VERSION=0.8.0-SNAPSHOT
cd ~/temp

# ---------------- external -----------------
rm -fr repository maven2
mkdir repository
cd repository
rsync -r $REPOSITORY/mysql ./
# mkdir -p joda-time/joda-time	# Already included in servicemix
# rsync -r --filter='- **/*javadoc.jar' $REPOSITORY/joda-time/joda-time/2.0 ./joda-time/joda-time/
mkdir biz
rsync -r $REPOSITORY/biz/source_code biz/
mkdir javax
rsync -r $REPOSITORY/javax/mail javax/
mkdir commons-collections
rsync -r $REPOSITORY/commons-collections/commons-collections commons-collections/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-external-repository.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
mv repository maven2
# java -jar $BINDEX -quiet -r ~/workspace/workspace/bin/obr/jbundle-external-repository.xml -t http://repo2.maven.org/%p/%f  ~/temp/maven2
# rm -fr maven2
# ---------------- jbundle snapshot -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' $REPOSITORY/org/jbundle org/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-repository-$JBUNDLE_SNAPSHOT_VERSION.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- tourapp snapshot -----------------
mkdir repository
cd repository
mkdir com
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' --filter='- **/*archetype*.jar' $REPOSITORY/com/tourapp com/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/tourapp-repository-$TOURAPP_SNAPSHOT_VERSION.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- util snapshot -----------------
mkdir repository
cd repository
mkdir -p org/jbundle
rsync -r  --filter='+ */' --filter='- **/*archetype*.jar' --filter='+ **/*SNAPSHOT.jar' --filter='- **' --filter='- **/*archetype*.jar' $REPOSITORY/org/jbundle/util org/jbundle
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-util-repository-SNAPSHOT.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
# cp ~/.m2/snapshot-repository.xml ~/workspace/workspace/bin/obr/
rm -fr repository
# ---------------- jbundle release -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='- **/*SNAPSHOT*.jar' $REPOSITORY/org/jbundle org/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/jbundle-repository-$JBUNDLE_VERSION.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
rm -fr repository
# ---------------- tourappp release -----------------
mkdir repository
cd repository
mkdir org
rsync -r  --filter='- **/*SNAPSHOT*.jar' $REPOSITORY/com/tourapp com/
cd ..
java -jar $BINDEX -quiet -r ~/.m2/tourapp-repository-$TOURAPP_VERSION.xml -t file:/home/don/.m2/%p/%f ~/temp/repository
rm -fr repository

