#!/bin/bash
#from http://github.com/jdallien/svn_scripts/blob/99dba1c7f198ec00dd16bcbaa1263e133a476dfd/svn_wc2b

#if [ $# -ne 1]; then
#    branch_name=my_working_copy
#else
#    branch_name=$1
#fi
branch_name=my_working_copy

trunk_url=`svn info | grep URL | sed 's/URL: //'`
project_base=`svn info | grep URL | sed 's/URL: //;s/\/trunk.*//'`

svn cp $trunk_url $project_base/branches/$branch_name -m "Creating temporary branch for working copy."
svn switch $project_base/branches/$branch_name
