#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env_base_stack.bash

# Make sure we're at the right host

if [ $SSH_MASTER != `/usr/bin/hostname` ]; then
    echo `basename $SCRIPT` : this script must be run on node $SSH_MASTER
    exit 1
fi

# Create the secondary index table similarily to the one which should
# already exist in the cluster.

$mysql_cmd -e "CREATE TABLE qservMeta.${OUTPUT_DB}__${OUTPUT_OBJECT_TABLE} LIKE qservMeta.${INPUT_DB}__${OUTPUT_OBJECT_TABLE}"

# Load TSV files harvested from the worker nodes into the table

mkdir -p $MASTER_LOG_DIR

cd $QSERV_DUMPS_DIR
for f in `ls -1 *.tsv`; do
  echo "Loading: ${f}"
  $mysql_cmd -e "LOAD DATA INFILE '$QSERV_DUMPS_DIR/$f' INTO TABLE qservMeta.${OUTPUT_DB}__${OUTPUT_OBJECT_TABLE}" >& $LOG_DIR/load_${f}.log
done
