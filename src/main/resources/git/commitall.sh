# git submodules init
#
# git pull
# git submodules update
for dir in tourapp \
../tourapp-parent \
../other \
../obsolete \
../wrapped \
../jbundle/jbundle-parent \
../android \
../../jbundle/jbundle \
../../jbundle/app/contact \
../../../jbundle/app/picture \
../../../jbundle/app/dance \
../../../jbundle/misc \
../../jbundle/util/biorhythm \
../../../jbundle/util/calendarpanel \
../../../jbundle/util/osgi \
../../../jbundle/util/osgi-webstart \
../../../jbundle/util/jcalendarbutton \
../../../jbundle/util/other \
../../../jbundle/util/util \
../../../jbundle/util/webapp \
../../../jbundle/util/wsdl; do
echo $dir
cd $dir
git add .
git commit -m "$1" -a
git push
done

cd ../../..
git add .
git commit -m "$1" -a
git push

