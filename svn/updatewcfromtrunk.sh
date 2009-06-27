#!/bin/bash

if [ -e $1 ] || [[ $location != */branches/* ]]; then
    echo "Usage (when you're in a branch): supwc STARTING_REVISION"
    echo "  supwc \`sbranchstart\` - to merge from the first revision of the branch"
    exit
else
    rev=$1
fi

location=`svn info | grep URL | sed 's/URL: //'`
project_base=`sed 's/\/branches.*//' <<<$location`

echo "will merge -r $rev:HEAD $project_base/trunk ."
svn merge -r $rev:HEAD $project_base/trunk .
