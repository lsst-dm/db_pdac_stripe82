#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

# Uncomment this to enable debug printout from the environment
# setting seqeunce.
#
#VERBOSE=1

source $SCRIPTS/env_qserv_stack.bash

config_dir=`realpath ${SCRIPTS}/../config`
sql_dir=`realpath ${SCRIPTS}/../sql`

worker=`/usr/bin/hostname`

if [[ "$WORKERS" != *"$worker"* ]]; then
    echo `basename $SCRIPT`": this script must be run on worker nodes: "${SSH_WORKERS}
    exit 1
fi

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Processing configuration templates at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

for file in common.cfg; do
    echo "${config_dir}/${file}.tmpl -> ${TMP_DIR}/${file}"
    translate_template ${config_dir}/${file}.tmpl ${TMP_DIR}/${file}
done

loader=`which qserv-data-loader.py`
opt_verbose="--verbose --verbose --verbose --verbose-all"
opt_conn="--host=${MASTER} --port=5012 --secret=${config_dir}/wmgr.secret --no-css"
opt_config="--config=${TMP_DIR}/common.cfg --config=${config_dir}/${OUTPUT_SOURCE_TABLE}.cfg"
opt_db_table_schema="${OUTPUT_DB} ${OUTPUT_SOURCE_TABLE} ${sql_dir}/${OUTPUT_SOURCE_TABLE}.sql"
worker_data_dir="${QSERV_DATA_DIR}/${OUTPUT_SOURCE_TABLE}/${worker}"

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Begin loading at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

for folder in `ls ${worker_data_dir}`; do

    echo "["`date`"] ** Loading folder: ${folder} **"
    echo "------------------------------------------------------------------------------------"

    opt_data="--skip-partition --chunks-dir=${worker_data_dir}/${folder}/"
    loadercmd="${loader} ${opt_verbose} ${opt_conn} --worker=${worker} ${opt_config} ${opt_data} ${opt_db_table_schema}"

    echo ${loadercmd}
    #${loadercmd}
    echo "------------------------------------------------------------------------------------"
done
echo "["`date`"] ** Finished loading **"
