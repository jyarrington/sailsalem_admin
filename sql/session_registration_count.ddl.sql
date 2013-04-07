CREATE

VIEW `session_registration_count`
AS
  SELECT
    `A`.`id_sailing_session` AS `id_sailing_session`,
    count(`B`.`id_student`)  AS `count_student`
  FROM (`sailing_session` `A` LEFT JOIN `session_students` `B`
            ON ((`A`.`id_sailing_session` = `B`.`id_sailing_session`)))
  GROUP BY `A`.`id_sailing_session`