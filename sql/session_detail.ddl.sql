
CREATE

  VIEW `session_detail` AS
  SELECT
    `A`.`id_sailing_program`                                        AS `id_sailing_program`,
    `B`.`id_sailing_session`                                        AS `id_sailing_session`,
    `A`.`class_name`                                                AS `class_name`,
    `A`.`class_description`                                         AS `class_description`,
    monthname(`B`.`start_date`)                                     AS `month_name`,
    dayofmonth(`B`.`start_date`)                                    AS `day_name`,
    (CASE
       WHEN A.full_day = 1 THEN '9:30am to 3:30pm'
       WHEN (hour(`B`.`start_date`) = 9) THEN '9am to noon'
       WHEN (hour(`B`.`start_date`) = 13) THEN '1pm to 4pm'
     END)    AS `time_of_day`,
    `B`.`student_limit`                                             AS `student_limit`,
    `C`.`count_student`                                             AS `count_student`,
    `B`.`student_limit` - `C`.`count_student`                       AS `spaces_left`,
    `B`.`start_date`                                                AS `start_date`
  FROM
      `sailing_program` `A`
      LEFT JOIN `sailing_session` `B`
        ON `A`.`id_sailing_program` = `B`.`id_sailing_program`
      LEFT JOIN `session_registration_count` `C`
        ON `B`.`id_sailing_session` = `C`.`id_sailing_session`
  ;