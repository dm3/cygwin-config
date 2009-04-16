#!/bin/bash
lines=0

while read x; do
    let lines=$lines+$x
done < <(find . -type f -name '*.java' -exec wc -l {} \; | awk '{print $1}')
echo $lines
