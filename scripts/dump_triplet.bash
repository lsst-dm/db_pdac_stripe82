#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

assert_worker

$SCRIPTS/get_chunk_numbers.bash "$@"

cd $TMP_DIR/chunks
for chunks in `ls -1 chunks_*`; do
    verbose "Dumping triplets of chunks: ${chunks} (async)"
    $SCRIPTS/dump_triplet_chunks.bash $chunks "$@" >& $LOG_DIR/dump_triplet_chunks.${chunks}.log&
done
