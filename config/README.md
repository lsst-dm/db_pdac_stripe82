The template files need do be preprocessed to replace placeholders
for database names (etc.) as per the current configuration:

  .. code-block:: bash

    OUTPUT_DB='sdss_stripe82_00'
    cat common.cfg.tmpl  | sed 's/\$OUTPUT_DB/'${OUTPUT_DB}'/'
    unset OUTPUT_DB


