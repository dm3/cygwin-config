#!/bin/bash
MAXDEPTH=5
depth=0

function check() {
    currentdir=`pwd`
    filter=`expr match "$currentdir" '.*target.*'`

    (( depth= $depth + 1 ))
    if [ $depth -gt $MAXDEPTH ] || [ $filter -gt 0 ]; then
        cd ..
        (( depth= $depth - 1 ))
        return
    fi
    url=`getUrl`

    # truncate current directory
    if [ $depth -gt 1 ]; then
        thisdir="${1%\/}"
        thisdir="${thisdir#\.}"
        thisdir=".$thisdir"
    else
        thisdir=$1
    fi

    # url with BASE_LOCATION removed from its front
    thisurl=${url##$BASE_LOCATION}
    if [ ${#thisurl} -lt ${#url} ]; then
        echo "$1 is ok"
    else
        echo "$1 is on $url !"
    fi

    /bin/ls -d ./*/ | while read -r f; do
        (cd $f && check $f)
    done
}

function getUrl() {
    echo `svn info | grep URL | sed 's/URL: //'`
}

BASE_LOCATION=`getUrl`
echo "All subdirectories must be on $BASE_LOCATION"
check .
