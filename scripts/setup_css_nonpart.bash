#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env_qserv_stack.bash

assert_master

config_dir=`realpath $SCRIPTS/../config`

# Populate CSS for the non-partitioned tables provided the database
# is already registered in CSS.

database_is_registered=
for db in `qserv-admin.py "SHOW DATABASES;"`; do
    if [ "$db" == "$OUTPUT_DB" ]; then
        database_is_registered=1
    fi
done
if [ -z $database_is_registered ]; then
    echo `basename $SCRIPT`": database ${OUTPUT_DB} is not registered in CSS"
    exit 1
fi

# Populate CSS only for those tables which are registered
# for this dataset.
 
for table in $OUTPUT_NONPART_TABLES; do

    verbose `basename $SCRIPT`": configuring CSS for table ${OUTPUT_DB}.${table}"

    # Translate configuration template

    translate_template ${config_dir}/css_${table}.params.tmpl $LOCAL_TMP_DIR/css_${table}.params

    if [ -z "$(test_flag '-n|--dry-run')" ]; then
        qserv-admin.py "CREATE TABLE ${OUTPUT_DB}.${table} ${LOCAL_TMP_DIR}/css_${table}.params;"
    else
        echo qserv-admin.py "CREATE TABLE ${OUTPUT_DB}.${table} ${LOCAL_TMP_DIR}/css_${table}.params;"
    fi
done

