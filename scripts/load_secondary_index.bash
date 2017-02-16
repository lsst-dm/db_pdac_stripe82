#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env_base_stack.bash

assert_master

# Create the secondary index table similarily to the one which should
# already exist in the cluster.

input_index="qservMeta.${INPUT_DB}__${OUTPUT_OBJECT_TABLE}"
output_index="qservMeta.${OUTPUT_DB}__${OUTPUT_OBJECT_TABLE}"

verbose "creating secondary index table '${output_index}"
$mysql_cmd -e "CREATE TABLE IF NOT EXISTS ${output_index} LIKE ${input_index}"

# Load TSV files harvested from the worker nodes into the table

cd $QSERV_DUMPS_DIR

verbose "total of `ls -1 | grep .tsv | wc -l` index file will be loaded"

for f in `ls -1 | grep .tsv`; do
  verbose "loading triplest from file: ${f}"
  $mysql_cmd -e "LOAD DATA INFILE '$QSERV_DUMPS_DIR/$f' INTO TABLE ${output_index}" >& $LOG_DIR/load_${f}.log
done
