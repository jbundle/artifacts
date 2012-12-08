# git clone ssh://scm.jbundle.org/scm/git/workspace
# git submodules init
# git submodules update

for dir in tourapp \
tourapp-parent \
other \
obsolete \
wrapped \
artifacts \
jbundle/jbundle-parent \
app/picture \
app/dance \
jbundle/android \
jbundle/javafx \
jbundle/jbundle \
jbundle/app/contact \
jbundle/misc \
jbundle/util/biorhythm \
jbundle/util/calendarpanel \
jbundle/util/osgi \
jbundle/util/osgi-webstart \
jbundle/util/jcalendarbutton \
jbundle/util/other \
jbundle/util/util \
jbundle/util/webapp \
jbundle/util/wsdl; do
echo $dir
git submodule add ssh://scm.jbundle.org/scm/git/workspace/$dir $dir
done

