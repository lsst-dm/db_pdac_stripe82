CREATE TABLE `Science_Ccd_Exposure_Metadata` (
        -- <descr> Generic key-value pair metadata for Science_Ccd_Exposure.</descr>
    `scienceCcdExposureId` bigint(20) NOT NULL,
        -- <ucd>meta.id;obs.image</ucd>
    `metadataKey` varchar(255) NOT NULL,
    `exposureType` tinyint(4) NOT NULL,
        -- <descr> Type of exposure.
        -- 1: Science CCD
        -- 2: Difference Imaging CCD
        -- 3: Good-seeing coadd
        -- 4: Deep coadd
        -- 5: Chi-squared coadd
        -- 6: Keith coadd </descr>
    `intValue` int(11) DEFAULT NULL,
    `doubleValue` double DEFAULT NULL,
    `stringValue` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`scienceCcdExposureId`,`metadataKey`),
    KEY `IDX_metadataKey` (`metadataKey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
