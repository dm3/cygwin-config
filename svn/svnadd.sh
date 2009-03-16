#!/bin/bash
svn st | grep ^\? | tr ^\? ' '| sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add
