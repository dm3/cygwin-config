#!/bin/bash
# After making sure your branch is up to date you’ll want to merge your branch
# with the master and then push your changes to the svn repository

CURRENT=`git branch | grep '\*' | awk '{print $2}'`
if [[ ! "${CURRENT}" =~ master ]]; then
    git rebase -i master
    status=`git checkout master | awk '{print $1}'`
    if [[ ! "${status}" =~ error ]]; then
        git merge ${CURRENT}
        git svn dcommit
    fi
    git checkout ${CURRENT}
fi
