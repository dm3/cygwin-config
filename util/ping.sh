#!/bin/bash
# courtesy of http://dev.kanngard.net/Permalinks/ID_20021101005519.html

source "$MY_SCRIPTS/bash/scaffolding.sh"

# timeout in seconds
TIMEOUT=2
OUTPUT=/tmp/ping.log
ADDRESS=127.0.0.1

# --------------- BEGIN PARAMETERS
while getopts ":t :o :a:" opt; do
  case $opt in
    o)
      OUTPUT=$OPTIND
      ;;
    a)
      ADDRESS=$OPTARG
      ;;
    t)
      TIMEOUT=$OPTIND
      ;;
    \?)
      my_printout "Usage: ping [-d] -a ADDRESS [-t TIMEOUT (default = 2sec)] [-o OUTPUT FILE (default = /ping.log)]"
      exit 1
      ;;
    :)
      requires_arg
      ;;
  esac
done
# --------------- END PARAMETERS

echo "Pinging [$ADDRESS] with $TIMEOUT second timeout..." > $OUTPUT #clear file
while sleep $TIMEOUT
do
        now >> $OUTPUT
	echo ' ' >> $OUTPUT
	ping $ADDRESS -n 1 | awk '/from/' >> $OUTPUT
done
