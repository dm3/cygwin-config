#!/bin/bash
# list only directories
/bin/ls -d */ | while read -r f; do
	( echo "updating $f" && cd "$f" && svn up )
done
