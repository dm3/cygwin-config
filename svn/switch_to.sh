#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: switch_to PATH_RELATIVE_TO_BASE"
    echo "       switch_to branches/my_branch"
    echo "       switch_to trunk"
    exit
fi

switch_to=$1
project_base=`svn info | grep URL | sed 's/URL: //;s/\/trunk.*//;s/\/branches.*//;s/\/tags.*//'`
echo "switching to $project_base/$switch_to"

svn switch $project_base/$switch_to

