#!/bin/bash

set -e

chunks="$1"

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

assert_worker

for chunk in `cat ${TMP_DIR}/chunks/${chunks}`;
do
    echo "Dumping triplets of chunk: ${chunk}"
    ${SCRIPTS}/dump_triplet_chunk.bash ${chunk} >& ${LOG_DIR}/dump_triplet.${chunk}.log
done

