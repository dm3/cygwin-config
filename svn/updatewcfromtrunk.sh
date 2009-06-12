#!/bin/bash

location=`svn info | grep URL`
project_base=`sed 's/URL: //;s/\/branches.*//' <<<$location`

if [ -e $1 ] || [[ $location != */branches/* ]]; then
    echo "Usage (when you're in a branch): supwc STARTING_REVISION"
    echo "  supwc \`sbranchstart\` - to merge from the first revision of the branch"
    exit
else
    rev=$1
fi

echo "will merge -r $rev:HEAD $project_base/trunk ."
svn merge -r $rev:HEAD $project_base/trunk .
