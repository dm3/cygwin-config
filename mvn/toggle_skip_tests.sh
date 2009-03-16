#!/bin/bash
# toggles <skipTests>true</skipTests> <--> <!-- <skipTests>true</skipTests> -->

[[ -f pom.xml ]] && sed -i 's/<skipTests>true<\/skipTests>/<!-- <skipTests>true<\/skipTests> -->/' pom.xml
