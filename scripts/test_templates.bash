#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

# Uncomment this to enable debug printout from the environment
# setting seqeunce.
#
#VERBOSE=1

source $SCRIPTS/env.bash

CONFIG_DIR=`realpath $SCRIPTS/../config`
SQL_DIR=`realpath $SCRIPTS/../sql`

echo
echo "Template substitutions:"
echo
echo "  \$OUTPUT_DB -> $OUTPUT_DB"
echo "  \$SQL_DIR   -> $SQL_DIR"
echo

files="common.cfg common-non-part.cfg css_${OUTPUT_OBJECT_TABLE}.params css_${OUTPUT_SOURCE_TABLE}.params"

echo "Translating templates:"
echo
for f in $files; do
    f_tmpl=${CONFIG_DIR}/${f}.tmpl
    echo "  $f_tmpl"
    translate_template $f_tmpl $TMP_DIR/$f
done

echo
echo "Output:"
echo
for f in $files; do
    f_out=$TMP_DIR/$f
    echo "  $f_out"
done
echo
