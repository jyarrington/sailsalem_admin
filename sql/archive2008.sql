

INSERT INTO wh_sailingsession
(
	year,
	Session,
	StartDate
)
SELECT
	2011,
	sp.class_name,
	ss.start_date
FROM
	sailing_session as ss
	left join sailing_program as sp
	  on ss.id_sailing_program = sp.id_sailing_program
;


INSERT INTO wh_registration
(
	year,
	id,
	studentName,
	BirthDate,
	Address,
	City,
	State,
	Zip,
	SchoolGrade,
	Height,
	Weight,
	HomePhone,
	Mother,
	Father,
	Phone1,
	Phone2,
	Email1,
	Email2,
	PrimaryEmergencyNumber,
	AssignedSession
)
SELECT
	2011,
	s.id_student,
	first_name + ' ' + last_name,
	birth_date,
	address,
	city,
	state,
	zip,
	school_grade,
	height,
	weight,
	phone1,
	guardian_one_first_name + ' ' + guardian_one_last_name,
	guardian_two_first_name + ' ' + guardian_two_last_name,
	phone1,
	phone2,
	email1,
	email2,
	emergency_phone,
	id_sailing_session
FROM
	students AS s
	LEFT JOIN session_students AS ss
    ON s.id_student = ss.id_student
;

DELETE FROM session_students;

DELETE FROM students;

DELETE FROM sailing_session;

delete from sailing_program;
