#! /bin/bash

# Custom versions of the LSST Stack and the latest version of the Qserv
# management scripts.

BASE_STACK='/datasets/gapon/stack/'
QSERV_PKG='/datasets/gapon/development/qserv'

# Qserv deployment parameters (adjust accordingly)

MYSQL_PASSWORD='CHANGEME'

MASTER='lsst-qserv-master01'
SSH_MASTER='qserv-master01'

WORKERS=`seq --format 'lsst-qserv-db%2.0f' 1 30`
SSH_WORKERS=`seq --format 'qserv-db%2.0f' 1 30`

QSERV_DATA_DIR='/datasets/gapon/production/stripe82_catalog_load/production_load'
QSERV_MYSQL_DIR='/qserv/data/mysql'
QSERV_DUMPS_DIR='/qserv/data/dumps'

# Source and destination databases

OUTPUT_DB='sdss_stripe82_01'

# Shortcuts

mysql_cmd="mysql -B -N -A -S ${QSERV_MYSQL_DIR}/mysql.sock -h localhost -P13306 -uroot -p${MYSQL_PASSWORD}"
mysqldump_cmd="mysqldump  -S ${QSERV_MYSQL_DIR}/mysql.sock -h localhost -P13306 -uroot -p${MYSQL_PASSWORD}"

# Translate the specified template file and print the result
# into the specified file.
#
# Usage: [<file_tmpl> [<file_out>]]
#
# Parameters:
#   <file_tmpl> - the input file to be translated. The input will be read from
#                 the standard input if no input file provided.
#
#   <file_out>  - the output file. The output will be written into
#                 the standard output stream if no output file provided.
#
# It's also acceptable to use symbol '-' as any file name to indicate
# the standard input (and output if needed).

function translate_template {
    this_path="$0"
    if [ $this_path == "bash" ]; then
        echo "env.bash: function translate_template() can't be called from an interactive shell"
        exit 1
    fi
    this_dir=`dirname $this_path`
    sql_dir=`realpath $this_dir/../sql`

    file_tmpl="-"
    if [ "$#" -gt 0 ]; then
        file_tmpl="$1"
    fi
    file_out="-"
    if [ "$#" -gt 1 ]; then
        file_out="$2"
    fi
    if [ "$file_out" == "-" ]; then
        cat $file_tmpl \
            | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
            | sed 's/\$SQL_DIR/'$(echo $sql_dir | sed 's/\//\\\//g')'/'
    else
        cat $file_tmpl \
            | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
            | sed 's/\$SQL_DIR/'$(echo $sql_dir | sed 's/\//\\\//g')'/' \
            > $file_out
    fi
}
