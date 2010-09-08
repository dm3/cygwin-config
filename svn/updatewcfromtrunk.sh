#!/bin/bash

trunk_postfix='/src'
location=`svn info | grep URL | sed 's/URL: //'`

if [ -e $1 ] || [[ $location != */branches/* ]]; then
    echo "Usage (when you're in a branch): supwc STARTING_REVISION"
    echo "  supwc \`sbranchstart\` - to merge from the first revision of the branch"
    exit
else
    rev=$1
fi

project_base=`sed 's/\/branches.*//' <<<$location`
without_base=${location##"$project_base/branches/"}
# EIS specific! removes everything after the branch name
branch_name=`echo $without_base | sed 's/\(EISDEV-[0-9]\+\)\{1\}\(\/.*\)*/\1/'`
postfix=${without_base##"$branch_name"}
if [[ $postfix == $branch_name ]]; then
    postfix="" # we are in the root of the branch
fi

echo "will merge -r $rev:HEAD $project_base/trunk$trunk_postfix$postfix ."
svn merge -r $rev:HEAD $project_base/trunk$trunk_postfix$postfix .
