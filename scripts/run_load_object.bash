#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

for node in $SSH_WORKERS; do
    echo $node : loading object table $OUTPUT_OBJECT_TABLE into $OUTPUT_DB
    ssh -n $node "$SCRIPTS/load_object.bash" >& $LOG_DIR/${node}_load_object.log&
done
