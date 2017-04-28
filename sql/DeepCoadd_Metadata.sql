CREATE TABLE `DeepCoadd_Metadata` (
    `deepCoaddId` bigint(20) NOT NULL,
        -- <ucd>meta.id;obs.image</ucd>
    `metadataKey` varchar(255) NOT NULL,
    `exposureType` tinyint(4) NOT NULL,
        -- <descr>Description of the schema.
        -- <ul>
        -- <li>Type of exposure</li>
        -- <li>1: Science CCD</li>
        -- <li>2: Difference Imaging CCD</li>
        -- <li>3: Good-seeing coadd</li>
        -- <li>4: Deep coadd</li>
        -- <li>5: Chi-squared coadd</li>
        -- <li>6: Keith coadd</li>
        -- </ul>
        -- </descr>
    `intValue` int(11) DEFAULT NULL,
    `doubleValue` double DEFAULT NULL,
    `stringValue` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`deepCoaddId`,`metadataKey`),
    KEY `IDX_metadataKey` (`metadataKey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
