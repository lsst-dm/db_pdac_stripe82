CREATE TABLE `LeapSeconds` (
    `whenJd` float NOT NULL,
        -- <descr>JD of change in TAI-UTC difference (leap second).</descr>
        -- <ucd>time.epoch</ucd>
        -- <unit>d</unit>
    `offset` float NOT NULL,
        -- <descr>New number of leap seconds.</descr>
        -- <ucd>time.interval</ucd>
        -- <unit>s</unit>
    `mjdRef` float NOT NULL,
        -- <descr>Reference MJD for drift (prior to 1972-Jan-1).</descr>
        -- <ucd>time.epoch</ucd>
        -- <unit>d</unit>
    `drift` float NOT NULL,
        -- <descr>Drift in seconds per day (prior to 1972-Jan-1).</descr>
        -- <ucd>arith.rate</ucd>
        -- <unit>s/d</unit>
    `whenMjdUtc` float DEFAULT NULL,
        -- <descr>MJD in UTC system of change (computed).</descr>
        -- <ucd>time.epoch</ucd>
        -- <unit>d</unit>
    `whenUtc` bigint(20) DEFAULT NULL,
        -- <descr>Nanoseconds from epoch in UTC system of change (computed).</descr>
        -- <ucd>time</ucd>
        -- <unit>ns</unit>
    `whenTai` bigint(20) DEFAULT NULL
        -- <descr>Nanoseconds from epoch in TAI system of change (computed).</descr>
        -- <ucd>time</ucd>
        -- <unit>ns</unit>
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
