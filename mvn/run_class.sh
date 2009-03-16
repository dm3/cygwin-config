#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: cmd CLASS"
else
    mvn exec:java -Dexec.mainClass=$1
fi
