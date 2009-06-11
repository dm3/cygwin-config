#!/bin/bash
if [ $# -ne 1 ]; then
    echo 'Usage: version NEW_VERSION'
    exit
else
    new_version=$1
fi
pattern="<version>[^<]*<\/version>"
substitute="<version>$new_version<\/version>"

# for each pom.xml in this and child directories
# from line 0 to the first line containing $pattern do s/$pattern/$substitute

# sed part could have been done with 'sed -i', which messes up VCS history (git sees the file as fully rewritten)
# mv seems to solve this problem
find . -name 'pom.xml' -exec bash -c "echo {} && grep -A2 -B2 '$pattern' {} | head -5 && echo 'version in 3rd line -> $new_version' && sed '0,/$pattern/s/$pattern/$substitute/' {} > '{}.new' && mv -f '{}.new' {}" \;
