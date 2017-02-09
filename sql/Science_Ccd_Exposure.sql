CREATE TABLE `Science_Ccd_Exposure` (
  `scienceCcdExposureId` bigint(20) NOT NULL,
  `run` int(11) NOT NULL,
  `camcol` tinyint(4) NOT NULL,
  `filterId` tinyint(4) NOT NULL,
  `field` int(11) NOT NULL,
  `filterName` char(3) NOT NULL,
  `ra` double NOT NULL,
  `decl` double NOT NULL,
  `htmId20` bigint(20) NOT NULL,
  `equinox` float NOT NULL,
  `raDeSys` varchar(20) NOT NULL,
  `ctype1` varchar(20) NOT NULL,
  `ctype2` varchar(20) NOT NULL,
  `crpix1` float NOT NULL,
  `crpix2` float NOT NULL,
  `crval1` double NOT NULL,
  `crval2` double NOT NULL,
  `cd1_1` double NOT NULL,
  `cd1_2` double NOT NULL,
  `cd2_1` double NOT NULL,
  `cd2_2` double NOT NULL,
  `corner1Ra` double NOT NULL,
  `corner1Decl` double NOT NULL,
  `corner2Ra` double NOT NULL,
  `corner2Decl` double NOT NULL,
  `corner3Ra` double NOT NULL,
  `corner3Decl` double NOT NULL,
  `corner4Ra` double NOT NULL,
  `corner4Decl` double NOT NULL,
  `poly` binary(120) NOT NULL,
  `taiMjd` double NOT NULL,
  `obsStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expMidpt` varchar(30) NOT NULL,
  `expTime` float NOT NULL,
  `nCombine` int(11) NOT NULL,
  `binX` int(11) NOT NULL,
  `binY` int(11) NOT NULL,
  `fluxMag0` float NOT NULL,
  `fluxMag0Sigma` float NOT NULL,
  `fwhm` double NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`scienceCcdExposureId`),
  KEY `IDX_htmId20` (`htmId20`),
  KEY `FK_Science_Ccd_Exposure_filterId` (`filterId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
