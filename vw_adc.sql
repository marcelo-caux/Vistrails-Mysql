CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_adc` AS
    SELECT 
        `change_tbl`.`id` AS `id`,
        `change_tbl`.`what` AS `what`,
        `change_tbl`.`old_obj_id` AS `old_obj_id`,
        `change_tbl`.`new_obj_id` AS `new_obj_Id`,
        `change_tbl`.`par_obj_id` AS `par_obj_id`,
        `change_tbl`.`par_obj_type` AS `par_obj_type`,
        `change_tbl`.`action_id` AS `action_id`,
        `change_tbl`.`entity_id` AS `entity_id`,
        `change_tbl`.`entity_type` AS `entity_type`,
        (_LATIN1'change' COLLATE latin1_swedish_ci) AS `Oper`
    FROM
        `change_tbl` 
    UNION SELECT 
        `add_tbl`.`id` AS `id`,
        `add_tbl`.`what` AS `what`,
        NULL AS `old_obj_id`,
        `add_tbl`.`object_id` AS `new_obj_Id`,
        `add_tbl`.`par_obj_id` AS `par_obj_id`,
        `add_tbl`.`par_obj_type` AS `par_obj_type`,
        `add_tbl`.`action_id` AS `action_id`,
        `add_tbl`.`entity_id` AS `entity_id`,
        `add_tbl`.`entity_type` AS `entity_type`,
        (_LATIN1'add' COLLATE latin1_swedish_ci) AS `Oper`
    FROM
        `add_tbl` 
    UNION SELECT 
        `delete_tbl`.`id` AS `id`,
        `delete_tbl`.`what` AS `what`,
        NULL AS `old_obj_id`,
        `delete_tbl`.`object_id` AS `new_obj_Id`,
        `delete_tbl`.`par_obj_id` AS `par_obj_id`,
        `delete_tbl`.`par_obj_type` AS `par_obj_type`,
        `delete_tbl`.`action_id` AS `action_id`,
        `delete_tbl`.`entity_id` AS `entity_id`,
        `delete_tbl`.`entity_type` AS `entity_type`,
        (_LATIN1'delete' COLLATE latin1_swedish_ci) AS `Oper`
    FROM
        `delete_tbl`
    ORDER BY `id`