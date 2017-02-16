#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

HELP="
DESCRIPTION:

  Create (or re-create) the database configured in the environment
  configuration file:

    `realpath $SCRIPTS/../config/env.bash`

  This operation will be performed simuyltaneously on all
  nodes (including MASTER) of the Qserv cluster.

USAGE:

  `basename $SCRIPT` [<options>]

OPTIONS:

  -D|--delete
      force database deletion before attempting to create
      the new one.

      ATTENTION: this will destroy any data which were
                  previously loaded into the database."

source $SCRIPTS/env.bash

assert_master

for node in $SSH_MASTER $SSH_WORKERS; do
    verbose $node : creating database $OUTPUT_DB
    ssh -n $node "$SCRIPTS/create_database.bash '$@'" >& $LOG_DIR/${node}_create_database.log &
done
