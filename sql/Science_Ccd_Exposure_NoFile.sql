CREATE TABLE `Science_Ccd_Exposure_NoFile` (
  `scienceCcdExposureId` bigint(20) NOT NULL,
  `run` int(11) NOT NULL,
  `filterId` tinyint(4) NOT NULL,
  `camcol` tinyint(4) NOT NULL,
  `field` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`scienceCcdExposureId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
