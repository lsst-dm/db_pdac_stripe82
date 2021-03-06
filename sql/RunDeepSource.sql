CREATE TABLE `RunDeepSource` (
    `id` bigint(20) NOT NULL,
        -- <descr>Primary key (unique identifier).</descr>
        -- <ucd>meta.id;src</ucd>
    `coord_ra` double DEFAULT NULL,
        -- <descr>ICRS RA of source centroid (x, y).</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `coord_decl` double DEFAULT NULL,
        -- <descr>ICRS Dec of source centroid (x, y).</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `coord_htmId20` bigint(20) DEFAULT NULL,
        -- <descr>Level 20 HTM ID of (ra, decl)</descr>
        -- <ucd>pos.HTM</ucd>
    `parent` bigint(20) DEFAULT NULL,
        -- <descr>SDSS parentID</descr>
    `calib_detected` bit(1) NOT NULL,
    `flags_negative` bit(1) NOT NULL,
    `deblend_nchild` int(11) NOT NULL,
        -- <descr>Number of children that this source has. Zero if it's the final deblending product.</desc>
    `deblend_deblended_as_psf` bit(1) NOT NULL,
    `deblend_psf_center_x` double DEFAULT NULL,
    `deblend_psf_center_y` double DEFAULT NULL,
    `deblend_psf_flux` double DEFAULT NULL,
        -- <descr>Deblended PSF flux of source.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `deblend_too_many_peaks` bit(1) NOT NULL,
    `deblend_failed` bit(1) NOT NULL,
    `flags_badcentroid` bit(1) NOT NULL,
    `centroid_sdss_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
    `centroid_sdss_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
    `centroid_sdss_xVar` float DEFAULT NULL,
        -- <descr>Variance of x.</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
    `centroid_sdss_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
    `centroid_sdss_yVar` float DEFAULT NULL,
        -- <descr>Variance of y.</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
    `centroid_sdss_flags` bit(1) NOT NULL,
        -- <ucd>meta.code.error</ucd>
    `centroid_gaussian_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
    `centroid_gaussian_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
    `centroid_gaussian_xVar` float DEFAULT NULL,
        -- <descr>Variance of x.</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
    `centroid_gaussian_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>  
    `centroid_gaussian_yVar` float DEFAULT NULL,
        -- <descr>Variance of y.</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>  
    `centroid_gaussian_flags` bit(1) NOT NULL,
        -- <ucd>meta.code.error</ucd>
    `centroid_naive_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
    `centroid_naive_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of source centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>  
    `centroid_naive_xVar` float DEFAULT NULL,
        -- <descr>Variance of x.</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>  
    `centroid_naive_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>  
    `centroid_naive_yVar` float DEFAULT NULL,
        -- <descr>Variance of y.</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>  
    `centroid_naive_flags` bit(1) NOT NULL,
        -- <ucd>meta.code.error</ucd>
    `flags_pixel_edge` bit(1) NOT NULL,
    `flags_pixel_interpolated_any` bit(1) NOT NULL,
    `flags_pixel_interpolated_center` bit(1) NOT NULL,
    `flags_pixel_saturated_any` bit(1) NOT NULL,
    `flags_pixel_saturated_center` bit(1) NOT NULL,
    `flags_pixel_cr_any` bit(1) NOT NULL,
    `flags_pixel_cr_center` bit(1) NOT NULL,
    `flags_pixel_bad` bit(1) NOT NULL,
    `shape_sdss_Ixx` double DEFAULT NULL,
        -- <descr>Second moment.</descr>
        -- <unit>pixel^2</unit>
    `shape_sdss_Iyy` double DEFAULT NULL,
        -- <descr>Second moment.</descr>
        -- <unit>pixel^2</unit>
    `shape_sdss_Ixy` double DEFAULT NULL,
        -- <descr>Second moment.</descr>
        -- <unit>pixel^2</unit>
    `shape_sdss_IxxVar` float DEFAULT NULL,
        -- <descr>Variance of shapeIxx.</descr>
        -- <ucd>stat.variance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_IxxIyyCov` float DEFAULT NULL,
        -- <descr>Covariance of shapeIxx and shapeIyy.</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_IxxIxyCov` float DEFAULT NULL,
        -- <descr>Covariance of shapeIxx and shapeIxy.</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_IyyVar` float DEFAULT NULL,
        -- <descr>Variance of shapeIyy.</descr>
        -- <ucd>stat.variance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_IyyIxyCov` float DEFAULT NULL,
        -- <descr>Covariance of shapeIyy and shapeIxy.</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_IxyVar` float DEFAULT NULL,
        -- <descr>Variance of shapeIxy.</descr>
        -- <ucd>stat.variance</ucd>
        -- <unit>pixel^4</unit>
    `shape_sdss_flags` bit(1) NOT NULL,
        -- <descr>set if SDSS shape measurement is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
    `shape_sdss_centroid_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of source shape centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
    `shape_sdss_centroid_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of source shape centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
    `shape_sdss_centroid_xVar` float DEFAULT NULL,
        -- <descr>Variance of x. of source shape centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
    `shape_sdss_centroid_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y of source shape centroid</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
    `shape_sdss_centroid_yVar` float DEFAULT NULL,
        -- <descr>Variance of y. source naive centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
    `shape_sdss_centroid_flags` bit(1) NOT NULL,
        -- <descr>set if centroid measured by SDSS shape algorithm is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
    `shape_sdss_flags_unweightedbad` bit(1) NOT NULL,
        -- <ucd>meta.code</ucd>
    `shape_sdss_flags_unweighted` bit(1) NOT NULL,
        -- <ucd>meta.code</ucd>
    `shape_sdss_flags_shift` bit(1) NOT NULL,
        -- <ucd>meta.code</ucd>
    `shape_sdss_flags_maxiter` bit(1) NOT NULL,
        -- <ucd>meta.code</ucd>
    `flux_gaussian` double DEFAULT NULL,
        -- <descr>Gaussian flux of source.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_gaussian_err` double DEFAULT NULL,
        -- <descr>Uncertainty of gaussian flux.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_gaussian_flags` bit(1) NOT NULL,
        -- <ucd>meta.code</ucd>
    `flux_gaussian_psffactor` float DEFAULT NULL,
    `flux_gaussian_flags_psffactor` bit(1) NOT NULL,
    `flux_naive` double DEFAULT NULL,
        -- <descr>Uncalibrated naive flux.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_naive_err` double DEFAULT NULL,
        -- <descr>Uncertainty of flux_naive.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_naive_flags` bit(1) NOT NULL,
    `flux_psf` double DEFAULT NULL,
        -- <descr>Uncalibrated PSF flux.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_psf_err` double DEFAULT NULL,
        -- <descr>Uncertainty of flux_psf.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_psf_flags` bit(1) NOT NULL,
    `flux_psf_psffactor` float DEFAULT NULL,
    `flux_psf_flags_psffactor` bit(1) NOT NULL,
    `flux_sinc` double DEFAULT NULL,
        -- <descr>Uncalibrated sinc flux.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_sinc_err` double DEFAULT NULL,
        -- <descr>Uncertainty of flux_sinc.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
    `flux_sinc_flags` bit(1) NOT NULL,
    `multishapelet_psf_inner_1` float DEFAULT NULL,
    `multishapelet_psf_outer_1` float DEFAULT NULL,
    `multishapelet_psf_ellipse_Ixx` float DEFAULT NULL,
    `multishapelet_psf_ellipse_Iyy` float DEFAULT NULL,
    `multishapelet_psf_ellipse_Ixy` float DEFAULT NULL,
    `multishapelet_psf_chisq` float DEFAULT NULL,
    `multishapelet_psf_integral` float DEFAULT NULL,
    `multishapelet_psf_flags` bit(1) NOT NULL,
        -- <descr>The multishapelet PSF fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_psf_flags_maxiter` bit(1) NOT NULL,
        -- <descr>Set if the optimizer ran into the maximum number of iterations limit for the multishapelet PSF fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_psf_flags_tinystep` bit(1) NOT NULL,
        -- <descr>Set if the optimizer step or trust region got so small no progress could be made for the multishapelet PSF fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_psf_flags_constraint_r` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the minimum allowed by the constraint (not a failure) for the multishapelet PSF fit.</descr>
        -- <ucd>meta.code</ucd>
    `multishapelet_psf_flags_constraint_q` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the maximum allowed by the constraint for the multishapelet PSF fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_flux` double DEFAULT NULL,
        -- <descr>Uncalibrated flux from the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <units>adu</units>
    `multishapelet_dev_flux_err` double DEFAULT NULL,
        -- <descr>Uncertainty of multishapelet_dev_flux.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
    `multishapelet_dev_flux_flags` bit(1) NOT NULL,
        -- <descr>Flux from the multishapelet de Vaucouleur fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_psffactor` float DEFAULT NULL,
        -- <descr>PSF factor for the multishapelet de Vaucouleur fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_flags_psffactor` bit(1) NOT NULL,
        -- <descr>PSF factor for the multishapelet de Vaucouleur fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_ellipse_Ixx` double DEFAULT NULL,
        -- <descr>Ellipse xx moment for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_ellipse_Iyy` double DEFAULT NULL,
        -- <descr>Ellipse yy moment for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_ellipse_Ixy` double DEFAULT NULL,
        -- <descr>Ellipse xy moment for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_psffactor_ellipse_Ixx` double DEFAULT NULL,
        -- <descr>Ellipse xx moment for the PSF factor for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_psffactor_ellipse_Iyy` double DEFAULT NULL,
        -- <descr>Ellipse yy moment for the PSF factor for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_psffactor_ellipse_Ixy` double DEFAULT NULL,
        -- <descr>Ellipse xy moment for the PSF factor for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_chisq` float DEFAULT NULL,
        -- <descr>Reduced chi-square for the multishapelet de Vaucouleur fit.</descr>
    `multishapelet_dev_flags_maxiter` bit(1) NOT NULL,
        -- <descr>Set if the optimizer ran into the maximum number of iterations limit for the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_flags_tinystep` bit(1) NOT NULL,
        -- <descr>Set if the optimizer step or trust region got so small no progress could be made for the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_flags_constraint_r` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the minimum allowed by the constraint (not a failure) for the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>meta.code</ucd>
    `multishapelet_dev_flags_constraint_q` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the maximum allowed by the constraint for the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_dev_flags_largearea` bit(1) NOT NULL,
        -- <descr>Set if the best-fit half-light ellipse area is larger than the number of pixels used for the multishapelet de Vaucouleur fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_flux` double DEFAULT NULL,
        -- <descr>Uncalibrated flux from the multishapelet exponential fit.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <units>adu</units>
    `multishapelet_exp_flux_err` double DEFAULT NULL,
        -- <descr>Uncertainty of multishapelet_exp_flux.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <units>adu</units>
    `multishapelet_exp_flux_flags` bit(1) NOT NULL,
        -- <descr>Flux from the multishapelet exponential fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_psffactor` float DEFAULT NULL,
        -- <descr>PSF factor for the multishapelet exponential fit.</descr>
    `multishapelet_exp_flags_psffactor` bit(1) NOT NULL,
        -- <descr>PSF factor for the multishapelet combo fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_ellipse_Ixx` double DEFAULT NULL,
        -- <descr>Ellipse xx moment for the multishapelet exponential fit.</descr>
    `multishapelet_exp_ellipse_Iyy` double DEFAULT NULL,
        -- <descr>Ellipse yy moment for the multishapelet exponential fit.</descr>
    `multishapelet_exp_ellipse_Ixy` double DEFAULT NULL,
        -- <descr>Ellipse xy moment for the multishapelet exponential fit.</descr>
    `multishapelet_exp_psffactor_ellipse_Ixx` double DEFAULT NULL,
        -- <descr>Ellipse xx moment for the PSF factor for the multishapelet exponential fit.</descr>
    `multishapelet_exp_psffactor_ellipse_Iyy` double DEFAULT NULL,
        -- <descr>Ellipse yy moment for the PSF factor for the multishapelet exponential fit.</descr>
    `multishapelet_exp_psffactor_ellipse_Ixy` double DEFAULT NULL,
        -- <descr>Ellipse xy moment for the PSF factor for the multishapelet exponential fit.</descr>
    `multishapelet_exp_chisq` float DEFAULT NULL,
        -- <descr>Reduced chi-square for the multishapelet exponential fit.</descr>
    `multishapelet_exp_flags_maxiter` bit(1) NOT NULL,
        -- <descr>Set if the optimizer ran into the maximum number of iterations limit for the multishapelet exponential fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_flags_tinystep` bit(1) NOT NULL,
        -- <descr>Set if the optimizer step or trust region got so small no progress could be made for the multishapelet exponential fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_flags_constraint_r` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the minimum allowed by the constraint (not a failure) for the multishapelet exponential fit.</descr>
        -- <ucd>meta.code</ucd>
    `multishapelet_exp_flags_constraint_q` bit(1) NOT NULL,
        -- <descr>Set if the best-fit ellipticity was the maximum allowed by the constraint for the multishapelet exponential fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_exp_flags_largearea` bit(1) NOT NULL,
        -- <descr>Set if the best-fit half-light ellipse area is larger than the number of pixels used for the multishapelet exponential fit.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_combo_flux` double DEFAULT NULL,
        -- <descr>Uncalibrated flux from the multishapelet combo fit.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <units>adu</units>
    `multishapelet_combo_flux_err` double DEFAULT NULL,
        -- <descr>Uncertainty of multishapelet_combo_flux.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <units>adu</units>
    `multishapelet_combo_flux_flags` bit(1) NOT NULL,
        -- <descr>Flux from the multishapelet combo fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_combo_psffactor` float DEFAULT NULL,
        -- <descr>PSF factor for the multishapelet combo fit.</descr>
    `multishapelet_combo_flags_psffactor` bit(1) NOT NULL,
        -- <descr>PSF factor for the multishapelet combo fit is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `multishapelet_combo_components_1` float DEFAULT NULL,
        -- <descr>Component 1 coefficient for the multishapelet combo fit.</descr>
    `multishapelet_combo_components_2` float DEFAULT NULL,
        -- <descr>Component 2 coefficient for the multishapelet combo fit.</descr>
    `multishapelet_combo_chisq` float DEFAULT NULL,
        -- <descr>Chi-square for the multishapelet combo fit.</descr>
    `correctfluxes_apcorr` float DEFAULT NULL,
        -- <descr>Aperture correction factor applied to fluxes.</descr>
        -- <ucd>arith.factor</ucd>
    `correctfluxes_apcorr_flags` bit(1) NOT NULL,
        -- <descr>Set if aperture correction is unreliable.</descr>
        -- <ucd>meta.code.error</ucd>
    `classification_extendedness` double DEFAULT NULL,
        -- <descr>Probability of being extended.</descr>
        -- <ucd>stat.probability</ucd>
    `detect_is_patch_inner` bit(1) NOT NULL,
        -- <descr>Detection is in the non-overlapping region of the patch.</descr>
        -- <ucd>meta.code</ucd>
    `detect_is_tract_inner` bit(1) NOT NULL,
        -- <descr>Detection is in the non-overlapping region of the tract.</descr>
        -- <ucd>meta.code</ucd>
    `detect_is_primary` bit(1) NOT NULL,
        -- <descr>Detection is the primary of a set of overlapping detections.</descr>
        -- <ucd>meta.code</ucd>
    `coord_raVar` float DEFAULT NULL,
        -- <descr>Variance of ra due to centroid uncertainty (xVar, xyCov, yVar).</descr>
        -- <ucd>stat.variance;pos.eq</ucd>
        -- <units>arcsec^2</units>
    `coord_radeclCov` float DEFAULT NULL,
        -- <descr>Covariance of ra, decl due to centroid uncertainty (xVar, xyCov, yVar).</descr>
        -- <ucd>stat.covariance;pos.eq</ucd>
        -- <units>arcsec^2</units>
    `coord_declVar` float DEFAULT NULL,
        -- <descr>Variance of decl due to centroid uncertainty (xVar, xyCov, yVar).</descr>
        -- <ucd>stat.variance;pos.eq.dec</ucd>
        -- <units>arcsec^2</units>
    `coadd_id` bigint(20) NOT NULL,
        -- <descr>ID of the coadd the source was detected and measured on (pointer to DeepCoadd).</descr>
        -- <ucd>meta.id;obs.image</ucd>
    `coadd_filter_id` int(11) NOT NULL,
        -- <descr>ID of filter used for the coadd the source was detected and measured on (pointer to DeepCoadd).</descr>
        -- <ucd>meta.id;instr.filter</ucd>
    PRIMARY KEY (`id`),
    KEY `IDX_coord_htmId20` (`coord_htmId20`),
    KEY `IDX_coord_decl` (`coord_decl`),
    KEY `IDX_parent` (`parent`),
    KEY `IDX_coadd_id` (`coadd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
