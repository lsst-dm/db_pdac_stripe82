#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

assert_master

for node in $SSH_MASTER $SSH_WORKERS; do
    verbose $node : creating database $OUTPUT_DB
    ssh -n $node "$SCRIPTS/create_database.bash '$@'" >& $LOG_DIR/${node}_create_database.log &
done
