CREATE VIEW `student_detail` AS
  SELECT
    A.paid                                                                                   AS paid,
    `A`.`first_name`                                                                         AS `first_name`,
    `A`.`last_name`                                                                          AS `last_name`,
    cast(`A`.`birth_date` AS DATE)                                                           AS `birth_date`,
    ((date_format(now(), _utf8'%Y') - date_format(`A`.`birth_date`, _utf8'%Y')) -
     (date_format(now(), _utf8'00-%m-%d') < date_format(`A`.`birth_date`, _utf8'00-%m-%d'))) AS `age`,
    `A`.`school_grade`                                                                       AS `school_grade`,
    `C`.`class_name`                                                                         AS `class_name`,
    `C`.`spaces_left`                                                                        AS `spaces_left`,
    cast(`C`.`start_date` AS DATE)                                                           AS `start_date`,
    `A`.`email1`                                                                             AS `email1`,
    `A`.`guardian_one_first_name`                                                            AS `parent first name`,
    `A`.`guardian_one_last_name`                                                             AS `parent last name`,
    `A`.`id_student`                                                                         AS `id_student`
  FROM
    (( `students` `A` LEFT JOIN `session_students` `B` ON((`A`.`id_student` = `B`.`id_student`))) LEFT JOIN `session_detail` `C` ON((`B`.`id_sailing_session` = `C`.`id_sailing_session`)))