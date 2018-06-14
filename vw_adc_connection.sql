CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_adc_connection` AS
    SELECT 
        `vw_adc`.`id` AS `id`,
        `vw_adc`.`what` AS `what`,
        `vw_adc`.`old_obj_id` AS `old_obj_id`,
        `vw_adc`.`new_obj_Id` AS `new_obj_Id`,
        `vw_adc`.`par_obj_id` AS `par_obj_id`,
        `vw_adc`.`par_obj_type` AS `par_obj_type`,
        `vw_adc`.`action_id` AS `action_id`,
        `vw_adc`.`entity_id` AS `entity_id`,
        `vw_adc`.`entity_type` AS `entity_type`,
        `vw_adc`.`Oper` AS `Oper`
    FROM
        `vw_adc`
    WHERE
        (`vw_adc`.`what` = 'connection')