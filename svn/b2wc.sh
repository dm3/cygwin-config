#!/bin/bash
# svn_b2wc (branch to working copy)

branch_revision=`svn log -q --stop-on-copy | grep '^r[0-9]' | sed 's/^r//;s/ |.*//' | tail -n 1`

if [ -e $branch_revision ] && [ -e $1 ]
then
  echo "Couldn't get branch creation revision number. Check svn log --stop-on-copy and use svn_b2wc <revision_number>"
  exit
elif [ -e $branch_revision ]
then
  branch_revision=$1
fi

branch_url=`svn info | grep URL | sed 's/URL: //'`
project_base=`svn info | grep URL | sed 's/URL: //;s/\/branches.*//'`
branch_name=my_working_copy

svn switch $project_base/trunk
svn merge -r $branch_revision:HEAD $branch_url .
svn delete $branch_url -m "Deleting working copy branch."
