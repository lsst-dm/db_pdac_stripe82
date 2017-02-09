#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

CONFIG_DIR=`realpath $SCRIPTS/../config`
SQL_DIR=`realpath $SCRIPTS/../sql`
TMP_DIR=/tmp

echo
echo "Template substitutions:"
echo
echo "  \$OUTPUT_DB -> $OUTPUT_DB"
echo "  \$SQL_DIR   -> $SQL_DIR"
echo

files=$(cat <<EOT
common.cfg
common-non-part.cfg
css_RunDeepSource.params
css_RunDeepForcedSource.params
EOT
)

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
