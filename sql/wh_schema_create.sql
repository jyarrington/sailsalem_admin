CREATE TABLE  `ss_admin_data`.`wh_registration` (
  year int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `registrationNumber` int(11) default NULL,
  `MedicalInformationForm` varchar(30) default NULL,
  `SwimForm` varchar(25) default NULL,
  `FieldTripForm` varchar(25) default NULL,
  `RegForm` varchar(25) default NULL,
  `Paid` varchar(25) default NULL,
  `studentName` varchar(50) default NULL,
  `Age` varchar(10) default NULL,
  `BirthDate` varchar(50) default NULL,
  `Address` varchar(100) default NULL,
  `City` varchar(50) default NULL,
  `State` varchar(10) default NULL,
  `Zip` varchar(10) default NULL,
  `SchoolGrade` varchar(25) default NULL,
  `Height` varchar(10) default NULL,
  `Weight` varchar(10) default NULL,
  `HomePhone` varchar(25) default NULL,
  `Mother` varchar(50) default NULL,
  `Father` varchar(50) default NULL,
  `Phone1` varchar(50) default NULL,
  `Phone2` varchar(50) default NULL,
  `Email1` varchar(50) default NULL,
  `Email2` varchar(50) default NULL,
  `PrimaryEmergencyNumber` varchar(500) default NULL,
  `TShirtSize` varchar(50) default NULL,
  `AssignedSession` varchar(50) default NULL,
  `SessionChange` varchar(50) default NULL,
  `Choice1` varchar(50) default NULL,
  `Choice2` varchar(50) default NULL,
  `Choice3` varchar(50) default NULL,
  `Choice4` varchar(50) default NULL,
  `Choice5` varchar(50) default NULL,
  `Notes` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;

CREATE TABLE  `ss_admin_data`.`wh_sailingsession` (
year int(11) not NULL,
  `Session` varchar(50) default NULL,
  `StartDate` datetime default NULL,
  UNIQUE KEY `Session` (`Session`, Year)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
;