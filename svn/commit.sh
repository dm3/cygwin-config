#/bin/bash
if [[ -z "$1" ]]; then
    CHANGELIST_NAME=tocommit
else
    CHANGELIST_NAME=$1
fi

STATUS_FILE=`mktemp`
COMMIT_CHANGELIST=`mktemp`
TO_ADD=/tmp/svn_to_add
svn st > $STATUS_FILE

# ignored
#sed '/^M.*\(lib\|.classpath\|.project\|Servers\|.prefs\|ipb-policy-fit-tests\|A[ \t]*+\|status$\)/!d' status | awk '{print $2}' > ignored

# Changelist appears in status when you have other active changelists
IGNORE_PATTERN="\(*.log\|*.class\|target\|Changelist\|.classpath\|.project\|.springBeans\|.launch\|Servers\|.prefs\|deps_all\|logs\|ipb-crm-fit-tests\|ipb-policy-fit-tests\|^A[ \t]*[+]*\|^?[ \t]*\)"

echo "svn status in $STATUS_FILE"
# add unversioned files
echo "(?) files in $TO_ADD"
sed '/^?/!d' $STATUS_FILE | awk '{print $2}' | sed "/$IGNORE_PATTERN/d" > $TO_ADD

# add to svn only if there is something to add
if [[ `wc -l $TO_ADD | awk '{print $1}'` -gt 0 ]]; then
    svn add --targets $TO_ADD
    # reload status file as we have added unversioned items in the previous step
    svn st > $STATUS_FILE
fi

# without A (added dirs)/A + (added files)
sed "/$IGNORE_PATTERN/d" $STATUS_FILE | awk '{print $2}' > $COMMIT_CHANGELIST
# A + files
sed '/^A[ \t]*+/!d' $STATUS_FILE | awk '{print $3}' >> $COMMIT_CHANGELIST
# A dirs
sed '/^A/!d' $STATUS_FILE | awk '{print $2}' | sed '/+/d' >> $COMMIT_CHANGELIST
# files created during eclipse:eclipse and custom properties
sed -i '\_claims/ipb-claims-services/.externalToolBuilders_d' $COMMIT_CHANGELIST
sed -i '\_claims/ipb-claims-services/maven-eclipse.xml_d' $COMMIT_CHANGELIST
sed -i '\_applications/ipb-deploy/src/test/resources/liquibase.dev.properties_d' $COMMIT_CHANGELIST
echo "(not ?) files in $COMMIT_CHANGELIST"

svn cl $CHANGELIST_NAME --targets $COMMIT_CHANGELIST
