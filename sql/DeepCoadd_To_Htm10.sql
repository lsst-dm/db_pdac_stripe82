CREATE TABLE `DeepCoadd_To_Htm10` (
    `deepCoaddId` bigint(20) NOT NULL,
        -- <descr>Pointer to DeepCoadd.</descr>
    `htmId10` int(11) NOT NULL,
        -- <ucd>pos.HTM</ucd>
        -- <descr>ID for Level 10 HTM triangle overlapping exposure. For each exposure in DeepCoadd, there will be one row for every overlapping triangle.</descr>
    KEY `IDX_htmId10` (`htmId10`),
    KEY `IDX_deepCoaddId` (`deepCoaddId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
