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
