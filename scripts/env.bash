#! /bin/bash

# Custom versions of the LSST Stack and the latest version of the Qserv
# management scripts.

BASE_STACK="/datasets/gapon/stack"
QSERV_PKG="/datasets/gapon/development/qserv"

# Qserv deployment parameters (adjust accordingly)

MYSQL_PASSWORD="CHANGEME"

MASTER="lsst-qserv-master01"
SSH_MASTER="qserv-master01"

WORKERS=`seq --format 'lsst-qserv-db%02.0f' 1 30`
SSH_WORKERS=`seq --format 'qserv-db%02.0f' 1 30`

# Source and destination databases

INPUT_DB="sdss_stripe82_00"
INPUT_OBJECT_TABLE="RunDeepSource"

OUTPUT_DB="sdss_stripe82_01"
OUTPUT_OBJECT_TABLE="$INPUT_OBJECT_TABLE"


QSERV_DATA_DIR="/datasets/gapon/production/stripe82_catalog_load/production_load"
QSERV_MYSQL_DIR="/qserv/data/mysql"
QSERV_DUMPS_DIR="/qserv/data/dumps/$OUTPUT_DB"

# The default location for the log files created on Qserv node

TMP_DIR="/tmp/$OUTPUT_DB"
LOG_DIR="$TMP_DIR/log"

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

# This function is similar to 'echo' except it will print
# an input message (all parameters) if the environment variable VERBOSE
# is present.

function debug {
    if [ ! -z ${VERBOSE} ]; then
        echo "$@"
    fi
}

# Verify if all folders exists for the current node on which
# the script is being run. Try creating the missing folders.

if [[ "$MASTER $WORKERS" == *"$(hostname)"* ]]; then

    # Make sure the script is being run under user 'qserv'

    if [ "$(whoami)" != "qserv" ]; then
        echo "env.bash: this script must be run by user 'qserv'"
        exit 1
    fi
    debug "env.bash: user 'qserv'"

    # Read-only access to these folders should be good enough

    for folder in "$QSERV_DATA_DIR" "$QSERV_MYSQL_DIR"; do

        if [ ! -d "$folder" ]; then
            echo "env.bash: directory '${folder}' doesn't exist or is not accessible"
            exit 1
        fi
        if [ ! -r "$folder" ]; then
            echo "env.bash: directory '${folder}' is not readable"
            exit 1
        fi
        debug "env.bash: access verified for '${folder}'"
    done

    # Check if a folder where MySQL file dumps and load would go
    # exists, and if it's not then create the one with wide open
    # permissions.

    if [ ! -d "$QSERV_DUMPS_DIR" ]; then

        mkdir -p      ${QSERV_DUMPS_DIR}
        chmod -R 0777 ${QSERV_DUMPS_DIR}

        debug "env.sh: created directory '${QSERV_DUMPS_DIR}'"
    fi
    if [ ! -w "$QSERV_DUMPS_DIR" ]; then
        echo "env.bash: directory '${QSERV_DUMPS_DIR}' is not writeable"
        exit 1
    fi
    debug "env.bash: access verified for '${QSERV_DUMPS_DIR}'"

    # Verify and create (if needed) if the temporary and log folders
    # exists and can be accessed for writing purposes by the current user.

    for folder in "$TMP_DIR" "$LOG_DIR"; do
        if [ ! -d "$folder" ]; then
            mkdir -p      "$folder"
            chmod -R 0777 "$folder"
            debug "env.sh: created directory '${folder}'"
        fi
        if [ ! -w "$folder" ]; then
            echo "env.bash: directory '${folder}' is not writeable"
            exit 1
        fi
        debug "env.bash: access verified for '${folder}'"
    done
fi

