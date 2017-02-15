#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

# Uncomment this to enable debug printout from the environment
# setting seqeunce.
#
#VERBOSE=1

source $SCRIPTS/env_qserv_stack.bash

assert_worker

config_dir=`realpath $SCRIPTS/../config`
sql_dir=`realpath $SCRIPTS/../sql`

worker=`/usr/bin/hostname`

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Processing configuration templates at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

for file in common-non-part.cfg; do
    echo "${config_dir}/${file}.tmpl -> $TMP_DIR/${file}"
    translate_template ${config_dir}/${file}.tmpl $TMP_DIR/${file}
done

loader=`which qserv-data-loader.py`
opt_verbose="--verbose --verbose --verbose --verbose-all"
opt_conn="--host=${MASTER} --port=5012 --secret=${config_dir}/wmgr.secret --no-css"
opt_config="--config=${TMP_DIR}/common-non-part.cfg"

echo "------------------------------------------------------------------------------------"
echo "["`date`"] ** Begin loading at worker: ${worker} **"
echo "------------------------------------------------------------------------------------"

for table in ${OUTPUT_NONPART_TABLES}; do

    echo "["`date`"] ** Loading table: ${table} **"
    echo "------------------------------------------------------------------------------------"

    opt_schema="${sql_dir}/${table}.sql"
    opt_data="${QSERV_DATA_DIR}/non-part/${table}.txt"
    loadercmd="${loader} ${opt_verbose} ${opt_conn} --worker=${worker} ${opt_config} ${OUTPUT_DB} ${table} ${opt_schema} ${opt_data}"

    echo ${loadercmd}
    #${loadercmd}
    echo "------------------------------------------------------------------------------------"
done
echo "["`date`"] ** Finished loading **"

