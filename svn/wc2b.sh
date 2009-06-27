#!/bin/bash
#from http://github.com/jdallien/svn_scripts/blob/99dba1c7f198ec00dd16bcbaa1263e133a476dfd/svn_wc2b

if [ -e $1 ]; then
    branch_name=my_working_copy
else
    branch_name=$1
fi

location=`svn info | grep URL | sed 's/URL: //'`
project_base=`sed 's/\/trunk.*//;s/\/branches.*//;s/\/tags.*//' <<<$location`

echo "copying $location to $branch_name"
svn cp $location $project_base/branches/$branch_name -m "creating temporary branch for working copy."
echo "switching to $branch_name"
svn switch $project_base/branches/$branch_name
