    CREATE TABLE `Filter` (
    `filterId` tinyint(4) NOT NULL,
        -- <descr>Unique id (primary key).</descr>
        -- <ucd>meta.id;instr.filter</ucd>
    `filterName` char(3) NOT NULL,
        -- <descr>Filter name. Valid values: 'u', 'g', 'r', 'i', 'z'</descr>
        -- <ucd>instr.bandpass</ucd>
    `photClam` float NOT NULL,
        -- <descr>Filter centroid wavelength.</descr>
        -- <ucd>em.wl.effective;instr.filter</ucd>
        -- <unit>nm</unit>
    `photBW` float NOT NULL,
        -- <descr>System effective bandwidth.</descr>
        -- <ucd>instr.bandwidth</ucd>
        -- <unit>nm</unit>
    PRIMARY KEY (`filterId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
