Processing templates
====================

  The template files need do be preprocessed to replace placeholders
  for database names (etc.) as per the current configuration:

    OUTPUT_DB='sdss_stripe82_00'
    SQL_DIR='some/dir'

    cat common.cfg.tmpl  | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/'
    cat css_RunDeepSource.params.tmpl        | \
         sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' | \
         sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/'
    cat css_RunDeepForcedSource.params.tmpl  | \
         sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' | \
         sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/'
