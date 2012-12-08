# git clone ssh://csm.jbundle.org/scm/git/workspace
git submodule init
git submodule update

for dir in tourapp \
../tourapp-parent \
../obsolete \
../other \
../wrapped \
../artifacts \
../jbundle/jbundle-parent \
../../app/picture \
../../app/dance \
../../jbundle/android \
../../jbundle/javafx \
../../jbundle/jbundle \
../../jbundle/app/contact \
../../../jbundle/misc \
../../jbundle/util/biorhythm \
../../util/calendarpanel \
../../util/osgi \
../../util/osgi-webstart \
../../util/jcalendarbutton \
../../../jbundle/util/other \
../../../jbundle/util/util \
../../../jbundle/util/webapp \
../../../jbundle/util/wsdl; do
echo $dir
cd $dir
git checkout master
done


