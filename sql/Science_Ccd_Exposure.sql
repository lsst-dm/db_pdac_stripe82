CREATE TABLE `Science_Ccd_Exposure`
(
    `scienceCcdExposureId` bigint(20) NOT NULL,
        -- <descr>Primary key (unique identifier).</descr>
        -- <ucd>meta.id;obs.image</ucd>
    `run` int(11) NOT NULL,
        -- <descr>Run number.</descr>
    `camcol` tinyint(4) NOT NULL,
        -- <descr>Camera column.</descr>
    `filterId` tinyint(4) NOT NULL,
        -- <descr>Id of the filter for the band.</descr>
        -- <ucd>meta.id;instr.filter</ucd>
    `field` int(11) NOT NULL,
        -- <descr>Field number.</descr>
    `filterName` char(3) NOT NULL,
        -- <descr>Filter name, pulled in from the Filter table.</descr>
        -- <ucd>instr.bandpass</ucd>
    `ra` double NOT NULL,
        -- <descr>ICRS R.A. of image center, corresponding to FITS pixel coordinates
        -- ((NAXIS1 + 1)/2, (NAXIS2 + 1)/2).</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `decl` double NOT NULL,
        -- <descr>ICRS Dec. of image center, corresponding to FITS pixel coordinates
        -- ((NAXIS1 + 1)/2, (NAXIS2 + 1)/2).</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `htmId20` bigint(20) NOT NULL,
        -- <descr>Level 20 HTM ID of (ra, decl)</descr>
        -- <ucd>pos.HTM</ucd>
    `equinox` float NOT NULL,
        -- <descr>Equinox of coordinates</descr>
        -- <ucd>pos.equinox</ucd>
    `raDeSys` varchar(20) NOT NULL,
        -- <descr>Coordinate system for equinox</descr>
        -- <ucd>pos.frame</ucd>
    `ctype1` varchar(20) NOT NULL,
        -- <descr>Coordinate type</descr>
        -- <ucd>pos.wcs.ctype</ucd>
    `ctype2` varchar(20) NOT NULL,
        -- <descr>Coordinate type</descr>
        -- <ucd>pos.wcs.ctype</ucd>
    `crpix1` float NOT NULL,
        -- <ucd>pos.wcs.ctype</ucd>
        -- <unit>pixel</unit>
    `crpix2` float NOT NULL,
        -- <ucd>pos.wcs.ctype</ucd>
        -- <unit>pixel</unit>
    `crval1` double NOT NULL,
        -- <ucd>pos.wcs.crval</ucd>
        -- <unit>deg</unit>
    `crval2` double NOT NULL,
        -- <ucd>pos.wcs.crval</ucd>
        -- <unit>deg</unit>
    `cd1_1` double NOT NULL,
        -- <ucd>pos.wcs.cdmatrix</ucd>
        -- <unit>deg/pixel</unit>
    `cd1_2` double NOT NULL,
        -- <ucd>pos.wcs.cdmatrix</ucd>
        -- <unit>deg/pixel</unit>
    `cd2_1` double NOT NULL,
        -- <ucd>pos.wcs.cdmatrix</ucd>
        -- <unit>deg/pixel</unit>
    `cd2_2` double NOT NULL,
        -- <ucd>pos.wcs.cdmatrix</ucd>
        -- <unit>deg/pixel</unit>
    `corner1Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 1, corresponding to FITS pixel coordinates
        -- (0.5, 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner1Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 1, corresponding to FITS pixel coordinates
        -- (0.5, 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner2Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 2, corresponding to FITS pixel coordinates
        -- (0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner2Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 2, corresponding to FITS pixel coordinates
        -- (0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner3Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 3, corresponding to FITS pixel coordinates
        -- (NAXIS1 + 0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner3Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 3, corresponding to FITS pixel coordinates
        -- (NAXIS1 + 0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner4Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 4, corresponding to FITS pixel coordinates
        -- (NAXIS1 + 0.5, 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner4Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 4, corresponding to FITS pixel coordinates
        -- (NAXIS1 + 0.5, 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `poly` binary(120) NOT NULL,
        -- <descr>Binary representation of the 4-corner polygon for the exposure.</descr>
    `taiMjd` double NOT NULL,
        -- <descr>Time (MJD, TAI) at the start of the exposure.</descr>
        -- <ucd>time.start</ucd>
        -- <unit>d</unit>
    `obsStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        -- <descr>Time (UTC, 1s precision) at the start of the exposure.</descr>
        -- <ucd>time.start</ucd>
    `expMidpt` varchar(30) NOT NULL,
        -- <descr>Time (ISO8601 format, UTC) at the mid-point of the combined exposure.</descr>
        -- <ucd>time.epoch</ucd>
    `expTime` float NOT NULL,
        -- <descr>Duration of exposure.</descr>
        -- <ucd>time.duration</ucd>
        -- <unit>s</unit>
    `nCombine` int(11) NOT NULL,
        -- <descr>Number of images co-added to create a deeper image.</descr>
    `binX` int(11) NOT NULL,
        -- <descr>Binning of the CCD in x.</descr>
        -- <ucd>meta.number</ucd>
        -- <unit>pixel</unit>
    `binY` int(11) NOT NULL,
        -- <descr>Binning of the CCD in y.</descr>
        -- <ucd>meta.number</ucd>
        -- <unit>pixel</unit>
    `fluxMag0` float NOT NULL,
        -- <descr>Flux of a zero-magnitude object.</descr>
        -- <ucd>phot.flux.density</ucd>
    `fluxMag0Sigma` float NOT NULL,
        -- <descr>1-sigma error on fluxmag0.</descr>
        -- <ucd>stat.error;phot.flux.density</ucd>
    `fwhm` double NOT NULL,
        -- <descr>Full width at half maximum</descr>
        -- <ucd>instr.obsty.seeing</ucd>
        -- <unit>arcsec</unit>
    `path` varchar(255) NOT NULL,
        -- <descr>CCD FITS file path relative to the SFM pipeline output directory.</descr>
    PRIMARY KEY (`scienceCcdExposureId`),
    KEY `IDX_htmId20` (`htmId20`),
    KEY `FK_Science_Ccd_Exposure_filterId` (`filterId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
