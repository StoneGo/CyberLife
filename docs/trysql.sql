CREATE ALGORITHM = UNDEFINED DEFINER = `cyberlife` @`localhost` SQL SECURITY DEFINER VIEW `v_pdepend` AS
select
    `pd`.`pdid` AS `pdid`,
    `pd`.`pid` AS `pid`,
    `pd`.`dpid` AS `dpid`,
    `p1`.`pname` AS `pname`,
    `p2`.`pname` AS `dpname`
from
    (
        (
            `pdepend` `pd`
            join `project` `p1` on((`pd`.`pid` = `p1`.`pid`))
        )
        join `project` `p2` on((`pd`.`dpid` = `p2`.`pid`))
    );

CREATE ALGORITHM = UNDEFINED DEFINER = `cyberlife` @`localhost` SQL SECURITY DEFINER VIEW `v_tdepend` AS
select
    `td`.`tdid` AS `tdid`,
    `td`.`tid` AS `tid`,
    `td`.`dtid` AS `dtid`,
    `t1`.`tname` AS `tname`,
    `t2`.`tname` AS `tpname`
from
    (
        (
            `tdepend` `td`
            join `task` `t1` on((`td`.`tid` = `t1`.`tid`))
        )
        join `task` `t2` on((`td`.`dtid` = `t2`.`tid`))
    );