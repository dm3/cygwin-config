#!/bin/bash
# ls-files lists modified and untracked files
git ls-files --modified --others | grep $1 | xargs git add
