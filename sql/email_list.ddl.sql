CREATE
VIEW `email_list` AS
  SELECT
    `ss_admin_data`.`students`.`email1` AS `email1`
  FROM `students`
  UNION SELECT
          `ss_admin_data`.`students`.`email2` AS `email2`
        FROM `students`