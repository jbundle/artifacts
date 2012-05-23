# git clone ssh://scm.jbundle.org/scm/git/workspace
# git submodules init
# git submodules update

for dir in tourapp \
tourapp-parent \
other \
obsolete \
wrapped \
jbundle/jbundle-parent \
jbundle/android \
jbundle/jbundle \
jbundle/app/contact \
jbundle/app/picture \
jbundle/app/dance \
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

