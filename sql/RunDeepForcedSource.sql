CREATE TABLE `RunDeepForcedSource` (
  `id` bigint(20) NOT NULL,
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
        -- <descr>goodSeeingSourceId of parent if source is deblended, otherwise NULL.</descr>
        -- <ucd>meta.id.parent;src</ucd>
  `flags_badcentroid` bit(1) NOT NULL,
        -- <descr>Set if the centroid measurement failed.</descr>
        -- <ucd>meta.code.error</ucd>
  `centroid_sdss_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of forced-source SDSS entroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
  `centroid_sdss_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of forced-source SDSS centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
  `centroid_sdss_xVar` float DEFAULT NULL,
        -- <descr>Variance of x. of forced-source SDSS centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
  `centroid_sdss_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y of forced-source SDSS centroid</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
  `centroid_sdss_yVar` float DEFAULT NULL,
        -- <descr>Variance of y. forced-source SDSS centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
  `centroid_sdss_flags` bit(1) NOT NULL,
        -- <descr>set if SDSS centroid is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
  `centroid_gaussian_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of forced-source gaussian centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
  `centroid_gaussian_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of forced-source gaussian centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
  `centroid_gaussian_xVar` float DEFAULT NULL,
        -- <descr>Variance of x. of forced-source gaussian centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
  `centroid_gaussian_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y of forced-source gaussian centroid</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
  `centroid_gaussian_yVar` float DEFAULT NULL,
        -- <descr>Variance of y. forced-source gaussian centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
  `centroid_gaussian_flags` bit(1) NOT NULL,
        -- <descr>set if gaussian centroid is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
  `centroid_naive_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of forced-source naive centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
  `centroid_naive_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of forced-source naive centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
  `centroid_naive_xVar` float DEFAULT NULL,
        -- <descr>Variance of x. of forced-source naive centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
  `centroid_naive_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y of forced-source naive centroid</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
  `centroid_naive_yVar` float DEFAULT NULL,
        -- <descr>Variance of y. forced-source naive centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
  `centroid_naive_flags` bit(1) NOT NULL,
        -- <descr>set if naive centroid is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
  `flags_pixel_edge` bit(1) NOT NULL,
        -- <descr>Set if forced-source is in region labeled EDGE.</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_interpolated_any` bit(1) NOT NULL,
        -- <descr>Set if forced-source footprint includes
        -- interpolated pixels.</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_interpolated_center` bit(1) NOT NULL,
        -- <descr>Set if forced-source center is close to
        -- interpolated pixels.</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_saturated_any` bit(1) NOT NULL,
        -- <descr>Set if forced-source footprint includes
        -- saturated pixels.</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_saturated_center` bit(1) NOT NULL,
        -- <descr>Set if forced-source center is close to
        -- saturated pixels.</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_cr_any` bit(1) NOT NULL,
        -- <descr>Set if forced-source footprint includes cosmic ray pixels</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_cr_center` bit(1) NOT NULL,
        -- <descr>Set if forced-source center is close to cosmic ray pixels</descr>
        -- <ucd>meta.code</ucd>
  `flags_pixel_bad` bit(1) NOT NULL,
        -- <descr>Set if forced-source footptinyt incoudes bad pixels </descr>
        -- <ucd>meta.code</ucd>
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
        -- <descr>Variance of shapeIyy.</descr>
        -- <ucd>stat.variance</ucd>
        -- <unit>pixel^4</unit>
  `shape_sdss_flags` bit(1) NOT NULL,
        -- <descr>set if SDSS shape measurement is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
  `shape_sdss_centroid_x` double DEFAULT NULL,
        -- <descr>Pixel axis 1 coordinate of forced-source shape centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.x</ucd>
        -- <unit>pixel</unit>
  `shape_sdss_centroid_y` double DEFAULT NULL,
        -- <descr>Pixel axis 2 coordinate of forced-source shape centroid,
        -- LSST pixel coordinate conventions.</descr>
        -- <ucd>pos.cartesian.y</ucd>
        -- <unit>pixel</unit>
  `shape_sdss_centroid_xVar` float DEFAULT NULL,
        -- <descr>Variance of x. of forced-source shape centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.x</ucd>
        -- <unit>pixel^2</unit>
  `shape_sdss_centroid_xyCov` float DEFAULT NULL,
        -- <descr>Covariance of x and y of forced-source shape centroid</descr>
        -- <ucd>stat.covariance</ucd>
        -- <unit>pixel^2</unit>
  `shape_sdss_centroid_yVar` float DEFAULT NULL,
        -- <descr>Variance of y. forced-source naive centroid</descr>
        -- <ucd>stat.variance;pos.cartesian.y</ucd>
        -- <unit>pixel^2</unit>
  `shape_sdss_centroid_flags` bit(1) NOT NULL,
        -- <descr>set if centroid measured by SDSS shape algorithm is unreliable</descr>
        -- <ucd>meta.code.error</ucd>
  `shape_sdss_flags_unweightedbad` bit(1) NOT NULL,
  `shape_sdss_flags_unweighted` bit(1) NOT NULL,
  `shape_sdss_flags_shift` bit(1) NOT NULL,
  `shape_sdss_flags_maxiter` bit(1) NOT NULL,
  `flux_gaussian` double DEFAULT NULL,
        -- <descr>Uncalibrated gaussian flux.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
  `flux_gaussian_err` double DEFAULT NULL,
        -- <descr>Uncertainty of flux_gaussian.</descr>
        -- <ucd>stat.error;phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
  `flux_gaussian_flags` bit(1) NOT NULL,
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
  `correctfluxes_apcorr` float DEFAULT NULL,
        -- <descr>Aperture correction factor applied to fluxes</descr>
        -- <ucd>arith.factor</ucd>
  `correctfluxes_apcorr_flags` bit(1) NOT NULL,
  `centroid_record_x` double DEFAULT NULL,
  `centroid_record_y` double DEFAULT NULL,
  `classification_extendedness` double DEFAULT NULL,
        -- <descr>Probability of being extended.<descr>
        -- <ucd>stat.probability</ucd>
  `refFlux` double DEFAULT NULL,
        -- <descr>Flux of the reference deep source on coadd.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
  `refFlux_err` double DEFAULT NULL,
        -- <descr>Error of lux of the reference deep source on coadd.</descr>
        -- <ucd>phot.count;stat.uncalib</ucd>
        -- <unit>adu</unit>
  `objectId` bigint(20) NOT NULL,
        -- <descr>ID of object this source was assigned to. NULL if the source
        -- did not participate in spatial clustering, or if the clustering
        -- algorithm considered the source to be a 'noise' source.</descr>
        -- <ucd>meta.id;src</ucd>
  `coord_raVar` float DEFAULT NULL,
        -- <descr>Variance of ra, taken from the sample covariance matrix
        -- of (ra, decl). The standard error of the mean ra is
        -- sqrt(raVar/obsCount)</descr>
        -- <ucd>stat.variance;pos.eq.ra</ucd>
        -- <unit>arcsec^2</unit>
  `coord_radeclCov` float DEFAULT NULL,
        -- <descr>Sample covariance of ra and decl.</descr>
        -- <ucd>stat.covariance;pos.eq</ucd>
        -- <unit>arcsec^2</unit>
  `coord_declVar` float DEFAULT NULL,
        -- <descr>Variance of decl, taken from the sample covariance matrix
        -- of (ra, decl). The standard error of the mean decl is
        -- sqrt(declVar/obsCount)</descr>
        -- <ucd>stat.variance;pos.eq.dec</ucd>
        -- <unit>arcsec^2</unit>
  `exposure_id` bigint(20) NOT NULL,
        -- <descr>Exposure identifier.</descr>
        -- <ucd>meta.id;obs.image</ucd>
  `exposure_filter_id` int(11) NOT NULL,
        -- <descr>Id of the filter for the band.</descr>
        -- <ucd>meta.id;instr.filter</ucd>
  `exposure_time` float DEFAULT NULL,
        -- <descr>Duration of exposure.</descr>
        -- <ucd>time.duration</ucd>
        -- <unit>s</unit>
  `exposure_time_mid` double DEFAULT NULL,
        -- <descr>Time (ISO8601 format, UTC) at the mid-point of the
        -- combined exposure.</descr>
        -- <ucd>time.epoch</ucd>
  `cluster_id` bigint(20) DEFAULT NULL,
    -- <descr> ID of a deduplication cluster.</descr>
  `cluster_coord_ra` double DEFAULT NULL,
    -- <descr> RA-coordinate of the center of cluster.</descr>
    -- <ucd>pos.eq.ra</ucd>
    -- <unit>deg</unit>
  `cluster_coord_decl` double DEFAULT NULL,
    -- <descr> Decl-coordinate of the center of cluster.</descr>
    -- <ucd>pos.eq.dec</ucd>
    -- <unit>deg</unit>
  `is_primary` bit(1) DEFAULT NULL,
    -- <descr> True if does not come from de-duplication.</descr>
  `object_coord_ra` double DEFAULT NULL,
        -- <descr>ICRS RA of object associated with this source, or ra if the
        -- source was not associated with any object (objectId is NULL).</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
  `object_coord_decl` double DEFAULT NULL,
        -- <descr>ICRS Dec of object associated with this source, or decl if the
        -- source was not associated with any object (objectId is NULL).</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
  PRIMARY KEY (`id`),
  KEY `IDX_coord_htmId20` (`coord_htmId20`),
  KEY `IDX_coord_decl` (`coord_decl`),
  KEY `IDX_parent` (`parent`),
  KEY `IDX_exposure_id` (`exposure_id`),
  KEY `IDX_exposure_filter_id` (`exposure_filter_id`),
  KEY `IDX_objectId` (`objectId`),
  KEY `IDX_objectId_exposure` (`objectId`,`exposure_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
