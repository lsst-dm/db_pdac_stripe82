#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

for node in $SSH_WORKERS; do
    echo $node : loading non-partitionable tables $OUTPUT_NONPART_TABLES into $OUTPUT_DB
    ssh -n $node "$SCRIPTS/load_nonpart.bash" >& $LOG_DIR/${node}_load_nonpart.log&
done
