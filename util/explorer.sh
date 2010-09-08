#!/bin/sh
WD=`pwd`
CURRENT=`cygpath -w $WD`
explorer $CURRENT
