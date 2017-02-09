Processing templates
====================

  The template files need do be preprocessed to replace placeholders
  for database names (etc.) as per the current configuration before using
  them by the corresponding tools. Here follow examples:

    OUTPUT_DB='sdss_stripe82_00'
    SQL_DIR='some/dir'

    cat common.cfg.tmpl \
      | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
      > common.cfg
      
    cat css_RunDeepSource.params.tmpl \
      | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
      | sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/' /
      > css_RunDeepSource.params
      
    cat css_RunDeepForcedSource.params.tmpl \
      |  sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/' \
      |  sed 's/\$SQL_DIR/'$(echo $SQL_DIR | sed 's/\//\\\//g')'/' \
      > css_RunDeepForcedSource.params
