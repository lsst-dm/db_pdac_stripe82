#!/bin/bash

set -e

SCRIPT=`realpath $0`
SCRIPTS=`dirname $SCRIPT`

source $SCRIPTS/env.bash

CONFIG_DIR=`realpath $SCRIPTS/../config`
SQL_DIR=`realpath $SCRIPTS/../sql`
TMP_DIR=/tmp

echo $SQL_DIR

echo "$CONFIG_DIR/common.cfg.tmpl -> $TMP_DIR/common.cfg"
cat $CONFIG_DIR/common.cfg.tmpl \
  | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
  > $TMP_DIR/common.cfg

echo "$CONFIG_DIR/common-non-part.cfg.tmpl -> $TMP_DIR/common-non-part.cfg"
cat $CONFIG_DIR/common-non-part.cfg.tmpl \
  | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
  > $TMP_DIR/common-non-part.cfg

echo "$CONFIG_DIR/css_RunDeepSource.params.tmpl -> $TMP_DIR/css_RunDeepSource.params"
cat $CONFIG_DIR/css_RunDeepSource.params.tmpl \
  | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
  | sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/' \
  > $TMP_DIR/css_RunDeepSource.params

echo "$CONFIG_DIR/css_RunDeepForcedSource.params.tmpl -> $TMP_DIR/css_RunDeepForcedSource.params"
cat $CONFIG_DIR/css_RunDeepForcedSource.params.tmpl \
  |  sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
  |  sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/' \
  > $TMP_DIR/css_RunDeepForcedSource.params
