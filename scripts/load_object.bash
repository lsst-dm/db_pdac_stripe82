#!/bin/bash

set -e


SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

# Uncomment this to enable debug printout from the environment
# setting seqeunce.
#
#VERBOSE=1

source $SCRIPTS/env_qserv_stack.bash

CONFIG_DIR=`realpath $SCRIPTS/../config`
SQL_DIR=`realpath $SCRIPTS/../sql`

worker=`/usr/bin/hostname`

if [[ "$WORKERS" != *"$(hostname)"* ]]; then
    echo `basename $SCRIPT`": this script must be run on worker nodes: "${SSH_WORKERS}
    exit 1
fi

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Processing configuration templates at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

for file in common.cfg; do
    echo "${CONFIG_DIR}/${file}.tmpl -> $TMP_DIR/${file}"
    translate_template ${CONFIG_DIR}/${file}.tmpl $TMP_DIR/${file}
done

loader=`which qserv-data-loader.py`
opt_verbose="--verbose --verbose --verbose --verbose-all"
opt_conn="--host=${MASTER} --port=5012 --secret=${CONFIG_DIR}/wmgr.secret --no-css"
opt_config="--config=${TMP_DIR}/common.cfg --config=${CONFIG_DIR}/${OUTPUT_OBJECT_TABLE}.cfg"
opt_db_table_schema="${OUTPUT_DB} ${OUTPUT_OBJECT_TABLE} ${SQL_DIR}/${OUTPUT_OBJECT_TABLE}.sql"

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Begin loading at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

opt_data="--skip-partition --chunks-dir=${QSERV_DATA_DIR}/${OUTPUT_OBJECT_TABLE}/${worker}/"
loadercmd="${loader} ${opt_verbose} ${opt_conn} --worker=${worker} ${opt_config} ${opt_data} ${opt_db_table_schema}"

echo ${loadercmd}
# ${loadercmd}

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Finished loading **"

