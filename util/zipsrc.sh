#!/bin/bash
# Excludes do not work neither in string form "*.some *.other", nor in array ("*.a" "*.b"), nor in escaped "\*.a \*.b".
# It seems that only the first exclude of the bunch of excludes works properly.

# DEFAULT_EXCLUDES=("\*/.git/\*" "\*.gitignore") #
if [ $# -lt 1 ]; then
    echo "Usage: zipsrc DIR [EXCLUDE_LIST]"
else
    DIR=$1
    ZIP=$1
    # if [ $# -lt 2 ]; then
    #     EXCLUDES=${DEFAULT_EXCLUDES[@]}
    # else
    #     EXCLUDES=$2
    # fi
    zip -r "$DIR" "$ZIP" -x "*/.git/*" "*/.settings/*" "*/target/*" "*.gitignore" "*.project" "*.classpath" "*.springBeans"
fi
