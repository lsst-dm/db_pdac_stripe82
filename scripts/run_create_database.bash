#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

for node in $SSH_MASTER $SSH_WORKERS; do
    echo $node : creating database $OUTPUT_DB
    ssh -n $node "$SCRIPTS/create_database.bash" >& $LOG_DIR/${node}_create_database.log &
done
