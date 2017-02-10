#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

mkdir -p $WORKER_LOG_DIR

for node in $SSH_WORKERS; do
    echo $node : enabling $OUTPUT_DB
    ssh -n $node "$SCRIPTS/qserv_enable_database.bash >& $WORKER_LOG_DIR/qserv_enable_database.log" &
done
