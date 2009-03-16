#!/bin/bash
if [ $# -ne 5 ]; then
    echo "Usage: install_file GROUPID ARTIFACTID VERSION PACKAGING FILE"
else
    if [[ -f $5 ]]; then
        mvn install:install-file -DgroupId=$1 -DartifactId=$2 -Dversion=$3 -Dpackaging=$4 -Dfile=$5
    else
        echo "Please specify a valid file"
    fi
fi
