#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

for node in $SSH_WORKERS; do
    echo $node : loading source table $OUTPUT_SOURCE_TABLE into $OUTPUT_DB
    ssh -n $node "$SCRIPTS/load_source.bash" >& $LOG_DIR/${node}_load_source.log&
done
