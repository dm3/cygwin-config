#!/bin/sh
SVN_SYNC_TAG='svn-sync'
#LAST_SYNC_REV=$(hg log --style=compact -b default | grep "\[$SVN_SYNC_TAG*\]" | head -n1 | awk -F':' '{print $1}' | sed 's/\[.*\]//')

LAST_SYNC_REV=$(hg tags | grep $SVN_SYNC_TAG | awk '{print $2}' | awk -F':' '{print $1}')
if [[ -e $LAST_SYNC_REV ]]; then
    echo "Last SVN sync revision not found. Expected an $SVN_SYNC_TAG tag!"
fi
TO_BE_SYNCED_REVS=$(hg log -r $LAST_SYNC_REV..tip -b default -q | awk -F':' '{print $1}')
for rev in $TO_BE_SYNCED_REVS; do
    # skip the $LAST_SYNC_REV
    if [[ $rev -ne $LAST_SYNC_REV ]]; then
        echo "Exporting -r $rev to $rev.patch..."
        hg export -r $rev > $rev.patch
    fi
done
