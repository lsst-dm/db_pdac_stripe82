#!/bin/bash

# Source database (if any) is used as a model to simplify certain
# configuration steps.
#
# TODO: Get rid of this and rafactor tools to make
#       the loading & configuration process completely
#       independent of any pre-exiating databases.

INPUT_DB="sdss_stripe82_00"

# Output database and tables

OUTPUT_DB="sdss_stripe82_01"
OUTPUT_OBJECT_TABLE="RunDeepSource"
OUTPUT_SOURCE_TABLE="RunDeepForcedSource"
OUTPUT_NONPART_TABLES="ZZZ_Db_Description LeapSeconds Filter Science_Ccd_Exposure Science_Ccd_Exposure_Metadata Science_Ccd_Exposure_To_Htm10 DeepCoadd DeepCoadd_Metadata DeepCoadd_To_Htm10 Science_Ccd_Exposure_NoFile"

# Data to be loaed into new database

INPUT_DATA_DIR="/datasets/gapon/production/stripe82_catalog_load/production_load"


