CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_provenance_exec` AS
    SELECT 
        `we`.`parent_version` AS `parent_version`,
        `we`.`user` AS `user`,
        `me`.`module_name` AS `module_name`,
        `me`.`ts_start` AS `ts_start`,
        `me`.`ts_end` AS `ts_end`,
        IFNULL(`me`.`error`, 'Sucesso') AS `Resultado`,
        `me`.`completed` AS `completed`
    FROM
        (`workflow_exec` `we`
        JOIN `module_exec` `me` ON ((`we`.`entity_id` = `me`.`entity_id`)))
    GROUP BY `we`.`parent_version` , `we`.`user` , `me`.`id` , `me`.`module_name` , `me`.`ts_start` , `me`.`ts_end` , `me`.`error` , `me`.`completed`