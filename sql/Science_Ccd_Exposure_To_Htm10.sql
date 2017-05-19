CREATE TABLE `Science_Ccd_Exposure_To_Htm10` (
    `scienceCcdExposureId` bigint(20) NOT NULL,
        -- <descr>Pointer to Science_Ccd_Exposure.</descr>
    `htmId10` int(11) NOT NULL,
        -- <descr>ID for Level 10 HTM triangle overlapping exposure. For each exposure in DeepCoadd, there will be one row for every overlapping triangle.</descr>
        -- <ucd>pos.HTM</ucd>
    KEY `IDX_htmId10` (`htmId10`),
    KEY `IDX_scienceCcdExposureId` (`scienceCcdExposureId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
