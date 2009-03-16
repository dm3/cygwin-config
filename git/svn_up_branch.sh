#!/bin/bash
# The recommended git workflow is to create a branch for every new feature you
# work on. For your branches to be up to date you have to switch to your master
# branch, rebase with the svn repository, switch back to your branch and then
# rebase your branch with the master.

CURRENT=`git branch | grep '\*' | awk '{print $2}'`
if [[ ! "${CURRENT}" =~ master ]]; then
    status=`git checkout master | awk '{print $1}'`
    if [[ ! "${status}" =~ error ]]; then
        git svn rebase
        git checkout ${CURRENT}
        git rebase master
    fi
fi
