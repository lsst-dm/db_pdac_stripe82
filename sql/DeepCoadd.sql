CREATE TABLE `DeepCoadd` (
    `deepCoaddId` bigint(20) NOT NULL,
        -- <descr>Primary key (unique identifier).</descr>
        -- <ucd>meta.id;obs.image</ucd>
    `tract` int(11) NOT NULL,
        -- <descr>Sky-tract number.</descr>
    `patch` char(16) NOT NULL,
        -- <descr>Sky-patch.</descr>
    `filterId` tinyint(4) NOT NULL,
        -- <descr>Id of the filter for the band.</descr>
        -- <ucd>meta.id;instr.filter</ucd>
        -- <unit></unit>
    `filterName` char(3) NOT NULL,
        -- <descr>Filter name, pulled in from the Filter table.</descr>
        -- <ucd>instr.bandpass</ucd>
    `ra` double NOT NULL,
        -- <descr>ICRS R.A. of image center, corresponding to FITS pixel coordinates ((NAXIS1 + 1)/2, (NAXIS2 + 1)/2).</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `decl` double NOT NULL,
        -- <descr>ICRS Dec. of image center, corresponding to FITS pixel coordinates ((NAXIS1 + 1)/2, (NAXIS2 + 1)/2).</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `htmId20` bigint(20) NOT NULL,
        -- <descr>Level 20 HTM ID of (ra, decl)</descr>
        -- <ucd>pos.HTM</ucd>
    `equinox` float NOT NULL,
        -- <ucd>pos.equinox </ucd>
    `raDeSys` varchar(20) NOT NULL,
        -- <ucd>pos.frame</ucd>
    `ctype1` varchar(20) NOT NULL,
        -- <ucd>pos.wcs.ctype</ucd>
    `ctype2` varchar(20) NOT NULL,
        -- <ucd>pos.wcs.ctype</ucd>
    `crpix1` float NOT NULL,
        -- <ucd>pos.wcs.crpix</ucd>
        -- <unit>pixel</unit>
    `crpix2` float NOT NULL,
        -- <ucd>pos.wcs.crpix </ucd>
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
        -- <descr>ICRS RA of image corner 1, corresponding to FITS pixel coordinates (0.5, 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner1Decl` double NOT NULL,
        -- <descr>ICRS RA of image corner 1, corresponding to FITS pixel coordinates (0.5, 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner2Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 2, corresponding to FITS pixel coordinates (0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner2Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 2, corresponding to FITS pixel coordinates (0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner3Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 3, corresponding to FITS pixel coordinates (NAXIS1 + 0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner3Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 3, corresponding to FITS pixel coordinates (NAXIS1 + 0.5, NAXIS2 + 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `corner4Ra` double NOT NULL,
        -- <descr>ICRS RA of image corner 4, corresponding to FITS pixel coordinates (NAXIS1 + 0.5, 0.5)</descr>
        -- <ucd>pos.eq.ra</ucd>
        -- <unit>deg</unit>
    `corner4Decl` double NOT NULL,
        -- <descr>ICRS Dec of image corner 4, corresponding to FITS pixel coordinates (NAXIS1 + 0.5, 0.5)</descr>
        -- <ucd>pos.eq.dec</ucd>
        -- <unit>deg</unit>
    `poly` binary(120) NOT NULL,
        -- <descr>binary representation of the 4-corner polygon for the exposure.</descr>
    `fluxMag0` float NOT NULL,
        -- <ucd>phot.flux.density</ucd>
    `fluxMag0Sigma` float NOT NULL,
        -- <ucd>stat.error;phot.flux.density</ucd>
    `matchedFwhm` double DEFAULT NULL,
        -- <descr>FWHM computed from PSF that was matched to during coaddition. NULL if coadds were created with PSF-matching turned off.</descr>
        -- <ucd>instr.obsty.seeing</ucd>
        -- <unit>arcsec</unit>
    `measuredFwhm` double DEFAULT NULL,
        -- <descr>FWHM computed from measured PSF. NULL if coadds were created with PSF-matching turned on and the pipeline was configured to use the matched-to PSF.</descr>
        -- <ucd>instr.obsty.seeing</ucd>
        -- <unit>arcsec</unit>
    `path` varchar(255) NOT NULL,
        -- <descr>FITS file path relative to the SFM pipeline output directory.</descr>
    PRIMARY KEY (`deepCoaddId`),
    KEY `IDX_htmId20` (`htmId20`),
    KEY `IDX_tract_patch_filterName` (`tract`,`patch`,`filterName`),
    KEY `FK_DeepCoadd_filterId` (`filterId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
