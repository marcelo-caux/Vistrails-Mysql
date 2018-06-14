CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_rpt_listparmvalues` AS
    SELECT DISTINCT
        `we`.`parent_version` AS `Run`,
        `me`.`id` AS `id`,
        `we`.`ts_start` AS `inicio`,
        `we`.`name` AS `name`,
        `mo`.`name` AS `Modulo`,
        `fu`.`name` AS `Funcao`,
        `pa`.`val` AS `val`
    FROM
        ((((`module_exec` `me`
        JOIN `workflow_exec` `we` ON ((`me`.`entity_id` = `we`.`entity_id`)))
        JOIN `module` `mo` ON ((`me`.`module_id` = `mo`.`id`)))
        JOIN `vw_adc_function` `fu` ON ((`mo`.`id` = `fu`.`par_obj_id`)))
        JOIN `vw_adc_parameter` `pa` ON ((`fu`.`new_obj_Id` = `pa`.`par_obj_id`)))
    ORDER BY `we`.`parent_version` , `me`.`id`