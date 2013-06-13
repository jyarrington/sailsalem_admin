-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2013 at 01:58 AM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ss_admin_data`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `email_list`
--
CREATE TABLE `email_list` (
`email1` varchar(50)
);
-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id_form` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `required` bit(1) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id_form`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='List of forms and use' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id_form`, `name`, `required`, `code`) VALUES
(1, 'Medical Information Form', '', 'med'),
(2, 'Swim Form', '', 'swim');

-- --------------------------------------------------------

--
-- Table structure for table `forms_students`
--

CREATE TABLE `forms_students` (
  `id_form` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_student` (`id_student`),
  KEY `fk_form` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forms_students`
--

INSERT INTO `forms_students` (`id_form`, `id_student`, `ts`) VALUES
(2, 58, '2011-06-07 19:33:44'),
(1, 58, '2011-06-07 19:33:44'),
(1, 59, '2011-03-26 14:38:48'),
(1, 63, '2011-03-31 15:48:06'),
(1, 268, '2011-05-30 22:30:24'),
(1, 269, '2011-05-30 22:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `sailing_program`
--

CREATE TABLE `sailing_program` (
  `id_sailing_program` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) NOT NULL,
  `class_description` varchar(200) NOT NULL,
  `full_day` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(2) NOT NULL DEFAULT '0',
  `class_type` varchar(50) NOT NULL,
  `age_group` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sailing_program`),
  UNIQUE KEY `class_name_UNIQUE` (`class_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Sailing Program refers to the class content -- Adult Keelboa' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `sailing_program`
--

INSERT INTO `sailing_program` (`id_sailing_program`, `class_name`, `class_description`, `full_day`, `sort_order`, `class_type`, `age_group`) VALUES
(6, 'Beginner Mornings Ages 8-12', 'Beginner Sailing Lessons - Ages 8-12 - Free - This class is for students who have never taken a class with Sail Salem before.', 0, 1, 'free', 'youth'),
(7, 'Advanced Beginner', 'Advanced Beginner - Ages 8-12 - $300($250 for Salem Residents - This class is for students who have taken a beginner class with Sail Salem before.', 1, 5, '300', 'youth'),
(8, 'Beginner Mornings Ages 13-18', 'Beginner - Ages 13-18 - Free - This class is for students who have never taken a class with Sail Salem before.', 0, 2, 'free', 'youth'),
(9, 'Advanced Beginner (13-18)', 'Advanced Beginner - Ages 13-18 - $300 ($250 for Salem Residents - This class is for students who have taken a beginner class with Sail Salem before.', 1, 6, '300', 'youth'),
(10, 'Beginner Afternoons Ages 8-12', 'Beginner Afternoons Ages 8-12 - Free', 0, 3, 'free', 'youth'),
(11, 'Beginner Afternoons Ages 13-18', 'Beginner Afternoons Ages 13-18 - Free', 0, 4, 'free', 'youth'),
(12, 'Junior Racing Clinic', '', 1, 10, '150', 'youth'),
(13, 'Adult Evening Class Monday', 'Adult Evening Class', 0, 0, '300', 'adult');

-- --------------------------------------------------------

--
-- Table structure for table `sailing_session`
--

CREATE TABLE `sailing_session` (
  `start_date` datetime DEFAULT NULL,
  `id_sailing_session` int(11) NOT NULL AUTO_INCREMENT,
  `id_sailing_program` int(11) NOT NULL,
  `student_limit` int(11) NOT NULL DEFAULT '12',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sailing_session`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `sailing_session`
--

INSERT INTO `sailing_session` (`start_date`, `id_sailing_session`, `id_sailing_program`, `student_limit`, `ts`) VALUES
('2013-07-01 09:00:00', 1, 6, 10, '2013-04-07 01:47:21'),
('2013-07-01 13:00:00', 2, 10, 10, '2013-04-07 02:08:48'),
('2013-07-08 09:00:00', 3, 6, 10, '2013-04-07 01:47:21'),
('2013-07-08 13:00:00', 4, 10, 10, '2013-04-07 02:08:48'),
('2013-07-15 09:00:00', 5, 6, 10, '2013-04-07 01:47:21'),
('2013-07-15 13:00:00', 6, 10, 10, '2013-04-07 02:08:48'),
('2013-07-29 09:00:00', 7, 6, 10, '2013-04-07 01:47:21'),
('2013-07-29 13:00:00', 8, 10, 10, '2013-04-07 02:08:48'),
('2013-08-05 09:00:00', 9, 6, 10, '2013-04-07 01:47:21'),
('2013-08-05 13:00:00', 10, 10, 10, '2013-04-07 02:08:48'),
('2013-08-12 09:00:00', 11, 6, 10, '2013-04-07 01:47:21'),
('2013-08-12 13:00:00', 12, 10, 10, '2013-04-07 02:08:48'),
('2013-08-19 09:00:00', 13, 6, 10, '2013-04-07 01:47:21'),
('2013-08-19 13:00:00', 14, 10, 10, '2013-04-07 02:08:48'),
('2013-07-01 09:00:00', 15, 7, 4, '2013-04-07 01:47:56'),
('2013-07-01 13:00:00', 16, 11, 4, '2013-04-07 02:08:58'),
('2013-07-08 09:00:00', 17, 7, 4, '2013-04-07 01:47:56'),
('2013-07-08 13:00:00', 18, 11, 4, '2013-04-07 02:08:58'),
('2013-07-15 09:00:00', 19, 7, 4, '2013-04-07 01:47:56'),
('2013-07-15 13:00:00', 20, 11, 4, '2013-04-07 02:08:58'),
('2013-07-29 09:00:00', 21, 7, 4, '2013-04-07 01:47:56'),
('2013-07-29 13:00:00', 22, 11, 4, '2013-04-07 02:08:58'),
('2013-08-05 09:00:00', 23, 7, 4, '2013-04-07 01:47:56'),
('2013-08-05 13:00:00', 24, 11, 4, '2013-04-07 02:08:58'),
('2013-08-12 09:00:00', 25, 7, 4, '2013-04-07 01:47:56'),
('2013-08-12 13:00:00', 26, 11, 4, '2013-04-07 02:08:58'),
('2013-08-19 09:00:00', 27, 7, 4, '2013-04-07 01:47:56'),
('2013-08-19 13:00:00', 28, 11, 4, '2013-04-07 02:08:58'),
('2013-07-01 09:00:00', 30, 8, 8, '2013-04-07 01:48:51'),
('2013-07-08 09:00:00', 32, 8, 8, '2013-04-07 01:48:51'),
('2013-07-15 09:00:00', 34, 8, 8, '2013-04-07 01:48:51'),
('2013-07-29 09:00:00', 36, 8, 8, '2013-04-07 01:48:51'),
('2013-08-05 09:00:00', 38, 8, 8, '2013-04-07 01:48:51'),
('2013-08-12 09:00:00', 40, 8, 8, '2013-04-07 01:48:51'),
('2013-08-19 09:00:00', 42, 8, 8, '2013-04-07 01:48:51'),
('2013-07-01 09:00:00', 45, 9, 6, '2013-04-07 01:49:00'),
('2013-07-08 09:00:00', 47, 9, 6, '2013-04-07 01:49:00'),
('2013-07-15 09:00:00', 49, 9, 6, '2013-04-07 01:49:00'),
('2013-07-29 09:00:00', 51, 9, 6, '2013-04-07 01:49:00'),
('2013-08-05 09:00:00', 53, 9, 6, '2013-04-07 01:49:00'),
('2013-08-12 09:00:00', 55, 9, 6, '2013-04-07 01:49:00'),
('2013-08-19 09:00:00', 57, 9, 6, '2013-04-07 01:49:00'),
('2013-07-01 22:33:05', 60, 12, 12, '2013-04-07 02:33:23'),
('2013-07-08 17:37:34', 61, 13, 12, '2013-04-27 21:38:03'),
('2013-07-09 17:37:53', 62, 13, 12, '2013-04-27 21:38:03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `session_detail`
--
CREATE TABLE `session_detail` (
`id_sailing_program` int(11)
,`id_sailing_session` int(11)
,`class_name` varchar(45)
,`class_description` varchar(200)
,`month_name` varchar(9)
,`day_name` int(2)
,`time_of_day` varchar(16)
,`student_limit` int(11)
,`count_student` bigint(21)
,`spaces_left` bigint(22)
,`start_date` datetime
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `session_registration_count`
--
CREATE TABLE `session_registration_count` (
`id_sailing_session` int(11)
,`count_student` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `session_students`
--

CREATE TABLE `session_students` (
  `id_sailing_session` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `u_student_session` (`id_sailing_session`,`id_student`),
  KEY `fk_student` (`id_student`),
  KEY `fk_session` (`id_sailing_session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Linking table between registrations and sessions, This is th';

--
-- Dumping data for table `session_students`
--

INSERT INTO `session_students` (`id_sailing_session`, `id_student`, `ts`) VALUES
(9, 14, '2013-04-07 04:17:24'),
(25, 13, '2013-04-15 16:12:22'),
(38, 13, '2013-04-15 16:12:22'),
(14, 12, '2013-04-15 16:16:17'),
(42, 12, '2013-04-15 16:16:17'),
(26, 14, '2013-04-07 04:17:24'),
(5, 15, '2013-04-07 04:18:47'),
(34, 15, '2013-04-07 04:18:47'),
(5, 17, '2013-04-09 14:13:32'),
(38, 17, '2013-04-09 14:13:32'),
(5, 18, '2013-04-09 15:31:03'),
(38, 18, '2013-04-09 15:31:03'),
(5, 19, '2013-04-09 15:39:22'),
(38, 19, '2013-04-09 15:39:22'),
(5, 20, '2013-04-09 15:40:22'),
(38, 20, '2013-04-09 15:40:22'),
(3, 21, '2013-04-15 16:10:57'),
(21, 21, '2013-04-15 16:10:57'),
(61, 22, '2013-04-27 22:38:15'),
(7, 16, '2013-06-12 16:57:25'),
(36, 16, '2013-06-12 16:57:25'),
(7, 17, '2013-06-12 17:23:50'),
(36, 17, '2013-06-12 17:23:50'),
(7, 18, '2013-06-12 17:25:55'),
(36, 18, '2013-06-12 17:25:55'),
(7, 19, '2013-06-12 18:10:29'),
(36, 19, '2013-06-12 18:10:29'),
(7, 20, '2013-06-12 18:25:13'),
(36, 20, '2013-06-12 18:25:13'),
(7, 21, '2013-06-12 18:30:51'),
(36, 21, '2013-06-12 18:30:51'),
(7, 22, '2013-06-12 18:34:22'),
(36, 22, '2013-06-12 18:34:22'),
(7, 23, '2013-06-12 18:38:08'),
(36, 23, '2013-06-12 18:38:08'),
(10, 24, '2013-06-12 18:41:43'),
(18, 24, '2013-06-12 18:41:43'),
(10, 25, '2013-06-12 18:44:12'),
(18, 25, '2013-06-12 18:44:14'),
(10, 26, '2013-06-12 18:45:51'),
(18, 26, '2013-06-12 18:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) NOT NULL,
  `birth_date` datetime NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `school_grade` int(11) NOT NULL,
  `guardian_one_first_name` varchar(50) DEFAULT NULL,
  `guardian_one_last_name` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `emergency_phone` varchar(500) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `guardian_two_first_name` varchar(45) DEFAULT NULL,
  `guardian_two_last_name` varchar(45) DEFAULT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_student`),
  UNIQUE KEY `U_student_name_birthdate` (`last_name`,`first_name`,`birth_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id_student`, `last_name`, `birth_date`, `address`, `city`, `state`, `zip`, `school_grade`, `guardian_one_first_name`, `guardian_one_last_name`, `phone1`, `phone2`, `email1`, `email2`, `emergency_phone`, `notes`, `first_name`, `guardian_two_first_name`, `guardian_two_last_name`, `paid`, `ts`) VALUES
(12, 'Yarrington', '1971-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 8, 'Paul', 'Yarrington', '9789989412', '9789989412', 'jason@sailsalem.org', 'jason@sailsalem.org', '', '', 'Jason', 'Katherine', 'Yarrington', 1, '2013-06-06 18:19:18'),
(13, 'Yarrington', '1971-02-15 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 8, 'Paul', 'Yarrington', '9789989412', '978-998-9412', 'jason@sailsalem.org', 'jason@sailsalem.org', '9785650111', 'Notes', 'Justin', 'Katherine', 'Yarrington', 0, '2013-06-06 18:19:18'),
(15, 'Grenier', '1971-02-25 00:00:00', '2 Main Street', 'Ipswich', 'MA', '01970', 34, 'Keri', 'Grenier', '9789989412', '9789989412', 'jason@sailsalem.org', 'jason@sailsalem.org', '9789989412', 'New Notes', 'Brianna', 'Joe', 'Grenier', 0, '2013-06-06 18:19:18'),
(16, 'Yarrington', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 16:57:25'),
(17, 'Yarrington5', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 17:23:50'),
(18, 'Yarrington6', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 17:25:55'),
(19, 'Yarrington7', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:10:29'),
(20, 'Yarrington8', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:25:13'),
(21, 'Yarrington9', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:30:51'),
(22, 'Yarrington10', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:34:22'),
(23, 'Yarrington11', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:38:08'),
(24, 'Yarrington12', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:41:43'),
(25, 'Yarrington13', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:44:06'),
(26, 'Yarrington14', '1983-02-25 00:00:00', '12 Gifford Court', 'Salem', 'MA', '01970', 9, 'Paul', 'Yarrington', '978-998-9412', '978-998-9412', 'jason.yarrington@gmail.com', 'jason.yarrington@gmail.com', '', '', 'Jason', 'Other', 'Yarrington', 0, '2013-06-12 18:45:51');

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_detail`
--
CREATE TABLE `student_detail` (
`paid` int(11)
,`first_name` varchar(50)
,`last_name` varchar(100)
,`birth_date` date
,`age` double(17,0)
,`school_grade` int(11)
,`class_name` varchar(45)
,`spaces_left` bigint(22)
,`start_date` date
,`email1` varchar(50)
,`parent first name` varchar(50)
,`parent last name` varchar(50)
,`id_student` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `UserAuthentication`
--

CREATE TABLE `UserAuthentication` (
  `UserAuthenticationID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(25) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(25) CHARACTER SET utf8 NOT NULL,
  `Role` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`UserAuthenticationID`),
  UNIQUE KEY `udx_UserName` (`UserName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `UserAuthentication`
--

INSERT INTO `UserAuthentication` (`UserAuthenticationID`, `UserName`, `Password`, `Role`) VALUES
(1, 'jyarrington', 'harleyhog', 'admin'),
(2, 'dave', 'airodoodle', 'admin'),
(3, 'patty', 'museum', 'admin'),
(4, 'stacy', 'compass', 'admin'),
(7, 'pat', 'read', NULL),
(8, 'bri', 'jboatgirl22', 'admin'),
(9, 'conway', 'conrad', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `wh_registration`
--

CREATE TABLE `wh_registration` (
  `year` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registrationNumber` int(11) DEFAULT NULL,
  `MedicalInformationForm` varchar(30) DEFAULT NULL,
  `studentName` varchar(50) DEFAULT NULL,
  `Age` varchar(10) DEFAULT NULL,
  `BirthDate` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(10) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  `SchoolGrade` varchar(25) DEFAULT NULL,
  `Height` varchar(10) DEFAULT NULL,
  `Weight` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(25) DEFAULT NULL,
  `Mother` varchar(50) DEFAULT NULL,
  `Father` varchar(50) DEFAULT NULL,
  `Phone1` varchar(50) DEFAULT NULL,
  `Phone2` varchar(50) DEFAULT NULL,
  `Email1` varchar(50) DEFAULT NULL,
  `Email2` varchar(50) DEFAULT NULL,
  `PrimaryEmergencyNumber` varchar(500) DEFAULT NULL,
  `TShirtSize` varchar(50) DEFAULT NULL,
  `AssignedSession` varchar(50) DEFAULT NULL,
  `Notes` varchar(500) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `guardian_one_firstname` varchar(255) DEFAULT NULL,
  `guardian_one_lastname` varchar(255) DEFAULT NULL,
  `guardian_two_firstname` varchar(255) DEFAULT NULL,
  `guardian_two_lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `U_Year_RegistrationNumber` (`year`,`registrationNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=752 ;

--
-- Dumping data for table `wh_registration`
--

INSERT INTO `wh_registration` (`year`, `id`, `registrationNumber`, `MedicalInformationForm`, `studentName`, `Age`, `BirthDate`, `Address`, `City`, `State`, `Zip`, `SchoolGrade`, `Height`, `Weight`, `HomePhone`, `Mother`, `Father`, `Phone1`, `Phone2`, `Email1`, `Email2`, `PrimaryEmergencyNumber`, `TShirtSize`, `AssignedSession`, `Notes`, `first_name`, `last_name`, `guardian_one_firstname`, `guardian_one_lastname`, `guardian_two_firstname`, `guardian_two_lastname`) VALUES
(2008, 1, 1, '1', 'Inegust Dyce', '12', '9/27/1995', '139 Marlborough', 'Salem', 'MA', '01970', '5', '5', '???', '??', 'Mary Dyce', '', '(781) 346-2930', '', '', '', '(781) 632-0690', 'yl', 'Jun 23 PM', '   Needs Waiver Signed', 'Inegust', 'Dyce', NULL, NULL, NULL, NULL),
(2008, 2, 2, '1', 'Noah Anderson', '7', '8/20/2000', '14 Flint Street', 'Salem', 'MA', '01970', '3', '48', '50', '(978) 741-7472', 'Julie Anderson', 'Chris Anderson', '(978) 979-2337', '(978) 979-2336', 'cmanderson13@verizon.net', '', '(978) 979-2337', 'yl', 'Jun 30 AM', '   ', 'Noah', 'Anderson', NULL, NULL, NULL, NULL),
(2008, 3, 3, '1', 'Jackson Colehower', '9', '3/22/1999', '8 Fairview Ave.', 'Salem', 'MA', '01970', '3', '54', '70', '(978) 741-8576', 'Susan Colehower', 'Bill', '(978) 729-9104', '(617) 324-3956', 'scolehower@comcast.net', 'wcolehower@comcast.net', '(9787) 299-1094', 'ym', 'Jul 21 PM', 'Called Dave 4/13 requesting afternoons', 'Jackson', 'Colehower', NULL, NULL, NULL, NULL),
(2008, 4, 4, '1', 'Olivia Pawlyk', '10', '1/14/1998', '33 Japanica Street', 'Salem', 'MA', '01970', '4', '59', '108', '(508) 932-9200', 'Alexia Pawlyk', 'Matthew Pawlyk', '(508) 932-9200', '(617) 635-5101', 'mattatamerican@hotmail.com', '', '(978) 468-4666', 'am', 'Aug 11 AM', '   ', 'Olivia', 'Pawlyk', NULL, NULL, NULL, NULL),
(2008, 5, 5, '1', 'Derek Zwiercan', '211', '3/3/1997', '6 Fairmount Street', 'Salem', 'MA', '01970', '5', '??', '82', '(978) 744-7322', 'Pam', 'Richard', '', '', '', '', '(978) 744-7322', 'yl', 'Aug 25 AM', 'Joshua Zwiercan Tim Ryan  Joshua is brother', 'Derek', 'Zwiercan', NULL, NULL, NULL, NULL),
(2008, 6, 6, '1', 'Joshua Zwiercan', '10', '8/17/1998', '6 Fairmount Street', 'Salem', 'MA', '01970', '4', '??', '64', '(978) 744-7322', 'Pam', 'Richard', '', '', '', '', '(978) 744-7322', 'ym', 'Aug 25 AM', 'Derek Zwiercan Tim Ryan  ', 'Joshua', 'Zwiercan', NULL, NULL, NULL, NULL),
(2008, 7, 7, '1', 'Quanah Lawrence', '9', '7/31/1999', '81 Orchard Street', 'Salem', 'MA', '01970', '4', '57', '???', '(978) 744-3837', 'Catherine Michener', 'Joshua Lawrence', '(978) 590-2447', '(978) 744-3837', 'catherine@taiwan-tearchers.com', 'jlaw@bu.edu', '(978) 281-6534', 'ym', 'Aug 11 AM', 'Marina Whitlow Anna hayden Jack McCarthy ', 'Quanah', 'Lawrence', NULL, NULL, NULL, NULL),
(2008, 8, 8, '1', 'Katie Moloney', '9', '7/2/1998', '414 1/2 Lafayette Street', 'Salem', 'MA', '01970', '4', '51', '60', '(978) 740-3834', 'Susan Moloney', 'Mauria Moloney', '(781) 254-9037', '(781) 254-3429', 'suncourt@yahoo.com', '', '(978) 744-2137', 'lm', 'Jul 7 PM', 'Alec Porter   ', 'Katie', 'Moloney', NULL, NULL, NULL, NULL),
(2008, 9, 9, '1', 'Alexander Porter', '9', '5/28/1998', '28 Bertuccio Avenue', 'Salem', 'MA', '01970', '4', '55', '88', '(978) 741-9458', 'Kelly Porter', 'Timothy Porter', '(603) 560-2186', '(603) 560-4680', 'alecsparents@verizon.net', '', '(978) 741-9458', 'yl', 'Jul 7 PM', 'katie moloney   ', 'Alexander', 'Porter', NULL, NULL, NULL, NULL),
(2008, 10, 10, '1', 'Isabel Welch', '8', '11/20/1999', '175 Federal Street', 'Salem', 'MA', '01970', '2', '50', '70', '(978) 740-3250', 'Mary Welch', 'Greg Welch', '(617) 223-6512', '(978) 895-5097', 'jorwelm@verizon.net', '', '(978) 335-1589', 'yl', 'Jun 23 AM', 'Marthias Martinez   ', 'Isabel', 'Welch', NULL, NULL, NULL, NULL),
(2008, 11, 11, '1', 'Mathias Martinez', '8', '4/6/2000', '56 Valiant Way', 'Salem', 'MA', '01970', '2', '??', '70', '(978) 594-5935', 'Milyia', 'Camilo', '(978) 335-1589', '(978) 334-9959', 'milyiaporto@yahoo.com', '', '(617) 223-6512', 'yl', 'Jun 23 AM', 'Isabel Welch   ', 'Mathias', 'Martinez', NULL, NULL, NULL, NULL),
(2008, 12, 12, '1', 'Grace Theriault', '8', '5/16/1999', '1 McKinley Road', 'Salem', 'MA', '01970', '3rd', '52', '85', '(978) 744-1206', 'Cindy Theriault', 'Peter Theriault', '(978) 869-7260', '(978) 740-8304', 'pcterri@comcast.net', '', '(978) 869-7260', 'yxl', 'Jun 23 AM', 'Patrick Cornacchio Madison Borden  ', 'Grace', 'Theriault', NULL, NULL, NULL, NULL),
(2008, 13, 13, '1', 'Jared Robinson', '11', '7/25/1996', '49 Clark  Street', 'Salem', 'MA', '01970', '5', '57', '76', '(978) 745-3236', 'Joyce Robinson', 'John Robinson', '(617) 791-7435', '', '', '', '(978) 745-3236', 'yl', 'Jul 7 PM', '   ', 'Jared', 'Robinson', NULL, NULL, NULL, NULL),
(2008, 14, 14, '1', 'Ian John Clark', '9', '12/2/1998', '3 Skerry St. Court', 'Salem', 'MA', '01970', '4', '48', '100', '(978) 740-9488', 'Gretchen', 'Cameron', '(978) 210-1081', '(978) 210-4123', 'gclark22002@comcast.net', '', '9789223000 ext 2230 or 2239', 'yl', 'Jul 21 AM', 'Aidan Dooley??   ', 'Ian', 'John', NULL, NULL, NULL, NULL),
(2008, 15, 15, '1', 'Peter O''Donnell', '11', '12/1/1996', '25 Woodside Street', 'Salem', 'MA', '01970', '5', '61', '90', '(978) 744-1582', 'Sandy O''Donnell', 'Phil O''Donnell', '(978) 979-6794', '(97) 821-0098', 'sodonn722@aol.com', '', '(978) 210-6098', 'am', 'Jul 7 PM', 'Timmy Ryan Dereck Zwercan  ', 'Peter', 'O''Donnell', NULL, NULL, NULL, NULL),
(2008, 16, 16, '1', 'Timothy Ryan', '11', '10/19/1996', '53 Tremont Street', 'Salem', 'MA', '01970', '5', '54', '82', '(978) 745-6198', 'Susan Ryan', 'Edward Ryan', '(508) 517-5117', '(978) 836-7343', 'setmic@comcast.net', '', '(978) 745-6198', 'as', 'Aug 25 AM', 'Dereck Zwercan Josh Zwercan??  ', 'Timothy', 'Ryan', NULL, NULL, NULL, NULL),
(2008, 17, 17, '1', 'Julia Bott', '11', '1/12/1997', '71 Tremont Street', 'Salem', 'MA', '01970', '5', '???', '???', '(978) 741-1466', 'Shannon Bott', 'Chip Bott', '(978) 375-1953', '(978) 479-4248', 'shannonbott@msn.com', 'chipbott@hotmail.com', '(978) 479-4248', 'ym', 'Jun 23 AM', 'Emily Hernando   ', 'Julia', 'Bott', NULL, NULL, NULL, NULL),
(2008, 18, 18, '1', 'Nathan Silva', '11', '12/2/1996', '166 North Street', 'Salem', 'MA', '01970', '5', '50', '65', '(978) 744-0963', 'Brenda Silva', 'Chris Silva', '(978) 852-3163', '(978) 852-3163', 'vintagebusgirl@yahoo.com', '', '(978) 852-3163', 'yxl', 'Aug 4 AM', 'Noah Silva   Noah is brother', 'Nathan', 'Silva', NULL, NULL, NULL, NULL),
(2008, 19, 19, '1', 'Noah Silva', '8', '9/28/1999', '166 North Street', 'Salem', 'MA', '01970', '2', '48', '50', '(978) 744-0963', 'Brenda Silva', 'Chris Silva', '(978) 852-3163', '(978) 852-3163', 'vintagebusgirl@yahoo.com', '', '(978) 852-3163', 'yl', 'Aug 4 AM', 'Nathan Silva   Nathan is brother', 'Noah', 'Silva', NULL, NULL, NULL, NULL),
(2008, 20, 20, '1', 'Adam Leith', '10', '9/1/1997', '9 Pioneer circle', 'Salem', 'MA', '01970', '4', '48', '60', '(978) 741-3777', 'Moira Leith', 'Toby Leith', '(978) 376-3026', '(978) 764-5950', 'leith3777@comcast.net', 'tleith@globe.com', '(978) 764-5950', 'yl', 'Jun 23 PM', '   ', 'Adam', 'Leith', NULL, NULL, NULL, NULL),
(2008, 21, 21, '1', 'Elizabeth Donahue', '9', '9/25/1998', '90 Summer Street', 'Salem', 'MA', '01970', '3', '54', '65', '(978) 744-5965', 'Rosanna Donahue', 'Johhn Donahue', '(978) 210-2166', '(978) 290-1108', 'rosannadonahue6@hotmail.com', '', '(978) 210-2166', 'ys', 'Jul 7 PM', 'Julia Donahue   Julia is sister.  Need Waiver completed.', 'Elizabeth', 'Donahue', NULL, NULL, NULL, NULL),
(2008, 22, 22, '1', 'Juli Donahue', '11', '3/25/1997', '90 Summer Street', 'Salem', 'MA', '01970', '5', '60', '98', '(978) 744-5965', 'Rosanna Donahue', 'John Donahue', '(978) 210-2166', '(978) 290-1108', 'rosannadonahue6@hotmail.com', '', '(978) 210-2166', 'yl', 'Jul 7 PM', 'Elizabeth Donahue   Elizabeth is sister.  Need waiver signed', 'Juli', 'Donahue', NULL, NULL, NULL, NULL),
(2008, 23, 23, '1', 'Leo Santoro', '9', '2/1/1999', '16 Ravenne Avenue', 'Boston', 'MA', '01970', '4', '54', '60', '(978) 594-0105', 'Zackari Santoro', 'James Santoro', '(617) 529-3254', '(617) 529-3218', 'zackds@comcast.net', 'jsantoro@slexhibits.com', '(617) 529-3218', 'ym', 'Jul 14 AM', '   Need to Check on Address and Parent info.', 'Leo', 'Santoro', NULL, NULL, NULL, NULL),
(2008, 24, 24, '1', 'Sean Harnett', '10', '10/28/1997', '38 Bayview Ave', 'Salem', 'MA', '01970', '4', '???', '???', '(978) 741-0019', 'Lorraine Harnett', 'Richard Harnett', '(508) 662-9735', '(617) 510-9844', 'Lharn@yahoo.com', 'rharn@yahoo.com', '(508) 662-9735', 'ym', 'Jun 23 PM', 'Deidre   Deidre sister  Field trip form allows walking home, but no field trips.', 'Sean', 'Harnett', NULL, NULL, NULL, NULL),
(2008, 25, 25, '1', 'Deirdre Harnett', '14', '5/19/1994', '38 Bayview Ave', 'Salem', 'MA', '01970', '8', '??', '??', '(978) 741-0019', 'Lorraine Harnett', 'Richard Harnett', '(508) 662-9735', '(617) 510-9844', 'lharn@yahoo.com', 'rharn@yahoo.com', '(508) 662-9735', 'ym', 'Jun 23 PM', 'Permission form does not allow field trips but does allow walking home', 'Deirdre', 'Harnett', NULL, NULL, NULL, NULL),
(2008, 26, 26, NULL, 'John O''Leary', '8', '11/6/1999', '137 Fort Avenue', 'Salem', 'MA', '01970', '2', '54', '116', '(978) 744-0345', 'Tracey O''Leary', 'John O''Leary', '(978) 375-3009', '(978) 375-3008', 'troleary@comcast.net', 'fighting-4@comcast.net', '(978) 375-3008', 'yxl', 'Jul 28 AM', '   ', 'John', 'O''Leary', NULL, NULL, NULL, NULL),
(2008, 27, 27, '1', 'Aidan Keenan', '8', '3/5/2181', '6 Manning Street', 'Salem', 'MA', '01970', '2', '55', '72', '(978) 744-7168', 'Kara McLaugh???', 'John Keenan', '(978) 821-1233', '(978) 821-1234', 'karam@thesurveygroup.com', '', '(978) 744-7168', 'yl', 'Jul 21 AM', 'Gabriel Uva   ', 'Aidan', 'Keenan', NULL, NULL, NULL, NULL),
(2008, 28, 28, NULL, 'Timothy Reynolds', '10', '12/15/1997', '66 Proctor Street', 'Salem', 'MA', '01970', '4', '58', '105', '(978) 744-3441', 'Melissa Reynolds', '', '(978) 210-9377', '(617) 886-1375', '', '', '(978) 744-5152', 'as', 'Jun 23 PM', 'Bobby tim  Borthers Bobby and Tim', 'Timothy', 'Reynolds', NULL, NULL, NULL, NULL),
(2008, 29, 29, '1', 'Robert Reynolds', '7', '5/18/2000', '66 Proctor Street', 'Salem', 'MA', '01970', '2', '53', '84', '(978) 744-3441', 'Melissa Reynolds', '', '(617) 886-1375', '(978) 210-9377', 'mlflyrg@aol.com', '', '(978) 744-5152', 'yxl', 'Jun 23 PM', 'Tim Reynolds Sean Reynolds  Brothers Tim and Sean', 'Robert', 'Reynolds', NULL, NULL, NULL, NULL),
(2008, 30, 30, NULL, 'Sean Reynolds', '11', '5/8/1996', '66 Procter Street', 'Salem', 'MA', '01970', '6', '63', '115', '(978) 744-3441', 'melissa Reynolds', '', '(978) 210-9377', '(617) 887-1365', 'mlflyrg@aol.com', '', '(978) 744-5152', 'am', 'Aug 18 AM', '   ', 'Sean', 'Reynolds', NULL, NULL, NULL, NULL),
(2008, 31, 31, '1', 'Madison Borden', '9', '9/10/1998', '7 Berube Road', 'Salem', 'MA', '01970', '4', '', '94', '(978) 745-6201', 'Judith Borden', 'Robert Borden', '(978) 223-2315', '(978) 223-3291', 'rbjb7bb@yahoo.com', '', '(978) 745-6201', 'am', 'Jun 23 AM', 'Grace Theriault   ', 'Madison', 'Borden', NULL, NULL, NULL, NULL),
(2008, 32, 32, NULL, 'Anna  Warnock', '9', '8/30/1998', '18 IndianHill Lane', 'Salem', 'MA', '01970', '4', '52', '80', '', 'Amanda', '', '(781) 592-4725', '', 'awarnock@mailulexus.edu', '', '(978) 744-2329', 'yxl', 'Jun 23 PM', 'Jackson Warnock   Jackson is brother', 'Anna', '', NULL, NULL, NULL, NULL),
(2008, 33, 33, NULL, 'Jackson Warnock', '11', '11/1/1996', '18 Indian Hill Lane', 'Salem', 'MA', '01970', '5', '56', '118', '', 'Amanda Warnock', '', '(781) 592-4725', '', 'awarnock@mail.ulexis.edu', '', '(978) 744-2329', 'am', 'Jun 23 PM', 'Anna Warnock   Sister', 'Jackson', 'Warnock', NULL, NULL, NULL, NULL),
(2008, 34, 34, '1', 'Noah Sax', '10', '8/28/1997', '21 Broad Street', 'Salem', 'MA', '01970', '4', '53', '107', '(978) 744-5474', 'Carol Sax', 'Michael Sax', '(508) 328-0131', '(978) 500-8641', 'simonpig1@msn.com', 'simonpig1@msn.com', '(508) 328-0134', 'am', 'Jul 7 PM', '   ', 'Noah', 'Sax', NULL, NULL, NULL, NULL),
(2008, 35, 35, '1', 'Meghan Maggiacomo', '10', '9/23/1997', '460 Loring Avenue', 'Salem', 'MA', '01970', '4', '53', '80', '(978) 740-5662', 'Elaine Grant', 'Stephen Grant', '(781) 254-0517', '', '', '', '9787408868  9789798892', 'ym', 'Jun 30 AM', 'Jake Weisnberger   Looks like should be in same class as Jake', 'Meghan', 'Maggiacomo', NULL, NULL, NULL, NULL),
(2008, 36, 36, '1', 'Jake Weisenberger', '9', '12/27/1998', '43 Linden Street', 'Salem', 'MA', '01970', '3', '58', '76', '(978) 740-8868', 'Jami Weisenberger', 'Tim Weisenberger', '(978) 979-8892', '(617) 494-3301', 'jamitolbert@gmail.com', '', '7812540517 9787405662', 'YL', 'Jun 30 AM', 'meghan maggiacomo   ', 'Jake', 'Weisenberger', NULL, NULL, NULL, NULL),
(2008, 37, 37, '1', 'Jack McCarthy', '10', '1/2/1998', '153 Bayview Ave', 'Salem', 'MA', '01970', '4', '58', '110', '(978) 744-1759', 'Kathleen McCarthy', 'Robert McCarthy', '(978) 836-7109', '(978) 836-7106', 'robertkmccarthy@verizon.net', '', '(978) 836-7106', 'yxl', 'Jul 28 AM', '   ', 'Jack', 'McCarthy', NULL, NULL, NULL, NULL),
(2008, 38, 38, NULL, 'Russell Grigorian', '12', '12/18/1995', '9 Sutton Ave', 'Salem', 'MA', '01970', '6', '63', '108', '(978) 741-1785', 'Nancy Grigorian', 'Naveg Grigorian', '(978) 979-1834', '(978) 979-1835', 'navegg@comcast.net', 'navegg@comcast.net', '(978) 745-5435', 'am', 'Jul 21 AM', '   Eli is brother', 'Russell', 'Grigorian', NULL, NULL, NULL, NULL),
(2008, 39, 39, NULL, 'Eli Grigorian', '8', '11/1/1999', '9 Sutton Ave', 'Salem', 'MA', '01970', '2', '56', '110', '(978) 741-1785', 'Nancy Grigorian', 'Naveg Grigorian', '(978) 979-1834', '(978) 979-1835', 'navegg@comcast.net', 'navegg@comcast.net', '(978) 745-5435', 'am', 'Jul 21 AM', 'Luce Brandt Kevin O''Shea  ', 'Eli', 'Grigorian', NULL, NULL, NULL, NULL),
(2008, 40, 40, '1', 'Michelle R.  Lemieux', '9', '9/22/1998', '39 Fort Avenue', 'Salem', 'MA', '01970', '3', '50', '60', '(978) 744-5471', 'Lyn-Anne Lemieux', 'Paul Lemieux', '(781) 631-2000', '(781) 994-5000', 'pd1591@msn.com', '', '(978) 744-5471', 'yl', 'Aug 18 AM', 'marc lemieux   Marc - Brother', 'Michelle', 'R.', NULL, NULL, NULL, NULL),
(2008, 41, 41, '1', 'Marc E. Lemieux', '8', '3/19/2000', '39 Fort Ave', 'Salem', 'MA', '01970', '2', '48', '50', '(978) 744-5471', 'Lyn-Anne Lemieux', 'Paul Lemieux', '(781) 631-2000', '(781) 994-5000', 'pd1591@msn.com', '', '(978) 744-5471', 'yl', 'Aug 18 AM', 'michelle lemieux   Sister', 'Marc', 'E.', NULL, NULL, NULL, NULL),
(2008, 42, 42, NULL, 'Mason Nalipinski', '10', '10/31/1997', '6 Broad Street', 'Salem', 'MA', '01970', '4', '60', '100', '(978) 744-5667', 'Paige Nalipinski', 'Mike Nalipinski', '(978) 340-1288', '(617) 680-5469', 'pnalipinski@partners.org', '', '(617) 680-5469', 'am', 'Aug 25 PM', 'Sophia DiPietro   Only Weekof August 25th', 'Mason', 'Nalipinski', NULL, NULL, NULL, NULL),
(2008, 43, 43, '1', 'Tucker Smith', '11', '12/31/1996', '33 Warren Street', 'Salem', 'MA', '01970', '5', '63', '111', '(978) 744-3721', 'Kerrie Smith', 'Jeffrey Smith', '', '', '', '', '(978) 744-3721', 'as', 'Jun 30 AM', '   Hayley - sister', 'Tucker', 'Smith', NULL, NULL, NULL, NULL),
(2008, 44, 44, '1', 'Hayley Smith', '8', '11/24/1999', '33 Warren Street', 'Salem', 'MA', '01970', '2', '45', '63', 'Wrong Number', 'Kerrie Smith', 'Jeffrey Smith', '', '', 'kmacsmith33@comcast.net', '', '(978) 744-3710', 'ym', 'Jun 30 AM', 'Tucker Smith Madison Ballou John Ballou Tucker brother', 'Hayley', 'Smith', NULL, NULL, NULL, NULL),
(2008, 45, 45, '1', 'Madison Ballou', '11', '2/13/1997', '45 Station Road', 'Salem', 'MA', '01970', '5', '60', '86', '', 'Susan M. Ballou', 'Daniel B. Ballou', '(978) 335-1588', '(978) 836-6824', 'sue365-6@msn.com', 'dballou@mccuecorp.com', '(978) 836-6824', 'yl', 'Jun 30 AM', 'Tucker Smith Hayley Smith John Ballou John is brother', 'Madison', 'Ballou', NULL, NULL, NULL, NULL),
(2008, 46, 46, '1', 'John Ballou', '9', '3/20/1999', '45 Station Road', 'Salem', 'MA', '01970', '3', '57', '75', '', 'Susan Ballou', 'Dan Ballou', '(978) 745-6710', '(978) 836-6824', 'sue3656@msn.com', 'dballou@mccuecorp.com', '(978) 836-6824', 'yl', 'Jun 30 AM', 'Madison Ballou Halley Smith Tucker Smith Madison sister', 'John', 'Ballou', NULL, NULL, NULL, NULL),
(2008, 47, 47, '0', 'Anne Mohler', '9', '8/9/1998', '21 Larchmont Road', 'Salem', 'MA', '01970', '4', '52', '60', '(978) 744-7395', 'Janet Mohler', 'David Mohler', '(617) 973-7844', '(978) 744-7395', 'davidmohler@verizon.net', 'janetmohler@verizon.net', '(978) 744-7395', 'ym', 'Aug 4 PM', 'Bridget Mohler   With Sister', 'Anne', 'Mohler', NULL, NULL, NULL, NULL),
(2008, 48, 48, '0', 'Bridget Mohler', '12', '3/4/1996', '21 Larchmont Road', 'Salem', 'MA', '01970', '6', '57', '80', '(978) 744-7395', 'Janet Moheler', 'David Moheler', '(617) 973-7844', '(978) 744-7395', 'davidmohler@verizon.net', 'janetmohler@verizon.net', '(978) 744-7395', 'ym', 'Aug 4 PM', 'Anne Mohler   With Sister', 'Bridget', 'Mohler', NULL, NULL, NULL, NULL),
(2008, 49, 49, '1', 'Isaac Dinallo', '11', '9/19/1996', '112 Linden Street', 'Salem', 'MA', '01970', '5', '58', '95', '(978) 745-8069', 'Suzanne Vincent', 'Michael Dinallo', '', '', 'suzvincent@verizon.net', '', '(978) 745-8069', 'yxl', 'Jul 28 AM', '   ', 'Isaac', 'Dinallo', NULL, NULL, NULL, NULL),
(2008, 50, 50, '1', 'Morgan Grundy', '9', '11/13/1998', '6 North Pine Street', 'Salem', 'MA', '01970', '3', '54', '85', '(978) 744-2547', 'Michelle Grundy', 'Rick Grundy', '', '(617) 510-6344', 'grund6@aol.com', '', '(978) 744-2547', 'yl', 'Aug 4 AM', 'Katie Moloney   ', 'Morgan', 'Grundy', NULL, NULL, NULL, NULL),
(2008, 51, 51, '1', 'Benjamin Phillips', '12', '2/5/1996', '89  Webb Street', 'Salem', 'MA', '01970', '6', '58', '90', '(978) 741-8547', 'Dorothy Phillips', 'William Phillips', '(978) 335-3320', '(978) 927-2364', 'dlphillips2@earthlink.net', '', '9787459500 ext 3018', 'yl', 'Jul 7 AM', '   Should be with Sister Grace', 'Benjamin', 'Phillips', NULL, NULL, NULL, NULL),
(2008, 52, 52, NULL, 'Grace Phillips', '9', '5/11/2008', '89 Webb Street', 'Salem', 'MA', '01970', '4', '52', '70', '(978) 741-8547', 'Dorothy Phillips', 'Williams Phillips', '(978) 335-3320', '9787459500 ext.3018', 'dlphillips2@earthlink.net', '', '(978) 927-2364', 'ym', 'Jul 7 AM', 'Benjamin   Must be with Brother Ben', 'Grace', 'Phillips', NULL, NULL, NULL, NULL),
(2008, 53, 53, '1', 'Victoria Kapantais', '8', '5/11/2000', '23 A Wisteria', 'Salem', 'MA', '01970', '2', '53', '57', '(978) 744-3801', 'Tracy Kapantais', 'Stephen Kapatnais', '(978) 979-2168', '(978) 725-6413', '', '', '(978) 744-3801', 'ys', 'Aug 11 AM', 'alexandra   Must be with Sister Alexandra', 'Victoria', 'Kapantais', NULL, NULL, NULL, NULL),
(2008, 54, 54, '1', 'Alexandra Kapantais', '10', '10/10/1997', '23A Wisteria Street', 'Salem', 'MA', '01970', '4', '56', '63', '(978) 744-3801', 'Tracy Kapantais', 'Stephen Kapantais', '(978) 979-2168', '(978) 725-6413', '', '', '(978) 744-3801', 'ym', 'Aug 11 AM', 'Victoria Kapantas   Must  be with Sister Victoria', 'Alexandra', 'Kapantais', NULL, NULL, NULL, NULL),
(2008, 55, 55, '1', 'Eddie Beaupre', '11', '10/6/1996', '11 Boardman Street', 'Salem', 'MA', '01970', '5', '54', '60', '(978) 745-8541', 'Marie Beaupre', 'Edward Beaupre', '(978) 239-5214', '', 'mebeaupre@aol.com', '', '(978) 745-8541', 'yl', 'Jul 7 PM', 'Nicole LaPointe Peter O''Donnell Nathban Silva Must be with Nicole  LaPointe', 'Eddie', 'Beaupre', NULL, NULL, NULL, NULL),
(2008, 56, 56, '1', 'Nicole LaPointe', '11', '8/5/1996', '', ' Unit 202', 'Salem', 'MA', '01970', '5', '61', '100', '(978) 744-6876', 'Laury LaPointe', 'Marc LaPointe', '(978) 239-0690', '(978) 578-1306', 'laurylapointe@yahoo.com', '(978) 239-0690', 'yxl', 'Jul 7 PM', 'Jul 14 PM', 'Nicole', 'LaPointe', NULL, NULL, NULL, NULL),
(2008, 57, 57, NULL, 'Brittney Boucher', '13', '4/12/1995', 'P.O. Box 508', 'Salem', 'MA', '01970', '6', '62', '90', '(978) 836-2932', 'Tammy Boucher', 'Jeffrey Boucher', '', '', '', '', '(978) 836-2932', 'ym', 'Jul 14 PM', 'Chantelle  Tucker   ', 'Brittney', 'Boucher', NULL, NULL, NULL, NULL),
(2008, 58, 58, NULL, 'Chantelle Tucker', '13', '', '27 Walter Street', 'Salem', 'MA', '01970', '6', '66', '90', '', '', '', '', '', '', '', '', 'ym', 'Jul 14 PM', 'Brittney Boucher   ', 'Chantelle', 'Tucker', NULL, NULL, NULL, NULL),
(2008, 59, 59, '1', 'Rachel Kelleher', '10', '2/21/1998', '53 Larchmont Road', 'Salem', 'MA', '01970', '4', '53', '75', '978-741-3620', 'Patti Kelleher', 'Doug Kelleher', '978-729-7973', '', 'dougkelleher@comcast.net', '', '(978) 973-0084', 'yl', 'Aug 18 AM', 'Amanda Eddy Kelsey O''Connell  ', 'Rachel', 'Kelleher', NULL, NULL, NULL, NULL),
(2008, 60, 60, '1', 'Julia Jermyn', '11', '4/12/1997', '50 Revena Ave', 'Salem', 'MA', '01970', '5', '48', '75', '(978) 746-6777', 'Deborah Jermyn', 'John Jermyn', '(978) 578-1701', '(978) 884-7507', '', '', '9787442799 or 9785004916', 'yxl', 'Jul 14 PM', 'Hannah Cryts Tenley Merett  ', 'Julia', 'Jermyn', NULL, NULL, NULL, NULL),
(2008, 61, 61, '1', 'Tenley Merrett', '10', '2/10/1998', '23 Surrey Road', 'Salem', 'MA', '01970', '4', '57', '70', '(978) 744-3445', 'Angela Merrett', '', '(978) 979-9483', '', '????', '', '(978) 979-9483', 'yxl', 'Aug 11 AM', 'Jackie Muise Hannah Crafts Julia Jermyn ', 'Tenley', 'Merrett', NULL, NULL, NULL, NULL),
(2008, 62, 62, NULL, 'Jacqueline Muise', '9', '6/29/1998', '5 Pershing Road', 'Salem', 'MA', '01970', '4', '48', '59', '(978) 745-4741', 'Nicole Muise', 'Eric Muise', '(617) 605-5305', '(617) 347-3266', 'thegr8pumkin@msn.com', 'e?muise@msn.com', '(617) 605-5305', 'as', 'Aug 11 AM', 'Tenley Merrett hannah Crafts Julia Jermyn ', 'Jacqueline', 'Muise', NULL, NULL, NULL, NULL),
(2008, 63, 63, NULL, 'Luce Brandt', '8', '10/3/1999', '3 Lynn Street', 'Salem', 'MA', '01970', '2', '50', '54', '(978) 744-6004', 'Patti Roka', 'Jeff Brandt', '(978) 210-2124', '(978) 656-3662', 'patrica.roka@verizon.net', 'jbrandt@tresolutions.com', 'as above', 'lm', 'Jul 21 AM', 'eli Gregorian aiden keenan jason hedstrom ', 'Luce', 'Brandt', NULL, NULL, NULL, NULL),
(2008, 64, 64, '1', 'Lisa Robinson', '10', '7/11/1997', '18 Conant Street', 'Salem', 'MA', '01970', '5', '60', '88', '(978) 744-3282', 'Cynthia Robinson', 'John Robinson', '(978) 979-5602', '', 'jrinvictus@yahoo.com', '', '(978) 979-5602', 'yxl', 'Aug 18 AM', 'Amanda Eddy   ', 'Lisa', 'Robinson', NULL, NULL, NULL, NULL),
(2008, 65, 65, NULL, 'Ryan Luby', '7', '7/1/2000', '23 Lemon Street', 'Salem', 'MA', '01970', '2', '', '52', '(978) 745-0703', 'Mrs.  Kaminski', 'Matt Kaminski', '(617) 427-7293', '(978) 745-1948', 'kaminski@gcts.edu', '', '(978) 745-0703', 'ys', 'Jul 21 PM', 'Robert Luby   With Brother', 'Ryan', 'Luby', NULL, NULL, NULL, NULL),
(2008, 66, 66, NULL, 'Robert  Luby', '9', '2/26/1999', '23 Lemon Street', 'Salem', 'MA', '01970', '2', '', '52', '(978) 745-0703', 'Mrs. Kaminski', 'Matt Kaminski', '617-427-7293', '(978) 745-1948', 'kaminski@gcts.edu', '', '(978) 745-0703', 'YS', 'Jul 21 PM', 'Ryan  Luby   Berother', 'Robert', '', NULL, NULL, NULL, NULL),
(2008, 67, 67, NULL, 'Jason Hedstrom', '8', '6/28/1999', '14 Orne Square', 'Salem', 'MA', '01970', '3', '46', '50', '(978) 745-6907', 'Carol Hedstrom', '', '(978) 580-9374', '', 'chornesq@aol.com', '', '(978) 580-9374', 'yl', 'Jul 21 PM', 'Eli Luce Ben Ben is brother', 'Jason', 'Hedstrom', NULL, NULL, NULL, NULL),
(2008, 68, 68, NULL, 'Benjamin Hedstrom', '10', '6/3/1997', '14 Orne Square', 'Salem', 'MA', '01970', '5', '62', '70', '(978) 745-6907', 'Carol Hedstgrom', '', '(978) 580-9374', '', 'Chornesq@aol.com', '', '(978) 580-9374', 'yxl', 'Jul 21 PM', 'Jason Hedstrom Luce Brandt Eli Gregorian Jason is brother', 'Benjamin', 'Hedstrom', NULL, NULL, NULL, NULL),
(2008, 69, 69, '1', 'Patrick Luddy', '11', '9/16/1996', '4 BiBaise Street', 'Salem', 'MA', '01970', '5', '60', '80', '(978) 744-1888', 'Caroline Luddy', 'Sean Luddy', '(508) 527-1750', '(978) 265-5737', 'a3ringcircus@comcast.net', '', '9787441888   9782655737', 'yl', 'Jul 7 AM', 'Rachel Luddy Alyssa Flynn  ', 'Patrick', 'Luddy', NULL, NULL, NULL, NULL),
(2008, 70, 70, '1', 'Rachel Luddy', '8', '5/4/1999', '4 Dibiase Street', 'Salem', 'MA', '01970', '3', '56', '65', '(978) 744-1888', 'CarolineLuddy', 'Sean Luddy', '(508) 527-1750', '(978) 265-5737', 'a3ringcircus@comcast.net', '', '9787441888 or 9787410424', 'yl', 'Jul 7 AM', 'fear of being alone in small sailboat.  Alyssa Flynn Patrick Luddy  ', 'Rachel', 'Luddy', NULL, NULL, NULL, NULL),
(2008, 71, 71, '1', 'Alyssa Flynn', '8', '7/21/1999', '42 Sable Road', 'Salem', 'MA', '01970', '3', '56', '68', '(978) 740-1353', 'Gretchen Flynn', 'gtimothy Flynn', '(978) 836-0019', '(978) 836-0017', 'gigiliane77@comcast.net', '9788360017', 'yl', 'jul7am', 'Jul 7 AM', 'Rachel Luddy Patrick Luddy  ', 'Alyssa', 'Flynn', NULL, NULL, NULL, NULL),
(2008, 72, 72, '1', 'Connor Mackey', '7', '9/13/2000', '2 Sunset Road', 'Salem', 'MA', '01970', '2', '', '50', '(978) 741-1511', 'Brenda Mackey', 'David Mackey', '(978) 423-9992', '(978) 578-0167', 'Brenda.mackey@danversbank.com', 'dtmackey@gmail.com', '(978) 578-0167', 'ys', 'Jul 14 AM', '   ', 'Connor', 'Mackey', NULL, NULL, NULL, NULL),
(2008, 73, 73, '1', 'Emily Hernando', '10', '5/6/1997', '91 Proctor Street', 'Salem', 'MA', '01970', '5', '???', '83', '(978) 744-4122', 'Theresa', 'Mark', '(978) 590-7748', '(978) 210-5575', 'thernando@comcast.net', 'mkhernando@comcast.net', '(978) 210-5575', 'ym', 'Jun 23 AM', 'Julia Bott   ', 'Emily', 'Hernando', NULL, NULL, NULL, NULL),
(2008, 74, 74, NULL, 'Amanda Eddy', '10', '11/11/1997', '11 Pope Street', 'Salem', 'MA', '01970', '4', '63', '73', '(978) 745-9236', 'Robin Eddy', 'Jonathan Eddy', '(978) 335-3596', '(978) 335-1009', 'robinceddy@verizon.net', 'jeddy5367@verizon.net', '(978) 745-9236', 'yl', 'Aug 18 AM', 'Lisa  Robinson Rachel  Kelleher  ', 'Amanda', 'Eddy', NULL, NULL, NULL, NULL),
(2008, 75, 75, NULL, 'Madelyn Thompson', '7', '5/14/2000', '5 Orchard Street', 'Salem', 'MA', '01970', '2', '48', '50', '(978) 745-7790', 'Monica', 'Tom', '(978) 337-2227', '(978) 979-8670', 'montomcolmad@verizon.net', '', '9783149942 - ami', 'lm', 'Aug 4 AM', 'Noah and Nate Silva Matthew O''Connell Colin Thompson Colin is brother', 'Madelyn', 'Thompson', NULL, NULL, NULL, NULL),
(2008, 76, 76, NULL, 'Colin Thompson', '9', '7/3/1998', '5 Orchard Street', 'Salem', 'MA', '01970', '4', '58', '75', '(978) 745-7790', 'Monica', 'Tom', '(978) 337-2227', '(978) 979-8670', 'montonicolmad@verizon.net', '', '978-3149942 - ami', 'yl', 'Aug 4 AM', 'Noah andNate Silva Matthew O''Connell Madelyn Thompson Madelyn - sister.', 'Colin', 'Thompson', NULL, NULL, NULL, NULL),
(2008, 77, 77, NULL, 'Maeve Murphy', '8', '5/28/1999', '31 Warren Street', 'Salem', 'MA', '01970', '3', '54', '60', '(978) 745-6327', 'Sarah Murphy', 'Matt Murphy', '(978) 314-5352', '(617) 331-3510', 'sarahmorrill@comcast.net', 'memurphy66@yahoo.com', '(978) 314-5352', 'yl', 'Jul 21 AM', 'Jason Hedstrom Luce Brandt Aiden Keenan ', 'Maeve', 'Murphy', NULL, NULL, NULL, NULL),
(2008, 78, 78, '1', 'Dylan Cook', '13', '5/19/1994', '13 Beacon Street', 'Salem', 'MA', '01970', '8', '60', '100', '(978) 594-5309', 'Kelly Cook', '', '(978) 335-8511', '7816316000 ext. 249', 'kcook@ngbank.com', '', '(978) 335-8511', 'am', 'Jul 14 PM', 'Alexandria Cook   Alex is sister.  Also note he''s in 8th grade', 'Dylan', 'Cook', NULL, NULL, NULL, NULL),
(2008, 79, 79, '1', 'Alexandria Cook', '11', '5/9/1996', '13 Beacon Street', 'Salem', 'MA', '01970', '6', '54', '57', '(978) 594-5309', 'Kelly Cook', '', '(978) 335-8511', '7816316000 ext 249', 'kcook@ngbank.com', '', '(978) 335-8511', 'yl', 'Jul 14 PM', 'Dylan Cook   Dylan is brother', 'Alexandria', 'Cook', NULL, NULL, NULL, NULL),
(2008, 80, 80, NULL, 'Mathew O''Connell', '10', '12/5/1997', '22 Orchard street', 'Salem', 'MA', '01970', '5', '"4''11"""', '110', '(978) 594-0067', 'Kathy', 'Charlie', '(978) 397-4946', '', '', '', '(978) 397-4946', 'YXL', 'Aug 18 AM', '"Colin Thompson', 'Mathew', 'O''Connell', NULL, NULL, NULL, NULL),
(2008, 81, 81, '1', 'Stephen Jacobs', '8', '4/15/2000', '38 Orne Street', 'Salem', 'MA', '01970', '2', '', '43', '(978) 744-6744', 'Sharon Gardner', 'Thomas Jacobs', '(978) 502-7999', '(617) 413-2638', '', 'tjacobs@alum.mit.edu', '(978) 744-6744', 'YS', 'Jul 14 AM', '"   Jul 21 PM', 'Stephen', 'Jacobs', NULL, NULL, NULL, NULL),
(2008, 82, 82, NULL, 'Temujin Frost', '9', '8/12/1998', '"3 Orange Street', ' #1"', 'Salem', 'MA', '01970', '3', '"4''5"""', '95', '594-1853', 'Elizabeth', 'Jason', '(206) 501-1495', '', 'temujinsmom@yahoo.com', '', 'YL', 'Jul 14 AM', '', 'Temujin', 'Frost', NULL, NULL, NULL, NULL),
(2008, 83, 83, '1', 'Kevin O''Shea', '8', '5/19/1999', '15 Winter Island Road', 'Salem', 'MA', '01970', '3', '', '83', '(978) 745-0250', 'Anne O''Shea', 'Paul O''Shea', '(508) 277-7029', '', 'p.pauloshea@comcast.net', '', '(978) 745-0250', 'YL', 'Jul 7 AM', 'Eli Gregorian   ', 'Kevin', 'O''Shea', NULL, NULL, NULL, NULL),
(2008, 84, 84, '1', 'Hannah Crafts', '11', '11/7/1996', '3 Gallows Circle', 'Salem', 'MA', '01970', '5', '"4''8"""', '70', '(978) 744-2799', 'Lisa Lyrah', 'Mike Crafts', '(978) 500-4916', '(781) 258-5592', '', '', '', '', 'Jul 14 PM', '', 'Hannah', 'Crafts', NULL, NULL, NULL, NULL),
(2008, 85, 85, '1', 'Mikaela Dionne', '10', '5/31/1997', '24 Sable Road', 'Salem', 'MA', '01970', '5', '"4''8"""', '72', '(978) 745-5330', 'Lisa Dione', 'Alan Dionne', '', '', '', '', '', '', 'Aug 11 AM', '', 'Mikaela', 'Dionne', NULL, NULL, NULL, NULL),
(2008, 86, 86, NULL, 'Jonah Levin', '10', '2/17/1998', '232 Lafayette Street', 'Salem', 'MA', '01970', '4', '"5''1"""', '80', '(978) 745-2385', 'Karen Levin', 'Lee Levin', '(978) 979-3301', '(978) 979-3302', '', '', '(978) 745-2385', 'YL', 'Jul 28 PM', '   ', 'Jonah', 'Levin', NULL, NULL, NULL, NULL),
(2008, 87, 87, NULL, 'John Kraft', '11', '7/24/1996', '140 Federal Street', 'Salem', 'MA', '01970', '5', '', '', '(978) 744-0388', 'Stacia', 'Michael', '(978) 744-0388', '(978) 283-1932', 'sm.kraft@verizon.net', 'michaelkraft@cbfisk.com', '(978) 744-0388', 'YL', 'Aug 18 AM', 'Ilsa Kraft   ', 'John', 'Kraft', NULL, NULL, NULL, NULL),
(2008, 88, 88, NULL, 'Ilsa Kraft', '8', '5/5/1999', '140 Federal Street', 'Salem', 'MA', '01970', '3', '4''', '', '(978) 744-0358', 'Staccia Kraft', 'Michael Kraft', '(978) 744-0388', '(978) 283-1932', 'sm.kraft@verizon.net', 'micahelkraft@cbfisk.com', '(978) 744-0388', 'YM', 'Aug 18 AM', 'John Kraft   ', 'Ilsa', 'Kraft', NULL, NULL, NULL, NULL),
(2008, 89, 89, '1', 'Anastacia Stefanski', '8', '12/26/1999', '15 Boardman Street', 'Salem', 'MA', '01970', '2', '24-Feb', '75', '(978) 741-8575', 'Susan Stefanski', 'Mark Stefanski', '(978) 821-8034', '(978) 821-8035', 'sustefanski@comcast.net', '', '(978) 741-8575', 'YL', 'Aug 25 AM', '   ', 'Anastacia', 'Stefanski', NULL, NULL, NULL, NULL),
(2008, 90, 90, NULL, 'Laura Sawin', '9', '12/4/1998', '20 Kosciusko Street', 'Salem', 'MA', '01970', '3', '4''10', '119', '(978) 852-0979', 'Nancy', 'Rob', '(978) 852-0979', '(978) 835-2190', 'nsawin@verizon.net', 'rsawin@verizon.net', '(978) 852-0979', 'AM', 'Aug 25 AM', '', 'Laura', 'Sawin', NULL, NULL, NULL, NULL),
(2008, 91, 91, NULL, 'Andrew Lussler', '10', '7/13/1997', '7 Bentley Street', 'Salem', 'MA', '01970', '5', '"4''7"""', '80', '(978) 745-6989', 'Jennifer', 'Mark', '(978) 621-9946', '(617) 828-2715', 'lussier_jennifer@hotmail.com', 'mark.lussier@verizon.net', '(978) 621-9946', 'YXL', 'Aug 4 AM', '   ', 'Andrew', 'Lussler', NULL, NULL, NULL, NULL),
(2008, 92, 92, '1', 'Sophia Blake', '8', '8/28/1999', '38 Dearborn Street', 'Salem', 'MA', '01970', '3', '"4''6"""', '66', '(978) 745-6588', 'Wendy Blake', 'Douglas Blake', '(978) 337-3097', '(978) 697-3551', 'wblake555@msn.com', '', '(978) 337-3097', 'YL', 'Jul 28 PM', '   ', 'Sophia', 'Blake', NULL, NULL, NULL, NULL),
(2008, 93, 93, NULL, 'Leo P. Smart', '10', '3/20/1998', '57 Appleton Street', 'Salem', 'MA', '01970', '5', '5''', '70', '(978) 741-4024', 'Karen Smart', 'Andrew Smart', '(508) 566-5591', '', 'wesmart5@earthlink.com', '', '(978) 741-4024', 'YM', 'Aug 18 PM', '   ', 'Leo', 'P.', NULL, NULL, NULL, NULL),
(2008, 94, 94, NULL, 'Aaron Smart', '10', '3/20/1998', '57 Appleton Street', 'Salem', 'MA', '01970', '5', '5''', '70', '(978) 741-4024', 'Karen Smart', 'Andrew Smart', '(508) 566-5591', '', 'wesmart5@earthlink.com', '', '', 'YM', 'Aug 18 PM', '   ', 'Aaron', 'Smart', NULL, NULL, NULL, NULL),
(2008, 95, 95, '1', 'Jonathon J. Rodriguez', '8', '1/7/2000', '18 Crombie Street', 'Salem', 'MA', '01970', '2', '', '72', '(978) 740-9170', 'Roberta Hussey', 'Raul Rodriquez', '(978) 744-0351', '(978) 210-2844', '', '', '(978) 210-2844', 'YM', 'Jul 28 PM', '   ', 'Jonathon', 'J.', NULL, NULL, NULL, NULL),
(2008, 96, 96, '1', 'Angelina Gaggiano', '8', '3/24/2000', '14 Patton Road', 'Salem', 'MA', '01970', '2', '', '63', '(978) 744-5509', 'Diane', 'Michael', '(508) 641-6192', '(508) 641-1988', 'dacagg@yahoo.com', 'mike@michaelcaggiano.com', '(508) 641-1988', 'YM', 'Jul 7 AM', 'Andrew Clark   ', 'Angelina', 'Gaggiano', NULL, NULL, NULL, NULL),
(2008, 97, 97, '0', 'Eli Spector', '11', '11/1/1996', '8 Horton Street', 'Salem', 'MA', '01970', '5', '', '80', '(978) 745-6938', 'Lori', 'Bob', '(978) 210-4186', '(978) 745-6938', 'jeets123@aol.com', '', '(978) 210-1913', 'AS', 'Aug 18 AM', 'Matt Jalbert and Nick Holt   ', 'Eli', 'Spector', NULL, NULL, NULL, NULL),
(2008, 98, 98, NULL, 'Nick Holt', '11', '1/1/1997', '80 Wilson Street', 'Salem', 'MA', '01970', '5', '"4''9"""', '75', '', 'Lyn', 'Kevin', '(978) 744-2871', '(978) 360-8338', '', '', '(978) 210-4186', 'AM', 'Withdrew', 'Eli Spector and Matt Jalbert   ', 'Nick', 'Holt', NULL, NULL, NULL, NULL),
(2008, 99, 99, '0', 'Adam Ngo', '11', '12/17/1996', '1 Clarke Ave', 'Salem', 'MA', '01970', '5', '', '85', '(978) 745-2278', 'Deb', 'Bao', '(978) 527-5174', '', '', '', '', 'AM', 'Aug 18 AM', '', 'Adam', 'Ngo', NULL, NULL, NULL, NULL),
(2008, 100, 100, '0', 'Matt Jalbert', '11', '11/30/1996', '38 Phillips Street', 'Salem', 'MA', '01970', '5', '', '75', '', 'Kim', 'Scott', '(978) 741-2538', '(508) 527-3748', '', '', '', 'AM', 'Aug 18 AM', 'Eli Spector and Nick Holt   ', 'Matt', 'Jalbert', NULL, NULL, NULL, NULL),
(2008, 101, 101, NULL, 'Paul Lazzaro', '10', '4/6/1998', '7 Kmball Street', 'Salem', 'MA', '01970', '4', '"4''8"""', '72', '(978) 869-5768', 'Barbara', 'Paul', '(978) 884-2301', '(978) 869-5768', 'lazzgal@comcast.net', 'pslazz@aol.com', '(978) 884-2301', 'YXL', 'Aug 4 AM', '"Shyla Smith', 'Paul', 'Lazzaro', NULL, NULL, NULL, NULL),
(2008, 102, 102, NULL, 'Gyana S Kendrick', '9', '8/1/1998', '"36 Buffum Street', ' 1st floor"', 'Salem', 'MA', '01970', '3', '"5''5"""', '110', '(978) 744-1576', 'Monica Kendrick', 'David Kendrick', '(978) 304-5804', '(978) 735-0954', '', '(978) 745-4062', 'YXL', 'Aug 4 AM', '', 'Gyana', 'S', NULL, NULL, NULL, NULL),
(2008, 103, 103, NULL, 'Emily E. Wright', '10', '6/23/1997', '"23 River Street', ' Apt 1"', 'Salem', 'MA', '01970', '4', '"5''4"""', '105', '(978) 745-4062', 'Annette Wright', 'Jamie Wright', '(978) 843-6116', '', '', '9785322860 Grandmother Diane Lane', 'YL', 'Aug 4 AM', '', 'Emily', 'E.', NULL, NULL, NULL, NULL),
(2008, 104, 104, '1', 'Samantha Claveau', '11', '11/5/1996', '115 Leach Street', 'Salem', 'MA', '01970', '5', '', '83', '(978) 741-3132', 'Ellen Claveau', 'Jeremy Calveau', '(978) 869-6933', '(978) 590-8850', 'elclaveu@yahoo.com', '', '(978) 590-8850', 'AS', 'Jul 21 AM', '   ', 'Samantha', 'Claveau', NULL, NULL, NULL, NULL),
(2008, 105, 105, '1', 'Justice Gallo', '7', '6/12/2000', '9 C Fillmore Road', 'Salem', 'MA', '01970', '2', '', '50', '(978) 744-3803', 'Isabel Gallo', 'Jeffrey Gallo', '(978) 223-8609', '(978) 745-9500', 'issyzzissy@yahoo.com', '', '(978) 223-8609', 'YS', 'Jul 14 PM', '   ', 'Justice', 'Gallo', NULL, NULL, NULL, NULL),
(2008, 106, 106, NULL, 'Colin Nye', '10', '5/19/1998', '5 Shore Ave', 'Salem', 'MA', '01970', '4', '"4''9"""', '89', '(978) 744-1358', 'Caroline Nye', 'Rick Nye', '(978) 758-1378', '(781) 631-1248', 'nyecc@yahoo.com', 'ricknye2003@yahoo.com', '(781) 631-4599', 'YL', 'Jul 28 PM', 'Dan Pini   ', 'Colin', 'Nye', NULL, NULL, NULL, NULL),
(2008, 107, 107, '1', 'Thomas Vosseler', '9', '4/7/1999', '15 Mt Vernon Street', 'Salem', 'MA', '01970', '3', '21-Feb', '53', '(978) 741-2507', 'Doris-Ann Vosseler', 'Bryan Vosseler', '(978) 210-1047', '(978) 210-1657', 'davosseler@yahoo.com', 'ecvbry@aol.com', '', 'YM', 'Jul 21 PM', '   ', 'Thomas', 'Vosseler', NULL, NULL, NULL, NULL),
(2008, 108, 108, '1', 'Gabriel Uva', '8', '9/23/1999', '40 Felt Street', 'Salem', 'MA', '01970', '2', '"4''4"""', '95', '(978) 745-8174', 'Mariflor Uva', 'Scott Uva', '(978) 500-7809', '(978) 500-7808', 'mariflor_uva@yahoo.com', 'scott_uva@hms.harvard.edu', '7813674879  Aunt Jamie', 'YL', 'Jul 21 AM', 'Aidan Keenan   ', 'Gabriel', 'Uva', NULL, NULL, NULL, NULL),
(2008, 109, 109, '1', 'Bailey Roffman', '9', '7/22/1998', '31 Fairmount Street', 'Salem', 'MA', '01970', '4', '4''10', '70', '(978) 853-1157', 'Christina', '', '(978) 977-6423', '', 'Christina.roffman@marriott.com', '', '9788531157 or 9785906415', 'YL', 'Jun 23 PM', 'Ryan Amyot and Bailey Roffman (share ride and daycare hours together)   ', 'Bailey', 'Roffman', NULL, NULL, NULL, NULL),
(2008, 110, 110, '1', 'Ryan Amyet', '10', '2/3/1998', '41 B Northey Street', 'Salem', 'MA', '01970', '4', '', '82', '(978) 594-5022', 'Paula Amyet', '', '(207) 450-8490', '', 'pjasophia@yahoo.com', '', '(978) 927-4980', 'YXL', 'Jun 23 PM', 'Bailey Roffman and Ryan Amyet (we share rides)   ', 'Ryan', 'Amyet', NULL, NULL, NULL, NULL),
(2008, 111, 111, '1', 'Owen', '8', '8/9/1999', '18 Patton Road', 'Salem', 'MA', '01970', '3', '"5''2"""', '80', '(978) 741-8702', 'Kelly', 'Michael', '(508) 843-6036', '(617) 838-9860', 'kc8702@aol.com', '', 'Kelly -- 5088436036', 'AL', 'Jul 28 AM', 'Sammy and Kevin   ', 'Owen', '', NULL, NULL, NULL, NULL),
(2008, 112, 112, '1', 'Sammy Clyne', '10', '6/23/1997', '18 Patton Road', 'Salem', 'MA', '01970', '5', '', '110', '(978) 741-8702', 'Kelly', 'Michael', '(508) 843-6036', '(617) 838-9860', 'kc8702@aol.com', '', 'Kelly -- 5088436036', 'AL', 'Jul 28 AM', 'Owen and Kevin   ', 'Sammy', 'Clyne', NULL, NULL, NULL, NULL),
(2008, 113, 113, '1', 'Kevin Clyne', '11', '7/13/1996', '18 Patton Road', 'Salem', 'MA', '01970', '6', '', '102 (120?0', '(978) 741-8702', 'Kelly', 'Michael', '(508) 843-6036', '(617) 838-9860', 'kc8702@aol.com', '', 'Kelly -- 5088436036', 'AL', 'Jul 28 AM', 'Sammy and Owen Clyne (brothers)   Might be too big for the kids program', 'Kevin', 'Clyne', NULL, NULL, NULL, NULL),
(2008, 114, 114, NULL, 'Zachariah Brown', '11', '3/15/1997', '57 Hancock Street', 'Salem', 'MA', '01970', '5', '"5''3"""', '100', '(978) 745-5586', 'Julie Pottier-Brown', 'Bill Brown', '(978) 304-2627', '(978) 745-5586', 'julieapb@verizon.net', 'bill.brown@state.ma.us', '(617) 722-1572', '', 'Jul 14 AM', 'Benjamin Brown -- Brother   ', 'Zachariah', 'Brown', NULL, NULL, NULL, NULL),
(2008, 115, 115, NULL, 'Benjamin Brown', '9', '1/31/1999', '57 Hancock Street', 'Salem', 'MA', '01970', '3', '"56"""', '69', '(978) 745-5586', 'Julie Pottier-Brown', 'Bill Brown', '(978) 304-2627', '(617) 722-1572', 'julieapb@verizon.net', 'bill.brown@state.ma.us', '(978) 745-5586', 'YM', 'Jul 14 AM', 'Zachariah Brown -- Brother   ', 'Benjamin', 'Brown', NULL, NULL, NULL, NULL),
(2008, 116, 116, '1', 'Mathew Eddows', '8', '9/20/1999', '7 Wheatland Street', 'Salem', 'MA', '01970', '2', '', '61', '(978) 745-0121', 'Donna Eddows', 'Doug Eddows', '(978) 210-4376', '(978) 750-0990', 'don11565@aol.com', 'eddows4@aol.com', '9787450121 Donna Home   9785318020  Bill Kelly grandfather', 'YM', 'Jul 21 AM', '   ', 'Mathew', 'Eddows', NULL, NULL, NULL, NULL),
(2008, 117, 117, '1', 'Danielle Viselli', '9', '2/26/1999', '26 Phelps Street', 'Salem', 'MA', '01970', '3', '"4''4"""', '65', '(978) 944-2205', '', 'Ernest', '', '(978) 944-2205', '', '', '(978) 317-9413', 'YL', 'Aug 4 AM', '"Shyla Smith (must be with)', 'Danielle', 'Viselli', NULL, NULL, NULL, NULL),
(2008, 118, 118, '1', 'Shyla Smith', '9', '8/9/1998', '1 Carol Way #306', 'Salem', 'MA', '01970', '4', '"4''9"""', '120', '(978) 744-5013', 'Susan', 'Paul', '(978) 317-9413', '(978) 239-9048', 'shylanmom@aol.com', '', '(978) 317-9413', 'AM', 'Aug 4 AM', '"Danielle Viselli (must be with)', 'Shyla', 'Smith', NULL, NULL, NULL, NULL),
(2008, 119, 119, '1', 'Jackson Hayward', '7', '1/8/2001', '105 Federal Street', 'Salem', 'MA', '01970', '1', '', '55', '(978) 741-7804', 'Susan', 'Robert', '(978) 239-3078', '(781) 929-9556', 'hayward32@verizon.net', '', '(978) 239-3078', 'YL', 'Jul 14 AM', 'Connor Mackey   ', 'Jackson', 'Hayward', NULL, NULL, NULL, NULL),
(2008, 120, 120, '1', 'Troy Welling', '8', '11/20/1999', '17 Bertuccio Ave', 'Salem', 'MA ', '01970', '2', '"4''3"""', '70', '(978) 741-2245', 'Audrey Welling', 'Kurt Welling', '(978) 979-5407', '(978) 744-8600', 'homedirt1313@comcast.net', 'awelling@jacquelinesbakery.com', '(978) 979-5407', 'YXL', 'Aug 25 AM', 'Ben Welling (Brother)   ', 'Troy', 'Welling', NULL, NULL, NULL, NULL),
(2008, 121, 121, '1', 'Ben Welling', '10', '5/5/1997', '17 Bertuccio Ave', 'Salem', 'MA', '01970', '5', '"4''5"""', '75', '(978) 741-2245', 'Audrey Welling', 'Kurt Welling', '(978) 979-5407', '(978) 744-8600', 'homedirt1313@comcast.net', 'awelling@jacquelinesbakery.com', '(978) 979-5407', 'YXL', 'Aug 25 AM', 'Troy Welling (Brother)   ', 'Ben', 'Welling', NULL, NULL, NULL, NULL),
(2008, 122, 122, '0', 'Devin Pinkham', '9', '5/13/1998', '86 Flint Street', 'Salem', 'MA', '01970', '4', '', '60', '(978) 594-1124', 'Shannon', 'Bruce', '(978) 500-6154', '(978) 922-9097', 'spinkham@comcast.net', '', '(978) 500-6154', 'YM', 'Aug 11 PM', '   ', 'Devin', 'Pinkham', NULL, NULL, NULL, NULL),
(2008, 123, 123, '1', 'Andrew Schatz', '13', '10/25/1994', '3B Stillwell Drive', 'Salem', 'MA', '01970', '7', '1-May', '103', '(978) 744-4246', 'Joyce Levenson ', '', '(978) 774-6820', '(978) 618-2575', 'levinsonje@verizon.net', '', '(978) 618-2575', 'SA', 'Jul 21 AM', 'Russell Gragorian   ', 'Andrew', 'Schatz', NULL, NULL, NULL, NULL),
(2008, 124, 124, '1', 'Eve Smith ', '8', '8/11/1999', '6 Witch Hill Road', 'Salem', 'Ma', '01970', '3', '55', '85', '(978) 744-6952', 'Jane Morrisey', 'Chris Smith', '(508) 932-7300', '(781) 593-5505', 'jane.morrisey@comcast.net', '', '(508) 932-7300', '', 'Jun 30 AM', 'Mae Viccica   ', 'Eve', 'Smith', NULL, NULL, NULL, NULL),
(2008, 125, 125, NULL, 'mae viccica', '8', '6/28/1999', '35 Broad St', 'Salem ', 'MA', '01970', '3', '52', '75', '(978) 741-1643', 'Helen Sides', 'Paul Viccica', '(978) 337-0963', '(978) 886-7066', 'sidesvic@msn.com', '', '(978) 741-1643', 'ym', 'Jun 30 AM', 'Eve Smith    ', 'mae', 'viccica', NULL, NULL, NULL, NULL),
(2008, 126, 126, NULL, 'Dan Pini', '10', '4/20/1998', '26 Symonds Street', 'Salem', 'MA', '01970', '4', '', '100', '(978) 745-2579', 'Tricia Pini', 'Doug Pini', '(978) 239-8179', '(978) 239-8182', 'ppini01@northshore.edu', '', '(978) 239-8179', 'AM', 'Aug 11 AM', '"Clyne Boys', 'Dan', 'Pini', NULL, NULL, NULL, NULL),
(2008, 127, 127, NULL, 'Jacob Pini', '8', '1/31/2000', '26 Symonds Street', 'Salem', 'MA', '01970', '2', '', '95', '(978) 745-2579', 'Tricia Pini', 'Doug Pini', '(978) 239-8179', '(978) 239-8182', 'ppini01@northshore.edu', '', '(978) 239-8179', 'AM', 'Aug 11 AM', '"Clyne Boys', 'Jacob', 'Pini', NULL, NULL, NULL, NULL),
(2008, 128, 128, NULL, 'Andrew Boucher', '9', '6/2/1998', '2 Lillian Road', 'Salem', 'MA', '01970', '4', '4''', '80', '(978) 745-0599', 'Pamela Ahmed Boucher', 'Keith Boucher', '(978) 975-8800', '(978) 766-6412', 'pam@ahmeilinsurance.com', '', '(978) 766-1093', 'YL', 'Jul 28 PM', '   ', 'Andrew', 'Boucher', NULL, NULL, NULL, NULL),
(2008, 129, 129, '1', 'Joseph McGonigal', '12', '7/13/1995', '32 Barston Street', 'Salem', 'MA', '01970', '7', '', '100', '(978) 740-1813', 'Liza J. Sovie', 'Michael Sovie', '(978) 771-4666', '(978) 771-6093', 'sovie@verizon.net', '', '(978) 771-4666', 'AM', 'Jun 30 AM', '   ', 'Joseph', 'McGonigal', NULL, NULL, NULL, NULL),
(2008, 130, 130, '1', 'Jacob Barz-Snell', '9', '2/4/1999', '7 West Terrace', 'Salem', 'MA', '01970', '3', '', '76', '(978) 740-9720', 'Jennifer', 'Jeffrey', '(978) 729-5204', '(978) 729-8008', 'jenniferbarz@comcast.net', 'jeffreysnell@comcast.net', '(978) 740-9720', 'Jun 23 PM', 'Jun 23 AM', 'Handwritten swim form', 'Jacob', 'Barz-Snell', NULL, NULL, NULL, NULL),
(2008, 131, 131, NULL, 'Alish Driscoll', '7', '7/7/2000', '16 Glenn Avenue', 'Salem', 'MA', '01970', '2', '4''', '85', '(978) 740-3137', 'Kim Driscoll', 'Nick Driscoll', '(978) 500-8562', '(978) 985-1549', 'kdriscoll@salem.com', '', '(978) 500-8562', 'YL', 'Aug 18 PM', 'Delaney Driscoll   ', 'Alish', 'Driscoll', NULL, NULL, NULL, NULL),
(2008, 132, 132, NULL, 'Delaney Driscoll', '10', '8/11/1997', '16 Glenn Ave', 'Salem', 'MA', '01970', '5', '"4''6"""', '95', '(978) 740-3137', 'Kim Driscoll', 'Nick Driscoll', '(978) 500-8562', '(978) 985-1549', 'kdriscoll@salem.com', '', '(978) 500-8562', 'YXL', 'Aug 18 PM', 'Alish Driscoll   ', 'Delaney', 'Driscoll', NULL, NULL, NULL, NULL),
(2008, 133, 133, '1', 'Julia Cook', '10', '12/5/1997', '105 Leach Street', 'Salem', 'MA', '01970', '4', '5''', '80', '(978) 740-9188', 'Andrea Cook', 'Mike Cook', '(508) 843-3071', '', 'thecooks8@verizon.net', '', '(978) 740-9188', 'AM', 'Jul 28 PM', '', 'Julia', 'Cook', NULL, NULL, NULL, NULL),
(2008, 134, 134, '1', 'Zachary Kelley', '9', '10/5/1998', '29 Gallows Hill Road', 'Salem', 'MA', '01970', '3', '', '70', '(978) 594-0115', 'Jennifer Kelley', 'Walne Kelley', '(978) 766-5977', '(978) 578-7280', 'zbjw@hotmail.com', '', '(978) 745-3883', 'YL', 'Jul 7 PM', 'Ryan Dullea -- Must be in same class   ', 'Zachary', 'Kelley', NULL, NULL, NULL, NULL),
(2008, 135, 135, '1', 'Ryan Dullea', '10', '10/21/1997', '29 Gallows Hill Road', 'Salem', 'MA', '01970', '4', '', '59', '(978) 594-0115', 'Nancy Dullea', 'Leonard Dullea', '(978) 578-7280', '(978) 578-2375', 'rynnic@aol.com', '', '(978) 594-0115', 'YM', 'Jul 7 PM', 'Zach Kelley - Must be in same class   ', 'Ryan', 'Dullea', NULL, NULL, NULL, NULL),
(2008, 136, 136, NULL, 'Sam Martin', '8', '5/26/1999', '5 West Circle', 'Salem', 'MA', '01970', '3', '4''', '50', '(978) 979-7472', 'Kerry', 'Brad', '(978) 740-3750', '(978) 979-7473', 'kerry.martin1@comcast.net', '', '(617) 631-6934', 'YM', 'Aug 4 PM', 'Alex his brother could go at a different time in August   ', 'Sam', 'Martin', NULL, NULL, NULL, NULL),
(2008, 137, 137, NULL, 'Alex Martin', '10', '11/22/1997', '5 West Circle', 'Salem', 'MA', '01970', '4', '"4''6"""', '70', '(978) 979-7473', 'Kerry', 'Brad', '(617) 631-6934', '', 'Kerry.Martin1@comcast.net', '', '(617) 631-6934', 'YL', 'Aug 4 PM', 'Sam his brother could go at a different time in August   ', 'Alex', 'Martin', NULL, NULL, NULL, NULL),
(2008, 138, 138, NULL, 'Thomas Philbin', 'NULL', '', '13 Appleton Street', 'Salem', 'MA', '01970', '2', '', '', '(978) 825-9191', 'Kelley Philbin', 'Thomas Philbin', '(978) 395-1079', '(978) 309-8038', 'kphilbin@hotmail.com', 'tphilbin@mma.org', '(978) 309-8038', 'YL', 'Aug 11 AM', '"Dan Jacob Pin', 'Thomas', 'Philbin', NULL, NULL, NULL, NULL),
(2008, 139, 139, NULL, 'Jonathon Philbin', '11', '', '13 Appleton Street', 'Salem', 'MA', '01970', '5', '', '', '', 'Kelley', 'Thomas', '(978) 395-1079', '(978) 309-8038', 'kphilbin@hotmail.com', 'tphilbin@hotmail.com', '(978) 309-8038', 'AXL', 'Aug 11 AM', '"Dan Jacob Pini', 'Jonathon', 'Philbin', NULL, NULL, NULL, NULL),
(2008, 140, 140, '0', 'David Andrews', '11', '1/13/1997', ' Apt A50', 'Salem', 'MA', '01970', '5', '5''', '107', '(978) 744-0853', 'Rana Jezzini', 'David Andrews', '(978) 335-0364', '(708) 958-4460', 'ranadavid2002@yahoo.com', '', '(781) 718-9241', 'YXL', 'Jul 7 AM', '', 'David', 'Andrews', NULL, NULL, NULL, NULL),
(2008, 141, 141, '1', 'Vadim Beliak', '11', '5/26/1996', '', 'Salem', 'MA', '01970', '5', '5''', '88', '7817189241 (cell)', 'Natalia Beliak', '', '(978) 326-4212', '', 'Natallia_Beliak@yahoo.com', '', '(978) 621-8638', 'AS', 'Jul 7 AM', 'physical challenge swimming', 'Vadim', 'Beliak', NULL, NULL, NULL, NULL),
(2008, 142, 142, NULL, 'Casandra Narinkiewicz', '10', '11/1/1997', '72 Conant Street', 'Salem', 'MA', '01970', '4', '4''', '80', '(978) 594-1208', 'Kimberly Phifer', 'Marle Narinkiewicz', '(978) 594-1898', '(978) 317-1108', 'mrsphifer@hotmail.com', '', '(978) 594-1898', 'AS', 'Jul 28 PM', '   Open for any other dates', 'Casandra', 'Narinkiewicz', NULL, NULL, NULL, NULL),
(2008, 143, 143, '1', 'Eliza Jane Holtz', '9', '2/4/1999', '19 Lincoln Road', 'Salem', 'MA', '01970', '3', '', '51', '(978) 741-7410', 'Meghan Holtz', 'Peter Holtz', '(978) 395-5480', '(978) 395-5479', 'mdholtz@comcast.net', 'pbholtz@comcast.net', '(978) 741-7410', 'YS', 'Jul 7 AM', 'Antidepressant. Madeleine Holtz (Twin Sister)   ', 'Eliza', 'Jane', NULL, NULL, NULL, NULL),
(2008, 144, 144, '1', 'Madeleine Holtz', 'NULL', '2/4/1999', '19 Lincoln Road', 'Salem', 'MA', '01970', '3', '"52"""', '62', '(978) 741-7410', 'Meghan Holtz', 'Peter Holtz', '(978) 395-5480', '(978) 395-5479', 'mdholtz@comcast.net', 'pbholtz@comcast.net', '(978) 741-7410', '', 'Jul 7 AM', 'Eliza Jane Holtz (Twin Sister)   ', 'Madeleine', 'Holtz', NULL, NULL, NULL, NULL),
(2008, 145, 145, NULL, 'Emily Fabre', '8', '3/29/2000', '4 Goodell Street', 'Salem', 'MA', '01970', '8', '4''', '53', '(978) 744-4046', 'Tammy', '', '(978) 766-9849', '', 'gimras@hotmail.com', '', '(978) 729-0253', 'YS', 'Aug 25 PM', '"Kaithlyn Fabre - Sister', 'Emily', 'Fabre', NULL, NULL, NULL, NULL),
(2008, 146, 146, NULL, 'Kaitlyn Fabre', '11', '4/9/1997', '4 Goodell Street', 'Salem', 'MA', '01970', '5', '"4''2"""', '80', '(978) 744-4046', 'Tammy', '', '(978) 766-9849', '', 'gimras@hotmail.com', '', '(978) 729-0253', '', 'Aug 25 PM', '"Emily Fabre - Sister', 'Kaitlyn', 'Fabre', NULL, NULL, NULL, NULL),
(2008, 147, 147, '1', 'Andrew Mosko', '9', '4/12/1999', '30 Irving Street', 'Salem', 'MA', '01970', '', '', '', '(978) 825-0256', '', '', '', '', '', '', '', '', 'Jul 21 PM', '   Needs all forms sent to mom for processing', 'Andrew', 'Mosko', NULL, NULL, NULL, NULL);
INSERT INTO `wh_registration` (`year`, `id`, `registrationNumber`, `MedicalInformationForm`, `studentName`, `Age`, `BirthDate`, `Address`, `City`, `State`, `Zip`, `SchoolGrade`, `Height`, `Weight`, `HomePhone`, `Mother`, `Father`, `Phone1`, `Phone2`, `Email1`, `Email2`, `PrimaryEmergencyNumber`, `TShirtSize`, `AssignedSession`, `Notes`, `first_name`, `last_name`, `guardian_one_firstname`, `guardian_one_lastname`, `guardian_two_firstname`, `guardian_two_lastname`) VALUES
(2008, 148, 148, '1', 'Dalton Fitzgerald', '9', '2/6/1999', '2a Russell Dr', 'Salem', 'MA', '01970', '3', '"39"""', '42', '(978) 741-2741', 'Kathleen Fitzgerald', 'NA', '(508) 932-2741', 'NA', 'BeautyGirlsX4@aol.com', '', '(978) 741-2741', 'YS', 'Aug 25 PM', 'Only week that will work.', 'Dalton', 'Fitzgerald', NULL, NULL, NULL, NULL),
(2008, 149, 149, NULL, 'Laura Smith', 'NULL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Jun 23 AM', '   ', 'Laura', 'Smith', NULL, NULL, NULL, NULL),
(2008, 150, 150, '1', 'Sophia Vener', '8', '5/23/2000', '7 Auburndale Road', 'Marblehead', 'MA', '01945', '2', '3', '8', '781-631-5413', 'Erica Vener', 'Ron Vener', '781-854-6810', '781-910-3869', '5veners@comcast.net', 'rvener@comcast.net', '781-631-5413', 'YL', 'Jun 23 AM', '   ', 'Sophia', 'Vener', NULL, NULL, NULL, NULL),
(2008, 151, 151, '1', 'Dana McKinnon-Tucker', '8', '2/25/2000', '25 Auburndale Road', 'Marblehead', 'MA', '01945', '3', '', '75', '(781) 799-8132', 'Maureen McKinnon-Tucker', 'Dan Tucker', '781-632-6363', '781-799-8132', 'mcktucker@gmail.com', 'tucker,dan@gmail.com', '(781) 632-6363', 'YM', 'Jun 23 AM', '   ', 'Dana', 'McKinnon-Tucker', NULL, NULL, NULL, NULL),
(2008, 152, 152, '1', 'Samantha Caulfield', '7', '7/3/2000', '20 Cloverdale Ave', 'Salem', 'MA', '01970', '2', '"53"""', '62', '(978) 594-5176', 'Veronica', 'Mike', '(781) 424-5665', '(781) 953-0926', 'vacaulfield@hotmail.com', '', '(617) 605-1751', '', 'Jun 23 AM', '', 'Samantha', 'Caulfield', NULL, NULL, NULL, NULL),
(2008, 153, 153, NULL, 'William Faulkner', '7', '8/13/2000', '173 Marlborough Road', 'Salem', 'MA', '01970', '2', '4''', '55', '', '', '', '(978) 804-7343', '', 'bmelissabill@msn.com', '', '(978) 804-7343', '', 'Aug 18 PM', '"Tyler Faulkner', 'William', 'Faulkner', NULL, NULL, NULL, NULL),
(2008, 154, 154, NULL, 'Tyker Faulkner', '9', '8/14/1998', '173 Marlborough Road', 'Salem', 'MA', '01970', '2', '4''', '60', '', '', '', '(978) 804-7343', '', 'bmelissabill@msn.com', '', '(978) 804-7343', '', 'Aug 18 PM', '"Tyler Faulkner', 'Tyker', 'Faulkner', NULL, NULL, NULL, NULL),
(2008, 155, 155, NULL, 'Anthony Ravelo', '9', '8/13/2000', '173 Marlborough Road', 'Salem', 'MA', '01970', '2', '4''', '60', '', '', '', '(978) 804-7343', '', 'bmelissabill@msn.com', '', '(978) 804-7343', '', 'Aug 18 PM', '"Tyler Faulkner', 'Anthony', 'Ravelo', NULL, NULL, NULL, NULL),
(2008, 156, 156, '1', 'Natalie J. Hanet', '11', '8/20/1996', '4 Winter Island Road', 'Salem', 'MA', '01970', '6', '"48"""', '100', '(978) 745-9417', 'Robin HaneY', 'Kevin Haney', '(617) 780-1942', '(617) 780-1942', 'k.kevinhaney@comcast.net', '', '(617) 780-1942', '', 'Aug 4 AM', '', 'Natalie', 'J.', NULL, NULL, NULL, NULL),
(2008, 157, 157, '1', 'Andrew Murray', '9', '2/5/1999', '2 Boardman Street #2', 'Salem', 'MA', '01970', '3', '"4''2"""', '50', '(978) 740-5006', 'Tiffany Murray', 'John Murray', '', '', '', '', '', '', 'Jun 30 AM', '', 'Andrew', 'Murray', NULL, NULL, NULL, NULL),
(2008, 158, 158, '1', 'Kayla Angelopolus', '10', '2/21/1998', '11 Symonds Street', 'Salem', 'MA', '01970', '4', '', '', '(978) 210-9636', 'Charlene Angelopolus', 'Ryan Angelopolus', '(978) 750-8398', '(603) 819-9308', 'none', '', '', ' 978-750-8398', 'Jul 14 AM', '', 'Kayla', 'Angelopolus', NULL, NULL, NULL, NULL),
(2008, 159, 159, '1', 'Sabrina King', '8', '6/22/1999', '11 Symonds Street', 'Salem', 'MA', '01970', '3', '', '112', '(978) 745-8226', 'Lisa King', 'Bob King', '(978) 423-1381', '(978) 265-7250', '290558@eecprovider.org', '', '(978) 423-1381', 'AM', 'Jul 14 AM', '', 'Sabrina', 'King', NULL, NULL, NULL, NULL),
(2008, 160, 160, NULL, 'Julian Channing', '9', '9/15/1998', '30 Winthrop Street', 'Salem', 'MA', '01970', '4', '"4''6"""', '78', '(978) 744-0063', 'Mary Collari', 'Edward Channing', '', '', '', '', '', '', 'Jul 21 PM', '', 'Julian', 'Channing', NULL, NULL, NULL, NULL),
(2008, 161, 161, '1', 'Andrew Clark', '8', '1/23/2000', '16 Patton Street', 'Salem', 'MA', '01970', '2', '', '', '(978) 741-5725', 'Kristen Clark', 'Robert Clark', '', '', '', '', '', '', 'Jul 7 AM', '', 'Andrew', 'Clark', NULL, NULL, NULL, NULL),
(2008, 162, 162, NULL, 'Bridget Ayers', '9', '7/29/1998', '11 West Circle', 'Salem', 'MA', '01970', '5', '"4''6"""', '56', '(978) 335-3674', 'Kim Ayers', 'Jim Ayers', '(978) 223-3879', '(978) 335-3674', 'kim@streetsmartdrives.com', '', '(978) 223-3879', '', 'Aug 4 PM', '', 'Bridget', 'Ayers', NULL, NULL, NULL, NULL),
(2008, 163, 163, NULL, 'Anthony Silva', '10', '11/1/1997', '106 Lowell Street', 'Peabody', 'MA', '01960', '4', '"4''6"""', '93', '9789777963', 'Karen Silva', 'Anthony Silva', '9788081794', '9789799157', 'ajnicki@verizon.net', '', '9788081794', '', 'Jul 28 AM', '', 'Anthony', 'Silva', NULL, NULL, NULL, NULL),
(2008, 164, 164, NULL, 'Nicholas Silva', '8', '2/11/2000', '106 Lowell Street', 'Peabody', 'MA', '01960', '2', '"4''4"""', '76', '9789777963', 'Karen Silva', 'Anthony Silva', '9788081794', '9789799157', 'ajnicki@verizon.net', '', '9788081794', '', 'Jul 28 AM', '', 'Nicholas', 'Silva', NULL, NULL, NULL, NULL),
(2008, 165, 165, '1', 'James McLernon', '9', '1/1/1999', '3A Veterans Memorial Drive', 'Peabody', 'MA', '01960', '3', '', '120', '(978) 532-3542', 'Barbara', 'James', '(978) 375-4801', '(978) 375-4800', 'barbi1131@comcast.net', 'mr89rw@comcast.net', '(978) 375-4801', 'AM', 'Jul 28 PM', '', 'James', 'McLernon', NULL, NULL, NULL, NULL),
(2008, 166, 166, '1', 'Michael McLernon', '8', '3/1/2000', '3A Veterans Memorial Drive', 'Peabody', 'MA', '01960', '3', '', '120', '(978) 532-3542', 'Barbara', 'James', '(978) 375-4801', '(978) 375-4800', 'barbi1131@comcast.net', 'mr89rw@comcast.net', '(978) 375-4801', 'AM', 'Jul 28 PM', '', 'Michael', 'McLernon', NULL, NULL, NULL, NULL),
(2008, 167, 167, '1', 'Hayley Gaynor', '11', '4/4/1997', '15 Daniels Street', 'Salem', 'MA', '1970', '6', '"4''5"""', '65', '(978) 744-7429', 'Sue Sciola', '', '(339) 440-2385', '', 'susansciola@comcast.net', '', '(978) 745-0656', 'YL', 'Jul 21 AM', '', 'Hayley', 'Gaynor', NULL, NULL, NULL, NULL),
(2008, 168, 168, '1', 'Cole Jermyn', '10', '8/6/1997', '4 Scenic Terrace', 'Salem', 'MA', '01970', '5', '"4''3"""', '70', '(978) 853-9181', 'Cheryl', 'John', '(617) 513-8731', '', 'cjermyn8@hotmail.com', 'john.jermyn@aexp.com', '(978) 853-9181', 'YM', 'Jul 14 AM', '', 'Cole', 'Jermyn', NULL, NULL, NULL, NULL),
(2008, 169, 169, '1', 'Patrick Scanlan', '13', '7/25/1994', '13 Bay View Circle', 'Salem', 'MA', '01970', '6', '5''', '114', '(978) 744-7117', 'Stephanie', 'James', '(978) 578-1983', '"9784590164', ' x203"', 'stephanie.scanlon@gmail.com', '', '(978) 744-7117', 'Jul 28 PM', '', 'Patrick', 'Scanlan', NULL, NULL, NULL, NULL),
(2008, 170, 170, '1', 'Callum Butler', '8', '10/12/1999', '14 Hunt Street', 'Danvers', 'MA', '', '', '', '', '(978) 836-9676', 'Amey', '', '', '', '', '', '', '', 'Jul 28 AM', '', 'Callum', 'Butler', NULL, NULL, NULL, NULL),
(2008, 171, 171, '1', 'Collin Butler', '11', '2/13/1997', '14 Hunt Street', 'Danvers', 'MA', '', '', '', '', '(978) 836-9676', 'Amey', '', '', '', '', '', '', '', 'Jul 28 PM', '', 'Collin', 'Butler', NULL, NULL, NULL, NULL),
(2008, 172, 172, '1', 'Becky Woodcock', '11', '8/6/1996', '20 Belleview', 'Salem', 'MA', '01970', '5', '', '75', '(978) 741-1484', 'Mary Woodcock', 'Tim Woodcock', '', '9789436920', 'timandmary.ma@netzero.net', '', '', 'YL', 'Jul 28 AM', '', 'Becky', 'Woodcock', NULL, NULL, NULL, NULL),
(2008, 173, 173, '1', 'Michael Cantone', '7', '8/25/2008', '11 Witchcraft Road', 'Salem', 'MA', '01970', '1', '', '55', '(978) 741-2456', 'Mary', 'Chris', '9787610228', '6174808004', 'marymalcan@hotmail.com', 'cantone13@hotmail.com', '', 'YM', 'Jul 14 PM', 'Kyle Oulette', 'Michael', 'Cantone', NULL, NULL, NULL, NULL),
(2008, 174, 174, NULL, 'Bradford Ayers', '8', '11/22/2000', '11 West Circle', 'Salem', 'MA', '01970', '2', '"4''3"""', '54', '(978) 335-3674', 'Kim Ayers', 'Jim Ayers', '(978) 223-3879', '(978) 335-3674', 'kim@streetsmartdrivers.com', '', '(978) 223-3879', '', 'Aug 4 PM', '', 'Bradford', 'Ayers', NULL, NULL, NULL, NULL),
(2008, 175, 175, '1', 'Brianna Swan', 'NULL', '', '', '', '', '', '', '', '', '(978) 745-5804', 'Melissa Swan', '', '9782101741', '', '', '', '', '', 'Jul 21 PM', '', 'Brianna', 'Swan', NULL, NULL, NULL, NULL),
(2008, 176, 176, NULL, 'Brian Moisan', '12', '12/7/1995', '"c/o Ann Moisan 41 Nichols Street"', 'Salem', 'MA', '01970', '7', '"4''7"""', '60', '978-210-5303 ', 'Ann Moisan', '', '9787450658 Jody Smith', '', '', '', '', '', 'Jul 14 PM', '', 'Brian', 'Moisan', NULL, NULL, NULL, NULL),
(2008, 177, 177, '1', 'Antonia Katsiris', '11', '6/2/1996', '8 Durkin Road', 'Salem', 'MA', '01970', '6', '"61"""', '85', '(978) 740-2449', 'Pamela Katsiris', 'Vianni', '6179748175', '9782629933', 'pamyianni@comcast.net', '', '6179748175', '', 'Aug 11 AM', '', 'Antonia', 'Katsiris', NULL, NULL, NULL, NULL),
(2008, 178, 178, '1', 'Kyle Ouellette', '7', '9/5/2000', '19 Witchcraft Road', 'Salem', 'MA', '01970', '7', '', '', '(978) 741-4346', 'Maureen', 'Steve', '9783751704', '9783754968', 'mnokoko@yahoo.com', 'oullettesr@yahoo.com', '9787456168', '', 'Jul 14 PM', 'Cantone''s said they wanted to be in the same session on the 14th.', 'Kyle', 'Ouellette', NULL, NULL, NULL, NULL),
(2008, 179, 179, '1', 'Shamus Lombard', '8', '2/4/2000', '120 Marlborough Road', 'Salem', 'MA', '01970', '2', '"53"""', '67', '(978) 741-5679', 'Diana Lombard', 'Sean Lombard', '9782103676', '9785788891', 'dllombard@partners.org', '', '9787450522 or 9783544010', 'YL', 'Jul 14 PM', '', 'Shamus', 'Lombard', NULL, NULL, NULL, NULL),
(2008, 180, 180, '1', 'Claudia Marie Lanes', '10', '9/30/1997', '25 Bartholomew Terrace', 'Peabody', 'MA', '01960', '4', '5''', '112', '(978) 538-9736', 'Patrice Lanes', 'Mark Lanes', '9789790270', '9782399118', 'ptlanes@comcast.net', 'mlanes@krohne.net', '9789790270', 'AL', 'Aug 11 PM', '', 'Claudia', 'Marie', NULL, NULL, NULL, NULL),
(2008, 181, 181, '1', 'Alexander Alessi', '8', '10/14/1999', '14 Vista Ave', 'Salem', 'MA', '01970', '2', '"54"""', '84', '(978) 745-3112', 'Cheryl Alessi', 'Michael Alessi', '9782106471', '3392270933', 'choosoff@aol.com', 'alessil4@aol.com', '9787453112', 'YXL', 'Jul 14 PM', '', 'Alexander', 'Alessi', NULL, NULL, NULL, NULL),
(2008, 182, 182, '1', 'Laura Barnes', '9', '6/29/1999', '51 Dearborn Street', 'Salem', 'MA', '01970', '3', '4''', '45', '(978) 741-4101', 'Melissa Barnes', 'Jason Barnes', '9783170278', '9782657349', '', '', '9783170278', 'YS', 'Jul 28 PM', '', 'Laura', 'Barnes', NULL, NULL, NULL, NULL),
(2008, 183, 183, '1', 'Calvin Full', '9', '8/27/1998', '12 Sherman Street', 'Peabody', 'MA', '01970', '3', '', '80', '(978) 977-9466', 'Dianne Full', 'David Full', '9782103339', '9787747100', 'dfull@salem.com', 'fullhaus11@netzero.com', '9782103339', '', 'Aug 4 PM', '', 'Calvin', 'Full', NULL, NULL, NULL, NULL),
(2008, 184, 184, '1', 'Connor Full', '9', '8/27/1998', '12 Sherman Street', 'Peabody', 'MA', '01970', '3', '', '80', '(978) 977-9466', 'Dianne Full', 'David Full', '9782103339', '9787747100', 'dfull@salem.com', 'fullhaus11@netzero.com', '9782103339', '', 'Aug 4 PM', '', 'Connor', 'Full', NULL, NULL, NULL, NULL),
(2008, 185, 185, '1', 'William Kraemer', '11', '12/10/1996', '17 Grove Street', 'Salem', 'MA', '01970', '5', '', '95', '(978) 741-7964', 'Kathleen Kraemer', 'James Kraemer', '', '', '', '', '', '', 'Jun 30 AM', '', 'William', 'Kraemer', NULL, NULL, NULL, NULL),
(2008, 186, 186, '1', 'Kaylee Steele', '12', '5/16/96', '7 Sandra Road', 'Peabody', 'MA', '01960', '6', '56"', '76', '(978) 531-3147', 'Kathy Steele', 'Tome Steele', '5089544973', '3392242338', '', '', '9783543584', 'ym', 'Jun 23 AM', '', 'Kaylee', 'Steele', NULL, NULL, NULL, NULL),
(2008, 187, 187, NULL, '', 'NULL', '', '', '', '', '', '', '', '', '', 'Willem E. van de Stadt', '', '', '', '', '', '', '', 'Jul 21 PM', '', '', '', NULL, NULL, NULL, NULL),
(2008, 188, 188, NULL, '', 'NULL', '', '', '', '', '', '', '', '', '', 'Willem E. van de Stadt', '', '', '', '', '', '', '', 'Jul 21 PM', '', '', '', NULL, NULL, NULL, NULL),
(2008, 195, 195, '1', 'Connor Alexander', '11', '10/19/96', '8 Rand Road', 'Salem', 'MA', '01970', '6', '', '75', '9787454588', 'Elayne', 'Brian', '6176453753', '9788528094', 'elayne.m.alexander@bankofamerica.com', 'besc.alexander@comcast.net', '6176453753', 'AS', 'Jun 23 PM', '', 'Connor', 'Alexander', NULL, NULL, NULL, NULL),
(2008, 196, 196, '0', 'Kara Lynne Welch', '8', '11/16/1999', '14 Andrew Street', 'Salem', 'MA', '01970', '3', '4''6"', '75', '978-744-8431', 'Sallie Belle Davis', 'Joseph J. Welch', '978-764-4931', '978-828-3010', 'joewelch@joewelch.com', 'sbdavis1@comcast.net', '978-828-3010', '', 'Jul 21 PM', 'Registration by email', 'Kara', 'Lynne', NULL, NULL, NULL, NULL),
(2008, 197, 197, '0', 'Eleanor Seyfried', '8', '12/1/99', '7 May Street', 'Salem', 'MA', '01970', '2', '', '', '978-744-0395', 'Rosemary', 'Mark', '978-744-3915', '978-915-3111 x225', '', 'seyfrieds@comcast.net', '978-744-0395', 'M', 'Jul 21 AM', 'Confirmed class on the phone', 'Eleanor', 'Seyfried', NULL, NULL, NULL, NULL),
(2008, 198, 198, '1', 'Rachel Zipper', '11', '3/22/97', '5 Cauldron Court', 'Salem', 'MA', '01970', '5', '5''', '100', '', 'Gayle Zipper', 'Mike Zipper', '978-407-4277', '978-804-7320', 'thezippers@hotmail.com', '', '978-744-5886', 'YXL', '', 'Jul 14 is full, need to overfill or call', 'Rachel', 'Zipper', NULL, NULL, NULL, NULL),
(2008, 199, 199, '0', 'Christopher Lutts', '11', '4/26/08', '95 Orne Street', 'Salem', 'MA', '01970', '5', '5''', '69', '978-741-3483', 'Elizabeth Lutts', 'Andrew Lutts', '', '', 'lisa@whitelight.net', '', '978-744-9378', 'YL', 'Jul 21 AM', 'Email registration', 'Christopher', 'Lutts', NULL, NULL, NULL, NULL),
(2008, 200, 200, '1', 'Sydney Hanford', '11', '5/31/97', '43 Valley street', 'Salem', 'MA', '01970', '5', '', '', '978-741-8698', 'Patricia Hanford', '', '781-820-3385', '', '', '', '781-820-3385', '', 'Aug 11 PM', 'Jackson', 'Sydney', 'Hanford', NULL, NULL, NULL, NULL),
(2008, 201, 201, '1', 'Jackson Hanford', '9', '7/13/99', '43 Valley Street', 'Salem', 'MA', '01970', '3', '', '', '978-741-8698', 'Patricia', '', '', '', '', '', '781-820-3385', '', 'Aug 11 PM', '', 'Jackson', 'Hanford', NULL, NULL, NULL, NULL),
(2008, 202, 202, '0', 'Christopher Lutts', 'NULL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Jul 21 AM', '', 'Christopher', 'Lutts', NULL, NULL, NULL, NULL),
(2008, 203, 203, '0', 'Evan Denman', '8', '5/16/00', '4 Apple Tree Rd', 'Danvers ', 'MA', '01923', '3', '50"', '52', '351-201-9193', 'Sheli', 'Blair', '', '', 'sheli.denman@thomson.com', '', '', '', 'Aug 18 PM', '', 'Evan', 'Denman', NULL, NULL, NULL, NULL),
(2008, 204, 204, '0', 'Adam Denman', '8', '5/16/2000', '4 Apple Tree Rd', 'Danvers', 'MA', '01923', '3', '50"', '52', '351-201-9193', 'Sheli', 'Blair', '', '', 'sheli.denman@thomson.com', '', '', '', 'Aug 18 PM', '', 'Adam', 'Denman', NULL, NULL, NULL, NULL),
(2008, 205, 205, '0', 'Sophia Gomes', '11', '9/27/96', '6 King Street', 'Peabody', 'MA', '01960', '6', '5''3', '120', '978 532 3846  ', 'Lisa', 'Fernando', '', '', ' lisawashere@yahoo.com', '', '', '', 'Aug 11 PM', '', 'Sophia', 'Gomes', NULL, NULL, NULL, NULL),
(2008, 206, 206, '0', 'julia cook', '10', '12/5/97', '105 leach st', '', '', '', '', '', '', '978-741-9188', 'andrea', '', '', '', '', '', '978-741-9188', '', '', '', 'julia', 'cook', NULL, NULL, NULL, NULL),
(2008, 207, 207, '1', 'Julia Graf', '11', '11/22/90', '51 Lynn Fells Parkway', 'Melrose', 'MA', '02176', '5', '5''', '85', '781-662-1639', 'Janet Graf', 'Rick Graf', '617-285-2173', '781-246-2800', 'jangraf@mail.com', '', 'Marie Beaupre - 978-745-8541', 'AS', 'Aug 18 PM', '', 'Julia', 'Graf', NULL, NULL, NULL, NULL),
(2008, 208, 208, '1', 'John Graf', '10', '1/6/98', '51 Lynn Fells Parkway', 'Melrose', 'MA', '02176', '4', '4''11', '95', '781-662-1639', 'Janet Graf', 'Rick Graf', '617-285-2173', '781-246-2800', 'jangraf@live.com', '', '', 'YXL', 'Aug 18 PM', '', 'John', 'Graf', NULL, NULL, NULL, NULL),
(2008, 209, 209, '1', 'Jack Kelly', '8', '6/8/00', '7 Dibiase Street', 'Salem', 'MA', '01970', '3', '4''2', '85', '978-745-0589', 'Chris', 'Michael', '978-869-1674', '978-869-1659', 'kelhome@earthlink.net', '', '978-869-1674', 'YL', 'Aug 11 PM', 'Fear of loud noises', 'Jack', 'Kelly', NULL, NULL, NULL, NULL),
(2008, 210, 210, '1', 'Jason Test', '13', '2/25/1971', '23 Pickman Street', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Jason', 'Test', NULL, NULL, NULL, NULL),
(2009, 211, 4, '0', 'Timothy Paul', '8', '10/2/2000', '5 Cressy Ave', 'Salem', 'MA', '01970', '2', '4\\''2\\', '60', '', 'Mike Paul', 'Mary Paul', '978-741-2398', '978-741-2398', 'mntpaul@msn.com', '', '978-902-8789', '', 'July 27 AM', 'No preference for morning or evening.  Friends -- Connor Mackey, Stephen Szpak', 'Timothy', 'Paul', NULL, NULL, NULL, NULL),
(2009, 212, 5, '0', 'Stephen Jacobs', '9', '4/15/2000', '38 Orne Street', 'Salem', 'MA', '01970', '4', '', '', '', 'Thomas Jacobs', 'Sharon Gardner', '978-744-6744', '978-745-0897', '', '', '978-744-4967', '', 'July 27 AM', '', 'Stephen', 'Jacobs', NULL, NULL, NULL, NULL),
(2009, 213, 6, '1', 'Alec Porter', '10', '5/28/1998', '28 Bertuccio Ave', 'Salem', 'MA', '01970', '5', '4\\''11\\', '90', '', 'Tim Porter', 'Kelly Porter', '978-741-9458', '978-741-9458', 'alecsparents@verizon.net', '', '603-560-4680', '', 'July 13 PM', 'Katie Moloney', 'Alec', 'Porter', NULL, NULL, NULL, NULL),
(2009, 214, 7, '1', 'Katie Moloney', '10', '7/2/1998', '414 1/2 Lafayette Street', 'Salem', 'MA', '01970', '5', '', '', '', 'Maurice Moloney', 'Sue Moloney', '978-740-3834', '978-740-3834', '', '', '', '', 'July 13 PM', 'Alec Porter', 'Katie', 'Moloney', NULL, NULL, NULL, NULL),
(2009, 215, 8, '0', 'Avery Kelleher', '8', '12/21/2000', '53 Larchmont Road', 'Salem', 'MA', '01970', '2', '', '', '', 'Patti Kelleher', 'Doug Kelleher', '978-793-0084', '978-741-3620', 'pdkelleher@comcast.net', '', '978-729-7973', '', 'Aug 10 AM', 'With her sister, Rachel Kelleher, who is a returning sailor', 'Avery', 'Kelleher', NULL, NULL, NULL, NULL),
(2009, 216, 9, '0', 'Rachel Kelleher', '11', '2/21/1998', '53 Larchmont Road', 'Salem', 'MA', '01970', '5', '', '', '', 'Patti Kelleher', 'Doug Kelleher', '978-793-0084', '978-741-3620', 'pdkelleher@comcast.net', '', '978-729-7973', '', 'Aug 10 AM', 'With her sister, Avery Kelleher, who is a first time sailor', 'Rachel', 'Kelleher', NULL, NULL, NULL, NULL),
(2009, 217, 10, '0', 'Julia Jermyn', '12', '4/12/1996', '50 Ravenna Ave', 'Salem', 'MA', '01970', '6', '5\\''2\\', '95', '', 'Deborah', 'Anthony', '978-578-1701', '978-740-0777', 'ajermyn@comcast.net', 'djermyn2000@msn.com', '978-578-1701', '', 'July 20 PM', '', 'Julia', 'Jermyn', NULL, NULL, NULL, NULL),
(2009, 218, 11, '0', 'Zachary Scarpola', '8', '2/15/2001', '6 Scenic Place', 'Salem', 'MA', '01970', '2', '4\\''', '70', '', 'Dan Scarpola', 'Colleen Scarpola', '781-244-7743', '978-825-0010', 'cscarpola@yahoo.com', '', '781-244-7743', '', 'July 20 AM', 'Amanda Flynn', 'Zachary', 'Scarpola', NULL, NULL, NULL, NULL),
(2009, 219, 12, '1', 'Jackson Colehower', '10', '3/22/1999', '8 Fairview Ave', 'Salem', 'MA', '01970', '', '', '', '', 'Susan Colehower', 'Bill Colehower', '978-741-8576', '', 'wcolehower@comcast.net', 'scolehower@comcast.net', '978-729-9104', '', 'Jun 22 AM', '', 'Jackson', 'Colehower', NULL, NULL, NULL, NULL),
(2009, 220, 13, '0', 'Leo Santoro', '10', '2/1/1999', '16 Ravenna Ave', 'Salem', 'MA', '01970', '6', '4\\''9\\', '80', '', 'Zackari Santoro', 'Jim Santoro', '617-529-3218', '978-594-0105', 'jsantoro@slexhibits.com', 'zackds@comcast.net', '617-529-3218, 617-529-3254', '', 'July 6 AM', 'Sister -- Isabelle Santoro', 'Leo', 'Santoro', NULL, NULL, NULL, NULL),
(2009, 221, 14, '0', 'Isabelle Santoro', '8', '4/13/2001', '16 Ravenna Ave', 'Salem', 'MA', '01970', '3', '4\\''0\\', '48', '', 'Zackari Santoro', 'Jim Santoro', '617-529-3218', '978-594-0105', 'jsantoro@slexhibits.com', 'zackds@comcast.net', '617-529-3218, 617-529-3254', '', 'July 6 AM', 'Brother -- Leo Santoro', 'Isabelle', 'Santoro', NULL, NULL, NULL, NULL),
(2009, 222, 15, '0', 'Isabel Welch', '9', '11/20/1999', '175 Federal Street', 'Salem', 'MA', '01970', '3', '', '', '', 'Greg Welch', 'Mary Welch', '978-740-3250', '978-745-1464', 'jorwelm@verizon.net', '', '', '', 'July 6 AM', 'Eleanor Seyfried', 'Isabel', 'Welch', NULL, NULL, NULL, NULL),
(2009, 223, 16, '0', 'Ely Grocki', '9', '4/5/2000', '31 1/2 Buffum Street', 'Salem', 'MA', '01970', '3', '55in', '80', '', 'Kevin Grocki', 'Erin Grocki', '978-509-5508', '978-317-1442', 'egrocki@gmail.com', 'kgrocki@gmail.com', '978-509-5508', '', 'July 20 AM', 'Gabrielle Uva', 'Ely', 'Grocki', NULL, NULL, NULL, NULL),
(2009, 224, 17, '0', 'Lindsay Cruciani', '8', '5/5/2000', '8 Purchase Street', 'Salem', 'MA', '01970', '3', '48\\"', '42', '', 'Chris Cruciani', 'Pam Cruciani', '978-745-4290', '978-979-4848', 'crucianicplj@msn.com', '', '978-758-8445', '', 'July 20 AM', 'Amanda Flynn', 'Lindsay', 'Cruciani', NULL, NULL, NULL, NULL),
(2009, 225, 18, '0', 'Alexandria Cook', '13', '5/9/1996', '13 Beacon Street', 'Salem', 'MA', '01970', '7', '4\\''7\\', '68', '', '', 'Kelly Cook', '978-594-5309', '', 'kcook@ngbank.com', '', '978-335-8511, 781-631-6000', '', 'July 13 PM MS/HS', 'Brother -- Dylan Cook', 'Alexandria', 'Cook', NULL, NULL, NULL, NULL),
(2009, 226, 19, '0', 'Dylan Cook', '15', '5/19/1994', '13 Beacon Street', 'Salem', 'MA', '01970', '9', '5\\''2\\', '120', '', '', 'Kelly Cook', '978-594-5309', '', 'kcook@ngbank.com', '', '978-335-8511, 781-631-6000', '', 'July 13 PM MS/HS', 'Sister -- Alexandria Cook', 'Dylan', 'Cook', NULL, NULL, NULL, NULL),
(2009, 227, 20, '1', 'Stephen Szpak Jr.', '7', '5/14/2001', '27 Bertuccio Ave', 'Salem', 'MA', '01970', '2', '53\\', '60', '', 'Susan Szpak', 'Stephen Szpak', '978-741-8154', '', 's.szpak@verizon.net', '', '978-290-2297', '', 'Jun 29 AM', 'Tim Paul, Eli Groki, Gabriel Uva', 'Stephen', 'Szpak', NULL, NULL, NULL, NULL),
(2009, 228, 21, '0', '', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(2009, 229, 22, '1', 'Michael Katsiris', '8', '10/18/2000', '8 Durkin Road', 'Salem', 'MA', '01970', '2', '52', '63', '', '', 'Pam Katsiris', '978-740-2449', '617-974-8175', 'pamyianni@comcast.net', '', '', '', 'July 13 AM', '', 'Michael', 'Katsiris', NULL, NULL, NULL, NULL),
(2009, 230, 23, '0', 'Hayley Smith', '9', '11/24/99', '33 Warren Street', 'Salem', 'MA', '01970', '3', '4.9', '80', '', 'Jeffery Smith', 'Kerrie Smith', '617.306.01915', '978.744.3721', 'kmacsmith33@comcast.net', 'jatuards@yahoo.com', '617.283.5638, 617.306.0195', '', 'Jun 29 PM', '', 'Hayley', 'Smith', NULL, NULL, NULL, NULL),
(2009, 231, 24, '1', 'Tea Katsiris', '8', '10/18/2000', '8 Durkin Road', 'Salem', 'MA', '01970', '2', '50\\', '60', '', 'Yianni Katsiris', 'Pam Katsiris', '978-740-2449', '978-262-9933', 'pamyianni@comcast.net', '', '617-974-8175', '', 'July 13 AM', '', 'Tea', 'Katsiris', NULL, NULL, NULL, NULL),
(2009, 232, 25, '1', 'Antonia Katsiris', '12', '6/2/1996', '8 Durkin Road', 'Salem', 'MA', '01970', '7', '5\\''2\\', '93', '', 'Yianni Katsiris', 'Pam Katsiris', '617-974-8175', '978-262-9933', 'pamyianni@comcast.net', '', '978-262-9933, 617-974-8175', '', 'July 13 AM', '', 'Antonia', 'Katsiris', NULL, NULL, NULL, NULL),
(2009, 233, 26, '0', 'Tucker Smith', '12', '12/31/96', '33 Warren Street', 'Salem', 'MA', '01970', '6', '5.2', '103', '', 'Jefferey Smith', 'Kerrie Smith', '617.306.0195', '978.744.3721', 'kmacsmith@comcast.net', 'jatuards@yahoo.com', '617.283.5638, 617.306.0195', '', 'Jun 29 PM', '', 'Tucker', 'Smith', NULL, NULL, NULL, NULL),
(2009, 234, 27, '0', '', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(2009, 235, 28, '0', 'Gabriel Uva', '9', '9/23/1999', '40 Felt Street', 'Salem', 'MA', '01970', '3', '55\\"', '104', '', 'Mariflor Uva', 'Scott Uva', '978-500-7808', '978-500-7809', 'uptrend99@yahoo.com', 'mariflor_uva@yahoo.com', '978-500-7808', '', 'July 20 AM', 'Ely Grocki, Stephen Szpak', 'Gabriel', 'Uva', NULL, NULL, NULL, NULL),
(2009, 236, 29, '1', 'Shamus Lombard', '9', '2/4/2000', '120 Marlborough', 'Salem', 'MA', '01970', '3', '', '', '', 'Sean Lombard', 'Diana Lombard', '978-210-3676', '978-578-8891', 'sdlombard@verizon.net', '', '978-360-2466', '', 'July 6 AM', 'Brother -- Brendan Lombard', 'Shamus', 'Lombard', NULL, NULL, NULL, NULL),
(2009, 237, 30, '1', 'Brendan Lombard', '7', '8/24/2001', '120 Marlborough Road', 'Salem', 'MA', '01970', '2', '', '', '', 'Sean Lombard', 'Diana Lombard', '978-210-3676', '978-578-8891', 'sdlombard@verizon.net', '', '978-360-2466', '', 'July 6 AM', 'Brother -- Shamus Lombard', 'Brendan', 'Lombard', NULL, NULL, NULL, NULL),
(2009, 238, 31, '1', 'Ian Clark', '10', '12/2/98', '3 Skerry Street Court', 'Salem', 'MA', '01970', '4', '4', '100', '', 'Cameron Ron Clark', 'Gretchen Clark', '978.740.9488', '978.740.9488', 'gclark22002@comcast.net', 'camclark51@comcast.net', '978.210.1081', '', 'July 13 AM', '', 'Ian', 'Clark', NULL, NULL, NULL, NULL),
(2009, 239, 32, '1', 'Kevin O\\''Shea', '9', '5/19/99', '15 Winter Island Road', 'Salem', 'MA', '01970', '4', '5', '100', '', '', 'Anne O\\''Shea', '978-745-0250', '', 'p.pauloshea@comcast.net', '', '508.277.7029', '', 'Jun 29 AM', '', 'Kevin', 'O\\''Shea', NULL, NULL, NULL, NULL),
(2009, 240, 33, '1', 'Derek Zwiercan', '12', '3/3/1997', '6 Fairmount Street', 'Salem', 'MA', '01970', '6', '5\\''', '100', '', 'Richard Zwiercan', 'Pamela Zwiercan', '978-744-7322', '978-744-7322', 'zeesclan@aol.com', '', '978-335-7322', '', 'July 13 AM', '', 'Derek', 'Zwiercan', NULL, NULL, NULL, NULL),
(2009, 241, 34, '1', 'Adam Leith', '11', '9/1/1998', '9 Pioneer Circle', 'Salem', 'MA', '01970', '5', '4', '80', '', 'Moira Leith', 'Toby Leith', '978.764.5950', '978.376.3026', 'leith3777@comcast.net', 'leith3777@comcast.net', '978.376.3026', '', 'June 29 AM MS/HS', '', 'Adam', 'Leith', NULL, NULL, NULL, NULL),
(2009, 242, 35, '1', 'Joshua Zwiercan', '10', '8/17/1998', '6 Fairmount Street', 'Salem', 'MA', '01970', '5', '5\\''', '70', '', 'Richard Zwiercan', 'Pamela Zwiercan', '978-744-7322', '978-744-7322, 978-335-7322', 'zeesclan@aol.com', 'zeesclan@aol.com', '', '', 'July 13 AM', '', 'Joshua', 'Zwiercan', NULL, NULL, NULL, NULL),
(2009, 243, 36, '0', 'Matthew Eddows', '9', '9.20.1999', '7 Wheatland Street', 'Salem', 'MA', '01970', '3', '53\\"', '75', '', 'Donna Eddows', 'Doug Eddows', '978.745.0121', '978.745.0121', 'eddows4@aol.com', 'don11565@aol.com', '978.210.4376, 978.210.2584', '', 'July 20 AM', '', 'Matthew', 'Eddows', NULL, NULL, NULL, NULL),
(2009, 244, 37, '0', 'Amanda Flynn', '8', '4/9/2001', '42 Sable Road', 'Salem', 'MA', '01970', '2', '50', '54', '', 'Timothy Flynn', 'Gretchen Flynn', '978-836-0019', '978-836-0017', 'gigilaine77@comcast.net', 'hotjob4me@comcast.net', '978-740-1353', '', 'July 20 AM', 'Zachary Scarpola, Lindsey Cruciani, Alyssa Flynn', 'Amanda', 'Flynn', NULL, NULL, NULL, NULL),
(2009, 245, 38, '0', 'Jack McCarthy', '11', '1/2/98', '153 BayView Ave.', 'Salem', 'MA', '01970', '5', '5', '100', '', 'Kathy McCarthy', 'Bob McCarthy', '978.744.1759', '978.744.1759', 'robertkmccarthy@verizon.net', '', '978.836.7109', '', 'Aug 3 AM', '', 'Jack', 'McCarthy', NULL, NULL, NULL, NULL),
(2009, 246, 39, '0', 'Alyssa Flynn', '9', '7/21/1999', '42 Sable Road', 'Salem', 'MA', '01970', '4', '54\\"', '62', '', 'Timothy Flynn', 'Gretchen Flynn', '978-836-0014', '978-836-0017', '', 'hotjob4me@comcast.net', '978-740-1353, 978-836-0019', '', 'July 20 AM', 'Amanda Flynn, Rachel Luddy, Lindsay Crusiani, Zack Scarpola, Patrick and Rachel Luddy', 'Alyssa', 'Flynn', NULL, NULL, NULL, NULL),
(2009, 247, 40, '1', 'Luce Brandt', '9', '10.3.99', '3 Lynn Street', 'Salem', 'MA', '01970', '3', '4.6', '60', '', 'Jeff Brant', 'Patti Roka', '978.744.6004', '', 'patricia.roka@verizon.ent', '', '978.210.2124', '', 'Jun 8 AM', 'Maeve Murphy, Eli Grigorian, jason headstom', 'Luce', 'Brandt', NULL, NULL, NULL, NULL),
(2009, 248, 41, '0', 'Patrick Luddy', '12', '9/16', '4 Dibiase Street', 'Salem', 'MA', '01970', '6', '5\\''3\\"', '120', '', '', 'Caroline Luddy', '978-744-1888', '508-527-1750', '', '', '978-740-1353', '', 'July 20 AM', 'Rachel Luddy, Alyssa Flynn', 'Patrick', 'Luddy', NULL, NULL, NULL, NULL),
(2009, 249, 42, '0', 'Julia Graf', '13', '11/22/95', '51 Lynn  Fells Parkway', 'Melrose', 'MA', '02176', '7', '5.1', '95', '', 'Rick Graf', 'Jane Graf', '781.662.1639', '', 'jangraf@live.com', '', '617.285.2173, 781.953.0208', '', 'July 13 PM', 'Eddie Beaupre, nicoloe lapointe, john graf', 'Julia', 'Graf', NULL, NULL, NULL, NULL),
(2009, 250, 43, '0', 'Rachel Luddy', '9', '5/4/1999', '4 DiBiase Street', 'Salem', 'MA', '01970', '4', '55\\"', '70', '', '', 'Caroline Luddy', '978-744-1888', '', '', '', '508-527-1750', '', 'July 20 AM', 'Alyssa Flynn, Patrick Luddy', 'Rachel', 'Luddy', NULL, NULL, NULL, NULL),
(2009, 251, 44, '0', 'Ben Welling', '11', '05/05/1997', '17 Bertuccio Ave', 'Salem', 'MA', '01970', '6', '5\\''0\\"', '83', '', 'Audrey Welling', 'Kurt Welling', '978-741-2245', '978-979-5407', 'homedirt1313@comcast.net', '', '978-979-5407', '', 'Aug 3 AM', '', 'Ben', 'Welling', NULL, NULL, NULL, NULL),
(2009, 252, 45, '0', 'John Graf', '11', '1/6/98', '51 Lynn Fells Parkway', 'Melrose', 'MA', '02176', '5', '5', '85', '', 'Rick Graf', 'Jane Graf', '781.662.1639', '781.662.1639', 'jangraf@live.com', '', '617.285.2173, 781.953.0208', '', 'July 13 PM', 'eddie beaupre, nicoloe lapointe, julia graf', 'John', 'Graf', NULL, NULL, NULL, NULL),
(2009, 253, 46, '1', 'Eddie Beaupre', '12', '10/6/96', '11 Boardman St', 'Salem', 'MA', '01970', '6', '4\\''10\\''\\''', '65', '', 'Ed Beaupre', 'Marie Beaupre', '978-645-8541', '', 'mebeaupre@aol.com', '', '978-239-5214', '', 'July 13 PM', 'nicole lapointe', 'Eddie', 'Beaupre', NULL, NULL, NULL, NULL),
(2009, 254, 47, '0', 'Peter O\\''Donnell', '12', '12/1/96', '25 Woodside Street', 'Salem', 'MA', '01970', '6', '5.2', '105', '', 'Phil O\\''Donnell', 'Sandra O\\''Donnell', '978.744.1582', '978.210.6098', 'sondonn722@aol.com', 'sodonn722@aol.com', '978.210.6098', '', 'July 6 PM', 'Noah Camelo', 'Peter', 'O\\''Donnell', NULL, NULL, NULL, NULL),
(2009, 255, 48, '0', 'Nicole Lapointe', '12', '8/5/96', '10 Norman St Unit 202', 'Salem', 'MA', '01970', '6', '5\\''3\\''\\''', '100', '', 'Marc Lapointe', 'Larry Lapointe', '978-744-6876', '978-578-1306', 'larrylapointe@yahoo.com', '', '978-239-0690', '', 'Jun 22 PM', 'Eddie Beaupre', 'Nicole', 'Lapointe', NULL, NULL, NULL, NULL),
(2009, 256, 49, '0', 'Alden Freddo', '', '', '', 'Salem', 'MA', '01970', '6', '5\\''0\\', '83', '', '', '', '', '', '', '', '978-979-5407', '', 'Aug 3 AM', '', 'Alden', 'Freddo', NULL, NULL, NULL, NULL),
(2009, 257, 50, '0', 'Troy Welling', '9', '11/20/1999', '17 Bertuccio Ave', 'Salem', 'MA', '01970', '3', '4\\''8\\"', '90', '', 'Audrey Welling', 'Kurt Welling', '978-741-2245', '978-979-5407', 'homedirt1313@comcast.net', '', '978-979-5407', '', 'Aug 3 AM', '', 'Troy', 'Welling', NULL, NULL, NULL, NULL),
(2009, 258, 51, '0', 'James McLernon', '10', '01/01/1994', '3A Vetrens Memorialk Dr', 'Peabody', 'MA', '01960', '4', '5\\''2\\''\\'' ', '120', '', 'Jim McLernon', 'Barbara McLernon', '978-375-4801', '978-375-4800', 'barbi1131@comcast.net', 'mr89rw@comcast.net', '978-210-3339', '', 'Aug 17 AM', 'Calvin Hill,Connor Full', 'James', 'McLernon', NULL, NULL, NULL, NULL),
(2009, 259, 52, '0', 'Kurt Koloseus', '8', '', '2 Cross Ave', 'Salem', 'MA', '01970', '2', '4\\''7\\"', '85', '', 'Paul Koloseus', 'Valerie Koloseus', '978-395-1457', '617-852-7263', 'vsktrigirl@verizon.net', '', '978-239-8179, Tricia Pini', '', 'Aug 10 AM', 'Jacob Pini, Daniel Pini, Jonathan Philbin, Thomas Philbin', 'Kurt', 'Koloseus', NULL, NULL, NULL, NULL),
(2009, 260, 53, '0', 'Michael McLernon', '9', '03/01/2000', '3A Vetrens Memorial Dr', 'Peabody', 'MA', '01960', '3', '4\\''10\\''\\''', '90', '', 'Jim McLernon', 'Barbara McLernon', '978-375-4801', '978-375-4800', 'barbi1131@comcast.net', 'mr89rw@comcast.net', '978-210-3339', '', 'Aug 17 AM', 'Calvin Full, Connor Full', 'Michael', 'McLernon', NULL, NULL, NULL, NULL),
(2009, 261, 54, '0', 'Sofia Camelo', '9', '1/18/00', '72 Orne Street', 'Salem', 'MA', '01970', '3rd', '4/7\\\\', '70', '', 'Carlos Camelo', 'Elizabeth Camelo', '978-304-9402', '978-304-9402', 'ecamelo@mghihp.edu', '978-304-9402', '781-760-7331', '', 'July 13 AM', '', 'Sofia', 'Camelo', NULL, NULL, NULL, NULL),
(2009, 262, 55, '0', 'Connor Full', '9', '5/8/00', '12 Sherman St', 'Peabody', 'MA', '01960', '3', '48\\''\\''', '65', '', 'David Full', 'Dianne Full', '978-210-3339', '978-977-9466', 'fullhous11@netzero.com', 'fullhous1@netzero.com', '978-210-3339', '', 'Aug 17 AM', 'Michael McLerson, James McLernon', 'Connor', 'Full', NULL, NULL, NULL, NULL),
(2009, 263, 56, '0', 'Jonathan Philbin', '11', '', '13 Appleton Street', 'Salem', 'MA', '01970', '6', '4\\''10\\"', '120', '', 'Kelley Philbin', 'Tom Philbin', '617-309-8038', '978-395-1079', 'tphilbin@mma.org', '', '978-998-5494, Sandy Doyle', '', 'Aug 10 AM', 'Daniel Pini, Jacob Pini, Kurt Koloseus', 'Jonathan', 'Philbin', NULL, NULL, NULL, NULL),
(2009, 264, 57, '0', 'Calvin Full', '10', '8/27/98', '12 Sherman St', 'Peabody', 'MA', '01960', '4', '58', '85', '', 'David Full', 'Dianne Full', '978-210-3339', '978-977-9466', 'fullhous11@netzero.com', 'fullhous1@netzero.com', '978-210-3339', '', 'Aug 17 AM', 'Michael McLernon, James McLernon', 'Calvin', 'Full', NULL, NULL, NULL, NULL),
(2009, 265, 58, '0', 'Thomas Philbin', '9', '', '13 Appleton Street', 'Salem', 'MA', '01970', '3', '4\\''', '', '', 'Kelley Philbin', 'Tom Philbin', '617-309-8038', '978-395-1079', 'tphilbin@mma.org', '', '978-998-5494, Sandy Doyle', '', 'Aug 10 AM', 'Daniel Pini, Jacob Pini, Kurt Koloseus', 'Thomas', 'Philbin', NULL, NULL, NULL, NULL),
(2009, 266, 59, '0', 'Owen Murphy', '7', '9/23/01', '31 Warren Street', 'Salem', 'MA', '01970', '1', '4\\\\\\''6\\\\\\''', '60', '', 'Matt Murphy', 'Sarah Morrill', '978-314-5352', '978-745-6327, 617-331-3510', 'sarahmorrill@comcast.net', 'memerphy66@yahoo.com', '978-314-532 Sarah', '', 'Aug 17 AM', 'Owen Murphy, Jason Hedtrom, Aida Keenan', 'Owen', 'Murphy', NULL, NULL, NULL, NULL),
(2009, 267, 60, '0', 'Maeve Murphy', '9', '5/28/99', '31 Warren Street', 'Salem', 'MA', '01970', '4', '5', '65', '', 'Matt Murphy', 'Sarah Morrill', '978-745-6327', '617-331-3510', 'sarahmorrill@comcast.net', 'memurphy66@yahoo.com', '978-314-5352 Sarah', '', 'Aug 17 AM', 'Adam Keenan, Owen Murphy, Jason Hedstrom', 'Maeve', 'Murphy', NULL, NULL, NULL, NULL),
(2009, 268, 61, '0', 'Aaron Smart', '11', '3/20/98', '57 Appleton St.', 'Salem', 'MA', '01970', '5', '5', '75', '', 'Andrew Smart', 'Karen Smart', '978-741-4024', '978-741-4024', '', '', '508-566-5541', '', 'Aug 10 AM', '', 'Aaron', 'Smart', NULL, NULL, NULL, NULL),
(2009, 269, 62, '1', 'Mason Nalipinski', '12', '10/31/97', '6 Broad St', 'Salem', 'MA', '01970', '5', '5\\''2\\''\\''', '100', '', 'Page', 'Mike', '978-744-5667', '978-340-1288', 'nalipinski.mike@epa.gov', 'pinskie@earthlink.net', '617-680-5469', '', 'July 27 PM', '', 'Mason', 'Nalipinski', NULL, NULL, NULL, NULL),
(2009, 270, 63, '0', 'Kaitlyn Fabre', '12', '4/9/97', '4 Goodell St', 'Salem', 'MA', '01970', '6', '4\\''8\\''\\''', '95', '', '', 'Tammy Fabre', '978-744-4046', '978-766-9849', 'gimras@hotmail.com', '', '978-766-9849', '', 'Aug 17 AM', 'Jacquelin Panneden, Hannah Vandesindt, Emily Fabre', 'Kaitlyn', 'Fabre', NULL, NULL, NULL, NULL),
(2009, 271, 64, '0', 'Daniel Pini', '11', '4/20/1998', '26 Symonds Street', 'Salem', 'MA', '01970', '5', '4\\''9\\"', '120', '', 'Doug Pini', 'Tricia Pini', '978-239-8179', '978-239-8182', 'triciapinirocks@yahoo.com', '', '978-395-1457, Valerie Koloseus', '', 'Aug 10 AM', 'Jonathan Philbin, Thomas Philbin, Kurt Koloseus', 'Daniel', 'Pini', NULL, NULL, NULL, NULL),
(2009, 272, 65, '0', 'Emily Fabre', '9', '3/29/00', '4 Goodell St', 'Salem', 'MA', '01970', '3', '49', '60', '', '', 'Tammy Fabre', '978-744-4046', '978-766-9849', 'gimras@hotmail.com', '', '978-766-9849', '', 'Aug 17 AM', 'Mae Sides, Angela Berry, Kaitlyn Fabre', 'Emily', 'Fabre', NULL, NULL, NULL, NULL),
(2009, 273, 66, '0', 'noah camelo ', '12', '6/15/96', '72 orne st', 'Salem', 'MA', '01970', '6', '5\\''4', '105', '', 'carlos camelo', 'elizabeth camelo', '978-304-9402', '508-265-7940', 'ecamlo@mgh.hp/edu', 'camelocleaning@yahoo.com', '781-760-7371', '', 'July 13 AM', 'Peter O\\''Donnell', 'noah', 'camelo', NULL, NULL, NULL, NULL),
(2009, 274, 67, '0', 'Jacob Pini', '9', '1/31/2000', '26 Symonds Street', 'Salem', 'MA', '01970', '3', '4\\''8\\"', '120', '', 'Doug Pini', 'Tricia Pini', '978-239-8179', '978-239-8182', 'triciapinirocks@yahoo.com', '', '978-395-1457, Valerie Koloseus', '', 'Aug 10 AM', 'Jonathan Philbin, Thomas Philbin, Kurt Koloseus', 'Jacob', 'Pini', NULL, NULL, NULL, NULL),
(2009, 275, 68, '0', 'Cooper Camelo', '10', '5/29/98', '72 Orne Street', 'Salem', 'MA', '01970', '4', '4\\''7\\', '70', '', 'Carlos', 'Elizabeth', '978-304-9402', '508-265-7940', 'ecamelo@mgh.hp.edu', 'camelocleaning@yahoo.com', '781-760-7371', '', 'July 13 AM', '', 'Cooper', 'Camelo', NULL, NULL, NULL, NULL),
(2009, 276, 69, '0', 'Samuel Dawley', '8', '1/8/01', '4 Broad St', 'Salem', 'MA', '01970', '2', '4', '60', '', 'Shaughnessy', 'Brian/ Barbara', '978-745-6312', '617-839-2295', 'brian.shaughnessy@gmail.com', '', '617-839-2295', '', '', '', 'Samuel', 'Dawley', NULL, NULL, NULL, NULL),
(2009, 277, 70, '1', 'Madeleine Joan Holtz', '10', '4/7/2002', '19 Lincoln Road', 'Salem', 'MA', '01970', '4', '', '', '', 'Meghan Holtz', 'Peter Holtz', '978-742-7240', '', '', '', '978-395-5480', '', 'Jun 29 PM', 'No order of preference on dates', 'Madeleine', 'Joan', NULL, NULL, NULL, NULL),
(2009, 278, 71, '1', 'Eliza Jane Holtz', '10', '4/7/2002', '19 Lincoln Road', 'Salem', 'MA', '01970', '4', '', '', '', 'Meghan Holtz', 'Peter Holtz', '978-742-7240', '', '', '', '978-395-5480', '', 'Jun 29 PM', 'No order of preference on classes', 'Eliza', 'Jane', NULL, NULL, NULL, NULL),
(2009, 279, 72, '1', 'Noah Anderson', '8', '8/20/00', '14 Flint Street', 'Salem', 'MA', '01970', '3', '4\\''2\\''\\''', '55', '', 'Chris Anderson', 'Julie Anderson', '978-979-2337', '978-979-2336', 'cmanderson13@verizon.net', 'cmanderson13@verizon.net', '978-741-7472 (hm) 978-979-2337 (cell)', '', 'July 6 AM', 'Shamus Lombard', 'Noah', 'Anderson', NULL, NULL, NULL, NULL),
(2009, 280, 73, '0', 'Jack Kelly', '8', '6/8/00', '7 Diabse Street', 'Salem', 'MA', '01970', '3', '4\\''2\\''\\''', '80', '', 'Michael Kelly', 'Chris Kelly', '978-745-0589', '', 'kelhome@earthlink.net', '', '978-869-1674, 978-869-1659', '', 'July 20 PM', '', 'Jack', 'Kelly', NULL, NULL, NULL, NULL),
(2009, 281, 74, '1', 'Morgan Grundy', '10', '11/13/1998', '6 North Pine Street', 'Salem', 'MA', '01970', '4', '4\\''8\\', '95', '', 'Michelle Grundy', 'Rick Grundy', '978-744-2547', '617-510-6344', 'richard.grundy@state.ma.us', '', '617-510-6344', '', 'Aug 3 AM', 'Katie Moloney, Nicole Verio', 'Morgan', 'Grundy', NULL, NULL, NULL, NULL),
(2009, 282, 75, '0', 'Aedan Salvador', 'NULL', '7/24/2001', '10 Bentley Street', 'Salem', 'MA', '01970', '2', '48\\', '60', '', 'Emilio Salvador', 'Deidre Salvador', '978-594-8090', '617-921-0602', 'emsalv@aol.com', 'emsalv@comcast.net', '978-766-1221', '', 'Aug 10 AM', '', 'Aedan', 'Salvador', NULL, NULL, NULL, NULL),
(2009, 283, 76, '0', 'John Ballou', '10', '3/20/1999', '45 Station Road', 'Salem', 'MA', '01970', '4', '4\\''9\\', '80', '', 'Sue Ballou', 'Dan Ballou', '978-836-6824', '978-745-6710', 'dballou@mccuecorp.com', 'sue365_6@msn.com', '978-744-0100', '', 'Jun 29 AM', 'Nicole LaPointe, Madison Ballou', 'John', 'Ballou', NULL, NULL, NULL, NULL),
(2009, 284, 77, '0', 'Madison Ballou', '12', '2/13/1997', '45 Station Road', 'Salem', 'MA', '01970', '6', '5\\''2\\', '102', '', 'Dan Ballou', 'Sue Ballou', '978-740-4440', '978-836-6824', 'sue365_6@msn.com', 'dballou@mccuecorp.com', '978-744-0100', '', 'June 29 AM MS/HS', 'Nicole LaPointe, Madison Ballou', 'Madison', 'Ballou', NULL, NULL, NULL, NULL),
(2009, 285, 78, '0', 'Shannon Murphy', '8', '9/14/2000', '42 Larchmont Road', 'Salem', 'MA', '01970', '3', '52\\', '64', '', 'Michael Murphy', 'Ellen Murphy', '978-741-4902', '', 'ellmur@us.ibm.com', '', '978-790-3314', '', 'Aug 10 AM', 'Avery Kelleher', 'Shannon', 'Murphy', NULL, NULL, NULL, NULL),
(2009, 286, 79, '1', 'Kyllian Twiss', 'NULL', '6/20/2000', '3 Goodridge Street', 'Peabody', 'MA', '01960', '3', '55\\\\', '70', '', 'Tom Twiss', 'Lisa Twiss', '978-531-2126', '978-531-2126', 'twissbrothers@yahoo.com', '', '978-979-8889', '', 'Aug 17 AM', 'The Full Brothers and McClernon Brothers', 'Kyllian', 'Twiss', NULL, NULL, NULL, NULL),
(2009, 287, 80, '0', 'Eleanor Seyfried', '9', '12/1/1999', '7 May Street #2', 'Salem', 'MA', '01970', '3', '', '', '', 'Rose Seyfried', 'Mark Seyfried', '978-744-2395', '978-744-0363', 'seyfrieds@gmail.com', 'rosemaryseyfried@gmail.com', '978-744-0395', '', 'July 6 AM', 'Isabelle Welch', 'Eleanor', 'Seyfried', NULL, NULL, NULL, NULL),
(2009, 288, 81, '0', 'Connor Alexander', 'NULL', '10/19/1996', '8 Rand Road', 'Salem', 'MA', '01970', '6', '5\\''', '80', '', 'Brian Alexander', 'Elayne Alexander', '617-645-3753', '978-852-8094', 'elayne.m.alexander@bankofamerica.com', '', '617-645-3753', '', 'July 27 AM', '', 'Connor', 'Alexander', NULL, NULL, NULL, NULL),
(2009, 289, 82, '1', 'Connor Heenan', '9', '12/26/99', '6 Fairfield Street', 'Salem', 'MA', '01970', '3', '', '', '', 'Dennis Heenan', 'Erin Heenan', '978-745-6009`', '978-745-6009', 'denerinheenan@verizon.net', 'denerinheenan@verizon.net', '978-821-4194', '', 'Jun 8 AM', '', 'Connor', 'Heenan', NULL, NULL, NULL, NULL),
(2009, 290, 83, '1', 'Cole Jermyn', '11', '8/6/97', '4 Scenic Terrace', 'Salem', 'MA', '01970', '6', '4''11', '87', '', 'Cheryl Jermyn', 'John jermyn', '978-744-6519', '978-853-9181', 'john.jermyn@aexp.com', 'cjermyn8@hotmail.com', '978-853-9181', '', 'July 6 AM', '', 'Cole', 'Jermyn', NULL, NULL, NULL, NULL),
(2009, 291, 84, '0', 'Demetri Bouras', '8', '7/31/00', '24 Buena Vista Ave', 'Salem', 'MA', '01970', '3', '4''3', '65', '', 'Peter Bouras', 'Michelle Bouras', '978-740-8642', '978-740-8642', 'pmbouras@verizon.net', 'pmbouras@verizon.net', '617-312-2345', '', 'Aug 17 AM', '', 'Demetri', 'Bouras', NULL, NULL, NULL, NULL),
(2009, 292, 85, '0', 'Laura Barnes', '10', '', '', 'Salem', 'MA', '01970', '', '', '', '', 'Jason Barnes', 'Melissa Barnes', '', '', '', '', '', '', 'July 20 PM', '', 'Laura', 'Barnes', NULL, NULL, NULL, NULL),
(2009, 293, 86, '0', 'Christopher Barnes', '8', '', '', 'Salem', 'MA', '01970', '', '', '', '', 'Jason Barnes', 'Melissa Barnes', '', '', '', '', '', '', 'July 20 PM', '', 'Christopher', 'Barnes', NULL, NULL, NULL, NULL),
(2009, 294, 87, '0', 'Chloe Irvine', '8', '10/28/00', '63 Dearborn Street', 'Salem', 'MA', '01970', '2', '', '', '', 'Geoff Irvine', 'Stephanie Irvine', '314-973-8588', '314-713-2926', 'stephirvine@me.com', '', '978-395-7116', '', 'July 20 AM', 'Eliza Nugent', 'Chloe', 'Irvine', NULL, NULL, NULL, NULL),
(2009, 295, 88, '0', 'Eliza Nugent', '8', '8/19/00', '12 River Street', 'Salem', 'MA', '01970', '2', '', '', '', 'Elizabeth Nugent', 'Peter Nugent', '617-501-8815', '857-523-0853', 'peter.t.nugent@accenture.com', 'elizabeth-nugent@comcast.net', '857-523-0853', '', 'July 20 AM', 'chle Irvine', 'Eliza', 'Nugent', NULL, NULL, NULL, NULL),
(2009, 296, 89, '0', 'Ian Graham', '12', '9/8/96', '41 Felt Street', 'Salem', 'MA', '01970', '7', '4''11', '89', '', 'John Graham', 'sonene Graham', '603-315-4392', '', 'sonene@comcast.net', '', '978-744-5729', '', 'July 13 AM', '', 'Ian', 'Graham', NULL, NULL, NULL, NULL),
(2009, 297, 90, '0', 'Connor Mackey', '8', '9/3/00', '2 Sunset Rd', 'Salem', 'MA', '01970', '2', '4''2', '53', '', 'Brenda Mackey', 'David Mackey', '978-578-0167', '978-423-9992', 'dtmackey@gmail.com', 'brenda.mackey@danversbank.com', '978-578-0167', '', 'July 27 AM', '', 'Connor', 'Mackey', NULL, NULL, NULL, NULL),
(2009, 298, 91, '1', 'Angelina Caggiano', '9', '3/24/00', '14 Patton Road', 'Salem', 'MA', '01970', '3', '', '80', '', 'Mike Caggiano', 'Diane Caggiano', '508-641-6192', '508-641-1988', 'dacagg@yahoo.com', '', '978-744-5509', '', 'July 6 AM', 'Andrew Clark and Meggan Hathaway', 'Angelina', 'Caggiano', NULL, NULL, NULL, NULL),
(2009, 299, 92, '0', 'AnnabelleBlaisdell', '9', '7/31/00', '11 Roosevelt Avenue', 'Marblehead', 'MA', '01945', '4', '', '53', '', 'Peter Blaisdell', 'Danielie Blaisdell', '781-608-9393', '781-405-4490', 'pdblaisdell@verizon.net', '', '781-608-9393', '', 'Aug 3 PM', '', 'AnnabelleBlaisdell', '', NULL, NULL, NULL, NULL),
(2009, 300, 93, '0', 'Meagan Hatahaway', '8', '6/8', '175 West Shore Drive', 'Marblehead', 'MA', '01945', '3', '53', '85', '', 'Frank Hathaway', 'Patricia Hathaway', '781-639-1769', '617-599-0734', 'hathaway@verizon.net', '', '781-727-1262', '', 'July 6 AM', 'Angelina Caggiano and Andrew Clark', 'Meagan', 'Hatahaway', NULL, NULL, NULL, NULL),
(2009, 301, 94, '0', 'Russell Griogorian', '13', '12/18/95', '9 Sutton Ave', 'Salem', 'MA', '01970', '7', '5''6', '115', '', 'Nareg Grigorian', 'Nancy Grigorian', '978-741-1785', '978-979-1834', 'nancygrigorian@comcast.net', 'naregg@comcast.net', '978-979-1834', '', 'July 6 PM MS/HS', 'Andrew Schatz', 'Russell', 'Griogorian', NULL, NULL, NULL, NULL),
(2009, 302, 95, '0', 'Sydney Hanford', '12', '5/31/97', '43 Valley Street', 'Salem', 'MA', '01970', '6', '55', '90', '', 'Scott', 'Patti', '', '978-930-2322', 'phanford@myseafood.com', 'scotthanford@yahoo.com', '781-820-3385', '', 'July 20 PM', 'must be placed with Julia jermyn for driving', 'Sydney', 'Hanford', NULL, NULL, NULL, NULL),
(2009, 303, 96, '0', 'Jackson Hanford', '10', '7/13/97', '43 Valley Street', 'Salem', 'MA', '01970', '4', '55', '100', '', 'Scott', 'Patti', '781-820-3385', '978-830-2322', 'phanford@myseafood.com', 'scotthanford@yahoo.com', '781-820-3385', '', 'July 20 PM', 'must be placed with Julia Jermyn', 'Jackson', 'Hanford', NULL, NULL, NULL, NULL),
(2009, 304, 97, '1', 'Andrew Clark', '9', '1/23/00', '16 Patton Road', 'Salem', 'MA', '01970', '3', '', '', '', 'Robert Clark', 'Kristen Clark', '978-741-5725', '800-615-0271', 'kristen_clark@hotmail.com', 'bobclark@comsys.com', '978-239-0893', '', 'July 6 AM', 'Angelina Caggiano', 'Andrew', 'Clark', NULL, NULL, NULL, NULL),
(2009, 305, 98, '0', 'Colin Nye', '11', '5/19/98', '5 Shore Ave', 'Salem', 'MA', '01970', '5', '5', '100', '', 'Rick Nye', 'caroline Nye', '978-744-1358', '978-744-1358', 'nyecc@yahoo.com', 'nyecc@yahoo.com', '978-758-1378', '', 'July 20 PM', 'That is the only session he can attend.', 'Colin', 'Nye', NULL, NULL, NULL, NULL),
(2009, 306, 99, '0', 'Adam Denman', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Adam', 'Denman', NULL, NULL, NULL, NULL),
(2009, 307, 100, '0', 'Evan Denman', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Evan', 'Denman', NULL, NULL, NULL, NULL),
(2009, 308, 101, '0', 'Ryan King', '9', '12/17/99', '35 Chase Street', 'Danvers', 'MA', '01923', '3', '4''7''''', '70', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Ryan', 'King', NULL, NULL, NULL, NULL),
(2009, 309, 102, '0', 'Leo Smart', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 AM', '', 'Leo', 'Smart', NULL, NULL, NULL, NULL),
(2009, 310, 103, '0', 'Satya Hoff', '8', '3/5/1', '47 Hathorne Street', 'Salem', 'MA', '01970', '3', '44', '50', '', 'Paul Hoff', 'k Hoff', '978-210-2084', '978-210-2428', 'kemwake@gmail.com', 'mailhoff@verizon.net', '978-210-2084', '', 'Aug 3 PM', '', 'Satya', 'Hoff', NULL, NULL, NULL, NULL),
(2009, 311, 104, '0', 'Julia Channing', '10', '9/15/98', '30 Wintrhop Street', 'Salem', 'MA', '01970', '5', '', '82', '', '', 'Mary Collari', '978-578-7665', '', 'juna98@hotmail.com', '', '978-578-7665', '', 'Aug 10 PM', '', 'Julia', 'Channing', NULL, NULL, NULL, NULL),
(2009, 312, 105, '0', 'Sam Martin', '10', '5/26/99', '5 West Circle', 'Salem', 'MA', '01970', '4', '54', '63', '978-979-7472', 'Kerry Martin', 'Brad Martin', '978-979-7472', '978-979-7473', 'kerry.martin1@comcast.net', '', '978-979-7472', '', 'July 27 PM', '', 'Sam', 'Martin', NULL, NULL, NULL, NULL),
(2009, 313, 106, '0', 'Alex Martin', '11', '11/22/97', '5 West Circle', 'Salem', 'MA', '01970', '5', '61', '90', '', '', 'Kerry Martin', '', '', 'kerry.martin1@comcast.net', '', '978-979-7472', '', 'July 27 PM', '', 'Alex', 'Martin', NULL, NULL, NULL, NULL),
(2009, 314, 107, '1', 'Mikaela Dionne', '12', '5/31/97', '24 Sable Road', 'Salem', 'MA', '01970', '6', '4''ll', '87', '', 'Alan Dionne', 'Lisa Dionne', '978-375-4964', '978-375-4963', 'lddionne@comcast.net', 'aedioone@comcast.net', '978-375-4964', '', 'June 29 AM MS/HS', '', 'Mikaela', 'Dionne', NULL, NULL, NULL, NULL),
(2009, 315, 108, '1', 'Collin Butler', '12', '10/12/1999', '14 Hunt Street', 'Danvers', 'MA', '01923', '6', '52''''', '68', '', 'Eric Butler', 'Amey Butler', '978-777-1976', '617-828-5191', 'amey.butler@verizon.net', '', '978-777-1976 (home) 978-836-9676 (Cell)', '', 'July 27 PM MS/HS', 'MIDDLE SCHOOL', 'Collin', 'Butler', NULL, NULL, NULL, NULL),
(2009, 316, 109, '1', 'Callum Butler', '9', '10/12/1999', '14 Hunt Street', 'Danvers', 'MA', '01923', '3', '48', '56', '', 'Eric Butler', 'Amey Butler', '978-777-1976', '617-828-5191', 'amey.butler@verizon.net', '', '978-777-1976, 978-836-9676', '', 'July 27 PM', '', 'Callum', 'Butler', NULL, NULL, NULL, NULL);
INSERT INTO `wh_registration` (`year`, `id`, `registrationNumber`, `MedicalInformationForm`, `studentName`, `Age`, `BirthDate`, `Address`, `City`, `State`, `Zip`, `SchoolGrade`, `Height`, `Weight`, `HomePhone`, `Mother`, `Father`, `Phone1`, `Phone2`, `Email1`, `Email2`, `PrimaryEmergencyNumber`, `TShirtSize`, `AssignedSession`, `Notes`, `first_name`, `last_name`, `guardian_one_firstname`, `guardian_one_lastname`, `guardian_two_firstname`, `guardian_two_lastname`) VALUES
(2009, 317, 110, '0', 'Brian Manning', '9', '2/16/00', '17 Kingdom Terrace', 'Peabody', 'MA', '01960', '3', '4''6''''', '', '', 'Shawn Manning', 'Diana Manning', '978-977-9851', '', 'diana.manning@middlecak,con', 'shawndiandbri@earthlink.,net', '508-560-2025', '', 'Aug 17 AM', '', 'Brian', 'Manning', NULL, NULL, NULL, NULL),
(2009, 318, 111, '1', 'Anya Hart', '9', '8/2/99', '10 Heritage Way', 'Marblehead', 'MA', '01945', '4', '53', '83', '', 'Clint', 'Jean', '781-639-1566', '781-639-1566', 'jhart@goulstonstons.com', 'clinthart@juno.com', '781-639-1566, 617-574-6571', '', 'Jun 29 AM', '', 'Anya', 'Hart', NULL, NULL, NULL, NULL),
(2009, 319, 112, '1', 'Erika Hostrop', '7', '7/22/01', '27 Sparhawk Ter', 'Marblehead', 'MA', '01945', '2', '51', '53', '', 'Fritz', 'Arlene ', '617-645-1074', '617-699-2177', 'ahostrop@comcast.net', '', '617-645-1074, 781-576-9417', '', 'Jun 29 PM', '', 'Erika', 'Hostrop', NULL, NULL, NULL, NULL),
(2009, 320, 113, '1', 'Marina Hostrop', '10', '11/26/98', '27 Sparhawk Ter', 'Marblehead', 'MA', '01945', '5', '57', '78', '', 'Fritz', 'Arlene', '617-645-1074', '617-699-2177', 'ahostrop@comcast.net', '', '617-645-1074, 781-576-9417', '', 'Jun 29 PM', '', 'Marina', 'Hostrop', NULL, NULL, NULL, NULL),
(2009, 321, 114, '1', 'Imogene Donovan', '8', '8/18/00', '14 Lincoln Park', 'Marblehead', 'MA', '01945', '3', '52', '58', '', 'Brendan', 'Alessandra', '781-576-9417', '781-576-9455', 'alexnboo@comcast.net', 'alexnboo@comcast.net', 'noel young (781-631-0788), Arlene Hostrop (617-645-1074)', '', 'Jun 29 PM', '', 'Imogene', 'Donovan', NULL, NULL, NULL, NULL),
(2009, 322, 115, '1', 'Erin Tarmey', '9', '01/11/2000', '53 Maverick Street', 'Marblehead', 'MA', '01945', '3', '54', '60', '', 'Marilyn', 'Mark', '781-639-8028', '781-639-8028', 'tarmeymark@comcast.net', '', '781-640-1232', '', 'July 6 PM', '', 'Erin', 'Tarmey', NULL, NULL, NULL, NULL),
(2009, 323, 116, '1', 'Madeline Mazuzan', 'NULL', '8/9/01', '257 Loring Ave', 'Salem', 'MA', '01970', '3', '46', '44', '', 'Mark', 'Vanessa', '781-367-8937', '978-257-5481', 'venessa.mazuzan@fei.com', 'mark.mazuzan@ngc.com', '781-367-8937', '', 'Jun 29 AM', '', 'Madeline', 'Mazuzan', NULL, NULL, NULL, NULL),
(2009, 324, 117, '1', 'Alexandra M. Enos', '7', '8/22/01', '72 Winthrop Ave', 'Beverly', 'MA', '01915', '3', '49', '48', '', '', 'Emily', '508-783-3550', '', 'emilybenos@gmail.com', '', '508-783-3550', '', 'Jun 29 AM', '', 'Alexandra', 'M.', NULL, NULL, NULL, NULL),
(2009, 325, 118, '1', 'Greg Conrad', '8', '2/15/01', '5 Martingdale Rd', 'Lexington', 'MA', '02421', '3', '4''10''''', '85', '', 'Lon Conrad', 'Lois Bisson', '781-862-7162', '978-828-5681', 'loisbisson@verizon.net', 'Lconrad@compassinvest.com', '781-259-1241 (linda conrad, grandmother)', '', 'Jun 22 PM', '', 'Greg', 'Conrad', NULL, NULL, NULL, NULL),
(2009, 326, 119, '0', 'Alex Rossetti', '11', '8/25/97', '42 Raymond Ave', 'Salem', 'MA', '01970', '5', '', '', '', 'Andrew', 'Meg', '978-740-0131', '978-998-9402', 'megrossetti2002@yahoo.com', '', '978-998-9403 Julian (brother)', '', 'July 27 PM MS/HS', '', 'Alex', 'Rossetti', NULL, NULL, NULL, NULL),
(2009, 327, 120, '0', 'Julian Rossetti', '16', '9/4/92', '42 Raymond Ave', 'Salem', 'MA', '01970', '10', '6', '', '', 'Andrew', 'Meg', '978-740-0131', '978-998-9402', '', '', '978-998-9403', '', 'Aug 3 PM MS/HS', 'High School', 'Julian', 'Rossetti', NULL, NULL, NULL, NULL),
(2009, 328, 121, '0', 'Jack Suminsby', '10', '10/14/98', 'PO Box 3275', 'Beverly', 'MA', '01915', '4', '', '80', '', 'David', 'Julianne', '978-335-2668', '978-578-7709', 'jsuminsby@yahoo.com', 'jdavidsuminsby@yahoo.com', '978-578-7709', '', 'Aug 3 PM', '', 'Jack', 'Suminsby', NULL, NULL, NULL, NULL),
(2009, 329, 122, '1', 'Benjamin Cassola', '10', '4/4/99', '6 Thomas Road', 'Beverly', 'MA', '01915', '4', '56''''', '100', '', 'Janice', 'Phillip', '978-927-9926', '978-836-8083', 'jancassola2@comcast.net', '', '978-836-6237', '', 'Aug 3 PM', '', 'Benjamin', 'Cassola', NULL, NULL, NULL, NULL),
(2009, 330, 123, '1', 'Adam Czubinski', '12', '01/30/97', '37 Chase St', 'Danvers', 'MA', '01923', '6', '5', '92', '', 'Stanley', 'Anna', '978-774-0877', '978-767-0271', 'anna.czubinski@comcast.net', '', '978-767-0271', '', 'July 27 PM MS/HS', 'Middle School', 'Adam', 'Czubinski', NULL, NULL, NULL, NULL),
(2009, 331, 124, '0', 'Alexandra Malarczyk', '12', '08/27/97', '17 Forest Street', 'Midlleton', 'MA', '01949', '6', '4''5''''', '105', '', 'Boleslaw', 'Dorota', '978-491-7591', '978-744-1340', 'dorotam@comcast.net', '', '978-491-4591', '', 'July 27 PM MS/HS', 'Middle School', 'Alexandra', 'Malarczyk', NULL, NULL, NULL, NULL),
(2009, 332, 125, '0', 'Victoria Malarczyk', '9', '6/13/00', '17 Forest Street', 'Middleton', 'MA', '01949', '3', '4', '48', '', 'Boleslaw', 'Dorota', '978-491-4591', '978-974-1340', 'dorotam@comcast.net', '', '978-491-4591', '', 'July 27 PM', '', 'Victoria', 'Malarczyk', NULL, NULL, NULL, NULL),
(2009, 333, 126, '0', 'Marena Anderson', '9', '11/23/99', '10 Adams Street', 'Salem', 'MA', '01970', '3', '54', '66', '', 'Ben', 'Lisa', '978-745-6840', '', 'mafali.anderson@comcast.net', '', '617-438-6218', '', 'Aug 17 AM', '', 'Marena', 'Anderson', NULL, NULL, NULL, NULL),
(2009, 334, 127, '0', 'Mohammad Ali El Ashlear', '13', '12/29/95', '212 Canal Street', 'Salem', 'MA', '01970', '8', '5''6'''' ', '150', '', 'Emaul', 'Jill', '978-745-4570', '', 'asim00@verizon.net', '', '', '', 'July 6 PM MS/HS', 'Middle School', 'Mohammad', 'Ali', NULL, NULL, NULL, NULL),
(2009, 335, 128, '0', 'Qasim El Ashear', '8', '9/23/00', '212 Canal Street', 'Salem', 'MA', '01970', '', '', '', '', 'Emaul', 'Jill', '978-745-4570', '', 'qasim00@verizon.net', '', '978-729-8430', '', 'July 6 PM', '', 'Qasim', 'El', NULL, NULL, NULL, NULL),
(2009, 336, 129, '1', 'Wiliam Vaillancourt', '14', '6/1/95', '45 Chestnut St', 'Salem', 'MA', '01970', '8', '5''7''''', '137', '', 'M Q', 'Kim', '617-851-8259', '781-639-2339, 781-910-8433', 'katui-kalignn@fmr.com', 'tmbeatty11@hotmail.com', '781-910-8762, 617-851-8759', '', 'July 13 PM MS/HS', 'High School', 'Wiliam', 'Vaillancourt', NULL, NULL, NULL, NULL),
(2009, 337, 130, '1', 'Joey Vaillancourt', '10', '7/12/98', '45 Chestnut Street', 'Marblehead', 'MA', '01945', '6', '5''1''''', '124', '', 'Quin', 'Kim', '617-851-8759', '781-639-2339, 781-910-8433', 'katni.kaliginn@fmr.com', 'tmbeatty11@hotmail.com', '781-910-8762', '', 'Jun 22 PM', '', 'Joey', 'Vaillancourt', NULL, NULL, NULL, NULL),
(2009, 338, 131, '0', 'Adrian Jablonka', '13', '1/23/96', '330 Walnut Street', 'Lynnfield', 'MA', '01940', '8', '5', '92', '', 'Rafal', 'Anna', '978-828-8829', '781-596-4407', 'anna.jablonka@vsea.com', 'r.jablonka@easternbk.com', '978-828-8829', '', 'Aug 10 PM MS/HS', 'Middle School', 'Adrian', 'Jablonka', NULL, NULL, NULL, NULL),
(2009, 339, 132, '0', 'Jakub Jablonka', '11', '5/7/98', '330 Walnut Street', 'Lynnfield', 'MA', '01940', '6', '4''9''''', '83', '', 'rafal', 'anna', '978-828-8829', '781-596-4407', 'anna.jablonka@vsea.com', 'r.jablonka@easternbk.com', '978-828-8829', '', 'Aug 10 PM MS/HS', 'middle school', 'Jakub', 'Jablonka', NULL, NULL, NULL, NULL),
(2009, 340, 133, '0', 'Simon Kazimierczyk', '11', '8/1/98', '35 Kings Hill Dr', 'Lynn', 'MA', '01905', '6', '5''', '135', '', 'Eric', 'Dorota', '781-599-7695', '781-521-4698', 'dortoaf@verizon.net', '', '781-521-4261', '', 'Aug 10 PM MS/HS', 'middle school', 'Simon', 'Kazimierczyk', NULL, NULL, NULL, NULL),
(2009, 341, 134, '0', 'Jack Emerling', '11', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', 'salemcsm@hotmail.com', '', '', '', 'Aug 3 AM', '', 'Jack', 'Emerling', NULL, NULL, NULL, NULL),
(2009, 342, 135, '0', 'Will Emerling', '9', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', 'salemcsm@hotmail.com', '', '', '', 'Aug 3 AM', '', 'Will', 'Emerling', NULL, NULL, NULL, NULL),
(2009, 343, 136, '0', 'Reid Oka-mclaren', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '978-745-9090', '', '', '', '', '', 'Aug 10 PM', '', 'Reid', 'Oka-mclaren', NULL, NULL, NULL, NULL),
(2009, 344, 137, '0', 'Joey Vaillancourt', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 6 PM', '', 'Joey', 'Vaillancourt', NULL, NULL, NULL, NULL),
(2009, 345, 138, '1', 'Sara Beatty', '10', '5/14/99', '81 Overlook Rd', 'Marblehead', 'MA', '01945', '5', '3''11''', '66', '', 'Todd', '', '802-324-0950', '', 'tmbeatty11@hotmail.com', '', '978-741-0799', '', 'Jun 22 PM', '', 'Sara', 'Beatty', NULL, NULL, NULL, NULL),
(2009, 346, 139, '0', 'Sara Beatty', '10', '5/14/99', '81 Overlook Road', 'Marblehead', 'MA', '01945', '5', '3''11''''', '66', '', 'Todd', '', '802-324-5950', '', 'tmbeatty11@hotmail.com', '', '978-741-0799', '', 'July 6 PM', '', 'Sara', 'Beatty', NULL, NULL, NULL, NULL),
(2009, 347, 140, '0', 'chloe scharffenberg', '8', '9/6/00', '16 Burley Farm Road', 'Danvers', 'MA', '01923', '3', '', '60', '', 'Scott Scharffenberg', 'Lisa Scharffenberg', '978-430-8568', '978-239-0295', 'lisaschaff@msn.com', 'scottschaff@msn.com', '978-239-0295', '', 'July 6 PM', '', 'chloe', 'scharffenberg', NULL, NULL, NULL, NULL),
(2009, 348, 141, '1', 'David- Covello', '8', '01/23/01', '36 Ledgewood Drive', 'Danvers', 'MA', '01923', '3', '4''6''', '70', '978 646-9453', 'Daniel Covello', 'Paige Covello', '978-766-8239', '617-416-9822', 'covello@comcast.net', 'dan.covello@sap.com', '978-766-8239', '', 'July 6 PM', '', 'David-', 'Covello', NULL, NULL, NULL, NULL),
(2009, 349, 142, '0', 'Laura Smith', '9', '10/3/99', '9 Witchcraft Road', 'Salem', 'MA', '01970', '3', '4''8"', '70', '', 'David Smith', 'Leanne Smith', '978-317-2543', '978-317-2546', 'airodoodle2109@aol.com', 'maritimeattorney@aol.com', '978-317-2543', '', 'July 6 PM', '', 'Laura', 'Smith', NULL, NULL, NULL, NULL),
(2009, 350, 143, '0', 'Nicholass Capra', '9', '', 'Crescent Drive', 'Salem', 'MA', '01970', '3', '', '', '', 'Bill Capra', 'Laurie Capra', '', '', 'laurie.capra@verizon.net', '', '', '', 'July 6 AM', '', 'Nicholass', 'Capra', NULL, NULL, NULL, NULL),
(2009, 351, 144, '0', 'Connor O''Shea', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 13 AM MS/HS', 'HIGH SCHOOL', 'Connor', 'O''Shea', NULL, NULL, NULL, NULL),
(2009, 352, 145, '0', 'James Cooper', '13', '9/20/95', '22 Highland Avenue', 'Salem', 'MA', '01970', '7/8', '5''1', '120', '', '', 'Mary Lou Scialdone', '978-745-3338', '', 'ML-scialdone@comcast.net', '', '978-210-6068', '', 'July 6 PM', '', 'James', 'Cooper', NULL, NULL, NULL, NULL),
(2009, 353, 146, '0', 'Sam Martin', '10', '5/26/99', '5 West Circle', 'Salem', 'MA', '01970', '4', '54', '63', '', '', '', '989-979-7472', '', 'kerry.martin1@comcast.net', '', '978-979-7472', '', 'July 27 PM', '', 'Sam', 'Martin', NULL, NULL, NULL, NULL),
(2009, 354, 147, '0', 'Patrick Scanlan', '14 1/2', '7/25/94', '13 Bay View Circle', 'Salem', 'MA', '01970', '7', '5', '125', '978-744-7117', 'Stephanie', 'Jim', '978-337-7516', '978-578-1983', 'stephanie.scanlan@gmail.com', '', '978-744-7821', '', 'Aug 10 AM MS/HS', '', 'Patrick', 'Scanlan', NULL, NULL, NULL, NULL),
(2009, 355, 148, '0', 'Daniel Lopez', '8', '10/11/00', '72 Washington Suare', 'Salem', 'MA', '01970', '2', '4''5', '60', '', '', 'Alejandra Barratt', '978-744-2748', '', 'albaralt@hotmail.com', '', '508-843-3393', '', 'Aug 3 AM', '', 'Daniel', 'Lopez', NULL, NULL, NULL, NULL),
(2009, 356, 149, '0', 'Michael Stuart', '11', '3/24/98', '14 Puritian Rd', 'Salem', 'MA', '01970', '5', '4''4''''', '103', '', 'Nancy', 'Mike ', '978-767-0714', '978-767-0715', '', '', '978-767-0714', '', '', '', 'Michael', 'Stuart', NULL, NULL, NULL, NULL),
(2009, 357, 150, '1', 'John Cataldo', '10', '10/22/98', '3 Cambridge Street', 'Salem', 'MA', '01970', '4', '', '74', '', 'Walter', 'Maura', '978-239-7987', '978-744-2958; 781-929-8568', '', '', '978-239-7987', '', 'Jun 22 AM', '', 'John', 'Cataldo', NULL, NULL, NULL, NULL),
(2009, 358, 151, '1', 'Christopher Cataldo', '9', '7/3/00', '3 Cambrdge Street', 'Salem', 'MA', '01970', '2', '', '71', '', 'Walter', 'Maura', '978-239-7981', '978-744-2958; 781-929-8568', 'm.cataldo@comcast.net', '', '978-239-7987', '', 'Jun 22 AM', '', 'Christopher', 'Cataldo', NULL, NULL, NULL, NULL),
(2009, 359, 152, '1', 'Don Kairento', '8', '06/02/01', '45 Warren Street', 'Salem', 'MA', '01970', '1', '42', '50', '', 'Malla Linturi', 'Harri Kairento', '978-744-3725', '781-301-1234', 'malla.lintur@gmail.com', 'harri.kairento @gmail.com', '508-783-8719', '', 'Jun 29 AM', '', 'Don', 'Kairento', NULL, NULL, NULL, NULL),
(2009, 360, 153, '0', 'Nathan Dimeco', '9', '5/20/00', '4 tanner rd', 'wilminton', 'MA', '01887', '3', '4''4''''', '60', '', 'Piia', 'Mario', '617-854-1187', '617-459-0252', 'pdimeco@verizon.net', 'mdieco@verizon.net', '617-563-3977', '', '', '', 'Nathan', 'Dimeco', NULL, NULL, NULL, NULL),
(2009, 361, 154, '1', 'Katie Darmody', '9', '03/10/2000', '69 Butler Street', 'Salem', 'MA', '01970', '3', '4''', '75', '', 'Kerri', 'Ed', '978-745-3615', '', 'ekdk@netzero.com', '', '', '', 'Jun 29 AM', '', 'Katie', 'Darmody', NULL, NULL, NULL, NULL),
(2009, 362, 155, '1', 'Hunter McDonough', '10', '8/30/99', '14 Chandler Rd', 'Salem', 'MA', '01970', '', '5''2''''', '70', '', 'Dawn', 'Kevin', '978-594-5133', '781-929-1629', 'huntermacd@comcast.net', '', '781-956-4307', '', 'Jun 22 PM', '', 'Hunter', 'McDonough', NULL, NULL, NULL, NULL),
(2009, 363, 156, '0', 'Michael Stuart', '11', '3/24/98', '14 Puritian Rd', 'Salem', 'MA', '01970', '5', '4''4''''', '103', '', 'Nancy', 'Mike', '978-767-0714', '978-767-0714', '', '', '978-767-0714', '', '', '', 'Michael', 'Stuart', NULL, NULL, NULL, NULL),
(2009, 364, 157, '1', 'Daniel Darmody', '12', '08/31/96', '69 Butler St', 'Salem', 'MA', '01970', '6', '5''', '100', '', 'Kerri', 'Ed', '978-745-3615', '', 'ekdk@netzero.com', '', '', '', 'June 29 AM MS/HS', 'MIDDLE SCHOOL', 'Daniel', 'Darmody', NULL, NULL, NULL, NULL),
(2009, 365, 158, '0', 'Derek Dupuis', '13', '6/28/96', '14 Maple St', 'Salem', 'MA', '01970', '8', '5''', '', '', 'Daniel', 'Stacey', '978-335-7397', '978-740-6645', '', 'staceydupuis@comcast.net', '', '', 'July 6 PM', '', 'Derek', 'Dupuis', NULL, NULL, NULL, NULL),
(2009, 366, 159, '0', 'Cianan Furlong', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Cianan', 'Furlong', NULL, NULL, NULL, NULL),
(2009, 367, 160, '0', 'Mike Welsh', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Mike', 'Welsh', NULL, NULL, NULL, NULL),
(2009, 368, 161, '1', 'Alexander Denby', '8', '6/27/01', '31 West Ave', 'Salem', 'MA', '01970', '2', '4''2''''', '70', '', 'David', 'Anya', '978-745-3548', '', 'anyadenby@gmail.com', 'daviddenby@comcast.net', '', '', 'July 13 PM', '', 'Alexander', 'Denby', NULL, NULL, NULL, NULL),
(2009, 369, 162, '0', 'Joshua Eugenio', '13', '4/28/96', '3 Forest St', 'Peabody', 'MA', '01960', '7', '', '105', '', 'Mark', 'Michelle', '978-979-7301', '617-834-2830', 'mle6964@verizon.net', '', '', '', 'July 13 PM MS/HS', '', 'Joshua', 'Eugenio', NULL, NULL, NULL, NULL),
(2009, 370, 163, '1', 'Katie Henry', '10', '2/15/99', 'po box 67', 'Salem', 'MA', '01970', '5', '4''5''''', '1', '', 'Bradford', 'Donna', '978-500-9063', '978-232-1435', 'riedl37@hotmail.com', 'bhenrytech@yahoo.com', '', '', 'July 13 PM', '', 'Katie', 'Henry', NULL, NULL, NULL, NULL),
(2009, 371, 164, '1', 'Patrick Henry', '8', '9/3/00', 'PO Box 67', 'Salem', 'MA', '01970', '3', '4''11', '95', '', 'Bradford', 'Donna', '978-500-9063', '978-232-1435', 'ried137@hotmail.com', 'bhenrytech@yahoo.com', '', '', 'July 13 PM', '', 'Patrick', 'Henry', NULL, NULL, NULL, NULL),
(2009, 372, 165, '0', 'Morgan Sax', '17', '2/18/92', '21 Broad Str', 'Salem', 'MA', '01970', '12', '5''6''''', '120', '', 'Michael', 'Carol', '978-744-5474', '', 'msax@msn.com', 'simonpigi@msn.com', '508-328-0134', '', 'July 6 AM MS/HS', '', 'Morgan', 'Sax', NULL, NULL, NULL, NULL),
(2009, 373, 166, '0', 'Carol Ternes', '17', '03/20/92', '16 Pickman St', 'Salem', 'MA', '01970', '12', '5''6''''', '130', '', 'llyod', 'Kathleen', '978-744-5374', '', '', '', '978-998-9172', '', 'July 6 AM MS/HS', '', 'Carol', 'Ternes', NULL, NULL, NULL, NULL),
(2009, 374, 167, '0', 'Audrey Wyke', '17', '12/8/91', '12 Chestnut St', 'Salem', 'MA', '01970', '11', '5''6''''', '130', '', '', 'rICK', '617-921-4502', '', 'AKWYKE@COMCAST.NET', '', '617-571-0897', '', 'July 6 AM MS/HS', '', 'Audrey', 'Wyke', NULL, NULL, NULL, NULL),
(2009, 375, 168, '0', 'Aidan Lane', '10', '5/31/99', '20 Pickman St', 'Salem', 'MA', '01970', '5', '4''10''''', '83', '', 'Michelle', 'Sean', '978-741-5263', '617-757-8335', 'michellehowe@comcast.net', '', '978-729-9877; 617-817-2069', '', 'Jun 29 PM', '', 'Aidan', 'Lane', NULL, NULL, NULL, NULL),
(2009, 376, 169, '1', 'Brendan Lombard', '7', '8/24/01', '120 Marlbough Rd', 'Salem', 'MA', '01970', '2', '', '', '', 'Diana', 'Sean', '978-210-3676', '978-578-8891', 'sdlombard@verizon.net', '', '978-360-2466', '', 'Jun 29 PM', '', 'Brendan', 'Lombard', NULL, NULL, NULL, NULL),
(2009, 377, 170, '1', 'Shamus Lombard', '9', '2/4/00', '120 Marlobough Rd', 'Salem', 'MA', '01970', '3', '', '', '', 'Diana', 'Sean', '978-210-3676', '978-578-8891', 'sdlombard@verozon.ner', '', '978-360-2466', '', 'Jun 29 PM', '', 'Shamus', 'Lombard', NULL, NULL, NULL, NULL),
(2009, 378, 171, '1', 'Jamie Vengren', '13', '1/9/96', '2 Maple St', 'Salem', 'MA', '01970', '8', '', '', '', 'Joseph', 'Andrea Cariveau', '978-578-0929', '978-578-1733', 'andicarriv@verizon.net', '', '978-741-3226', '', 'July 6 PM MS/HS', '', 'Jamie', 'Vengren', NULL, NULL, NULL, NULL),
(2009, 379, 172, '0', 'James Kontoules', '13', '3/28/1996', '3 Hillside Ave', 'Salem', 'MA', '01970', '8', '5''7''''', '100', '', 'Luisa', 'Charles', '978-741-5769', '978-741-5769', 'clkon@comcast.net', '', '978-740-1771', '', 'July 6 PM MS/HS', '', 'James', 'Kontoules', NULL, NULL, NULL, NULL),
(2009, 380, 173, '0', 'Hannah Loewen', '9', '1/2/00', '12 Trinity Rd', 'Marblehead', 'MA', '01945', '3', '48', '48', '', 'Oliver', 'Cindy', '781-639-8357', '`', 'cdtloewen@aol.com', '', '781-844-7953', '', 'Aug 10 PM', '', 'Hannah', 'Loewen', NULL, NULL, NULL, NULL),
(2009, 381, 174, '0', 'Kirstyn Russell', '8', '2/9/01', '126 Highland Ave', 'Salem', 'MA', '01970', '3', '45', '40', '', 'Cheryl', 'James', '978-836-9558', '978-335-4741', 'cjrussell2000@gmail.com', 'cjrussell2000@verizon.net', '781-631-1517', '', 'Aug 17 PM', '', 'Kirstyn', 'Russell', NULL, NULL, NULL, NULL),
(2009, 382, 175, '0', 'Meghan Maggiacomo', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 13 AM', '', 'Meghan', 'Maggiacomo', NULL, NULL, NULL, NULL),
(2009, 383, 176, '0', 'Emily Maggiacomo', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 13 AM', '', 'Emily', 'Maggiacomo', NULL, NULL, NULL, NULL),
(2009, 384, 177, '0', 'Claudia Lanes', '11', '9/30/97', '25 Bartholomew Terr', 'Peabody', 'MA', '', '6', '5''1''''', '137', '', 'Patrica', 'Mark', '978-979-0270', '978-239-0119', 'ptlanes@comcast.net', '', '', '', 'July 20 AM MS/HS', '', 'Claudia', 'Lanes', NULL, NULL, NULL, NULL),
(2009, 385, 178, '0', 'Connor', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 AM MS/HS', '', 'Connor', '', NULL, NULL, NULL, NULL),
(2009, 386, 179, '0', 'Aiden Moulton', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 AM MS/HS', '', 'Aiden', 'Moulton', NULL, NULL, NULL, NULL),
(2009, 387, 180, '0', 'Alexis Mancini', '10', '9/23/98', '5 Lions Lane', 'Salem', 'MA', '01970', '5', '4''8''''', '78', '', 'Susan', 'Michael', '978-740-4523', '', 'hairpro@live.com', '', '978-340-3538', '', 'July 20 PM', '', 'Alexis', 'Mancini', NULL, NULL, NULL, NULL),
(2009, 388, 181, '0', 'Owen Ricker', '10', '3/23/99', '36 Londonderry Road', 'Marblehead', 'MA', '01945', '5', '5''2''''', '120', '', 'LeeAnne', 'Charlie', '781-631-8471', '781-631-8471', 'lricker@comcast.net', 'c.ricker@comcast.net', '781-254-5496', '', 'July 20 PM', '', 'Owen', 'Ricker', NULL, NULL, NULL, NULL),
(2009, 389, 182, '0', 'Stephenson', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 PM', '', 'Stephenson', '', NULL, NULL, NULL, NULL),
(2009, 390, 183, '0', 'Peter Whouley', '10', '7/6/99', '208 Centre Street', 'Danvers', 'MA', '01923', '5', '', '', '', 'Sally P Kerans', 'Michael', '978-744-1683', '', 'sallypkerans@gmail.com', 'mwhouley@deweysquare.com', '978-766-8661', '', 'July 20 PM', '', 'Peter', 'Whouley', NULL, NULL, NULL, NULL),
(2009, 391, 184, '0', 'Emily Ricker', '13', '7/4/96', '36 Londonderry Rd', 'Marblehead', 'MA', '01945', '8', '5''4''''', '140', '', 'LeeAnne', 'Charlie', '781-631-8471', '781-631-3050', 'lricker@comcast.net', 'c.ricker@comcast.net', '781-254-5496', '', 'July 20 PM MS/HS', '', 'Emily', 'Ricker', NULL, NULL, NULL, NULL),
(2009, 392, 185, '0', 'Stephenson', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 PM MS/HS', '', 'Stephenson', '', NULL, NULL, NULL, NULL),
(2009, 393, 186, '0', 'Kate Brodsky', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 PM MS/HS', '', 'Kate', 'Brodsky', NULL, NULL, NULL, NULL),
(2009, 394, 187, '0', 'Jada McDonald', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 20 PM MS/HS', '', 'Jada', 'McDonald', NULL, NULL, NULL, NULL),
(2009, 395, 188, '0', 'Sofia Antonucci', '9', '11/7/99', '14 Spruce St', 'Malden', 'MA', '02148', '3', '4''9''''', '70', '', 'Andrea', 'Kenny', '781-760-0153', '781-879-2747', 'aanto_93@yahoo.con', 'kgantonu@yahoo.com', '', '', 'July 27 AM', '', 'Sofia', 'Antonucci', NULL, NULL, NULL, NULL),
(2009, 396, 189, '0', 'Kenneth Antonucci', '11', '2/21/98', '14 Spruce St', 'Malden', 'MA', '02148', '5', '4''11''''', '87', '', 'Andrea', 'Kenny', '781-760-0153', '781-879-2747', 'aanto_93@yahoo.com', 'kgantonu@yahoo.com', '', '', 'July 27 AM', '', 'Kenneth', 'Antonucci', NULL, NULL, NULL, NULL),
(2009, 397, 190, '0', 'Henry Fisk', '9', '8/1/99', '8 Waite St', 'Malden', 'MA', '02148', '3', '4''9''''', '115', '', 'Julie', 'Russ', '617-922-6500', '978-869-5317', 'julie.fisk@gmail.com', '', '781-321-6092', '', 'July 27 AM', '', 'Henry', 'Fisk', NULL, NULL, NULL, NULL),
(2009, 398, 191, '0', 'Rebecca Fisk', '11', '12/30/97', '8 Waite St', 'Malden', 'MA', '02148', '5', '5''4''''', '123', '', 'Julie', 'Russ', '617-922-6500', '978-869-5317', 'julie.fisk@gmail.com', '', '781-321-6092', '', 'July 27 AM', '', 'Rebecca', 'Fisk', NULL, NULL, NULL, NULL),
(2009, 399, 192, '0', 'Sonterre', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 AM', '', 'Sonterre', '', NULL, NULL, NULL, NULL),
(2009, 400, 193, '0', 'Elisha McManus', '10', '12/29/98', '22 Cabot St', 'Salem', 'MA', '01970', '4', '4''5''''', '80', '', 'Matt', 'Summer', '603-233-2304', '', '', '', '978-590-6188', '', 'July 27 AM', '', 'Elisha', 'McManus', NULL, NULL, NULL, NULL),
(2009, 401, 194, '0', 'Bella Baidak', '10', '2/15/99', '22 Cabot St', 'Salem', 'MA', '01970', '4', '4''5''''', '85', '', 'Matt', 'Summer', '603-233-2304', '978-590-6188', 'mattmanzzo@yahoo.com', 'juliansebastianbella@yahoo.com', '978-590-6188', '', 'July 27 AM', '', 'Bella', 'Baidak', NULL, NULL, NULL, NULL),
(2009, 402, 195, '0', 'Sebastian Baidak', '8', '9/12/00', '22 Cabot St', 'Salem', 'MA', '01970', '2', '4''', '80', '', 'Matt', 'Summer', '603-233-2304', '978-590-6188', 'mattmanzzoo22@yahoo.com', 'juliansebastianbell@yahoo.com', '', '', 'July 27 AM', '', 'Sebastian', 'Baidak', NULL, NULL, NULL, NULL),
(2009, 403, 196, '0', 'Julian Baidak', '13', '2/15/96', '22 Cabot St', 'Salem', 'MA', '01970', '7', '5''6''''', '180', '', 'Matt', 'Summer', '603-233-2204', '978-590-6188', 'mattmanzzo22@yahoo.com', 'juliansebastianbella@yahoo.com', '', '', 'July 27 AM MS/HS', '', 'Julian', 'Baidak', NULL, NULL, NULL, NULL),
(2009, 404, 197, '0', 'Nathaniel Clark', '13', '11/7/95', '30 One St', 'Salem', 'MA', '01970', '7', '5''11', '150', '', 'Mark', 'Maureen', '978-744-1222', '', '', 'moquilts@comcast.net', '978-290-6932', '', 'July 27 AM MS/HS', '', 'Nathaniel', 'Clark', NULL, NULL, NULL, NULL),
(2009, 405, 198, '0', 'Nicholas Antonucci', '12', '9/22/96', '14 Spruce St', 'Malden', 'MA', '02148', '6', '5''1''''', '110', '', 'Andrea', 'Kenny', '781-760-0153', '781-879-2747', 'aanto_93@yahoo.com', 'kgantonu@yahoo.com', '', '', 'July 27 AM MS/HS', '', 'Nicholas', 'Antonucci', NULL, NULL, NULL, NULL),
(2009, 406, 199, '0', 'Abigail Fisk', '12', '11/4/96', '8 Waite St', 'Malden', 'MA', '02148', '6', '5''5''''', '115', '', 'Julie', 'Russ', '617-922-6500', '978-869-5317', 'julie.fisk@gmail.com', '781-321-6092', '', '', 'July 27 AM MS/HS', '', 'Abigail', 'Fisk', NULL, NULL, NULL, NULL),
(2009, 407, 200, '0', 'Madison Ballou', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 PM MS/HS', '', 'Madison', 'Ballou', NULL, NULL, NULL, NULL),
(2009, 408, 201, '0', 'Morgenstern', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 PM', '', 'Morgenstern', '', NULL, NULL, NULL, NULL),
(2009, 409, 202, '0', 'Mclean', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 PM', '', 'Mclean', '', NULL, NULL, NULL, NULL),
(2009, 410, 203, '1', 'Ryan Bassett', '8', '5/16/01', '2 Felt St', 'Salem', 'MA', '01970', '2', '4''10''''', '80', '', 'Eric', 'Justine', '617-785-5513', '978-745-3959', 'bassetts@comcast.net', '', '', '', 'July 27 PM', '', 'Ryan', 'Bassett', NULL, NULL, NULL, NULL),
(2009, 411, 204, '0', 'Irvine', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 PM', '', 'Irvine', '', NULL, NULL, NULL, NULL),
(2009, 412, 205, '0', 'Jackson Colehower', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 27 PM', '', 'Jackson', 'Colehower', NULL, NULL, NULL, NULL),
(2009, 413, 206, '0', 'Autumn Pattison', '11', '11/30/97', '76 Moffatt Road', 'Salem', 'MA', '01970', '6', '4''8''''', '85', '', 'Phil', 'Belinda', '978-265-4448', '978-740-4461', 'phil_pattison@hotmail.com', 'pattison76@verizon.net', '', '', 'July 27 PM MS/HS', '', 'Autumn', 'Pattison', NULL, NULL, NULL, NULL),
(2009, 414, 207, '0', 'Quinn Barrett', '8', '8/12/00', '17 Bryant St', 'Salem', 'MA', '01970', '3', '44''''', '40', '', 'Johnathan', 'Brenda', '978-744-9441', '781-405-1857', '', '', '', '', 'Aug 3 AM', '', 'Quinn', 'Barrett', NULL, NULL, NULL, NULL),
(2009, 415, 208, '0', 'Lou Brenden', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 AM', '', 'Lou', 'Brenden', NULL, NULL, NULL, NULL),
(2009, 416, 209, '0', 'Sydney Livermore', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 AM', '', 'Sydney', 'Livermore', NULL, NULL, NULL, NULL),
(2009, 417, 210, '0', 'Devin Pinkman', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 PM', '', 'Devin', 'Pinkman', NULL, NULL, NULL, NULL),
(2009, 418, 211, '0', 'Kira Pinkman', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 PM', '', 'Kira', 'Pinkman', NULL, NULL, NULL, NULL),
(2009, 419, 212, '0', 'Nicholas Minasian', '12', '6/20/97', '166 Grove St', 'Lexington', 'MA', '02420', '7', '5', '87', '', 'Vartan', 'Jen', '617-921-0515', '617-921-0774; 786-860-0012', 'jenminasian@yahoo.com', '', '', '', 'Aug 3 PM', '', 'Nicholas', 'Minasian', NULL, NULL, NULL, NULL),
(2009, 420, 213, '0', 'Sebastian Minasian', '8', '8/2/00', '166 Grove St', 'Lexington', 'MA', '02420', '4', '5''4''''', '71', '', 'Vartan', 'Jen', '617-921-0515', '781-860-0012; 617-921-0774', 'jenminasian@yahoo.com', '', '', '', 'Aug 3 PM', '', 'Sebastian', 'Minasian', NULL, NULL, NULL, NULL),
(2009, 421, 214, '0', 'Mackenzie Loewen', '13', '4/11/96', '12 Trinity Rd', 'Marblehead', 'MA', '01945', '7', '5''3''''', '90', '', 'Cindy', 'Oliver', '781-639-8357', '', 'cdtloewen@aol.com', '', '781-844-7953', '', 'Aug 10 AM MS/HS', '', 'Mackenzie', 'Loewen', NULL, NULL, NULL, NULL),
(2009, 422, 215, '0', 'McCarthy', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 AM MS/HS', '', 'McCarthy', '', NULL, NULL, NULL, NULL),
(2009, 423, 216, '0', 'John Chicoine', '11', '01/14/98', '7 Seemore Sr', 'Salem', 'MA', '01970', '', '', '', '', 'Anna', 'Tim', '978-578-4149', '978-423-3168', 'achicoine@comcast.net', 'timchinoine@comcast.net', '978-578-4149; 978-745-9731', '', 'Aug 10 PM MS/HS', '', 'John', 'Chicoine', NULL, NULL, NULL, NULL),
(2009, 424, 217, '0', 'Hunter McDonough', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Hunter', 'McDonough', NULL, NULL, NULL, NULL),
(2009, 425, 218, '0', 'James Callahan', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'James', 'Callahan', NULL, NULL, NULL, NULL),
(2009, 426, 219, '0', 'Trevor Gilligan', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Trevor', 'Gilligan', NULL, NULL, NULL, NULL),
(2009, 427, 220, '0', 'Tory Gilligan', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 13 PM', '', 'Tory', 'Gilligan', NULL, NULL, NULL, NULL),
(2009, 428, 221, '0', 'Snell', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 10 PM', '', 'Snell', '', NULL, NULL, NULL, NULL),
(2009, 429, 222, '0', 'Abriss Holtel', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 AM MS/HS', '', 'Abriss', 'Holtel', NULL, NULL, NULL, NULL),
(2009, 430, 223, '0', 'Adam Mangione', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 AM MS/HS', '', 'Adam', 'Mangione', NULL, NULL, NULL, NULL),
(2009, 431, 224, '0', 'Rodney Bedell', '13', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 AM MS/HS', '', 'Rodney', 'Bedell', NULL, NULL, NULL, NULL),
(2009, 432, 225, '1', 'Christian Vandestadt', '12', '2/12/97', '55 Highland St', 'Salem', 'MA', '01970', '6', '5', '100', '', 'Enn', 'Willem', '508-596-8205', '978-745-6439', 'dutch002@aol.com', '', '', '', 'Aug 17 PM', '', 'Christian', 'Vandestadt', NULL, NULL, NULL, NULL),
(2009, 433, 226, '1', 'Hannah Vandestadt', '12', '2/11/97', '55 Highland St', 'Salem', 'MA', '01970', '6', '5', '90', '', 'Enn', 'Willem', '508-596-8205', '978-745-6439', 'dutch002@aol.com', '', '', '', 'Aug 17 PM', '', 'Hannah', 'Vandestadt', NULL, NULL, NULL, NULL),
(2009, 434, 227, '0', 'Owen Clyne', '9', '8/9/99', '18 Patton Road', 'Salem', 'MA', '01970', '4', '5', '95', '', 'Kelly', 'Michael', '978-741-8702', '617-838-9860', 'kellyclyne@yahoo.com', 'mclyne@partners.org', '', '', 'Aug 17 PM', '', 'Owen', 'Clyne', NULL, NULL, NULL, NULL),
(2009, 435, 228, '0', 'Dahlgren', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Dahlgren', '', NULL, NULL, NULL, NULL),
(2009, 436, 229, '0', 'Abu Sharkh', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Abu', 'Sharkh', NULL, NULL, NULL, NULL),
(2009, 437, 230, '0', 'Nolan Obrien', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Nolan', 'Obrien', NULL, NULL, NULL, NULL),
(2009, 438, 231, '0', 'Greg Conrad', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Greg', 'Conrad', NULL, NULL, NULL, NULL),
(2009, 439, 232, '0', 'Kevin Clyne', '12', '7/13/96', '18 Patton Road', 'Salem', 'MA', '01970', '7', '5''6''''', '130', '', 'Kelly', 'Michael', '978-741-8702', '617-838-9860', 'kellyclyne@yahoo.com', 'mclyne@partners.org', '', '', 'Aug 17 PM MS/HS', '', 'Kevin', 'Clyne', NULL, NULL, NULL, NULL),
(2009, 440, 233, '0', 'Sam Clyne', '11', '6/23/97', '18 Patton Road', 'Salem', 'MA', '01970', '6', '5''4''''', '125', '', 'Kelly', 'Michael', '978-741-8702', '617-838-9860', 'kellyclyne@yahoo.com', 'mclyne@partners.org', '', '', 'Aug 17 PM MS/HS', '', 'Sam', 'Clyne', NULL, NULL, NULL, NULL),
(2009, 441, 234, '0', 'Jared Robinson', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Jared', 'Robinson', NULL, NULL, NULL, NULL),
(2009, 442, 235, '0', 'Thomas McNulty', '10', '3/25/99', '12 Lebel Rd', 'Danvers', 'MA', '01923', '5', '5''', '105', '', 'Louise', 'Tom', '978-857-5857', '978-857-9125', 'thommcnulty@gmail.com', 'familyfunshoppe@gmail.com', '', '', 'July 20 PM', '', 'Thomas', 'McNulty', NULL, NULL, NULL, NULL),
(2009, 443, 236, '0', 'Natalie Coughlin', '10', '2/18/99', '136 Essex St', 'Beverly', 'MA', '01915', '5', '5''1''''', '69', '', 'Michael', 'Amy Procter', '978-927-2628', '', 'equitainer@aol.com', '', '978-500-5850', '', 'July 13 PM', '', 'Natalie', 'Coughlin', NULL, NULL, NULL, NULL),
(2009, 444, 237, '0', 'Elizabeth "Izzy" Coughlin', '12', '9/10/96', '136 Essex St', 'Beverly', 'MA', '01915', '7', '5''4''''', '9-', '', 'Michael', 'Amy Procter', '978-927-2628', '', 'equitainer@aol.com', '', '978-500-5850', '', 'July 13 PM', '', 'Elizabeth', '"Izzy"', NULL, NULL, NULL, NULL),
(2009, 445, 238, '1', 'Emma Bassett', '8', '5/16/01', '2 Felt St', 'Salem', 'MA', '01970', '2', '4''8''''', '60', '', 'Justine', 'Eric', '617-785-5513', '978-745-3959', '', 'bassetts@comcast.net', '', '', 'July 27 PM', '', 'Emma', 'Bassett', NULL, NULL, NULL, NULL),
(2009, 446, 239, '0', 'Deanna Minasian', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 AM MS/HS', '', 'Deanna', 'Minasian', NULL, NULL, NULL, NULL),
(2009, 447, 240, '0', 'Rebecca Minasian', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 AM MS/HS', '', 'Rebecca', 'Minasian', NULL, NULL, NULL, NULL),
(2009, 448, 241, '0', 'Alexandra Minasian', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 3 AM MS/HS', '', 'Alexandra', 'Minasian', NULL, NULL, NULL, NULL),
(2009, 449, 242, '0', 'Pano Kalaras', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Pano', 'Kalaras', NULL, NULL, NULL, NULL),
(2009, 450, 243, '0', 'Stacey Litzos', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Stacey', 'Litzos', NULL, NULL, NULL, NULL),
(2009, 451, 244, '0', 'Libby Browning', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'July 6 PM', '', 'Libby', 'Browning', NULL, NULL, NULL, NULL),
(2009, 452, 245, '0', 'Hold', 'NULL', '', '', 'Salem', 'MA', '01970', '', '', '', '', '', '', '', '', '', '', '', '', 'Aug 17 PM', '', 'Hold', '', NULL, NULL, NULL, NULL),
(2010, 453, NULL, NULL, NULL, NULL, '2001-03-26 00:00:00', '40 Daniels court', 'Salem', 'MA', '01970', '0', '55inches', '73lbs', NULL, NULL, NULL, '781 346 3269', '978 944 4185', 'carmen_henriques@comcast.net', '', '', NULL, NULL, '', 'Conner ', 'Henriques', 'Carmen', 'Henriques', '', ''),
(2010, 454, NULL, NULL, NULL, NULL, '2002-06-21 00:00:00', '40 Daniels court', 'Salem', 'MA', '01970', '0', '50.5', '52', NULL, NULL, NULL, '781 346 3269', '978 944 4185', 'carmen_henriques@comcast.net', '', '', NULL, NULL, '', 'Christopher', 'Henriques', 'Carmen', 'Henriques', '', ''),
(2010, 455, NULL, NULL, NULL, NULL, '1998-08-13 00:00:00', '24 peter Rd.', 'North Reading', 'MA', '01864', '6', '5''', '?', NULL, NULL, NULL, '978-664-2053', '978-664-2053', 'chris_fnr@yahoo.com', 'epfeener@yahoo.com', '', NULL, NULL, '', 'Alex', 'Feener', 'Chris', 'Feener', 'Edward ', 'Feener'),
(2010, 456, NULL, NULL, NULL, NULL, '1998-01-18 00:00:00', '275 Haverhill St', 'North Reading', 'MA', '01864', '6', '5'' 7', '95 lbs.', NULL, NULL, NULL, '978-276-0431', '978-276-0431', 'audier@verizon.net', 'audier@verizon.net', '978-604-5802', NULL, NULL, '', 'Peter', 'Audier', 'Melissa ', 'Audier', 'Phil', 'Audier'),
(2010, 457, NULL, NULL, NULL, NULL, '2000-01-31 00:00:00', '275 Haverhill St.', 'North Reading', 'MA', '01864', '4', '4''9', '60 lbs. ?', NULL, NULL, NULL, '978-276-0431', '978-276-0431', 'audier@verizon.net', 'audier@verizon.net', '978-604-5802', NULL, NULL, '', 'Gillian', 'Audier', 'Melissa', 'Audier', 'Phil', 'Audier'),
(2010, 458, NULL, NULL, NULL, NULL, '1996-10-06 00:00:00', '11 Boardman Street', 'Salem', 'MA', '01970', '7', '5''2', '90', NULL, NULL, NULL, '978 745-8541', '978 745-8541', 'mebeaupre@aol.com', 'mebeaupre@aol.com', '', NULL, NULL, '', 'Eddie', 'Beaupre', 'Marie', 'Beaupre', 'Marie', 'Beaupre'),
(2010, 459, NULL, NULL, NULL, NULL, '1996-08-05 00:00:00', '69 Linden Street', 'Salem', 'MA', '01970', '7', '5''4', '110', NULL, NULL, NULL, '978-744-6876', '978-578-1306', 'laurylapointe@yahoo.com', '', '', NULL, NULL, '', 'Nicole', 'Lapoint', 'Laury', 'Lapointe', 'Marc', 'Lapointe'),
(2010, 460, NULL, NULL, NULL, NULL, '1998-07-24 00:00:00', '14 Cedar Street', 'North Reading', 'MA', '01864', '7', '53', '84', NULL, NULL, NULL, '9786640147', '9786640147', 'six.wags@hotmail.com', 'six.wags@hotmail.com', '', NULL, NULL, '', 'Charlie', 'Wagner', 'Shauna', 'Wagner', 'Scott', 'Wagner'),
(2010, 461, NULL, NULL, NULL, NULL, '1997-02-13 00:00:00', '45 Station Rd. ', 'Salem', 'MA', '01970', '7', '5''', '95', NULL, NULL, NULL, '(978) 836-6824', '(978) 745-6710', 'balloudan@gmail.com', 'sue365_6@msn.com', '', NULL, NULL, '', 'Madison', 'Ballou', 'Dan', 'Ballou', 'Sue', 'Ballou'),
(2010, 462, NULL, NULL, NULL, NULL, '1999-03-20 00:00:00', '45 Station Rd. ', 'Salem', 'MA', '01970', '5', '4''8"', '80', NULL, NULL, NULL, '(978) 836-6824', '(978) 745-6710', 'balloudan@gmail.com', 'sue365_6@msn.com', '', NULL, NULL, '', 'John', 'Ballou', 'Dan', 'Ballou', 'Sue', 'Ballou'),
(2010, 463, NULL, NULL, NULL, NULL, '2001-01-21 00:00:00', '14 Cedar Street', 'North Reading', 'MA', '01864', '4', '52', '60', NULL, NULL, NULL, '9786640147', '9786640147', 'six.wags@hotmail.com', 'six.wags@hotmail.com', '', NULL, NULL, '', 'Laura', 'Wagner', 'Shauna', 'Wagner', 'Scott', 'Wagner'),
(2010, 464, NULL, NULL, NULL, NULL, '1993-05-02 00:00:00', '51 Lynn Fells Pkwy', 'Melrose', 'MA', '01970', '11', '5''6"', '115', NULL, NULL, NULL, '781-662-1639', '', 'jangraf@live.com', '', '', NULL, NULL, '', 'Laura', 'Graf', 'Rick and Janet ', 'Graf', '', ''),
(2010, 465, NULL, NULL, NULL, NULL, '1995-11-22 00:00:00', '51 Lynn Fells Pkwy', 'Melrose', 'MA', '01970', '0', '5''3"', '100', NULL, NULL, NULL, '781-662-1639', '', 'jangraf@live.com', '', '', NULL, NULL, '', 'Julia', 'Graf', 'Rick and Janet', 'Graf', '', ''),
(2010, 466, NULL, NULL, NULL, NULL, '1998-01-06 00:00:00', '51 Lynn Fells Pkway', 'Melrose', 'MA', '02176', '0', '5''2"', '97', NULL, NULL, NULL, '781-662-1639', '', 'jangraf@live.com', '', '', NULL, NULL, '', 'John ', 'Graf', 'Rick and Janet', 'Graf', '', ''),
(2010, 467, NULL, NULL, NULL, NULL, '2002-09-17 00:00:00', '9 Witchcraft Road', 'Salem', 'MA', '01970', '1', '50"', '50', NULL, NULL, NULL, '978-317-2546', '978-317-2543', 'maritimeattorney@aol.com', 'airodoodle2109@aol.com', '', NULL, NULL, '', 'Patrick', 'Smith', 'David', 'Smith', 'Leanne', 'Smith'),
(2010, 468, NULL, NULL, NULL, NULL, '2000-10-18 00:00:00', '8 Durkin Road', 'Salem', 'MA', '01970', '3', '53"', '65 #', NULL, NULL, NULL, '978-740-2449', '978-740-2449', 'pamyianni@comcast.net', '', '', NULL, NULL, '', 'Michael', 'katsiris', 'Pamela', 'Katsiris', 'Yianni', 'Katsiris'),
(2010, 469, NULL, NULL, NULL, NULL, '2000-10-18 00:00:00', '8 Durkin Road', 'Salem', 'MA', '01970', '3', '52"', '62 #', NULL, NULL, NULL, '978-740-2449', '978-740-2449', 'pamyianni@comcast.net', '', '', NULL, NULL, '', 'Tea', 'Katsirs', 'Pamela', 'Katsiris', 'Yianni', 'Katsiris'),
(2010, 470, NULL, NULL, NULL, NULL, '1996-06-02 00:00:00', '8 Durkin Road', 'Salem', 'MA', '01970', '8', '62"', '105 #', NULL, NULL, NULL, '978-740-2449', '978-740-2449', 'pamyianni@comcast.net', '', '', NULL, NULL, '', 'Antonia', 'Katsirs', 'Pamela', 'Katsiris', 'Yianni', 'Katsiris'),
(2010, 471, NULL, NULL, NULL, NULL, '1996-12-31 00:00:00', '33 Warren Street', 'Salem', 'MA', '01970', '0', '5''3''''', '110', NULL, NULL, NULL, '978 744-3721', '978 744-3721', 'kmacsmith33@comcast.net', 'kmacsmith33@comcast.net', '', NULL, NULL, '', 'Tucker', 'Smith', 'Kerrie', 'Smith', 'Jeffrey', 'Smith'),
(2010, 472, NULL, NULL, NULL, NULL, '1999-11-24 00:00:00', '33 Warren Street', 'Salem', 'MA', '01970', '0', '4''5', '60', NULL, NULL, NULL, '978 744-3721', '978 744-3721', 'kmacsmith33@comcast.net', 'kmacsmith33@comcast.net', '', NULL, NULL, '', 'Hayley', 'Smith', 'Kerrie', 'Smith', 'Jeffrey', 'Smith'),
(2010, 473, NULL, NULL, NULL, NULL, '2001-03-05 00:00:00', '47 Hathorne Street', 'Salem', 'MA', '01970', '4', '65 inches', '65 lbs', NULL, NULL, NULL, '978 210 2084', '978 210 2428', 'kemwave@gmail.com', 'mailhoff17@gmail.com', '', NULL, NULL, '', 'Satya', 'Hoff', 'Paul and Kathleen', 'Hoff', 'Paul ', 'Hoff'),
(2010, 474, NULL, NULL, NULL, NULL, '1996-05-09 00:00:00', '13 Beacon St', 'Salem', 'MA', '01970', '9', '4 ft 9 inc', '75 pounds', NULL, NULL, NULL, '978-335-8511', '781-631-6000', 'kcook@ngbank.com', '', '781-631-6000', NULL, NULL, 'Extension 249 on the emergency number', 'Alexandria', 'Cook', 'Kelly', 'Cook', '', ''),
(2010, 475, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '13 Beacon Street', 'Salem', 'MA', '01970', '11', '5 ft 3 inc', '130', NULL, NULL, NULL, '978-335-8511', '', 'kcook@ngbank.com', '', '781-631-6000', NULL, NULL, 'x 249 on emergency number', 'Dylan', 'Cook', 'Kelly', 'Cook', '', ''),
(2010, 476, NULL, NULL, NULL, NULL, '1998-08-09 00:00:00', '21 Larchmont Rd', 'Salem', 'MA', '01970', '6', '4'' 11', '65', NULL, NULL, NULL, '978-744-7395', '978 744 7395', 'davidmohler@verizon.net', 'davidmohler@verizon.net', '', NULL, NULL, '', 'Anne', 'Mohler', 'Janet ', 'Mohler', 'David', 'Mohler'),
(2010, 477, NULL, NULL, NULL, NULL, '2001-07-29 00:00:00', '21 Larchmont Rd', 'Salem', 'MA', '01970', '3', '4''', '50', NULL, NULL, NULL, '978-744-7395', '978 744 7395', 'davidmohler@verizon.net', 'davidmohler@verizon.net', '', NULL, NULL, '', 'William', 'Mohler', 'Janet ', 'Mohler', 'David', 'Mohler'),
(2010, 478, NULL, NULL, NULL, NULL, '1996-03-04 00:00:00', '21 Larchmont Rd', 'Salem', 'MA', '01970', '8', '5''2"', '100', NULL, NULL, NULL, '978-744-7395', '978 744 7395', 'davidmohler@verizon.net', 'davidmohler@verizon.net', '', NULL, NULL, '', 'Bridget', 'Mohler', 'Janet ', 'Mohler', 'David', 'Mohler'),
(2010, 479, NULL, NULL, NULL, NULL, '2001-06-27 00:00:00', '31 West Ave.', 'Salem', 'MA', '01970', '4', '', '', NULL, NULL, NULL, '9787453548', '9787453548', 'DavidDenby@comcast.net', 'anyadenby@gmail.com', '', NULL, NULL, '', 'Sascha', 'Denby', 'David', 'Denby', 'Anya', 'Denby'),
(2010, 480, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '1 Surf St', 'Marblehead', 'MA', '01945', '3', '57', '69', NULL, NULL, NULL, '7819903390', '7819903390', 'chay@mfs.com', 'gordon@aline.com', '781-990-3390', NULL, NULL, '', 'Tucker', 'Hay', 'Cathy', 'Hay', 'Gordon', 'Hay'),
(2010, 481, NULL, NULL, NULL, NULL, '1996-10-19 00:00:00', '8 Rand Road', 'Salem', 'MA', '01970', '7', '5''1"', '85 lbs', NULL, NULL, NULL, '617-645-3753', '978-852-8094', 'elayne.m.alexander@bankofamerica.com', '', '', NULL, NULL, '', 'Connor', 'Alexander', 'Elayne', 'Alexander', 'Brian', 'Alexander'),
(2010, 482, NULL, NULL, NULL, NULL, '2002-02-03 00:00:00', '71 Tremont Street', 'Salem', 'MA', '01970', '2', '51in', '66', NULL, NULL, NULL, '978-741-1466', '978-479-4248', 'shannonbott@gmail.com', 'chipbott@mac.com', '', NULL, NULL, '', 'Kathryn', 'Bott', 'Shannon ', 'Bott', 'Chip', 'Bott'),
(2010, 483, NULL, NULL, NULL, NULL, '2001-08-09 00:00:00', '257 Loring Ave', 'Salem', 'MA', '01970', '3', '4''1', '50 lbs', NULL, NULL, NULL, '978 741 4601', '978 741 4601', 'vanessa.mazuzan@fei.com', 'mark.mazuzan@tasc.com', '', NULL, NULL, '', 'Madeleine', 'Mazuzan', 'Vanessa', 'Mazuzan', 'Mark ', 'Mazuzan'),
(2010, 484, NULL, NULL, NULL, NULL, '2001-08-21 00:00:00', '72 Winthrop Ave', 'Beverly', 'MA', '01915', '3', '4''2', '52 lbs', NULL, NULL, NULL, '508 783 3550', '', 'emily.enos@ml.com', '', '', NULL, NULL, '', 'Alex', 'Enos', 'Emily', 'Enos', '', ''),
(2010, 485, NULL, NULL, NULL, NULL, '2001-11-09 00:00:00', '10 River St.', 'Salem', 'MA', '01970', '0', '50 inches', '48 lbs.', NULL, NULL, NULL, '9787446076', '', 'ann.whittier@gmail.com', '', '', NULL, NULL, '', 'Ursula', 'Siegfried', 'Ann and Stephen', 'Whittier', '', ''),
(2010, 486, NULL, NULL, NULL, NULL, '2001-11-09 00:00:00', '10 River St.', 'Salem', 'MA', '01970', '0', '50 inches', '48 lbs.', NULL, NULL, NULL, '9787446076', '', 'ann.whittier@gmail.com', '', '', NULL, NULL, '', 'liza', 'Nugent', 'Ann and Stephen', 'Whittier', '', ''),
(2010, 487, NULL, NULL, NULL, NULL, '2000-08-19 00:00:00', '12 River St.', 'Salem', 'MA', '01970', '0', '55 inches', '53 lbs.', NULL, NULL, NULL, '9787422443', '857-523-0853', 'Pete.f.nugent@gmail.com', '', '617-840-5093', NULL, NULL, '', 'Eliza', 'Nugent', 'Peter and Elizabeth ', 'Nugent', 'Elizabeth', 'Nugent'),
(2010, 488, NULL, NULL, NULL, NULL, '2001-08-01 00:00:00', '1 Hibbard Rd', 'Marblehead', 'MA', '01945', '2', '52 inches', '72 lbs', NULL, NULL, NULL, '781-639-0864', '', 'kathygayne@msn.com', '', '', NULL, NULL, '', 'Trey', 'Gayne', 'Kathy and Rick', 'Gayne', '', ''),
(2010, 489, NULL, NULL, NULL, NULL, '2069-12-31 00:00:00', '1492 Plantation Dr', 'Hudson', 'OH', '44236', '0', '55', '90 Lbs', NULL, NULL, NULL, '434-409-8981', '434-409-8981', 'wileys@ymail.com', 'wileys@ymail.com', '', NULL, NULL, '', 'Isaac ', 'Wiley', 'Linda', 'Wiley', 'Andrew', 'Wiley'),
(2010, 490, NULL, NULL, NULL, NULL, '2001-06-02 00:00:00', '1492 Plantation Dr', 'Hudson', 'OH', '44236', '0', '55', '91 Lbs.', NULL, NULL, NULL, '434-409-8981', '434-409-8981', 'wileys@ymail.com', 'wileys@ymail.com', '', NULL, NULL, '', 'Sylvan ', 'Wiley', 'Linda', 'Wiley', 'Andrew', 'Wiley'),
(2010, 491, NULL, NULL, NULL, NULL, '1997-06-21 00:00:00', '2 Madeline Ave.', 'Salem', 'MA', '01970', '7', '5''2', '105', NULL, NULL, NULL, '978-745-3439', '978-745-3439', 'sandram_1@comcast.net', 'macsheart@comcast.net', '', NULL, NULL, '', 'dakota', 'mcmahon', 'sandra', 'mcmahon', 'michael', 'mcmahon'),
(2010, 492, NULL, NULL, NULL, NULL, '2069-12-31 00:00:00', '24 Sable Road', 'Salem', 'MA', '01970', '0', '5'' 1', '100 lbs.', NULL, NULL, NULL, '978-375-4964', '978-375-4963', 'lddionne@comcast.net', 'aedionne@comcast.net', '', NULL, NULL, '', 'Mikaela', 'Dionne', 'Lisa', 'Dionne', 'Alan', 'Dionne'),
(2010, 493, NULL, NULL, NULL, NULL, '1997-05-05 00:00:00', '17 Bertuccio Ave', 'Salem', 'MA', '01970', '8', '5''', '100', NULL, NULL, NULL, '978-979-5407', '978-771-4088', 'audwellig@gmail.com', 'homedirt1313@comcast.net', '', NULL, NULL, '', 'Ben', 'Welling', 'Audrey', 'Welling', 'Kurt', 'Welling'),
(2010, 494, NULL, NULL, NULL, NULL, '1999-11-20 00:00:00', '17 Bertuccio ave', 'Salem', 'MA', '01970', '5', '5"', '115', NULL, NULL, NULL, '978-979-5407', '978-771-4088', 'audwelling@gmail.com', 'homedirt1313@comcast.net', '', NULL, NULL, '', 'Troy', 'Welling', 'Audrey', 'Welling', 'Kurt ', 'Welling'),
(2010, 495, NULL, NULL, NULL, NULL, '1998-07-03 00:00:00', '5 Orchard Street', 'salem', 'MA', '01970', '6', '4''11"', '70', NULL, NULL, NULL, '9783372227', '9789798670', 'monica580@rocketmail.com', 'monica580@rocketmail.com', '', NULL, NULL, '', 'Colin ', 'Thompson', 'Monica', 'Thompson', 'Thomas', 'Thompson'),
(2010, 496, NULL, NULL, NULL, NULL, '2000-05-14 00:00:00', '5 Orchard Street', 'salem', 'MA', '01970', '4', '50 inches', '58 lbs', NULL, NULL, NULL, '9783372227', '9789798670', 'monica580@rocketmail.com', 'monica580@rocketmail.com', '', NULL, NULL, '', 'Madelyn', 'Thompson', 'Monica', 'Thompson', 'Thomas', 'Thompson'),
(2010, 497, NULL, NULL, NULL, NULL, '1999-11-01 00:00:00', '6 cushing', 'Salem', 'MA', '01970', '4', '53 inches', '63.8', NULL, NULL, NULL, '978-210-2343', '978-210-2343', 'alex7kris29@hotmail.com', 'alex7kris29@hotmail.com', '', NULL, NULL, '', 'alexandria', 'gaudet', 'kristen ', 'gaudet', 'kristen', 'gaudet'),
(2010, 498, NULL, NULL, NULL, NULL, '1998-02-21 00:00:00', '53 Larchmont rd', 'Salem', 'MA', '01970', '7', '5 feet', '95', NULL, NULL, NULL, '978-741-3620', '978-793-0084', 'dougkelleher@comcast.net', '', '', NULL, NULL, '', 'rachel', 'kelleher', 'Patti', 'kelleher', 'doug', 'kelleher'),
(2010, 499, NULL, NULL, NULL, NULL, '2000-09-14 00:00:00', '42 Larchmont Rd', 'Salem', 'MA', '01970', '4', '54 inches', '72 lbs', NULL, NULL, NULL, '978-741-4902', '', 'ellmur@us.ibm.com', '', '', NULL, NULL, '', 'Shannon', 'Murphy', 'Ellen', 'Murphy', '', ''),
(2010, 500, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '53 Larchmont Rd', 'Salem', 'MA', '01970', '4', '', '78', NULL, NULL, NULL, '978-741-3620', '978-793-0084', 'dougkelleher@comcast.net', '', '', NULL, NULL, '', 'Avery ', 'Kelleher', 'Patti', 'Kelleher', 'Doug', 'Kelleher'),
(2010, 501, NULL, NULL, NULL, NULL, '1994-03-23 00:00:00', '102 Bayview Avenue', 'Salem', 'MA', '01970', '10', '5''3', '135', NULL, NULL, NULL, '978-740-3264', '857-241-9604', 'giadellamonica@aol.com', '', '', NULL, NULL, '', 'Aaron', 'Godin', 'Gianna', 'Dellamonica', 'Eric', 'Godin'),
(2010, 502, NULL, NULL, NULL, NULL, '1995-07-13 00:00:00', '102 Bayview Ave.', 'Salem', 'MA', '01970', '9', '5''0', '115', NULL, NULL, NULL, '978-740-3264', '857-241-9604', 'giadellamonica@aol.com', '', '', NULL, NULL, '', 'Elijah', 'Godin', 'Gianna', 'Dellamonica', 'Eric', 'Godin');
INSERT INTO `wh_registration` (`year`, `id`, `registrationNumber`, `MedicalInformationForm`, `studentName`, `Age`, `BirthDate`, `Address`, `City`, `State`, `Zip`, `SchoolGrade`, `Height`, `Weight`, `HomePhone`, `Mother`, `Father`, `Phone1`, `Phone2`, `Email1`, `Email2`, `PrimaryEmergencyNumber`, `TShirtSize`, `AssignedSession`, `Notes`, `first_name`, `last_name`, `guardian_one_firstname`, `guardian_one_lastname`, `guardian_two_firstname`, `guardian_two_lastname`) VALUES
(2010, 503, NULL, NULL, NULL, NULL, '2002-03-22 00:00:00', '7 Mount Vernon Street', 'Salem', 'MA', '01970', '2', '51', '78', NULL, NULL, NULL, '978-979-7291', '', 'iggy322@comcast.net', '', '', NULL, NULL, '', 'Noah', 'Dangora', 'Rebecca', 'Dangora', '', ''),
(2010, 504, NULL, NULL, NULL, NULL, '1997-02-13 00:00:00', '14 Hunt St.', 'Danvers', 'MA', '01923', '7', '56', '80 lbs', NULL, NULL, NULL, '978-777-1976', '978-777-1976', 'amey.butler@verizon.net', 'eric.butler2@verizon.net', '978-836-9676', NULL, NULL, '', 'Collin', 'Butler', 'Amey', 'Butler', 'Eric', 'Butler'),
(2010, 505, NULL, NULL, NULL, NULL, '1999-10-12 00:00:00', '14 Hunt St.', 'Danvers', 'MA', '01923', '4', '52', '60lbs', NULL, NULL, NULL, '978-777-1976', '978-777-1976', 'amey.butler@verizon.net', 'eric.butler2@verizon.net', '978-836-9676', NULL, NULL, '', 'Callum', 'Butler', 'Amey', 'Butler', 'Eric', 'Butler'),
(2010, 506, NULL, NULL, NULL, NULL, '2000-05-10 00:00:00', '49 Dunlap Street #2', 'Salem', 'MA', '01970', '4', '50 inches', '55', NULL, NULL, NULL, '978-857-8745', '', 'mary.desrocher@aecom.com', '', '', NULL, NULL, '', 'Aidan', 'Desrocher', 'Mary', 'Desrocher', '', ''),
(2010, 507, NULL, NULL, NULL, NULL, '2002-01-25 00:00:00', '49 Dunlap Street #2', 'Salem', 'MA', '01970', '4', '50 inches', '75', NULL, NULL, NULL, '978-857-8745', '978-764-4167', 'mary.desrocher@aecom.com', '', '978-745-8794', NULL, NULL, '', 'Sara', 'Desrocher', 'Mary', 'Desrocher', 'Doug', 'Desrocher'),
(2010, 508, NULL, NULL, NULL, NULL, '1997-08-27 00:00:00', '35 Stagecoach Rd.', 'Topsfield', 'MA', '01983', '8', '4''8', '110', NULL, NULL, NULL, '978-828-7502', '978-887-2766', 'larcari@comcast.net', 'larcari@comcast.net', '', NULL, NULL, '', 'Nicholas', 'Arcari', 'Jay', 'Arcari', 'Laura', 'Arcari'),
(2010, 509, NULL, NULL, NULL, NULL, '1997-08-27 00:00:00', '35 Stagecoach Rd.', 'Topsfield', 'MA', '01983', '5', '4''2', '80', NULL, NULL, NULL, '978-828-7502', '978-887-2766', 'larcari@comcast.net', 'larcari@comcast.net', '', NULL, NULL, '', 'Enzo', 'Arcari', 'Jay', 'Arcari', 'Laura', 'Arcari'),
(2010, 510, NULL, NULL, NULL, NULL, '2000-07-03 00:00:00', '35 Stagecoach Rd.', 'Topsfield', 'MA', '01983', '5', '4''4', '75', NULL, NULL, NULL, '978-828-7502', '978-887-2766', 'larcari@comcast.net', 'larcari@comcast.net', '', NULL, NULL, '', 'Phoebe', 'Cote', 'Jay', 'Arcari', 'Laura', 'Arcari'),
(2010, 511, NULL, NULL, NULL, NULL, '1998-01-08 00:00:00', '35 Stagecoach Rd.', 'Salem', 'MA', '01970', '8', '4''11', '115', NULL, NULL, NULL, '978-828-7502', '978-887-2766', 'larcari@comcast.net', 'larcari@comcast.net', '', NULL, NULL, '', 'Jasper', 'Cote', 'Jay', 'Arcari', 'Laura', 'Arcari'),
(2010, 512, NULL, NULL, NULL, NULL, '1997-01-30 00:00:00', '37 Chase St', 'Danvers', 'MA', '01923', '7', '5 ft', '98 lbs', NULL, NULL, NULL, '978-774-0877', '978-774-0877', 'annaczubinski@comcast.net', '', '978-767-0271', NULL, NULL, '', 'Adam', 'Czubinski', 'Anna', 'Czubinski', 'Stanley', 'Czubinski'),
(2010, 513, NULL, NULL, NULL, NULL, '1997-08-27 00:00:00', '181 North St', 'Danvers', 'MA', '01923', '8', '5''6', '125 lbs', NULL, NULL, NULL, '978 7741440', '978 7741440', 'pccrum92@alumni.amherst.edu', 'crum@infinity.aero', '', NULL, NULL, '', 'Sam', 'Crum', 'Pam', 'Crum', 'Jeff', 'Crum'),
(2010, 514, NULL, NULL, NULL, NULL, '1996-01-23 00:00:00', '330 Walnut Street', 'Lynnfield', 'MA', '01940', '8', '5''3', '101 lbs', NULL, NULL, NULL, '978-828-8829', '781-596-4407', 'anna.jablonka@vsea.com', 'r.jablonka@easternbank.com', '', NULL, NULL, '', 'Adrian ', 'Jablonka', 'Anna', 'Jablonka', 'Rafal', 'Jablonka'),
(2010, 515, NULL, NULL, NULL, NULL, '1998-05-07 00:00:00', '330 Walnut Street', 'Lynnfield', 'MA', '01940', '6', '4''11', '92 lbs', NULL, NULL, NULL, '978-828-8829', '781-596-4407', 'anna.jablonka@vsea.com', 'r.jablonka@easternbank.com', '', NULL, NULL, '', 'Jakub', 'Jablonka', 'Anna', 'Jablonka', 'Rafal', 'Jablonka'),
(2010, 516, NULL, NULL, NULL, NULL, '1998-08-01 00:00:00', '35 Kings Hill Drive', 'Lynn', 'MA', '01905', '0', '5''2', '144', NULL, NULL, NULL, '781 599-7695', '781-521-4698', 'dorotaf@verizon.net', 'dorotaf@verizon.net', '', NULL, NULL, '', 'Simon', 'Kazimierczyk', 'Dorota', 'Kazimierczyk', 'Eric', 'Kazimierczyk'),
(2010, 517, NULL, NULL, NULL, NULL, '2001-06-03 00:00:00', '35 Kings Hill Drive', 'Lynn', 'MA', '01905', '3', '4''5''''', '', NULL, NULL, NULL, '781 599-7695', '781-521-4698', 'dorotaf@verizon.net', 'dorotaf@verizon.net', '', NULL, NULL, '', 'Daniel', 'Kazimierczyk', 'Dorota', 'Kazimierczyk', 'Eric', 'Kazimierczyk'),
(2010, 518, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '41 Felt St.', 'Salem', 'MA', '01970', '9', '5''2', '100', NULL, NULL, NULL, '603-315-4392', '603-231-2934', 'sonene@comcast.net', '', '', NULL, NULL, '', 'Ian', 'Graham', 'Sonene', 'Graham', 'John', 'Graham'),
(2010, 519, NULL, NULL, NULL, NULL, '1998-04-20 00:00:00', '26 Symonds St', 'Salem', 'MA', '01970', '7', '5''43''', '130', NULL, NULL, NULL, '978-239-8179', '978-239-8182', 'triciapinirocks@yahoo.com', '', '', NULL, NULL, '', 'Daniel', 'Pini', 'Tricia', 'Pini', 'Doug', 'Pini'),
(2010, 520, NULL, NULL, NULL, NULL, '2000-01-31 00:00:00', '26 Symonds St', 'Salem', 'MA', '01970', '5', '5''2"', '130', NULL, NULL, NULL, '978-239-8179', '978-239-8182', 'triciapinirocks@yahoo.com', '', '', NULL, NULL, '', 'Jacob', 'Pini', 'Tricia', 'Pini', 'Doug', 'Pini'),
(2010, 521, NULL, NULL, NULL, NULL, '2002-02-27 00:00:00', '3 Hibbard Rd.', 'Marblehead', 'MA', '01945', '2', '4'' 2''''', '87', NULL, NULL, NULL, '781-631-8051', '781-631-8051', 'derosier.mhd@gmail.com', 'derosier.mhd@gmail.com', '', NULL, NULL, '', 'Lillian', 'DeRosier', 'Catherine', 'DeRosier', 'Thomas M. ', 'DeRosier'),
(2010, 522, NULL, NULL, NULL, NULL, '1998-02-17 00:00:00', '330 West Emerson St.', 'Melrose', 'MA', '02176', '6', '5''2', '90 lbs', NULL, NULL, NULL, '617-480-9123', '339-224-1580', 'eijocase@mac.com', 'pcasey@rsa.com', '', NULL, NULL, '', 'Daniel', 'Casey', 'Eileen', 'Casey', 'Paul', 'Casey'),
(2010, 523, NULL, NULL, NULL, NULL, '2000-04-05 00:00:00', '31 1/2 Buffum St', 'Salem', 'MA', '01970', '4', '4 feet', '103', NULL, NULL, NULL, '978-509-5508', '978-744-1809', 'egrocki@gmail.com', 'kgrocki@gmail.com', '', NULL, NULL, '', 'Ely', 'Grocki', 'Erin', 'Grocki', 'Kevin ', 'Grocki'),
(2010, 524, NULL, NULL, NULL, NULL, '1998-09-15 00:00:00', '30 Winthrop Street', 'Salem', 'MA', '01970', '0', '5'' 2"', '100lbs', NULL, NULL, NULL, '978-578-7665', '', 'juma98@hotmail.com', '', '', NULL, NULL, '', 'Julia', 'Channing', 'Mary ', 'Collari', '', ''),
(2010, 525, NULL, NULL, NULL, NULL, '2001-09-05 00:00:00', '239 Green Street', 'Marblehead', 'MA', '01945', '0', '4 feet, 4 ', '59 lbs', NULL, NULL, NULL, '781-799-7036', '781-389-0630', 'kklocker@towerschool.org', 'sklocker@verizon.net', '', NULL, NULL, '', 'Dylan', 'Klocker', 'Kelly', 'Klocker', 'Scott', 'Klocker'),
(2010, 526, NULL, NULL, NULL, NULL, '2000-06-04 00:00:00', '15 Sumner Rd', 'Salem', 'MA', '01970', '4', '4''9"', '80', NULL, NULL, NULL, '978-745-1698', '617-733-0872', 'edmacook@comcast.net', '', '', NULL, NULL, '', 'Michael', 'Cook', 'Danielle', 'Cook', 'Eric', 'Cook'),
(2010, 527, NULL, NULL, NULL, NULL, '2000-10-11 00:00:00', '72 Washington Square', 'Salem', 'MA', '01970', '3', '4 ft ', '63', NULL, NULL, NULL, '508-843-3393', '', 'albaralt@hotmail.com', '', '', NULL, NULL, '', 'Daniel ', 'Lopez', 'Alejandra', 'Baralt', '', ''),
(2010, 528, NULL, NULL, NULL, NULL, '2002-04-09 00:00:00', '25 Roslyn St #5', 'Salem', 'MA', '01970', '1', '50 in ', '57', NULL, NULL, NULL, '6178236273', '6176506273', 'imapoppy@excite.com', '', '', NULL, NULL, '', 'Swan', 'Anderson', 'Poppy', 'Ibabao', 'josh', 'gray'),
(2010, 529, NULL, NULL, NULL, NULL, '1995-12-29 00:00:00', '212 Canal Street', 'Salem', 'MA', '01970', '8', '5''11', '205', NULL, NULL, NULL, '978-729-8430', '978-729-5136', 'qasim00@verizon.net', 'qasim00@verizon.net', '', NULL, NULL, '', 'Mohammed', 'El-Ashkar', 'Jill', 'El-Ashkar', 'Emad', 'El-Ashkar'),
(2010, 530, NULL, NULL, NULL, NULL, '2003-09-23 00:00:00', '212 Canal Street', 'Salem', 'MA', '01970', '3', '5', '100', NULL, NULL, NULL, '978-729-8430', '978-729-5136', 'qasim00@verizon.net', 'qasim00@verizon.net', '', NULL, NULL, '', 'Qasim', 'El-Ashkar', 'Jill', 'El-Ashkar', 'Emad', 'El-Ashkar'),
(2010, 531, NULL, NULL, NULL, NULL, '1994-01-20 00:00:00', '212 Canal Street', 'Salem', 'MA', '01970', '10', '5''7"', '130', NULL, NULL, NULL, '978-729-8430', '978-729-5136', 'qasim00@verizon.net', 'qasim00@verizon.net', '', NULL, NULL, '', 'Shadya', 'El-Ashkar', 'Jill ', 'El-Ashkar', 'Emad', 'El-Ashkar'),
(2010, 532, NULL, NULL, NULL, NULL, '2000-02-15 00:00:00', '385 Puritan Road', 'Swampscott', 'MA', '01907', '4', '58', '100 lbs.', NULL, NULL, NULL, '781-581-9764', '781-771-9849', 'hmcarr@comcast.net', 'brookscarr@yahoo.com', '', NULL, NULL, '', 'Andrew ', 'Carr', 'Heather', 'Carr', 'Brooks', 'Carr'),
(2010, 533, NULL, NULL, NULL, NULL, '2006-07-31 00:00:00', '175 West Shore Drive', 'Marblehead', 'MA', '01945', '4', '55', '95', NULL, NULL, NULL, '781-727-1262', '781-639-1769', 'hathaway@verizon.net', 'fhathaway@camsys.com', '', NULL, NULL, '', 'Meagan', 'Hathaway', 'Patricia', 'Hathaway', 'Frank ', 'Hathaway'),
(2010, 534, NULL, NULL, NULL, NULL, '2069-12-31 00:00:00', '175 West Shore Drive', 'Marblehead', 'MA', '01945', '1', '48', '50', NULL, NULL, NULL, '781-727-1262', '781-639-1769', 'hathaway@verizon.net', 'fhathaway@camsys.com', '', NULL, NULL, '', 'Emma', 'Hathaway', 'Patricia', 'Hathaway', 'Frank', ' Hathaway'),
(2010, 535, NULL, NULL, NULL, NULL, '1998-12-27 00:00:00', '43 Linden Street', 'Salem', 'MA', '01970', '0', '5''', '98', NULL, NULL, NULL, '978-979-8892', '671-312-8491', 'jamitolbert@gmail.com', '', '', NULL, NULL, '', 'Jake', 'Weisenberger', 'Jami ', 'Weisenberger', 'Tim', 'Weisenberger'),
(2010, 536, NULL, NULL, NULL, NULL, '2000-10-12 00:00:00', '43 Linden Street', 'Salem', 'MA', '01970', '0', '4???', '110', NULL, NULL, NULL, '978-979-8892', '671-312-8491', 'jamitolbert@gmail.com', '', '', NULL, NULL, '', 'Madelyn', 'Weisenberger', 'Jami', 'Weisenberger', 'Tim ', 'Weisenberger'),
(2010, 537, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '1 Lowell St.', 'Salem', 'MA', '01970', '4', '4''-7"', '75 lbs', NULL, NULL, NULL, '978-744-6647', '978-744-6647', 'kmeche@comcast.net', 'mmeche@wsarchitects.com', '', NULL, NULL, '', 'Alexander', 'Meche', 'Kristin', 'Meche', 'Mark', 'Meche'),
(2010, 538, NULL, NULL, NULL, NULL, '1996-09-07 00:00:00', '1 Lowell St.', 'Salem', 'MA', '01970', '8', '5''-5"', '128', NULL, NULL, NULL, '978-744-6647', '978-744-7379', 'kmeche@comcast.net', 'mmeche@wsarchitects.com', '', NULL, NULL, '', 'Atticus', 'Meche', 'Kristin', 'Meche', 'Mark', 'Meche'),
(2010, 539, NULL, NULL, NULL, NULL, '2001-10-05 00:00:00', 'winthrop street', 'Salem', 'MA', '01970', '4', '54 inches', '65', NULL, NULL, NULL, '718-926-5522', '', 'julesoro@yahoo.com', '', '', NULL, NULL, '', 'gold', 'theo', 'julie ', 'gold', '', ''),
(2010, 540, NULL, NULL, NULL, NULL, '2001-02-15 00:00:00', '5 Martingale Road', 'Lexington', 'MA', '02421', '4', '5 feet', '110', NULL, NULL, NULL, '781-862-7162', '978-828-5681', 'loisbisson@verizon.net', 'lconrad@compassinvest.com', '978-590-2985', NULL, NULL, '', 'Greg', 'Conrad', 'Lois ', 'Bisson', 'Louis ', 'Conrad II'),
(2010, 541, NULL, NULL, NULL, NULL, '1997-04-09 00:00:00', '4 Goodell Street', 'Salem', 'MA', '01970', '0', '5''1', '105', NULL, NULL, NULL, '1978-766-9849', '', 'gimras@hotmail.com', '', '978-766-9849', NULL, NULL, '', 'Kaitlyn', 'Fabre', 'Tammy', 'Fabre', '', ''),
(2010, 542, NULL, NULL, NULL, NULL, '2000-03-29 00:00:00', '4 Goodell Street', 'Salem', 'MA', '01970', '0', '4''8', '70', NULL, NULL, NULL, '1-978-766-9849', '', 'gimras@hotmail.com', '', '978-766-9849', NULL, NULL, '', 'Emily', 'Fabre', 'Tammy', 'Fabre', '', ''),
(2010, 543, NULL, NULL, NULL, NULL, '1999-11-20 00:00:00', '23 Heritage Lane', 'Lynnfield', 'MA', '01940', '4', '4'' 8', '70 lbs', NULL, NULL, NULL, '781-334-4160', '', 'arnett23@verizon.net', '', '', NULL, NULL, '', 'Georgia ', 'Arnett', 'Lisa', 'Arnett', '', ''),
(2010, 544, NULL, NULL, NULL, NULL, '1992-09-05 00:00:00', '23 Heritage Lane', 'Lynnfield', 'MA', '01940', '12', '5'' 4', '110 lbs', NULL, NULL, NULL, '781-334-4160', '', 'arnett23@verizon.net', '', '', NULL, NULL, '', 'Sydni', 'Arnett', 'Lisa', 'Arnett', '', ''),
(2010, 545, NULL, NULL, NULL, NULL, '1999-05-19 00:00:00', '15 Winter Island Road ', 'Salem', 'MA', '01970', '5', '5''1', '115 lbs', NULL, NULL, NULL, '978-745-0250', '', 'p.pauloshea@comcast.net', '', '508-277-7029', NULL, NULL, '', 'kevin', 'O''Shea', 'Anne ', 'O''Shea', '', ''),
(2010, 546, NULL, NULL, NULL, NULL, '1998-07-30 00:00:00', '14 Chandler Rd', 'Salem', 'MA', '01970', '0', '4ft 7 in', '72lbs', NULL, NULL, NULL, '19785945133', '', 'Huntermad@comcast.net', '', '', NULL, NULL, '', 'Hunter', 'Mcdonough', 'Dawn & Kevin', 'Mcdonough', '', ''),
(2010, 547, NULL, NULL, NULL, NULL, '1996-06-20 00:00:00', '15 Juniper Drive', 'Granby', 'CT', '06035', '8', '5''6', '150', NULL, NULL, NULL, '860-653-5624', '860-653-5624', 'rainville.peter@gmail.com', 'smoors@sbcglobal.net', '978-744-4187', NULL, NULL, 'Emergency Contact, Loretta Rainville', 'Scott', 'Rainville', 'Peter R.', 'Rainville', 'Susan R.', 'Rainville'),
(2010, 548, NULL, NULL, NULL, NULL, '1996-06-20 00:00:00', '15 Juniper Drive', 'Granby', 'CT', '06035', '8', '5''6', '160', NULL, NULL, NULL, '860-653-5624', '860-653-5624', 'rainville.peter@gmail.com', 'smoors@sbcglobal.net', '978-744-4187', NULL, NULL, 'Loretta Rainville is emergency contact', 'Brian', 'Rainville', 'Peter R.', 'Rainville', 'Susan R.', 'Rainville'),
(2010, 549, NULL, NULL, NULL, NULL, '1997-10-31 00:00:00', '6 Broad Street', 'Salem', 'MA', '01970', '6', '5''8', '130', NULL, NULL, NULL, '978-744-5667', '978-744-5667', 'pnalipinski@partners.org', 'piriski@earthlink.net', '617-686-5469', NULL, NULL, '', 'Mason', 'Nalipinski', 'Paige', 'Nalipinski', 'Mike', 'Nalipinski'),
(2010, 550, NULL, NULL, NULL, NULL, '1997-05-19 00:00:00', '50 Cabot Road', 'Danvers', 'MA', '01923', '8', '4''11', '150', NULL, NULL, NULL, '978-239-3808', '978-239-6636', 'blberamsdell@yahoo.com', 'blberamsdell@yahoo.com', '978-239-6636', NULL, NULL, '', 'Eric', 'Ramsdell', 'Linda', 'Ramsdell', 'Brad', 'Ramsdell'),
(2010, 551, NULL, NULL, NULL, NULL, '2000-05-08 00:00:00', '12 Sherman Street', 'Peabody', 'MA', '01960', '4', '4'''' 2', '100', NULL, NULL, NULL, '978-210-3339', '', 'fullhaus11@netzero.com', '', '', NULL, NULL, '', 'Connor', 'Full', 'Dianne ', 'Full', '', ''),
(2010, 552, NULL, NULL, NULL, NULL, '1998-08-27 00:00:00', '12 Sherman Street', 'Peabody', 'MA', '01960', '5', '4''5', '101', NULL, NULL, NULL, '978-210-3339', '', 'fullhaus11@netzero.com', '', '', NULL, NULL, '', 'Calvin', 'Full', 'Dianne ', 'Full', '', ''),
(2010, 553, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', '3A Veteran Memorial Drive', 'Peabody', 'MA', '01960', '5', '5'' 2', '140', NULL, NULL, NULL, '978-376-4801', '', 'barbi1131@verizon.net', '', '', NULL, NULL, '', 'James', 'McLernon', 'Barbara', 'McLernon', '', ''),
(2010, 554, NULL, NULL, NULL, NULL, '2000-03-01 00:00:00', '3A Veteran Memorial Drive', 'Peabody', 'MA', '01960', '4', '5'' 2', '130', NULL, NULL, NULL, '978-376-4801', '', 'barbi1131@verizon.net', '', '', NULL, NULL, '', 'Michael', 'McLernon', 'Barbara', 'McLernon', '', ''),
(2010, 555, NULL, NULL, NULL, NULL, '2000-03-11 00:00:00', '4 Howard Avenue', 'Peabody', 'MA', '01960', '0', '57 in', '99lbs', NULL, NULL, NULL, '(978)532-6793', '(978)532-6793', 'jlendall@verizon.net', 'plendall@verizon.net', '', NULL, NULL, '', 'Knox', 'Lendall', 'Jean', 'Lendall', 'Peter', 'Lendall'),
(2010, 556, NULL, NULL, NULL, NULL, '1997-09-01 00:00:00', '9 Pioneer Circle', 'Salem', 'MA', '01970', '6', '5''2', '', NULL, NULL, NULL, '978-741- 3777', '978-764-5950', 'leith3777@comcast.net', 'leith3777@comcast.net', '', NULL, NULL, '', 'Adam', 'Leith', 'Moira', 'Leith', 'Toby ', 'Leith'),
(2010, 557, NULL, NULL, NULL, NULL, '2001-09-23 00:00:00', '31 Warren Street', 'Salem', 'MA', '01970', '0', '', '', NULL, NULL, NULL, '978 745-6327', '978 745-6327', 'sarahmorrill@comcast.net', 'sarahmorrill@comcast.net', '', NULL, NULL, '', 'Owen', 'Murphy', 'Sarah', 'Morrill', 'Sarah', 'Morrill'),
(2010, 558, NULL, NULL, NULL, NULL, '1999-05-28 00:00:00', '31', 'Salem', 'MA', '01970', '0', '', '', NULL, NULL, NULL, '978 745-6327', '978 745-6327', 'sarahmorrill@comcast.net', 'sarahmorrill@comcast.net', '', NULL, NULL, '', 'Maeve', 'Murphy', 'Sarah', 'Morrill', 'Sarah', 'Morrill'),
(2010, 559, NULL, NULL, NULL, NULL, '1996-08-13 00:00:00', '6 Cambridge Street', 'Salem', 'MA', '01970', '8', '5ft 11 inc', '130', NULL, NULL, NULL, '978-998-9317', '617-392-0948', 'judy.bedell@verizon.net', 'john.bedell@fmr.com', '', NULL, NULL, '', 'Rodney', 'Bedell', 'Judy', 'Bedell', 'John ', 'Bedell'),
(2010, 560, NULL, NULL, NULL, NULL, '2001-07-30 00:00:00', '6 Cambridge Street', 'Salem', 'MA', '01970', '3', '50 inches', '50 lbs', NULL, NULL, NULL, '978-998-9317', '617-392-0948', 'judy.bedell@verizon.net', 'john.bedell@fmr.com', '', NULL, NULL, '', 'Alfred ', 'Bedell', 'Judy', 'Bedell', 'john', 'bedell'),
(2010, 561, NULL, NULL, NULL, NULL, '1996-09-10 00:00:00', '136 Essex St', 'Beverly', 'MA', '01915', '8', '5''6', '100', NULL, NULL, NULL, '(978)927-2628', '', '', '', '', NULL, NULL, '', 'Iggy', 'Coughlin', 'Michael ', 'Coughlin', '', ''),
(2010, 562, NULL, NULL, NULL, NULL, '1997-01-30 00:00:00', '70 Summer Street Apt #1', 'Salem', 'MA', '01970', '7', '5''', '130', NULL, NULL, NULL, '781-389-8562', '', 'lisabyors@comcast.net', '', '', NULL, NULL, '', 'Joey', 'Byors', 'Lisa ', 'Byors', '', ''),
(2010, 563, NULL, NULL, NULL, NULL, '2000-02-04 00:00:00', '120 Marlborough Road', 'Salem', 'MA', '01970', '4', '', '89', NULL, NULL, NULL, '978-210-3676', '978-578-8891', 'sdlombard@verizon.net', '', '', NULL, NULL, '', 'Shamus ', 'Lombard', 'Diana', 'Lombard', 'Sean', 'Lombard'),
(2010, 564, NULL, NULL, NULL, NULL, '2001-08-24 00:00:00', '120 Marlborough Road', 'Salem', 'MA', '01970', '3', '', '68', NULL, NULL, NULL, '978-210-3676', '978-578-8891', 'sdlombard@verizon.net', '', '', NULL, NULL, '', 'Brendan ', 'Lombard', 'Diana', 'Lombard', 'Sean', 'Lombard'),
(2010, 565, NULL, NULL, NULL, NULL, '1998-11-03 00:00:00', '43 Ellsworth Ave', 'Beverly', 'MA', '01915', '6', '59 inches', '101', NULL, NULL, NULL, '978-223-3394', '781-690-3055', 'bmcmacdonald@hotmail.com', 'mtman@live.com', '978-223-3394', NULL, NULL, '', 'Collin ', 'MacDonald', 'Mary', 'MacDonald', 'Bob ', 'MacDonald'),
(2010, 566, NULL, NULL, NULL, NULL, '1999-04-04 00:00:00', '6 Thomas Road', 'Beverly', 'MA', '01915', '6', '4'' 11''', '110 lbs', NULL, NULL, NULL, '978-927-9926', '978-836-8083', 'jancassola@comcast.net', '', '978-836-6237', NULL, NULL, '', 'Benjamin ', 'Cassola', 'Janice ', 'Cassola', 'Phil', 'Cassola'),
(2010, 567, NULL, NULL, NULL, NULL, '1998-10-14 00:00:00', 'PO Box 3275', 'Beverly', 'MA', '01915', '5', '60 in', '80 lbs', NULL, NULL, NULL, '978-335-2668', '978-578-7709', 'jsuminsby@yahoo.com', 'jdavidsuminsby@yahoo.com', '', NULL, NULL, '', 'Jack ', 'Suminsby', 'Juliana', 'Suminsby', 'David', 'Suminsby'),
(2010, 568, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '113A Federal St.', 'Salem', 'MA', '01970', '0', '5''0', '90', NULL, NULL, NULL, '617-780-8960', '617-680-9381', 'janine_matho@harvard.edu', 'lmatho@verizon.net', '', NULL, NULL, '', 'Alec', 'Matho', 'Janine ', 'Matho', 'Luis', 'Matho'),
(2010, 569, NULL, NULL, NULL, NULL, '1996-11-04 00:00:00', '8 waite street', 'malden', 'MA', '02148', '7', '5 ''6', '130', NULL, NULL, NULL, '617 922 6500', '978 869 5317', 'julie.fisk@gmail.com', '', '', NULL, NULL, '', 'abby', 'fisk', 'julie', 'fisk', 'russell', 'fisk'),
(2010, 570, NULL, NULL, NULL, NULL, '1997-12-30 00:00:00', '8 waite st', 'malden', 'MA', '02148', '7', '5''5', '150', NULL, NULL, NULL, '617 922 6500', '', 'julie.fisk@gmail.com', '', '', NULL, NULL, '', 'rebecca', 'fisk', 'julie', 'fisk', '', ''),
(2010, 571, NULL, NULL, NULL, NULL, '1996-09-22 00:00:00', '14 spruce', 'Salem', 'MA', '01970', '8', '5''5', '130', NULL, NULL, NULL, '781-760-0153', '781-879 2747', '', '', '', NULL, NULL, '', 'Nicholas ', 'Antonucci', 'Andrea', 'Antonucci', 'ken antonucci', ''),
(2010, 572, NULL, NULL, NULL, NULL, '1998-02-21 00:00:00', '14 spruce', 'malden', 'MA', '02148', '7', '5''3', '95', NULL, NULL, NULL, '781-760-0153', '', '', '', '', NULL, NULL, '', 'kenneth', 'antonucci', 'andrea', 'antonucci', '', ''),
(2010, 573, NULL, NULL, NULL, NULL, '1999-11-07 00:00:00', '14 spruce', 'malden', 'MA', '02148', '4', '5''0', '80', NULL, NULL, NULL, '781-760-0153', '', '', '', '', NULL, NULL, '', 'Sophia', 'antonucci', 'Andrea', 'Antonucci', '', ''),
(2010, 574, NULL, NULL, NULL, NULL, '2001-11-06 00:00:00', '14 spruce st', 'Malden', 'MA', '02148', '3', '4''8', '65', NULL, NULL, NULL, '781-760-0153', '', '', '', '', NULL, NULL, '', 'Bianca', 'Antonucci', 'Andrea', 'Antonucci', '', ''),
(2010, 575, NULL, NULL, NULL, NULL, '2000-04-06 00:00:00', '56 Valiant Way', 'Salem', 'MA', '01970', '4', '5 ft', '100 lb', NULL, NULL, NULL, '9785945935', '9785945935', 'milviaporto@yahoo.com', 'milviaporto@yahoo.com', '', NULL, NULL, '', 'Mathias ', 'Martinez', 'Milvia', 'Porto Martinez', 'Camilo', 'Martinez'),
(2010, 576, NULL, NULL, NULL, NULL, '1998-11-05 00:00:00', '56 Valiant Way', 'Salem', 'MA', '01970', '6', '5 3', '130', NULL, NULL, NULL, '9785945935', '9785945935', 'milviaporto@yahoo.com', 'milviaporto@yahoo.com', '', NULL, NULL, '', 'Mariana', 'Porto', 'Milvia', 'Porto Martinez', 'Camilo', 'Martinez'),
(2010, 577, NULL, NULL, NULL, NULL, '2000-04-15 00:00:00', '56 Valiant Way', 'Salem', 'MA', '01970', '4', '5 ft', '80 lb', NULL, NULL, NULL, '9785945935', '9785945935', 'milviaporto@yahoo.com', 'milviaporto@yahoo.com', '', NULL, NULL, '', 'Luke', 'Holmes', 'Amy ', 'Holmes', 'Scott ', 'Holmes'),
(2010, 578, NULL, NULL, NULL, NULL, '1997-08-24 00:00:00', '112 Columbus Ave', 'Salem', 'MA', '01970', '8', '4'' 11"', '100', NULL, NULL, NULL, '978-744-2986', '978-766-2258', 'jaliduffy@aol.com', 'jaliduffy@aol.com', '', NULL, NULL, '', 'Pete', 'Duffy', 'Lisa', 'Duffy', 'Jim ', 'Duffy'),
(2010, 579, NULL, NULL, NULL, NULL, '1994-07-08 00:00:00', '112 Columbus Ave', 'Salem', 'MA', '01970', '11', '5''2', '110', NULL, NULL, NULL, '978-744-2986', '978-766-2258', 'jaliduffy@aol.com', 'jaliduffy@aol.com', '', NULL, NULL, '', 'Suzannah', 'Duffy', 'Lisa', 'Duffy', 'Jim ', 'Duffy'),
(2010, 580, NULL, NULL, NULL, NULL, '1992-08-26 00:00:00', '112 Columbus Ave', 'Salem', 'MA', '01970', '12', '5''7"', '175', NULL, NULL, NULL, '978-744-2986', '978-766-2258', 'jaliduffy@aol.com', 'jaliduffy@aol.com', '', NULL, NULL, '', 'Tom', 'Duffy', 'Lisa', 'Duffy', 'Jim', 'Duffy'),
(2010, 581, NULL, NULL, NULL, NULL, '1996-10-04 00:00:00', '19 Wisteria', 'Salem', 'MA', '01970', '8', '5''5', '120', NULL, NULL, NULL, '978-548-8683', '', 'jaliduffy@aol.com', '', '', NULL, NULL, '', 'Katherine', 'Towey', 'Laura', 'Towey', '', ''),
(2010, 582, NULL, NULL, NULL, NULL, '1995-10-02 00:00:00', '153 Bay View Ave', 'Salem', 'MA', '01970', '8', '5''4', '140', NULL, NULL, NULL, '978 744-1759', '978 744-1759', 'robertkmccarthy@verizon.net', '', '', NULL, NULL, '', 'William', 'McCarthy', 'Bob', 'McCarthy', 'Kathy', 'McCarthy'),
(2010, 583, NULL, NULL, NULL, NULL, '1998-01-02 00:00:00', '153 Bay View Ave', 'Salem', 'MA', '01970', '6', '5''4', '135', NULL, NULL, NULL, '978 744-1759', '978 744-1759', 'robertkmccarthy@verizon.net', '', '', NULL, NULL, '', 'Jack', 'McCarthy', 'bob', 'McCarthy', 'Kathy', 'McCarthy'),
(2010, 584, NULL, NULL, NULL, NULL, '1997-09-27 00:00:00', '176 Ashland Street', 'Melrose', 'MA', '02176', '7', '4''8', '75 lbs', NULL, NULL, NULL, '781-665-3996', '617-678-8670', 'tangl5@verizon.net', '', '781-665-3996', NULL, NULL, '', 'Austin', 'Smith', 'Lenonore', 'Gauthier Smith', 'Geoffrey', 'Smith'),
(2010, 585, NULL, NULL, NULL, NULL, '1997-02-11 00:00:00', '55 Highland St.', 'Salem', 'MA', '01970', '7', '5', '', NULL, NULL, NULL, '508-596-8205', '', 'Dutch002@aol.com', '', '', NULL, NULL, '', 'Hannah', 'van de Stadt', 'Erin', 'Van de Stadt', '', ''),
(2010, 586, NULL, NULL, NULL, NULL, '1997-02-12 00:00:00', '55 Highland St.', 'Salem', 'MA', '01970', '7', '5'' 2', '100 lbs', NULL, NULL, NULL, '508-596-8205', '', 'Dutch002@aol.com', '', '', NULL, NULL, '', 'Christiaan', 'van de Stadt', 'Erin', 'van de Stadt', '', ''),
(2010, 587, NULL, NULL, NULL, NULL, '1997-08-02 00:00:00', '10 Belleau Rd', 'Salem', 'MA', '01970', '0', '5''3', '91 lb', NULL, NULL, NULL, '978-740-3045', '', 'Claudian40@comcast.net', '', '', NULL, NULL, '', 'Christopher', 'Nikolopoulos', 'Claudia and Nick', 'Nikolopoulos', '', ''),
(2010, 588, NULL, NULL, NULL, NULL, '1999-09-20 00:00:00', '7 Wheatland st', 'Salem', 'MA', '01970', '4', '', '', NULL, NULL, NULL, '978-745-0121', '978-745-0121', 'don11565@aol.com', 'Eddows4@aol.com', '', NULL, NULL, '', 'Matthew', 'Eddows', 'Donna', 'Eddows', 'Douglas ', 'Eddows'),
(2010, 589, NULL, NULL, NULL, NULL, '1999-05-31 00:00:00', '20 Pickman St', 'Salem', 'MA', '01970', '0', '5''', '95lbs', NULL, NULL, NULL, '617-817-2069', '978-729-9877', 'seantlane@hotmail.com', 'mhowe68@hotmail.com', '', NULL, NULL, '', 'Aidan', 'Lane', 'Sean', 'Lane', 'Michelle', 'Lane'),
(2010, 590, NULL, NULL, NULL, NULL, '2000-02-16 00:00:00', '17 Kingdom Ter', 'Peabody', 'MA', '01960', '4', '55.5', '104', NULL, NULL, NULL, '508-560-2021', '978-977-9851', 'sdbmanning@verizon.net', 'diana.manning@middleoak.com', '', NULL, NULL, '', 'Brian', 'Manning', 'Shawn', 'Manning', 'Diana', 'Manning'),
(2010, 591, NULL, NULL, NULL, NULL, '2001-01-27 00:00:00', '51 Ward Street', 'Lexington', 'MA', '02421', '4', '4''5"', '60', NULL, NULL, NULL, '781-863-6455', '781-863-6455', 'heidip@post.harvard.edu', 'dashjdot@gmail.com', '', NULL, NULL, '', 'Lucas', 'Burkholder', 'Heidi', 'Pasternak', 'Jay', 'Burkholder'),
(2010, 592, NULL, NULL, NULL, NULL, '1997-07-10 00:00:00', '7 Hillside Ave', 'Salem', 'MA', '01970', '0', '52', '95 lbs', NULL, NULL, NULL, '978-745-5478', '', 'kmakros@msn.com', '', '', NULL, NULL, '', 'Ariane', 'Mills', 'Kathleen', 'Makros', '', ''),
(2010, 593, NULL, NULL, NULL, NULL, '2001-07-07 00:00:00', '7 Chestnut Strret', 'Salem', 'MA', '01970', '4', '4''9', '115', NULL, NULL, NULL, '617-697-4500', '978-745-1647', 'johnaseger@segerarchitects.com', 'daseger@comcast.net', '', NULL, NULL, '', 'Allen', 'Seger', 'John', 'Seger', 'Donna ', 'Seger'),
(2010, 594, NULL, NULL, NULL, NULL, '1999-11-20 00:00:00', '41 Pearson street', 'Beverly', 'MA', '01915', '0', '', '82lbs', NULL, NULL, NULL, '978-273-8786', '978 273-8786', 'ksammae@gmail.com', 'ksammae@gmail.com', '781-592-9779', NULL, NULL, '', 'Maeve', 'Corbett', 'kim ', 'sammons', 'kim', 'sammons'),
(2010, 595, NULL, NULL, NULL, NULL, '2000-07-31 00:00:00', '24 Buena Vista Avenue', 'Salem', 'MA', '01970', '4', '4''5', '70', NULL, NULL, NULL, '978-740-8642', '978-740-8642', 'pmbouras@comcast.net', 'pmbouras@comcast.net', '617-312-2345', NULL, NULL, '', 'Demetri', 'Bouras', 'Michelle', 'Bouras', 'Peter', 'Bouras'),
(2010, 596, NULL, NULL, NULL, NULL, '2002-01-24 00:00:00', '50 Ravenna Ave', 'Salem', 'MA', '01970', '2', '', '', NULL, NULL, NULL, '978-884-7507', '978-587-1701', 'ajermyn@comcast.net', '', '978-578-1701', NULL, NULL, '', 'Jack', 'Jermyn', 'Deborah', 'Jermyn', 'Tony', 'Jermyn'),
(2010, 597, NULL, NULL, NULL, NULL, '2001-04-01 00:00:00', '16 Sunset Drive', 'Beverly', 'MA', '01915', '0', '57.25', '84 lbs', NULL, NULL, NULL, '978-430-4350', '978-729-4498', 'kfox@salem.org', 'fox_matthew@hotmail.com', '', NULL, NULL, '', 'George', 'Fox', 'Kate', 'Fox', 'Matt', 'Fox'),
(2010, 598, NULL, NULL, NULL, NULL, '1999-12-01 00:00:00', '97 West Street', 'Beverly', 'MA', '01915', '4', '5'' 0', '95', NULL, NULL, NULL, '978 921 4321', '978 328 2858', 'richard.harrison7892@gmail.com', 'mich.a.harrison@gmail.com', '', NULL, NULL, '', 'Maggie', 'Harrison', 'Richard', 'Harrison', 'Michele', 'Harrison'),
(2010, 599, NULL, NULL, NULL, NULL, '2001-10-27 00:00:00', '6 Allen St', 'Salem', 'MA', '01970', '2', '4''11''', '110', NULL, NULL, NULL, '978-745-3259', '978-745-3259', 'nancylipinski@verizon.net', '', '', NULL, NULL, '', 'Emma', 'Lipinski', 'Nancy', 'Lipinski', 'John ', 'Lipinski'),
(2010, 600, NULL, NULL, NULL, NULL, '1998-09-10 00:00:00', '136 Essex St', 'Beverly', 'MA', '01915', '6', '5''4', '90', NULL, NULL, NULL, '(978)927-2628', '', 'MCOUGHLI@nhs-healthlink.org', 'equitainer@aol.com', '', NULL, NULL, '', 'Natalie', 'Coughlin', 'Michael', 'Coughlin', 'Amy', 'Coughlin'),
(2010, 601, NULL, NULL, NULL, NULL, '2000-07-21 00:00:00', '11 Chandler Rd', 'Salem', 'MA', '01970', '4', '4''', '70', NULL, NULL, NULL, '9787449065', '9787449065', 'Peterlaurie@comcast.net', 'Peterlaurie@comcast.net', '', NULL, NULL, '', 'Ryan', 'Moroney', 'Laurie', 'Moroney', 'Peter', 'Moroney'),
(2010, 602, NULL, NULL, NULL, NULL, '2000-09-02 00:00:00', '29', 'Salem', 'MA', '01970', '4', '4', '88 lbs', NULL, NULL, NULL, '678-367-7376', '978-744-6986', 'a.master@earthlink.net', 'a.master@earthlink.net', '', NULL, NULL, '', 'Stabo', 'Eaton', 'Amy', 'Master', 'Stanley', 'Eaton'),
(2010, 603, NULL, NULL, NULL, NULL, '2002-05-24 00:00:00', '29 Boardman St', 'Salem', 'MA', '01970', '3', '4', '70 lbs', NULL, NULL, NULL, '678-367-7376', '978-744-6986', 'a.master@earthlink.net', '', '', NULL, NULL, '', 'Arabella', 'Eaton', 'Amy', 'Master', 'Stanley', 'Eaton'),
(2010, 604, NULL, NULL, NULL, NULL, '1996-07-25 00:00:00', '49 Clark Street', 'Salem', 'MA', '01970', '7', '5''3', '96 lbs', NULL, NULL, NULL, '617-791-7435', '978-745-3236', 'Joyce.Robinson@fns.usda.gov', 'Joyce.Robinson@fns.usda.gov', '', NULL, NULL, '', 'Jared', 'Robinson', 'Joyce', 'Robinson', 'John ', 'Robinson'),
(2010, 605, NULL, NULL, NULL, NULL, '2000-05-16 00:00:00', '4 Appletree Rd', 'Danvers', 'MA', '01923', '4', '54"', '60lbs', NULL, NULL, NULL, '9787740197', '9788366164', 'sheli.denman@thomsonreuters.com', 'blairdenman@hotmail.com', '', NULL, NULL, '', 'Evan', 'Denman', 'Sheli', 'Denman', 'Blair', 'Denman'),
(2010, 606, NULL, NULL, NULL, NULL, '2000-05-16 00:00:00', '4 Appletree', 'Danvers', 'MA', '01923', '4', '55', '60', NULL, NULL, NULL, '9787740197', '9788366164', 'sheli.denman@thomsonreuters.com', 'blairdenman@hotmail.com', '', NULL, NULL, '', 'Adam', 'Denman', 'Sheli', 'Denman', 'Blair', 'Denman'),
(2010, 607, NULL, NULL, NULL, NULL, '2000-08-29 00:00:00', '33 Bradstreet Ave.', 'Danvers', 'MA', '01970', '4', '4.10', '115', NULL, NULL, NULL, '978-762-3526', '978-762-3526', 'juleszwick@juno.com', 'juleszwick@juno.com', '', NULL, NULL, '', 'Griffin', 'Zwicker', 'Julie', 'Zwicker', 'James ', 'Zwicker'),
(2010, 608, NULL, NULL, NULL, NULL, '1999-10-11 00:00:00', '31 Bradstreet Ave.', 'Danvers', 'MA', '01923', '4', '4''10', '85lbs', NULL, NULL, NULL, '978-335-6254', '', 'juleszwick@juno.com', '', '', NULL, NULL, '', 'Tahg', 'Coakley', 'Wilda', 'Jackson', '', ''),
(2010, 609, NULL, NULL, NULL, NULL, '2000-10-21 00:00:00', '409 Essex st', 'Salem', 'MA', '01970', '3', '4ft9inches', '68lbs', NULL, NULL, NULL, '978-335-3276', '781-346-1443', 'slt1021@comcast.net', '', '', NULL, NULL, '', 'samuel', 'tyler', 'dawn', 'tyler', 'tim', 'tyler'),
(2010, 610, NULL, NULL, NULL, NULL, '2069-12-31 00:00:00', '8 Flynn St', 'Salem', 'MA', '01970', '0', '5 feet', '110', NULL, NULL, NULL, '978-745-8410', '978-745-8410', 'c.crawley@easternbk.com', 'crawley8@comcast.net', '', NULL, NULL, '', 'Jack', 'Crawley', 'Cara ', 'Crawley', 'John', 'Crawley'),
(2010, 611, NULL, NULL, NULL, NULL, '1998-02-07 00:00:00', '6 Home Street', 'Salem', 'MA', '01970', '6', '5''', '90 lbs', NULL, NULL, NULL, '9788368037', '9788368036', 'bajel257@comcast.net', 'bjel74@comcast.net', '', NULL, NULL, '', 'Hayley', 'Jellison', 'Bethann', 'Jellison', 'Robert', 'Jellison'),
(2010, 612, NULL, NULL, NULL, NULL, '1999-05-07 00:00:00', '6 Home Street', 'Salem', 'MA', '01970', '5', '4''8''', '90 lbs', NULL, NULL, NULL, '9788368037', '9788368036', 'bajel257@comcast.net', 'bjel74@comcast.net', '', NULL, NULL, '', 'Jessica', 'Jellison', 'Bethann', 'Jellison', 'Robert', 'Jellison'),
(2010, 613, NULL, NULL, NULL, NULL, '1997-06-12 00:00:00', '5 crescent drive', 'Salem', 'MA', '01970', '6', '4''10', '135', NULL, NULL, NULL, '978-210-4344', '', 'rlbsalem66@comcast.net', '', '', NULL, NULL, '', 'jared', 'brewster', 'renee', 'melendez', '', ''),
(2010, 614, NULL, NULL, NULL, NULL, '2001-06-03 00:00:00', '11 1/2 Albion St.', 'Salem', 'MA', '01970', '0', '4''7', '92lbs', NULL, NULL, NULL, '9782736657', '9785023542', 'pmwebb45@gmail.com', 'maj258@yahoo.com', '', NULL, NULL, '', 'Shannon', 'Webb', 'Paula', 'Webb', 'Stephen', 'Webb'),
(2010, 615, NULL, NULL, NULL, NULL, '1997-09-10 00:00:00', '11 1/2 Albion St', 'Salem', 'MA', '01970', '0', '5ft', '97lbs', NULL, NULL, NULL, '9782736657', '9785023542', 'pmwebb45@gmail.com', 'Maj258@yahoo.com', '', NULL, NULL, '', 'Colin ', 'Webb', 'Paula ', 'Webb', 'Stephen', 'Webb'),
(2010, 616, NULL, NULL, NULL, NULL, '1999-04-02 00:00:00', '8 Outlook Hill', 'Salem', 'MA', '01970', '5', '5''1', '86', NULL, NULL, NULL, '978-745-6153', '', 'a.pinto@comcast.net', '', '', NULL, NULL, '', 'Briana', 'Pinto', 'Ana', 'Pinto', '', ''),
(2010, 617, NULL, NULL, NULL, NULL, '2001-12-03 00:00:00', '8 Outlook Hill', 'Salem', 'MA', '01970', '2', '51', '75', NULL, NULL, NULL, '978-745-6153', '', 'a.pinto@comcast.net', '', '', NULL, NULL, '', 'Adam', 'Pinto', 'Ana', 'Pinto', '', ''),
(2010, 618, NULL, NULL, NULL, NULL, '1998-08-10 00:00:00', '8 Victory Rd', 'Salem', 'MA', '01970', '7', '5''6"', '180', NULL, NULL, NULL, '978-335-2640', '978-335-3390', 'vickig01970@yahoo.com', '', '', NULL, NULL, '', 'Matthew', 'Leausa', 'Victoria ', 'Gauthier', 'Max', 'Leausa'),
(2010, 619, NULL, NULL, NULL, NULL, '1999-07-16 00:00:00', '13 Broad Street', 'Danvers', 'MA', '01923', '4', '54.5', '85', NULL, NULL, NULL, '7812642328', '7812644148', 'cook.heather@verizon.net', '', '', NULL, NULL, '', 'Parker', 'Cook', 'Heather', 'Cook', 'Robert', 'Cook'),
(2010, 620, NULL, NULL, NULL, NULL, '1995-03-04 00:00:00', '9 Nursery Street', 'Salem', 'MA', '01970', '9', '63', '110', NULL, NULL, NULL, '978-764-5354', '508-317-4365', 'jay_smith@fitforcinc.com', 'mbinma@juno.com', '', NULL, NULL, '', 'Hannah', 'Smith', 'Jay', 'Smith', 'Mary Beth', 'Smith'),
(2010, 621, NULL, NULL, NULL, NULL, '1995-03-04 00:00:00', '9 Nursery Street', 'Salem', 'MA', '01970', '8', '63', '110', NULL, NULL, NULL, '978-764-5354', '508-317-4365', 'j_smith@fitforce.inc', 'mbinma@juno.com', '', NULL, NULL, '', 'Abigail', 'Smith', 'Jay', 'Smith', 'Mary Beth', 'Smith'),
(2010, 622, NULL, NULL, NULL, NULL, '1998-09-13 00:00:00', '13 Juniper Ave.', 'Salem', 'MA', '01970', '5', '5''1''''', '115', NULL, NULL, NULL, '978-741-3637', '978-500-6091', 'cjuliewhitlow@gmail.com', 'ommerchan@gmail.com', '978-500-6089', NULL, NULL, '', 'Marina', 'Whitlow', 'Julie ', 'Whitlow', 'Olga', 'Merchan'),
(2010, 623, NULL, NULL, NULL, NULL, '1998-06-25 00:00:00', '32 Summit Ave.', 'Salem', 'MA', '01970', '6', '5''', '105', NULL, NULL, NULL, '978-501-0587', '', 'nwadsworth@salemstate.edu', '', '', NULL, NULL, '', 'Olivia', 'Wadsworth', 'Nelly', 'Wadsworth', '', ''),
(2010, 624, NULL, NULL, NULL, NULL, '0201-03-22 00:00:00', '9 Nursery', 'Salem', 'MA', '01970', '3', '52', '68', NULL, NULL, NULL, '978-764-5354', '508-317-4365', 'j_smith@fitforceinc.org', 'mbinma@juno.com', '', NULL, NULL, '', 'Noah', 'Smith', 'Jay', 'Smith', 'Mary Beth', 'Smith'),
(2010, 625, NULL, NULL, NULL, NULL, '2000-08-11 00:00:00', '7 Sutton terrace', 'Salem', 'MA', '01970', '4', '54', '74', NULL, NULL, NULL, '978-594-5144', '978-594-5144', 'ljmagee@comcast.net', 'ljmagee@comcast.net', '781-718-3947', NULL, NULL, '', 'Samuel', 'Magee', 'Lisa', 'Magee', 'Jeffrey', 'Magee'),
(2010, 626, NULL, NULL, NULL, NULL, '2000-08-11 00:00:00', '7 Sutton terrace', 'Salem', 'MA', '01970', '4', '53', '77', NULL, NULL, NULL, '978-594-5144', '978-594-5144', 'ljmagee@comcast.net', 'ljmagee@comcast.net', '781-718-3947', NULL, NULL, 'Nut Allergy', 'Hannah', 'Magee', 'Lisa', 'Magee', 'Jeffrey', 'Magee'),
(2010, 627, NULL, NULL, NULL, NULL, '2000-09-10 00:00:00', '81 Marlborough Rd', 'Salem', 'MA', '01970', '3', '4''8', '115', NULL, NULL, NULL, '978-744-9699', '978-744-9699', 'dannys-mom@comcast.net', '', '', NULL, NULL, '', 'Danny', 'Liberge', 'Jennifer', 'Liberge', 'Mike', 'Liberge'),
(2010, 628, NULL, NULL, NULL, NULL, '2001-10-16 00:00:00', '1 Laurel St.,Apt. 2R', 'Salem', 'MA', '01970', '9', '51.5 inche', '54 pounds', NULL, NULL, NULL, '(978)594-5736', '(978)594-5736', 'swimsdog@yahoo.com', 'swimsdog@yahoo.com', '', NULL, NULL, '', 'Darlin', 'Samson', 'Linda', 'Samson', 'Linda', 'Samson'),
(2010, 629, NULL, NULL, NULL, NULL, '1998-02-17 00:00:00', '39 fairview ave', 'beverly', 'MA', '01915', '7', '66 inches', '98lbs', NULL, NULL, NULL, '9784952466', '9784952466', 'jdlaandrews@YAHOO.COM', 'jdlaandrews@yahoo.com', '', NULL, NULL, '', 'abby', 'andrews', 'Debbie', 'Andrews', 'John', 'Andrews'),
(2010, 630, NULL, NULL, NULL, NULL, '1995-12-04 00:00:00', '39 Fairivew Ave', 'beverly', 'MA', '01915', '9', '5feet 7 in', '135', NULL, NULL, NULL, '9784952466', '9784952465', 'jdlaandrews@yahoo.com', 'jdlaandrews@yahoo.com', '', NULL, NULL, '', 'Linsey', 'Andrews', 'Debbie', 'Andrews', 'John', 'Andrews'),
(2010, 631, NULL, NULL, NULL, NULL, '1999-10-13 00:00:00', '17 Roslyn Street', 'Salem', 'MA', '01970', '0', '4''11', '95lb', NULL, NULL, NULL, '781-316-4150', '', 'dmj4life2002@yahoo.com', '', '', NULL, NULL, '', 'Jillian', 'Awalt', 'Danielle', 'Madruga', '', ''),
(2010, 632, NULL, NULL, NULL, NULL, '1997-10-25 00:00:00', '16 RIVERBANK ROAD', 'Salem', 'MA', '01970', '0', '5 FEET', '140', NULL, NULL, NULL, '978 740 0399', '978 740 0399', 'doncur@comcast.net', '', '', NULL, NULL, '', 'ERIN', 'CURLEY', 'DONNA', 'CURLEY', 'RICHARD', 'CURLEY'),
(2010, 633, NULL, NULL, NULL, NULL, '1999-07-15 00:00:00', '16 RIVERBANK ROAD', 'Salem', 'MA', '01970', '0', '51', '58 LBS', NULL, NULL, NULL, '978 740 0399', '978 740 0399', 'doncur@comcast.net', '', '', NULL, NULL, '', 'JESSICA', 'CURLEY', 'DONNA', 'CURLEY', 'RICHARD', 'CURLEY'),
(2010, 634, NULL, NULL, NULL, NULL, '2002-06-18 00:00:00', '16 RIVERBANK ROAD', 'Salem', 'MA', '01970', '0', '50', '55 LBS', NULL, NULL, NULL, '978 740 0399', '978 740 0399', 'doncur@comcast.net', '', '', NULL, NULL, '', 'SARAH ', 'CURLEY', 'DONNA', 'CURLEY', 'RICHARD ', 'CURLEY'),
(2010, 635, NULL, NULL, NULL, NULL, '2001-08-04 00:00:00', '93 Maple Street', 'Middleton', 'MA', '01949', '4', '51 inches', '60 lbs', NULL, NULL, NULL, '978-502-2425', '978-846-0640', '', 'ddavis@northshore.edu', '', NULL, NULL, '', 'Harrison', 'Davis', 'Larry', 'Davis', 'Donna', 'Davis'),
(2010, 636, NULL, NULL, NULL, NULL, '1997-09-24 00:00:00', '21 Saltonstall Parkway', 'Salem', 'MA', '01970', '6', '5', '110', NULL, NULL, NULL, '978-744-0262', '978-930-5175', 'laurenbrian@verizon.net', '', '', NULL, NULL, '', 'Maise', 'Shepard', 'Lauren', 'Perry', 'Joseph ', 'Shepard'),
(2010, 637, NULL, NULL, NULL, NULL, '1998-05-17 00:00:00', '22 East Corning St', 'Beverly', 'MA', '01970', '6', '5ft 5in', '100', NULL, NULL, NULL, '978-927-4998', '', 'ackplorer@comcast.net', '', '', NULL, NULL, '', 'Emma ', 'Faulkner', 'Ellen ', 'Faulkner', '', ''),
(2010, 638, NULL, NULL, NULL, NULL, '2000-09-15 00:00:00', '22 East Corning St', 'Beverly', 'MA', '01915', '3', '4ft 11 in', '60', NULL, NULL, NULL, '978-927-4998', '', 'ackplorer@comcast.net', '', '', NULL, NULL, '', 'Sarah ', 'Faulkner', 'Ellen', 'Faulkner', '', ''),
(2010, 639, NULL, NULL, NULL, NULL, '2001-12-05 00:00:00', '43 Ralph Road', 'Marblehead', 'MA', '01945', '2', '54 in', '80 lbs', NULL, NULL, NULL, '978 302 3648', '978 302 2202', 'nsherf@salemstate.edu', '', '978-302-3648', NULL, NULL, '', 'Cooper', 'Sherf', 'Nicole', 'Sherf', 'Mark ', 'Sherf'),
(2010, 640, NULL, NULL, NULL, NULL, '2000-12-08 00:00:00', '17 Bryant St Apt 2', 'Salem', 'MA', '01970', '3', '', '73', NULL, NULL, NULL, '781-405-1857', '978-479-2626', 'bag1977@msn.com', '', '', NULL, NULL, '', 'Quinn', 'Galante-Barrett', 'Brenda', 'Galante', 'Jonathan ', 'Barrett'),
(2010, 641, NULL, NULL, NULL, NULL, '2002-07-06 00:00:00', '17 Bryant St Apt 2', 'Salem', 'MA', '01970', '2', '68', '68', NULL, NULL, NULL, '781-405-1857', '978-479-2626', 'bag1977@msn.com', '', '', NULL, NULL, '', 'Ella', 'Galante-Barrett', 'Brenda', 'Galante', 'Jonathan', 'Barrett'),
(2010, 642, NULL, NULL, NULL, NULL, '1999-02-09 00:00:00', '2A Woodside St', 'Salem', 'MA', '01970', '5', '4', '8', NULL, NULL, NULL, '9784982025', '6172516571', 'aaaa.lypps@comcast.net', 'aaaa.lypps@comcast.net', '', NULL, NULL, '', 'Abaigeal', 'Lypps', 'Amy B', 'Lypps', 'Andrew', 'Lypps'),
(2010, 643, NULL, NULL, NULL, NULL, '2000-08-20 00:00:00', '238 loring ave', 'Salem', 'MA', '01970', '0', '5''0"', '92', NULL, NULL, NULL, '978 744 6237', '978 744 6237', 'Lisabella964@mac.com', 'Mpcsr15@comcast.net', '', NULL, NULL, '', 'Patrick', 'Collins', 'Lisa', 'Collins', 'Michael', 'Collins'),
(2010, 644, NULL, NULL, NULL, NULL, '2002-03-07 00:00:00', '175 Federal Street', 'Salem', 'MA', '01970', '2', '', '', NULL, NULL, NULL, '978-740-3250', '978-740-3250', 'jorwelm@verizon.net', 'jorewelm@verizon.net', '', NULL, NULL, '', 'Harry', 'Welch', 'Mary  ', 'Jordan-Welch', 'Mary', 'Jordan-Welch'),
(2010, 645, NULL, NULL, NULL, NULL, '1999-11-20 00:00:00', '175 Federal st', 'Salem', 'MA', '01970', '4', '', '', NULL, NULL, NULL, '978-740-3250', '978-740-3250', 'jorwelm@verizon.net', 'jorwelm@verizon.net', '', NULL, NULL, '', 'Isabel', 'Welch', 'Mary', 'Jordan-Welch', 'Mary', 'Jordan-Welch'),
(2010, 646, NULL, NULL, NULL, NULL, '2000-12-20 00:00:00', '2 Hayes Road', 'Salem', 'MA', '01970', '3', '4.5', '72', NULL, NULL, NULL, '978-979-2191', '978-741-2256', 'dsantacruz1@juno.com', 'bsantacruz@icoc.org', '978-979-2106', NULL, NULL, '', 'Kevin ', 'Santa Cruz', 'Doug ', 'Santa Cruz', 'Beth', 'Santa Cruz'),
(2010, 647, NULL, NULL, NULL, NULL, '2001-05-11 00:00:00', 'hubon street', 'Salem', 'MA', '01970', '3', '4'' 2 "', '70', NULL, NULL, NULL, '617-797-4921', '781-254-2603', 'gogfs@verizon.net', '', '', NULL, NULL, '', 'liam', 'fabbri ', 'patty', 'fabbri ', 'luke', 'fabbri'),
(2010, 648, NULL, NULL, NULL, NULL, '2001-12-31 00:00:00', '135 Bridge ', 'Salem', 'MA', '01970', '0', '4''6 "', '70', NULL, NULL, NULL, '978-744-7841', '978-744-7841', 'schaedlefamily@yahoo.com', 'schaedlefamily@yahoo.com', '', NULL, NULL, '', 'marlene', 'schaedle', 'Marlene', 'schaedle', 'Marc', 'Schaedle'),
(2010, 649, NULL, NULL, NULL, NULL, '1999-06-18 00:00:00', 'hubon st', 'Salem', 'MA', '01970', '5', '5''', '96 ', NULL, NULL, NULL, '781-254-2603', '617-797-4921', 'gogfs@verizon.net', 'gogfs@verizon.net', '', NULL, NULL, '', 'collin', 'fabbri', 'luke', 'fabbri', 'patty', 'fabbri'),
(2010, 650, NULL, NULL, NULL, NULL, '1996-09-26 00:00:00', '205 North Street', 'Salem', 'MA', '01970', '7', '5.3ft', '100 pounds', NULL, NULL, NULL, '9787458873', '9787458873', 'stoutderek@netscape.net', 'stoutderek@netscape.net', '', NULL, NULL, '', 'Victoria', 'Stout', 'Christina ', 'Stout', 'Derek', 'Stout'),
(2010, 651, NULL, NULL, NULL, NULL, '1997-01-14 00:00:00', '12 Planters St', 'Salem', 'MA', '01970', '7', '5ft 9in', '', NULL, NULL, NULL, '978-766-1837', '978-766-1838', 'mkzip24@comcast.net', 'fzip19@comcast.net', '', NULL, NULL, '', 'Meaghan', 'Zipper', 'Mary Kate', 'Zipper', 'Frank', 'Zipper'),
(2010, 652, NULL, NULL, NULL, NULL, '2002-05-24 00:00:00', '238 Lafayette Street', 'Salem', 'MA', '01970', '3', '4''4', '60', NULL, NULL, NULL, '978 740-9693', '978 740-9693', 'jane@janeshouse.com', 'jane@janeshouse.com', '978-335-1266', NULL, NULL, 'Would like to switch to August 9 AM, August 16 AM, or August 9 PM', 'David', 'Turiel', 'Jane Ann', 'Turiel', 'Jane', 'Turiel'),
(2010, 653, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '20 forest ave #3', 'Salem', 'MA', '01970', '2', '52 inches', '85lbs', NULL, NULL, NULL, '978-979-6032', '978-979-6032', 'klr@gmail.com', 'mattveno@hotmail.com', '', NULL, NULL, '', 'Sarah', 'Veno', 'karen', 'Veno', 'Matthew', 'Veno'),
(2010, 654, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '20 Forest Ave. #3', 'Salem', 'MA', '01970', '5', '58', '88', NULL, NULL, NULL, '978-979-6032', '978-979-6032', 'klr@gmail.com', 'mattveno@hotmail.com', '', NULL, NULL, '', 'Nicole', 'Veno', 'Karen', 'Veno', 'Matthew', 'Veno'),
(2010, 655, NULL, NULL, NULL, NULL, '2002-03-24 00:00:00', '6 Skerry St', 'Salem', 'MA', '01970', '2', '4''-', '58 lbs', NULL, NULL, NULL, '978-745-7874', '978-745-7874', 'salemclawson@msn.com', 'rclawson@tcco.com', '', NULL, NULL, '', 'Skyler ', 'Clawson', 'Marcie', 'Clawson', 'Robert ', 'Clawson'),
(2010, 656, NULL, NULL, NULL, NULL, '1999-08-16 00:00:00', '50 Winter Island Road', 'Salem', 'MA', '01970', '4', '??', '??', NULL, NULL, NULL, '978-744-5261', '', 'diswangai@gmail.com', '', '', NULL, NULL, '', 'Nicholas ', 'Lay', 'Casey ', 'Murphree', '', ''),
(2010, 657, NULL, NULL, NULL, NULL, '1996-10-31 00:00:00', '50 Winter Island Road', 'Salem', 'MA', '01970', '5', '', '', NULL, NULL, NULL, '978-744-5261', '', 'diswangai@gmail.com', '', '', NULL, NULL, '', 'Anthony ', 'Lay', 'Casey', 'Murphree', '', ''),
(2010, 658, NULL, NULL, NULL, NULL, '2002-02-09 00:00:00', '3 sutton ave', 'Salem', 'MA', '01970', '2', '4ft', '80lbs', NULL, NULL, NULL, '19787444380', '19787444380', 'scrummpy@comcast.net', 'scrummpy@comcast.net', '', NULL, NULL, '', 'Keenan', 'Howley', 'anne', 'kenny', 'Brendan', 'Howley'),
(2010, 659, NULL, NULL, NULL, NULL, '2002-03-01 00:00:00', '9 japonica st', 'Salem', 'MA', '01970', '3', '52inches', '100lbs', NULL, NULL, NULL, '978-335-1863', '978-745-4106', 'nzb2@verizon.net', 'nzb2@verizon.net', '', NULL, NULL, '', 'zachery', 'mccarthy', 'robert', 'mccarthy', 'nancy', 'haibon'),
(2010, 660, NULL, NULL, NULL, NULL, '1998-12-27 00:00:00', '3B Sugar Hill Lane', 'Wakefield', 'MA', '01880', '5', '4''11"', '', NULL, NULL, NULL, '781-727-7713', '617-293-3600', 'ginav2005@yahoo.com', 'tuppenney@comcast.net', '', NULL, NULL, '', 'Gianna', 'Thibeault', 'Gina', 'Venezia', 'William ', 'Thibeault'),
(2010, 661, NULL, NULL, NULL, NULL, '2001-05-05 00:00:00', '58 Walnut Road', 'Salem', 'MA', '01970', '3', '4''', '60', NULL, NULL, NULL, '978-468-4775', '', 'Gumbolu@gis.net', '', '', NULL, NULL, '', 'JP', 'Collins', 'Lara', 'Collins', '', ''),
(2010, 662, NULL, NULL, NULL, NULL, '2002-07-10 00:00:00', '13 River Street', 'Salem', 'MA', '01970', '0', '4 feet', '52', NULL, NULL, NULL, '5085271219', '5084519555', 'cynthia.m.johnson@gmail.com', 'rjohnson@hcpro.com', '', NULL, NULL, 'There is an important sheet to read about Trevor.  Asperger''s Syndrome, Fear of Loud Unexpected Noises', 'Trevor', 'Johnson', 'cynthia', 'johnson', 'richard', 'johnson'),
(2010, 663, NULL, NULL, NULL, NULL, '2000-11-21 00:00:00', '6 Adams Street', 'Salem', 'MA', '01970', '3', '50', '62lbs', NULL, NULL, NULL, '978-741-5221', '978-360-4168', 'gwronkow@aol.com', 'dwronkowski@yahoo.com', '', NULL, NULL, '', 'Isabella', 'Wronkowski', 'Gina', 'Wronkowski', 'Dan', 'Wronkowski'),
(2010, 664, NULL, NULL, NULL, NULL, '1995-05-22 00:00:00', '72 Bay View Ave.', 'Salem', 'MA', '01970', '9', '5''8"', '120', NULL, NULL, NULL, '978-239-7210 ', '978-239-7212 ', 'jfellows2002@yahoo.com', '', '', NULL, NULL, '', 'Will', 'Fellows', 'Jan ', 'Fellows', 'Dave', 'Fellows'),
(2010, 665, NULL, NULL, NULL, NULL, '2001-08-24 00:00:00', '14 Francis Road', 'Salem', 'MA', '01970', '0', '4.5', '68 lbs', NULL, NULL, NULL, '978-745-6322', '978-745-6322', 'xxlindalooxx@verizon.net', 'xxlindalooxx@verizon.net', '', NULL, NULL, '', 'Christina', 'McLaughlin', 'Linda', 'McLaughlin', 'Scott', 'Mclaughlin'),
(2010, 666, NULL, NULL, NULL, NULL, '2001-12-13 00:00:00', '28 Howard Street Unit 1', 'Salem', 'MA', '01970', '0', '53 inches', '55 lbs', NULL, NULL, NULL, '978-744-0604', '978-328-4377', 'kendra.lefleur@gmail.com', 'jrlefleur@gmail.com', '', NULL, NULL, '', 'Elias', 'LeFleur', 'Kendra', 'LeFleur', 'Alan', 'LeFleur'),
(2010, 667, NULL, NULL, NULL, NULL, '2001-08-20 00:00:00', '67 Grant Street', 'Lynn', 'MA', '01902', '3', '', '100 lbs', NULL, NULL, NULL, '781-540-1209', '781-953-0270', 'djolly@partners.org', 'djolly@partners.org', '', NULL, NULL, '', 'Jessica', 'Jolly', 'Danielle', 'Jolly', 'Dennis', 'Jolly'),
(2010, 668, NULL, NULL, NULL, NULL, '2001-10-01 00:00:00', '16 Patton Road', 'Salem', 'MA', '01970', '2', '4'' 4"', '60lbs', NULL, NULL, NULL, '978-239-0893', '800-615-0271', 'kristen_clark@hotmail.com', 'bobclark@comsys.com', '', NULL, NULL, '', 'Katelyn', 'Clark', 'Kristen', 'Clark', 'Robert ', 'Clark '),
(2010, 669, NULL, NULL, NULL, NULL, '2000-01-23 00:00:00', '16 Patton Road', 'Salem', 'MA', '01970', '4', '4''6"', '80lbs', NULL, NULL, NULL, '978-239-0893', '800-615-0271', 'kristen_clark@hotmail.com', 'andrewrobertclark@hotmail.com', '', NULL, NULL, '', 'Andrew', 'Clark', 'Kristen', 'Clark', 'Robert', 'Clark'),
(2010, 670, NULL, NULL, NULL, NULL, '2000-06-08 00:00:00', '7 Dibiase St', 'Salem', 'MA', '01970', '0', '4''4', '85#', NULL, NULL, NULL, '978-745-0589', '978-745-0589', 'kelhome@earthlink.net', '', '', NULL, NULL, '', 'Jack', 'Kelly', 'Chris', 'Kelly', 'Michael', 'Kelly'),
(2010, 671, NULL, NULL, NULL, NULL, '1999-09-29 00:00:00', '5 Alba Ave ', 'Salem', 'MA', '01970', '2', '', '', NULL, NULL, NULL, '978 302 5544', '508 2077626', 'carla5@comcast.net', 'jmroper@statestreet.com', '', NULL, NULL, '', 'Michael', 'Roper', 'Carla ', 'Roper', 'Jim', 'Roper'),
(2010, 672, NULL, NULL, NULL, NULL, '2001-10-13 00:00:00', '5 Alba Ave ', 'Salem', 'MA', '01970', '2', '', '', NULL, NULL, NULL, '978 302 5544', '5082075626', 'carla5@comcast.net', 'jmroper@statestreet.com', '', NULL, NULL, '', 'Nicolas', 'Roper', 'Carla ', 'Roper', 'Jim', 'Roper');
INSERT INTO `wh_registration` (`year`, `id`, `registrationNumber`, `MedicalInformationForm`, `studentName`, `Age`, `BirthDate`, `Address`, `City`, `State`, `Zip`, `SchoolGrade`, `Height`, `Weight`, `HomePhone`, `Mother`, `Father`, `Phone1`, `Phone2`, `Email1`, `Email2`, `PrimaryEmergencyNumber`, `TShirtSize`, `AssignedSession`, `Notes`, `first_name`, `last_name`, `guardian_one_firstname`, `guardian_one_lastname`, `guardian_two_firstname`, `guardian_two_lastname`) VALUES
(2010, 673, NULL, NULL, NULL, NULL, '2001-03-12 00:00:00', '15 summit st', 'Salem', 'MA', '01970', '3', '4 ft 5 in', '75', NULL, NULL, NULL, '9787412846', '9787412846', 'jmc101761@msn.com', '', '', NULL, NULL, '', 'Kaylee ', 'Coelho', 'George', 'Coelho', 'Maria', 'Coelho'),
(2010, 674, NULL, NULL, NULL, NULL, '1999-06-14 00:00:00', '14 Osborne Street', 'Salem', 'MA', '01970', '6', '4 10', '85', NULL, NULL, NULL, '978-360-3160', '617-755-3514', 'nparsons617@gmail.com', '', '', NULL, NULL, '', 'Brianna', 'Parsons', 'Nicole', 'Parsons', 'Brian', 'Parsons'),
(2010, 675, NULL, NULL, NULL, NULL, '2001-02-01 00:00:00', '14 Osborne Street', 'Salem', 'MA', '01970', '4', '4'' 2"', '55', NULL, NULL, NULL, '978-360-3160', '617-755-3514', 'nparsons617@gmail.com', '', '', NULL, NULL, '', 'Patrick', 'Parsons', 'Nicole', 'Parsons', 'Brian', 'Parsons'),
(2010, 676, NULL, NULL, NULL, NULL, '1994-07-06 00:00:00', '14 Francis Road', 'Salem', 'MA', '01970', '0', '5'''' 7''', '135 lbs.', NULL, NULL, NULL, '978-745-6322', '978-745-6322', 'xxlindalooxx@verizon.net', '', '', NULL, NULL, '', 'Sean', 'McLaughlin', 'Linda', 'McLaughlin', 'Scott', 'McLaughlin'),
(2010, 677, NULL, NULL, NULL, NULL, '1995-02-03 00:00:00', '9 Lakeshore Drive', 'Beverly', 'MA', '01915', '0', '5'''' 8''', '175 lbs.', NULL, NULL, NULL, '978-921-1463', '978-921-1463', 'zelano@verizon.net', '', '', NULL, NULL, '', 'Andrea', 'Zelano', 'Debra', 'Zelano', 'Carlo', 'Zelano'),
(2010, 678, NULL, NULL, NULL, NULL, '1997-04-14 00:00:00', '9 Lakeshore Drive', 'Beverly', 'MA', '01915', '0', '5'''' 9''', '145 lbs.', NULL, NULL, NULL, '978-921-1463', '978-921-1463', 'zelano@verizon.net', '', '', NULL, NULL, '', 'Nicholas', 'Zelano', 'Debra', 'Zelano', 'Carlo', 'Zelano'),
(2010, 679, NULL, NULL, NULL, NULL, '1994-09-03 00:00:00', '72 Middlebury Lane', 'Beverly', 'MA', '01915', '0', '5'''' 7''', '135 lbs.', NULL, NULL, NULL, '978-927-9561', '978-927-9561', 'zelano@verizon.net', '', '', NULL, NULL, '', 'Jillian', 'Morneau', 'Tricia', 'Morneau', 'Joe', 'Morneau'),
(2010, 680, NULL, NULL, NULL, NULL, '2000-10-10 00:00:00', '7 Hillside Ave', 'Marblehead', 'MA', '01945', '0', '4''4', '65', NULL, NULL, NULL, '7816391120', '7816391120', 'jahna.gregory@gmail.com', 'jahna.gregory@gmail.com', '', NULL, NULL, '', 'Lily', 'Gregory', 'Jahna', 'Gregory', 'Paul', 'Gregory'),
(2010, 681, NULL, NULL, NULL, NULL, '2001-10-12 00:00:00', '7 Hillside Ave', 'Marblehead', 'MA', '01945', '0', '4''2', '65', NULL, NULL, NULL, '7816391120', '7816391120', 'jahna.gregory@gmail.com', 'jahna.gregory@gmail.com', '', NULL, NULL, '', 'Rachael', 'Gregory', 'Jahna', 'Gregory', 'Jahna', 'Gregory'),
(2010, 682, NULL, NULL, NULL, NULL, '2001-08-27 00:00:00', '77 Roosevelt Ave', 'Salem', 'MA', '01970', '0', '48"', '60 lbs', NULL, NULL, NULL, '781 639-1386', '781 639-1386', 'bcoate@comcast.net', 'bcoate@comcast.net', '', NULL, NULL, '', 'Eliza', 'Coate', 'Elizabeth', 'Coate', 'Elizabeth', 'Coate'),
(2010, 683, NULL, NULL, NULL, NULL, '2010-06-13 00:00:00', '3 Surrey Road ', 'Salem', 'MA', '01970', '0', '48"', '55lbs. ', NULL, NULL, NULL, '9788289995', '', 'amellomps@aol.com', '', '', NULL, NULL, '', 'Sarah ', 'Mello', 'Anne ', 'Mello ', '', ''),
(2010, 684, NULL, NULL, NULL, NULL, '1998-01-20 00:00:00', '19 East Collins St', 'Salem', 'MA', '01970', '0', '5''2', '95', NULL, NULL, NULL, '978-744-7863', '978-767-0607', 'nanfra1@verizon.net', 'nanfra1@verizon.net', '', NULL, NULL, '', 'Joseph', 'Curtin', 'Nancy', 'Curtin', 'Frank', 'Curtin'),
(2010, 685, NULL, NULL, NULL, NULL, '1996-10-16 00:00:00', '43 Railroad Ave', 'Beverly', 'MA', '01915', '7', '5', '127', NULL, NULL, NULL, '978-985-9121', '978-397-3585', 'leighton@leightonoconnor.com', '', '', NULL, NULL, '', 'Justin', 'OConnor', 'Leighton', 'O''Connor', 'Barbara', ' DiMambro'),
(2010, 686, NULL, NULL, NULL, NULL, '2001-10-02 00:00:00', '160 Bridge St. #1', 'Salem', 'MA', '01970', '3', '49 inches', '54 lbs.', NULL, NULL, NULL, '7815881263', '7815881266', 'sherylanncarolan@yahoo.com', 'paulcarolanjr@yahoo.com', '', NULL, NULL, '', 'Kayla', 'Carolan', 'Sheryl-Ann ', 'Carolan', 'Paul', 'Carolan JR'),
(2010, 687, NULL, NULL, NULL, NULL, '1999-05-15 00:00:00', '26 pickman st', 'Salem', 'MA', '01970', '5', '4''8''''', '75lbs', NULL, NULL, NULL, '978-394-4335', '', 'nldhassy@comcast.net', '', '', NULL, NULL, '', 'Nyona', 'Dukes', 'Nancy', 'Dukes', '', ''),
(2010, 688, NULL, NULL, NULL, NULL, '1994-05-24 00:00:00', '65 Sonning Road', 'Beverly', 'MA', '01915', '0', '5''10"', '135', NULL, NULL, NULL, '781-249-4608', '', 'lapierrediane@yahoo.com', '', '', NULL, NULL, '', 'Greg', 'LaPierre', 'Diane', 'LaPierre', 'Gary LaPierre', 'same as above'),
(2010, 689, NULL, NULL, NULL, NULL, '2000-01-12 00:00:00', '50 Winter Island Road', 'Salem', 'MA', '01970', '0', '', '', NULL, NULL, NULL, '978-744-5261', '', 'diswangai@gmail.com', '', '', NULL, NULL, '', 'Talon', 'Beer-Flanigin', 'Casey', 'Murphree', '', ''),
(2010, 690, NULL, NULL, NULL, NULL, '2000-09-04 00:00:00', '450 Asbury Street', 'Hamilton', 'MA', '01982', '5', '5''5', '92', NULL, NULL, NULL, '978-609-1611', '781-913-2616', 'pionardi@gmail.com', 'michal_Szydlowski@yahoo.com', '978-609-1611', NULL, NULL, '', 'Adrian', 'Florczyk', 'Lidia', 'Szydlowski', 'Michal', 'Szydlowski'),
(2010, 691, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '470 Asbury Street', 'Hamilton', 'MA', '01982', '5', '4''11"', '85', NULL, NULL, NULL, '978-578-6146', '781-760-1140', 'lauren1gold@gmail.com', '', '978-578-6146', NULL, NULL, '', 'Zachary', 'Willwerth', 'Lauren', 'Willwerth', 'Robert', 'Willwerth'),
(2010, 692, NULL, NULL, NULL, NULL, '1998-11-02 00:00:00', '56 Hobart Street', 'Salem', 'MA', '01970', '7', '5''6', '130', NULL, NULL, NULL, '508-423-2479', '', 'Kirsten.Peterson@lahey.org', '', '', NULL, NULL, '', 'Niko', 'Bazos', 'Kirsten ', 'Peterson', '', ''),
(2010, 693, NULL, NULL, NULL, NULL, '2002-06-08 00:00:00', '23 Crescent Drive', 'Salem', 'MA', '01970', '3', '4'' 6"', '80lbs.', NULL, NULL, NULL, '978-429-5842', '978-406-3896', 'jenn0273@msn.com', 'jenn0273@msn.com', '', NULL, NULL, '', 'Caitlin', 'Waters', 'Michael', 'Waters', 'Jennifer', 'Waters'),
(2010, 694, NULL, NULL, NULL, NULL, '2000-05-20 00:00:00', '6 Chestnut Street', 'Salem', 'MA', '01970', '5', '51"', '75 lbs', NULL, NULL, NULL, '978-397-8398', '857-204-8220', 'jb_mclean@comcast.net', 'jmclean43@gmail.com', '', NULL, NULL, '', 'Collin', 'McLean', 'Julie', 'McLean', 'Jim ', 'McLean'),
(2010, 695, NULL, NULL, NULL, NULL, '1997-12-06 00:00:00', '5 crescent drive', 'Salem', 'MA', '01970', '6', '4''10', '130', NULL, NULL, NULL, '9782104344', '', 'rlbsalem66@comcast.net', '', '', NULL, NULL, '', 'jared', 'brewster', 'renee', 'melendez', '', ''),
(2010, 696, NULL, NULL, NULL, NULL, '1996-09-16 00:00:00', '4 Dibiase Street', 'Salem', 'MA', '01970', '5', '54 approx', '70 ', NULL, NULL, NULL, '978-744-1888', '978-265-5737', 'a3ringcircus@comcast.net', 'a3ringcircus@comcas.net', '', NULL, NULL, '', 'Rachel', 'Luddy', 'Caroline', 'Luddy', 'Sean', 'Luddy'),
(2010, 697, NULL, NULL, NULL, NULL, '1996-09-16 00:00:00', '4 Dibiase Street', 'Salem', 'MA', '01970', '7', '5 feet app', '106', NULL, NULL, NULL, '978-744-1888', '978-265-5737', 'a3ringcircus@comcast.net', 'a3ringcircus@comcast.net', '', NULL, NULL, '', 'Patrick', 'Luddy', 'Caroline', 'Luddy', 'Sean', 'Luddy'),
(2010, 698, NULL, NULL, NULL, NULL, '2000-02-29 00:00:00', '90 lafayette st, #203', 'Salem', 'MA', '01970', '4', '53', '50', NULL, NULL, NULL, '9788100929', '', 'ekchocolate@comcast.net', '', '', NULL, NULL, '', 'Taizo', 'Simpson', 'Ejyo', 'Katagiri', '', ''),
(2010, 699, NULL, NULL, NULL, NULL, '1999-09-11 00:00:00', '19 Pond Street', 'Marblehead', 'MA', '01945', '4', '', '', NULL, NULL, NULL, '781-639-1949', '', 'pjjalbert@gmail.com', 'ljmarble@gmail.com', '', NULL, NULL, '', 'Oliver', 'Jalbert', 'Peter', 'Jalbert', 'Laura', 'Jalbert'),
(2010, 700, NULL, NULL, NULL, NULL, '2001-03-24 00:00:00', '19 Pond Street', 'Marblehead', 'MA', '01945', '3', '', '', NULL, NULL, NULL, '781-639-1949', '', 'pjjalbert@gmail.com', 'ljmarble@gmail.com', '', NULL, NULL, '', 'Henry', 'Jalbert', 'Peter', 'Jalbert', 'Laura', 'Jalbert'),
(2010, 701, NULL, NULL, NULL, NULL, '2000-07-03 00:00:00', '3 cambridge', 'Salem', 'MA', '01970', '3', '', '85 lb', NULL, NULL, NULL, '978 744 2958', '', 'm.cataldo@comcast.net', '', '', NULL, NULL, '', 'christopher', 'cataldo', 'maura', 'cataldo', 'walter ', 'cataldo'),
(2010, 702, NULL, NULL, NULL, NULL, '1998-10-22 00:00:00', '3 cambridge', 'Salem', 'MA', '01970', '5', '', '85', NULL, NULL, NULL, '9782397987', '', 'm.cataldo@comcast.net', '', '', NULL, NULL, '', 'john', 'cataldo', 'maura', 'cataldo', 'walter', 'cataldo'),
(2010, 703, NULL, NULL, NULL, NULL, '1999-05-17 00:00:00', '37 poplar st', 'Salem', 'MA', '01970', '5', '', '80', NULL, NULL, NULL, '9784732450', '', 'karenshannah@yahoo.com', '', '', NULL, NULL, '', 'cainan ', 'furlong', 'karen', 'beswick', '', ''),
(2010, 704, NULL, NULL, NULL, NULL, '2000-02-03 00:00:00', '72 Beaver St., Apt. #2', 'Salem', 'MA', '01970', '4', '4''6', '80', NULL, NULL, NULL, '978-578-3019', '575-313-5039', 'lynnembick@yahoo.com', '', '', NULL, NULL, '', 'Lizzy', 'Embick-Porter', 'Lynn ', 'Embick-Morris', 'Eric ', 'Morris'),
(2010, 705, NULL, NULL, NULL, NULL, '1997-02-21 00:00:00', '72 Beaver St., Apt. #2', 'Salem', 'MA', '01970', '7', '5''6', '100', NULL, NULL, NULL, '978-578-3019', '575-313-5039', 'lynnembick@yahoo.com', '', '', NULL, NULL, '', 'Dal', 'Embick', 'Lynn', 'Embick-Morris', 'Eric', 'Morris'),
(2010, 706, NULL, NULL, NULL, NULL, '1999-07-21 00:00:00', '42 Sable Road', 'Salem', 'MA', '01970', '5', '5 Feet', '70 pounds', NULL, NULL, NULL, '978-740-1353', '978-740-1353', 'Gigilaine77@comcast.net', 'Hotjob4me@comcast.net', '', NULL, NULL, '', 'Alyssa', 'Flynn', 'Gretchen', 'Flynn', 'Tim', 'Flynn'),
(2010, 707, NULL, NULL, NULL, NULL, '1997-06-19 00:00:00', '2 Raymond Circle', 'Peabody', 'MA', '01960', '8', '5''', '100', NULL, NULL, NULL, '617-345-5715', '', 'sironfield@btmucapital.com', '', '', NULL, NULL, '', 'Jake', 'Ironfield', 'Sandy', 'Ironfield', '', ''),
(2010, 708, NULL, NULL, NULL, NULL, '1996-11-27 00:00:00', '10 Ellsworth Road', 'Peabody', 'MA', '01970', '7', '4.10', '99', NULL, NULL, NULL, '978-531-0592', '617-660-1362', 'bsanford@salemstate.edu', '', '', NULL, NULL, '', 'Eric ', 'Sanford', 'Bonnie      Mother ', 'Sanford', 'Glenn ', 'Sanford'),
(2010, 709, NULL, NULL, NULL, NULL, '1995-01-24 00:00:00', '2 spinale', 'peabody', 'MA', '01960', '10', '5.3', '150', NULL, NULL, NULL, '978 223 0437', '', 'kosmiderdonna@yahoo.com', '', '', NULL, NULL, '', 'robert', 'oprzedek', 'donna', 'kosmider', 'wesley', 'oprzedek'),
(2010, 710, NULL, NULL, NULL, NULL, '1996-07-22 00:00:00', '2 spinale', 'peabody', 'MA', '01960', '9', '5.2', '102', NULL, NULL, NULL, '978 223 0437', '', 'kosmiderdonna@yahoo.com', '', '', NULL, NULL, '', 'erica', 'oprzedek', 'donna ', 'kosmider', 'wesley', 'oprzedek'),
(2010, 711, NULL, NULL, NULL, NULL, '1997-10-11 00:00:00', '2 spinale', 'peabody ', 'MA', '01960', '7', '4.11', '90', NULL, NULL, NULL, '978 223 0437', '', '', '', '', NULL, NULL, '', 'evelyn', 'oprzedek', 'donna', 'kosmider', 'wesley', 'oprzedek'),
(2010, 712, NULL, NULL, NULL, NULL, '2001-02-07 00:00:00', '3 School St Ct', 'Salem', 'MA', '01970', '3', '', '87 lbs', NULL, NULL, NULL, '978-210-5085', '978-210-9021', 'tweeca1@aol.com', 'paulthebulider@comcast.net', '', NULL, NULL, '', 'Madison', 'Suchecki', 'Lenity', 'El Dagany', 'Paul ', 'Suchecki'),
(2010, 713, NULL, NULL, NULL, NULL, '1993-11-21 00:00:00', '275 Richards  Road', 'Ridgewood', 'NJ', '07450', '10', '6''0', '160', NULL, NULL, NULL, '201-6815005', '201-344-3219', 'mwmarcus@marcusassoc.net', 'annalise@marcusassoc.net', '', NULL, NULL, '', 'Max', 'Marcus', 'Mitchell', 'Marcus', 'Annalise', 'Marcus'),
(2010, 714, NULL, NULL, NULL, NULL, '1997-04-14 00:00:00', '275 Richards Road', 'Ridgewood', 'NJ', '07450', '0', '5''2', '105', NULL, NULL, NULL, '201-681-5005', '201-344-3219', 'mwmarcus@marcusassoc.net', 'annalise@marcusassoc.net', '', NULL, NULL, '', 'Melissa', 'Marcus', 'mitchell', 'marcus', 'Annalise', 'Marcus'),
(2010, 715, NULL, NULL, NULL, NULL, '1993-02-03 00:00:00', '10 Fisher Road', 'Chelmsford', 'MA', '01824', '12', '5''4"', '105', NULL, NULL, NULL, '9782440633', '', 'huro1091@comcast.net', '', '', NULL, NULL, '', 'Leah', 'Folsom', 'Hugh', 'Folsom', '', ''),
(2010, 716, NULL, NULL, NULL, NULL, '1995-12-07 00:00:00', '17 Friend St', 'Beverly', 'MA', '01915', '0', '5'' 8"', '140', NULL, NULL, NULL, '978-729-8209 ', '978-921-4737', 'ljaquith@appleseeds.com', 'peterjaquith@comcast.net', '', NULL, NULL, '', 'Sarah', 'Jaquith', 'Lisa', 'Jaquith', 'Peter', 'Jaquith'),
(2010, 717, NULL, NULL, NULL, NULL, '1999-07-13 00:00:00', '43 valley st', 'Salem', 'MA', '01970', '6', '56"?', '115', NULL, NULL, NULL, '781-820-3385', '978-930-2322', 'phanford@myseafood.com', 'scotthanford@yahoo.com', '', NULL, NULL, '', 'jackson', 'Hanford', 'Patricia', 'Hanford', 'Scott ', 'hanford'),
(2010, 718, NULL, NULL, NULL, NULL, '1998-11-06 00:00:00', '12 Bedford Street', 'Salem', 'MA', '01970', '5', '4'' 10', '115', NULL, NULL, NULL, '781-789-1655  ', '781-789-0526 ', 'starionj@yahoo.com', 'kbbcs@comcast.com', '', NULL, NULL, '', 'Sarah', 'Starion', 'Jane', 'Starion', 'Kevin', 'Starion'),
(2010, 719, NULL, NULL, NULL, NULL, '1993-12-07 00:00:00', '55 Barstow St', 'Salem', 'MA', '01970', '11', '5"3', '110', NULL, NULL, NULL, '978 457 3541', '', 'eugenia_alvarez@msn.com', '', '', NULL, NULL, '', 'Maria Cristina', 'Del Valle', 'Eugenia ', 'Alvarez', '', ''),
(2010, 720, NULL, NULL, NULL, NULL, '1996-09-14 00:00:00', '17 Brook Street', 'Georgetown', 'MA', '01833', '8', '5''2', '110', NULL, NULL, NULL, '781-258-4392', '978-257-1805', 'lisa@harringtonspub.com', 'danieloneill6@comcast.net', '781-258-4392', NULL, NULL, '', 'Siobhan ', 'O''Neill', 'Lisa', 'O''Neill', 'Daniel', 'O''Neill'),
(2010, 721, NULL, NULL, NULL, NULL, '1998-04-07 00:00:00', '17 Brook Street', 'Georgetown', 'MA', '01970', '7', '5''2', '120', NULL, NULL, NULL, '781-258-4392', '978-257-1805', 'lisa@harringtonspub.com', 'danieloneill6@comcast.net', '781-258-4392', NULL, NULL, '', 'Shane', 'O''Neill', 'Lisa', 'O''Neill', 'Daniel', 'O''Neill'),
(2010, 722, NULL, NULL, NULL, NULL, '1998-05-13 00:00:00', '89 Ocean Ave', 'Salem', 'MA', '01970', '7', '4f 10in', '95', NULL, NULL, NULL, '9785006154', '', 'spinkham@comcast.net', '', '', NULL, NULL, '', 'Devin', 'Pinkham', 'Shannon', 'Pinkham', '', ''),
(2010, 723, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '7 Seemore St', 'Salem', 'MA', '01970', '7', '5''6', '175lbs', NULL, NULL, NULL, '978-745-9731', '978-423-3168', 'achicoine@comcast.net', '', '978-578-4149', NULL, NULL, '', 'John', 'Chicoine', 'Anna', 'Chicoine', 'Tim', 'Chicoine'),
(2010, 724, NULL, NULL, NULL, NULL, '2002-01-09 00:00:00', '3 Skerry Street', 'Salem', 'MA', '01970', '3', '', '80lb', NULL, NULL, NULL, '978-210-1081', '978-210-4123', 'gclark22002@comcast.net', '', '978-210-1081', NULL, NULL, '', 'Abigail', 'Clark', 'Gretchen', 'Clark', 'Cameron', 'Clark'),
(2010, 725, NULL, NULL, NULL, NULL, '1998-12-02 00:00:00', '3 Skerry Street', 'Salem', 'MA', '01970', '6', '', '130', NULL, NULL, NULL, '978-210-1081', '978-210-4123', 'gclark22002@comcast.net', '', '978-210-1081', NULL, NULL, '', 'Ian', 'Clark', 'Gretchen', 'Clark', 'Cameron', 'Clark'),
(2010, 726, NULL, NULL, NULL, NULL, '1997-06-09 00:00:00', '34 Old Planters Road', 'Beverly', 'MA', '01915', '7', '5''2', '110', NULL, NULL, NULL, '617-722-6229', '', 'jay@hussey.com', '', '650-787-3075', NULL, NULL, '', 'Sean', 'Hussey', 'Jay', 'Hussey', '', ''),
(2010, 727, NULL, NULL, NULL, NULL, '1998-03-20 00:00:00', '57 Appleton Street', 'Salem', 'MA', '01970', '6', '5''3"', '80', NULL, NULL, NULL, '978-741-4024', '978-741-4024', 'wesmart5@earlthlink.net', '', '508-566-5591', NULL, NULL, '', 'Leo', 'Smart', 'K.', '978-741-4024', 'Andrew', 'Smart'),
(2010, 728, NULL, NULL, NULL, NULL, '1998-03-20 00:00:00', '57 Appleton Street', 'Salem', 'MA', '01970', '6', '5''3"', '80', NULL, NULL, NULL, '978-741-4024', '978-741-4024', 'wesmart5@earthlink.net', '', '508-566-5591', NULL, NULL, '', 'Aaron', 'Smart', 'K', 'Smart', 'Andrew', 'Smart'),
(2010, 729, NULL, NULL, NULL, NULL, '1997-08-06 00:00:00', '4 Scenic Terrace', 'Salem', 'MA', '01970', '8', '5''2"', '103', NULL, NULL, NULL, '978-744-6519', '', 'john.jermyn@aexp.com', '', '978-744-6519', NULL, NULL, '', 'Cole', 'Jermyn', 'John', 'Jermyn', 'Cheryl', 'Jermyn'),
(2010, 730, NULL, NULL, NULL, NULL, '1997-05-02 00:00:00', '3 Heritage Drive #25', 'Salem', 'MA', '01970', '7', '5''', '110', NULL, NULL, NULL, '978-210-4608', '978-397-9409', 'mrodnewton25@yahoo.com', '', '781-913-0737', NULL, NULL, '', 'Dominic', 'Newton', 'Mishele', 'Newton', 'Arlen', 'Newton'),
(2010, 731, NULL, NULL, NULL, NULL, '1999-02-04 00:00:00', '19 Lincoln Road', 'Salem', 'MA', '01970', '6', '5''', '100', NULL, NULL, NULL, '978-741-7410', '978-395-5480', 'mdholtz@comcast.net', 'pbholtz@comcast.net', '978-395-5480', NULL, NULL, '', 'Madeleine', 'Holtz', 'Meghan', 'Holtz', 'Peter', 'Holtz'),
(2010, 732, NULL, NULL, NULL, NULL, '1996-08-31 00:00:00', '69 Butler Street', 'Salem', 'MA', '01970', '7', '5''9', '110', NULL, NULL, NULL, '978-745-3615', '', 'ekdkd@verizon.net', '', '978-745-3615', NULL, NULL, '', 'Daniel', 'Darmody', 'Ed', 'Darmody', '', ''),
(2010, 733, NULL, NULL, NULL, NULL, '2000-03-20 00:00:00', '69 Butler Street', 'Salem', 'MA', '01970', '4', '', '', NULL, NULL, NULL, '978-745-3615', '', 'ekdkd@verizon.net', '', '978-745-3615', NULL, NULL, '', 'Katherine', 'Darmody', 'Ed', 'Darmody', '', ''),
(2010, 734, NULL, NULL, NULL, NULL, '2001-05-05 00:00:00', '35 Northend Ave', 'Salem', 'MA', '01970', '3', '47', '80', NULL, NULL, NULL, '978-744-4142', '', 'danjennh@verizon.net', '', '339-440-6643', NULL, NULL, '', 'Leah', 'Harrigan', 'Jennifer', 'Harrigan', 'Daniel', 'Harrigan'),
(2010, 735, NULL, NULL, NULL, NULL, '2001-02-03 00:00:00', '460 Loring Avenue', 'Salem', 'MA', '01970', '3', '', '', NULL, NULL, NULL, '978-740-5662', '781-248-2335', 'emagic4@verizon.net', '', '781-254-0517', NULL, NULL, '', 'Emily', 'Maggiacomo', 'Elaine', 'Grant', 'Joseph', 'Tharton'),
(2010, 736, NULL, NULL, NULL, NULL, '1997-09-23 00:00:00', '460 Loring Avenue', 'Salem', 'MA', '01970', '6', '5''', '', NULL, NULL, NULL, '978-744-5662', '781-248-2335', 'emagic4@verizon.net', '', '781-254-0517', NULL, NULL, '', 'Meghan', 'Maggiacomo', 'Elaine', 'Grant', 'Joseph', 'Thornton'),
(2010, 737, NULL, NULL, NULL, NULL, '2000-01-01 00:00:00', '???', 'Salem', 'MA', '01970', '1', '1', '1', NULL, NULL, NULL, '978-999-9999', '', '', '', '999-999-9999', NULL, NULL, 'Need to get registration information from William', 'Wesoly', 'Hanger', 'William', 'Hanger', '', ''),
(2010, 738, NULL, NULL, NULL, NULL, '1998-01-26 00:00:00', '8 Cliff Street', 'Salem', 'MA', '01970', '6', '', '', NULL, NULL, NULL, '978-745-4396', '', 'cibeleaguiar@hotmail.com', '', '978-210-5070', NULL, NULL, 'Cibele''s primary language is Portugese', 'Fabricio', 'Aquiar', 'Cibele', 'Aguiar', '', ''),
(2010, 739, NULL, NULL, NULL, NULL, '1995-10-08 00:00:00', '6 summer street', 'marblehead', 'MA', '01945', '10', '5'' 7"', '135', NULL, NULL, NULL, '781-639-1720', '', 'kelliek1@aol.com', '', '', NULL, NULL, '', 'Andrew', 'Keenan', 'kellie', 'keenan', '', ''),
(2010, 740, NULL, NULL, NULL, NULL, '1997-09-23 00:00:00', '47 Clifton Avenue', 'Marblehead', 'MA', '01970', '8', '58', '85 pounds', NULL, NULL, NULL, '19785000524', '19785009868', 'lianeirons1@comcast.net', 'manueldarocha@comcast.net', '', NULL, NULL, '', 'Olivia', 'DaRocha', 'Liane', 'Irons', 'Manuel ', 'Darocha'),
(2010, 741, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '19 Greenlawn Ave.', 'Salem', 'MA', '01970', '8', '5''9"', '200 lbs.', NULL, NULL, NULL, '978-815-5240', '978-745-4868', 'huskydiver@aol.com', 'lkjpan@aol.com', '', NULL, NULL, '', 'Jaclyn', 'Panneton', 'Mike', 'Panneton', 'Lauri', 'Panneton'),
(2010, 742, NULL, NULL, NULL, NULL, '1995-04-25 00:00:00', '15 Winter Island Road ', 'Salem', 'MA', '01970', '9', '6''2"', '240', NULL, NULL, NULL, '978-745-0250', '', 'p.pauloshea@comcast.net', '', '', NULL, NULL, '', 'connor', 'o''Shea', 'Anne ', 'O''Shea', '', ''),
(2010, 743, NULL, NULL, NULL, NULL, '1997-02-19 00:00:00', '13 Appleton St.', 'Salem', 'MA', '01970', '7', '5''5''', '150LBS', NULL, NULL, NULL, '978-395-1079', '', 'kelleyphilbin@hotmail.com', '', '', NULL, NULL, '', 'Jonathan ', 'Philbin', 'Kelley', 'Philbin', '', ''),
(2010, 744, NULL, NULL, NULL, NULL, '1998-12-02 00:00:00', '14 Larchwood Street', 'N. Billerica', 'MA', '01862', '7', '5ft', '106 lbs', NULL, NULL, NULL, '978 6631755', '978-663-1755', 'amindar@wmconnect.com', 'amindar@wmconnect.com', '', NULL, NULL, '', 'Alexandra', 'Minasian', 'Arsen ', 'Minasian', 'Marina', 'Minasian'),
(2010, 745, NULL, NULL, NULL, NULL, '1996-05-24 00:00:00', '14 Larchwood Street', 'N. Billerica', 'MA', '01862', '9', '5'' 4"', '175', NULL, NULL, NULL, '978-663-1755', '978 663-1755', 'amindra@wmconnect.com', 'amindra@wmconnect.com', '', NULL, NULL, '', 'Rebecca', 'Minasian', 'Arsen', 'Minasian', 'Marina', 'Minasian'),
(2010, 746, NULL, NULL, NULL, NULL, '1994-04-25 00:00:00', '14 Larchwood Street', 'N. Billerica', 'MA', '01862', '11', '5'' 6', '161 lbs', NULL, NULL, NULL, '978-663-1755', '978-663-1755', 'amindra@wmconnect.com', 'amindra@wmconnect.com', '', NULL, NULL, '', 'Deanna ', 'Minasian', 'Arsen', 'Minasian', 'Marina ', 'Minasian'),
(2010, 747, NULL, NULL, NULL, NULL, '1997-02-03 00:00:00', '1 Sherwood Lane', 'Beverly', 'MA', '01915', '0', '57 inches', '88 lbs', NULL, NULL, NULL, '617-610-5029', '617-901-0739', 'jtremblay@partners.org', '', '', NULL, NULL, '', 'Michaela', 'Tremblay', 'Joanne', 'Tremblay', 'Mike', 'Tremblay'),
(2010, 748, NULL, NULL, NULL, NULL, '1969-12-31 00:00:00', '', '', '', '', '0', '', '', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, '', '', '', '', '', '', ''),
(2010, 749, NULL, NULL, NULL, NULL, '2012-02-12 00:00:00', '17 Brook Street', 'Georgetown', 'MA', '01833', '3', '4''8', '75', NULL, NULL, NULL, '781-258-4392', '978-257-1805', 'lisa@harringtonspub.com', 'danieloneill@comcas.net', '781-258-4392', NULL, NULL, 'Waitlist -- Prefers July 26 Afternoons', 'Conor', 'O''Neill', 'Lisa', 'O''Neill', 'Daniel', 'O''Neill'),
(2010, 750, NULL, NULL, NULL, NULL, '1999-10-03 00:00:00', '3 Lynn Street', 'Salem', 'MA', '01970', '4', '', '', NULL, NULL, NULL, '978-744-6004', '', 'patricia.roka@verizon.net', '', '', NULL, NULL, '', 'Luce', 'Brandt', 'Patti', 'Roka', '', ''),
(2010, 751, NULL, NULL, NULL, NULL, '2069-12-31 00:00:00', '3 Lynn Street', 'Salem', 'MA', '01970', '1111', '', '', NULL, NULL, NULL, '978-744-6004', '', 'patricia.roka@verizon.net', '', '', NULL, NULL, '', 'Eli', 'Brandt', 'Patti', 'Roka', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wh_sailingsession`
--

CREATE TABLE `wh_sailingsession` (
  `year` int(11) NOT NULL,
  `Session` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  UNIQUE KEY `U_Year_Session` (`Session`,`year`,`StartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wh_sailingsession`
--

INSERT INTO `wh_sailingsession` (`year`, `Session`, `StartDate`) VALUES
(2009, 'Aug 10 AM', '2009-08-10 09:00:00'),
(2009, 'Aug 10 AM MS/HS', '2009-08-10 09:00:00'),
(2009, 'Aug 10 PM', '2009-08-10 13:00:00'),
(2009, 'Aug 10 PM MS/HS', '2009-08-10 13:00:00'),
(2008, 'Aug 11 AM', '2008-08-11 00:00:00'),
(2008, 'Aug 11 PM', '2008-08-11 00:00:00'),
(2009, 'Aug 17 AM', '2009-08-17 09:00:00'),
(2009, 'Aug 17 AM MS/HS', '2009-08-17 09:00:00'),
(2009, 'Aug 17 PM', '2009-08-17 13:00:00'),
(2009, 'Aug 17 PM MS/HS', '2009-08-17 13:00:00'),
(2008, 'Aug 18 AM', '2008-08-18 00:00:00'),
(2008, 'Aug 18 PM', '2008-08-18 00:00:00'),
(2008, 'Aug 25 AM', '2008-08-25 00:00:00'),
(2008, 'Aug 25 PM', '2008-08-25 00:00:00'),
(2009, 'Aug 3 AM', '2009-08-03 09:00:00'),
(2009, 'Aug 3 AM MS/HS', '2009-08-03 09:00:00'),
(2009, 'Aug 3 PM', '2009-08-03 13:00:00'),
(2009, 'Aug 3 PM MS/HS', '2009-08-03 13:00:00'),
(2008, 'Aug 4 AM', '2008-08-04 00:00:00'),
(2008, 'Aug 4 PM', '2008-08-04 00:00:00'),
(2008, 'Jul 14 AM', '2008-07-14 00:00:00'),
(2008, 'Jul 14 PM', '2008-07-14 00:00:00'),
(2008, 'Jul 21 AM', '2008-07-21 00:00:00'),
(2008, 'Jul 21 PM', '2008-07-21 00:00:00'),
(2008, 'Jul 28 AM', '2008-07-28 00:00:00'),
(2008, 'Jul 28 PM', '2008-07-28 00:00:00'),
(2008, 'Jul 7 AM', '2008-07-07 00:00:00'),
(2008, 'Jul 7 PM', '2008-07-07 00:00:00'),
(2009, 'July 13 AM', '2009-07-13 09:00:00'),
(2009, 'July 13 AM MS/HS', '2009-07-13 09:00:00'),
(2009, 'July 13 PM', '2009-07-13 13:00:00'),
(2009, 'July 13 PM MS/HS', '2009-07-13 13:00:00'),
(2009, 'July 20 AM', '2009-07-20 09:00:00'),
(2009, 'July 20 AM MS/HS', '2009-07-20 09:00:00'),
(2009, 'July 20 PM', '2009-07-20 13:00:00'),
(2009, 'July 20 PM MS/HS', '2009-07-20 13:00:00'),
(2009, 'July 27 AM', '2009-07-27 09:00:00'),
(2009, 'July 27 AM MS/HS', '2009-07-27 09:00:00'),
(2009, 'July 27 PM', '2009-07-27 13:00:00'),
(2009, 'July 27 PM MS/HS', '2009-07-27 13:00:00'),
(2009, 'July 6 AM', '2009-07-06 09:00:00'),
(2009, 'July 6 AM MS/HS', '2009-07-06 09:00:00'),
(2009, 'July 6 PM', '2009-07-06 13:00:00'),
(2009, 'July 6 PM MS/HS', '2009-07-06 13:00:00'),
(2009, 'Jun 22 AM', '2009-06-22 09:00:00'),
(2009, 'Jun 22 PM', '2009-06-22 13:00:00'),
(2008, 'Jun 23 AM', '2008-06-23 00:00:00'),
(2008, 'Jun 23 PM', '2008-06-23 00:00:00'),
(2009, 'Jun 29 AM', '2009-06-29 09:00:00'),
(2009, 'Jun 29 PM', '2009-06-29 13:00:00'),
(2008, 'Jun 30 AM', '2008-06-30 00:00:00'),
(2008, 'Jun 30 PM', '2008-06-30 00:00:00'),
(2009, 'Jun 8 AM', '2009-06-08 09:00:00'),
(2009, 'Jun 8 PM', '2009-06-08 13:00:00'),
(2009, 'June 29 AM MS/HS', '2009-06-29 09:00:00'),
(2009, 'June 29 PM MS/HS', '2009-06-29 13:00:00'),
(2010, 'Junior Keelboat', '2010-06-28 09:00:00'),
(2010, 'Junior Keelboat', '2010-06-28 13:00:00'),
(2010, 'Junior Keelboat', '2010-07-05 09:00:00'),
(2010, 'Junior Keelboat', '2010-07-05 13:00:00'),
(2010, 'Junior Keelboat', '2010-07-12 09:00:00'),
(2010, 'Junior Keelboat', '2010-07-12 13:00:00'),
(2010, 'Junior Keelboat', '2010-07-19 09:00:00'),
(2010, 'Junior Keelboat', '2010-07-19 13:00:00'),
(2010, 'Junior Keelboat', '2010-07-26 09:00:00'),
(2010, 'Junior Keelboat', '2010-07-26 13:00:00'),
(2010, 'Junior Keelboat', '2010-08-02 09:00:00'),
(2010, 'Junior Keelboat', '2010-08-02 13:00:00'),
(2010, 'Junior Keelboat', '2010-08-09 09:00:00'),
(2010, 'Junior Keelboat', '2010-08-09 13:00:00'),
(2010, 'Junior Keelboat', '2010-08-16 09:00:00'),
(2010, 'Junior Keelboat', '2010-08-16 13:00:00'),
(2011, 'Junior Keelboat', '2011-07-05 09:00:00'),
(2011, 'Junior Keelboat', '2011-07-05 13:00:00'),
(2011, 'Junior Keelboat', '2011-07-11 09:00:00'),
(2011, 'Junior Keelboat', '2011-07-11 13:00:00'),
(2011, 'Junior Keelboat', '2011-07-18 09:00:00'),
(2011, 'Junior Keelboat', '2011-07-18 13:00:00'),
(2011, 'Junior Keelboat', '2011-07-25 09:00:00'),
(2011, 'Junior Keelboat', '2011-07-25 13:00:00'),
(2011, 'Junior Keelboat', '2011-08-01 09:00:00'),
(2011, 'Junior Keelboat', '2011-08-01 13:00:00'),
(2011, 'Junior Keelboat', '2011-08-08 09:00:00'),
(2011, 'Junior Keelboat', '2011-08-08 13:00:00'),
(2011, 'Junior Keelboat', '2011-08-15 09:00:00'),
(2011, 'Junior Keelboat', '2011-08-15 13:00:00'),
(2010, 'Opti', '2010-06-28 09:00:00'),
(2010, 'Opti', '2010-06-28 13:00:00'),
(2010, 'Opti', '2010-07-05 09:00:00'),
(2010, 'Opti', '2010-07-05 13:00:00'),
(2010, 'Opti', '2010-07-12 09:00:00'),
(2010, 'Opti', '2010-07-12 13:00:00'),
(2010, 'Opti', '2010-07-19 09:00:00'),
(2010, 'Opti', '2010-07-19 13:00:00'),
(2010, 'Opti', '2010-07-26 09:00:00'),
(2010, 'Opti', '2010-07-26 13:00:00'),
(2010, 'Opti', '2010-08-02 09:00:00'),
(2010, 'Opti', '2010-08-02 13:00:00'),
(2010, 'Opti', '2010-08-09 09:00:00'),
(2010, 'Opti', '2010-08-09 13:00:00'),
(2010, 'Opti', '2010-08-16 09:00:00'),
(2010, 'Opti', '2010-08-16 13:00:00'),
(2011, 'Opti', '2011-07-05 09:00:00'),
(2011, 'Opti', '2011-07-05 13:00:00'),
(2011, 'Opti', '2011-07-11 09:00:00'),
(2011, 'Opti', '2011-07-11 13:00:00'),
(2011, 'Opti', '2011-07-18 09:00:00'),
(2011, 'Opti', '2011-07-18 13:00:00'),
(2011, 'Opti', '2011-07-25 09:00:00'),
(2011, 'Opti', '2011-07-25 13:00:00'),
(2011, 'Opti', '2011-08-01 09:00:00'),
(2011, 'Opti', '2011-08-01 13:00:00'),
(2011, 'Opti', '2011-08-08 09:00:00'),
(2011, 'Opti', '2011-08-08 13:00:00'),
(2011, 'Opti', '2011-08-15 09:00:00'),
(2011, 'Opti', '2011-08-15 13:00:00');

-- --------------------------------------------------------

--
-- Structure for view `email_list`
--
DROP TABLE IF EXISTS `email_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `email_list` AS select `students`.`email1` AS `email1` from `students` union select `students`.`email2` AS `email2` from `students`;

-- --------------------------------------------------------

--
-- Structure for view `session_detail`
--
DROP TABLE IF EXISTS `session_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session_detail` AS select `A`.`id_sailing_program` AS `id_sailing_program`,`B`.`id_sailing_session` AS `id_sailing_session`,`A`.`class_name` AS `class_name`,`A`.`class_description` AS `class_description`,monthname(`B`.`start_date`) AS `month_name`,dayofmonth(`B`.`start_date`) AS `day_name`,(case when (`A`.`full_day` = 1) then '9:30am to 3:30pm' when (hour(`B`.`start_date`) = 9) then '9am to noon' when (hour(`B`.`start_date`) = 13) then '1pm to 4pm' end) AS `time_of_day`,`B`.`student_limit` AS `student_limit`,`C`.`count_student` AS `count_student`,(`B`.`student_limit` - `C`.`count_student`) AS `spaces_left`,`B`.`start_date` AS `start_date` from ((`sailing_program` `A` left join `sailing_session` `B` on((`A`.`id_sailing_program` = `B`.`id_sailing_program`))) left join `session_registration_count` `C` on((`B`.`id_sailing_session` = `C`.`id_sailing_session`)));

-- --------------------------------------------------------

--
-- Structure for view `session_registration_count`
--
DROP TABLE IF EXISTS `session_registration_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session_registration_count` AS select `A`.`id_sailing_session` AS `id_sailing_session`,count(`B`.`id_student`) AS `count_student` from (`sailing_session` `A` left join `session_students` `B` on((`A`.`id_sailing_session` = `B`.`id_sailing_session`))) group by `A`.`id_sailing_session`;

-- --------------------------------------------------------

--
-- Structure for view `student_detail`
--
DROP TABLE IF EXISTS `student_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_detail` AS select `A`.`paid` AS `paid`,`A`.`first_name` AS `first_name`,`A`.`last_name` AS `last_name`,cast(`A`.`birth_date` as date) AS `birth_date`,((date_format(now(),_utf8'%Y') - date_format(`A`.`birth_date`,_utf8'%Y')) - (date_format(now(),_utf8'00-%m-%d') < date_format(`A`.`birth_date`,_utf8'00-%m-%d'))) AS `age`,`A`.`school_grade` AS `school_grade`,`C`.`class_name` AS `class_name`,`C`.`spaces_left` AS `spaces_left`,cast(`C`.`start_date` as date) AS `start_date`,`A`.`email1` AS `email1`,`A`.`guardian_one_first_name` AS `parent first name`,`A`.`guardian_one_last_name` AS `parent last name`,`A`.`id_student` AS `id_student` from ((`students` `A` left join `session_students` `B` on((`A`.`id_student` = `B`.`id_student`))) left join `session_detail` `C` on((`B`.`id_sailing_session` = `C`.`id_sailing_session`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
