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
  `flux_gaussian_err` double DEFAULT NULL,
  `flux_gaussian_flags` bit(1) NOT NULL,
  `flux_gaussian_psffactor` float DEFAULT NULL,
  `flux_gaussian_flags_psffactor` bit(1) NOT NULL,
  `flux_naive` double DEFAULT NULL,
  `flux_naive_err` double DEFAULT NULL,
  `flux_naive_flags` bit(1) NOT NULL,
  `flux_psf` double DEFAULT NULL,
  `flux_psf_err` double DEFAULT NULL,
  `flux_psf_flags` bit(1) NOT NULL,
  `flux_psf_psffactor` float DEFAULT NULL,
  `flux_psf_flags_psffactor` bit(1) NOT NULL,
  `flux_sinc` double DEFAULT NULL,
  `flux_sinc_err` double DEFAULT NULL,
  `flux_sinc_flags` bit(1) NOT NULL,
  `correctfluxes_apcorr` float DEFAULT NULL,
  `correctfluxes_apcorr_flags` bit(1) NOT NULL,
  `centroid_record_x` double DEFAULT NULL,
  `centroid_record_y` double DEFAULT NULL,
  `classification_extendedness` double DEFAULT NULL,
  `refFlux` double DEFAULT NULL,
  `refFlux_err` double DEFAULT NULL,
  `objectId` bigint(20) NOT NULL,
  `coord_raVar` float DEFAULT NULL,
  `coord_radeclCov` float DEFAULT NULL,
  `coord_declVar` float DEFAULT NULL,
  `exposure_id` bigint(20) NOT NULL,
  `exposure_filter_id` int(11) NOT NULL,
  `exposure_time` float DEFAULT NULL,
  `exposure_time_mid` double DEFAULT NULL,
  `cluster_id` bigint(20) DEFAULT NULL,
  `cluster_coord_ra` double DEFAULT NULL,
  `cluster_coord_decl` double DEFAULT NULL,
  `is_primary` bit(1) DEFAULT NULL,
  `object_coord_ra` double DEFAULT NULL,
  `object_coord_decl` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_coord_htmId20` (`coord_htmId20`),
  KEY `IDX_coord_decl` (`coord_decl`),
  KEY `IDX_parent` (`parent`),
  KEY `IDX_exposure_id` (`exposure_id`),
  KEY `IDX_exposure_filter_id` (`exposure_filter_id`),
  KEY `IDX_objectId` (`objectId`),
  KEY `IDX_objectId_exposure` (`objectId`,`exposure_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
