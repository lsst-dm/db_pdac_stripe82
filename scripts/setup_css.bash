#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env_qserv_stack.bash

assert_master

# Translate configuration templates

config_dir=`realpath $SCRIPTS/../config`

files="\
css_${OUTPUT_OBJECT_TABLE}.params \
css_${OUTPUT_SOURCE_TABLE}.params \
"

for f in $files; do
    f_tmpl=${config_dir}/${f}.tmpl
    translate_template $f_tmpl $TMP_DIR/$f
done

# Populate CSS for the new database

qserv-admin.py "CREATE DATABASE ${OUTPUT_DB} ${config_dir}/css.params;"
qserv-admin.py "CREATE TABLE ${OUTPUT_DB}.${OUTPUT_OBJECT_TABLE} ${TMP_DIR}/css_${OUTPUT_OBJECT_TABLE}.params;"
qserv-admin.py "CREATE TABLE ${OUTPUT_DB}.${OUTPUT_SOURCE_TABLE} ${TMP_DIR}/css_${OUTPUT_SOURCE_TABLE}.params;"

