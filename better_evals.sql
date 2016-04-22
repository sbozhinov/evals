-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 11:07 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `better_evals`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `name`, `email`, `super`) VALUES
('cbean', 'Connie Bean', 'cbean@ewu.edu', 0),
('elisep', 'Elise Peterson', 'elise@peter.sone', 0),
('jlamphere', 'James Lamphere', 'jlamphere@ewu.edu', 0),
('lwenke', 'Lenna Wenke', 'lenna.wenke@eagles.ewu.edu', 0),
('mstanzak', 'Margo Stanzak', 'mstanzak@ewu.edu', 1),
('oijoijaa', 'Bill Nyer', 'aoij@oij.com', 0),
('Pschimpf', 'Paul Schimpf', 'pschimpf@ewu.edu', 0),
('rfencl', 'Regan Fencing', 'reganfencl@eagles.ewu.edu', 0),
('sbozhinov', 'Stanislav Bozhinov', 'sbozhinov@msn.com', 0),
('shoerner', 'Stephen Hoerner', 'gupocca@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `sub_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `answer` int(11) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`sub_id`,`q_id`),
  KEY `q_id` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`sub_id`, `q_id`, `answer`, `comments`) VALUES
(1, 1, 5, ''),
(1, 2, 2, 'There was no real content, per se.'),
(1, 3, 5, ''),
(1, 4, 3, ''),
(2, 1, 3, 'Fusce id convallis orci. Cras rhoncus pharetra arcu, interdum suscipit nibh ullamcorper rhoncus. Integer bibendum dolor eget iaculis tempor. Nam auctor erat ut leo egestas, ac venenatis odio efficitur. Quisque accumsan quam diam, eget iaculis massa pharetr'),
(2, 2, 4, ''),
(2, 3, 3, ''),
(2, 4, 3, ''),
(3, 1, 5, 'one comment'),
(3, 2, 4, 'two comments'),
(3, 3, 3, 'a third comment'),
(3, 4, 2, 'another comment or two'),
(3, 7, 1, 'another annoying comment. `~!@#$%^&*()_+-=[]\\;'':"{}|<>?,./'),
(4, 1, 5, 'TESTIN'),
(4, 2, 5, 'TESTIN'),
(4, 3, 5, 'TESTIN'),
(4, 4, 5, '../../../'),
(5, 1, NULL, NULL),
(5, 2, NULL, NULL),
(5, 3, 5, NULL),
(5, 4, NULL, NULL),
(6, 1, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, 'yay'),
(6, 4, NULL, NULL),
(6, 7, NULL, NULL),
(7, 1, 2, NULL),
(7, 2, 3, NULL),
(7, 3, NULL, NULL),
(7, 4, 1, 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `course_question`
--

CREATE TABLE IF NOT EXISTS `course_question` (
  `section_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`,`q_id`),
  KEY `q_id` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_question`
--

INSERT INTO `course_question` (`section_id`, `q_id`) VALUES
(1, 7),
(114, 13),
(48, 30),
(113, 30),
(114, 30),
(115, 30),
(115, 32),
(113, 35),
(114, 35),
(113, 36),
(114, 36),
(116, 36);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `inst_id_hashed` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`inst_id_hashed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`inst_id_hashed`, `last_name`, `first_name`, `email`) VALUES
('01a35194531f77be8b0b8efe6d06aa46', 'Schimpf', 'Paul', NULL),
('088d7a9ad06a03be3a1c1f2e979f83ff', 'Clark', 'Robert', NULL),
('0ba274c73962e7a85fd87a45f91d4356', 'Pauley', 'Joseph', NULL),
('17e4c97b9ee93046eb0c56168dd61e0b', 'Reineman', 'Jeremy', NULL),
('19568f7034bb0406137331b8b2670c16', 'Anderson', 'Olin', ''),
('1b1116ba630fa3f84a4d2ec871e2a482_', 'Hoerner', 'Stephen', NULL),
('252fa4b84987f324a356167dfed83a6e', 'Kakoczky', 'Steven', NULL),
('316e906f83d62efbedce1103cb84d976', 'Murphy', 'Daniel', NULL),
('32a161eda2ad3e2571d01117329fa80c', 'Stokes', 'Daniel', NULL),
('3742884015d511962a5be4ec31231a1a', 'Canfield', 'Andrew', NULL),
('3c5b8856ad1a2ef10a74fd0e7ee408bc', 'Chatellier', 'Nathan', NULL),
('3f360fd2a30edf679d217c54026b9347', 'Lemelin', 'Robert', NULL),
('5635d36828c12b177ba3aea2738cdf69', 'Sipes', 'Richard', NULL),
('5d0202520f4dc6e510a0ef2aec56d5c7', 'Shields', 'Peter', ''),
('670af5e3534906f2f850bb50f33d8f0a', 'Nielsen', 'Eric', NULL),
('7574ec0279bdd6e9dddc9c9a1c8b6da0', 'Xu', 'Bojian', NULL),
('777cd020f9a1450ac7ef0414d7389cce', 'Kamp', 'Brian', NULL),
('7bf8519d61df246a474de43dc4a622f2', 'Peters', 'Chris', NULL),
('850063a0ac039f189da47d4dc6e50493', 'Smith', 'Adam', NULL),
('8a7c4b79f10669a1927d4b2bae41c864', 'Inoue', 'Atsushi', NULL),
('993c78edf0d44a75a4362ccbb4b34178', 'Tian', 'Yun', NULL),
('9abcc119f43f51784aab6ee2e4a8499d', 'Lefave', 'Nicholas', NULL),
('9b495250254dd487d42a5ea25238f71d', 'Pickett', 'Rickie', NULL),
('a010cf30f0d09c3192430e74e0af6bd9', 'Li', 'Dan', NULL),
('a71a277c9a95d029e68184fda1bfe06f', 'Robertson', 'Benjamin', NULL),
('b6b5f9b4571cf110fb4f4475a078559f', 'Rolfe', 'Timothy', NULL),
('b72e873c8b767fdb1e787678f52f7001', 'Hogan', 'Edward', NULL),
('b7314d556d11031959abc251a1d1eca8', 'Steiner', 'Stuart', NULL),
('bab0ee2f2c7a574ce9bbf43872a5699c', 'Cromwell', 'Brett', NULL),
('c17fdc557b8f677e30c5984127720349', 'Englin', 'Riley', NULL),
('c7eec92ea3bb024db28e9c0a5b4df566', 'Capaul', 'Thomas', NULL),
('cddd685c839535af5213a06701f59249', 'Stokes', 'Mitchell', NULL),
('cf7af95a100ff01dc70f16a536e61533', 'Simmons', 'Steven', NULL),
('d1a9b4983486c6595e8a036cf57f0127', 'Pearson', 'James', NULL),
('d2e7b89b14a5f83f2c4050a5467ff50b', 'Herve', 'Daniel', NULL),
('d3cf0605426ae1b53386d40b2b9fb937', 'Bondo', 'R', NULL),
('d8591e04de9c010e1a47939d4d17c0f4', 'Taylor', 'Carol', NULL),
('daa13b178dd81b68117aa4c6692ad900', 'Almohanna', 'Sumayah', 'sumayah.almohanna@eagles.ewu.edu'),
('dd4b21e9ef71e1291183a46b913ae6f2', 'TBA', 'TBA', NULL),
('e0fffeecdb4a7371928f682880dac309', 'Imamura', 'Kosuke', NULL),
('ec939b43615146c41a0e909abd04a9b8', 'Pfleegor', 'Isaac', ''),
('f0ed72e799fefcb90ab0011b44ce1370', 'Fencl', 'Regan', NULL),
('fe99b3ccfc2c7e099788257ce4e04b49', 'Tappan', 'Dan', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `q_type` int(4) NOT NULL,
  `creator_type` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `instructor` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`q_id`),
  KEY `instructor` (`instructor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`q_id`, `archived`, `q_type`, `creator_type`, `description`, `instructor`) VALUES
(1, 1, 0, 'admin', 'The course as a whole was', NULL),
(2, 1, 0, 'admin', 'The course content was', NULL),
(3, 1, 0, 'admin', 'The instructor''s contribution to the course was', NULL),
(4, 1, 0, 'admin', 'The instructor''s effectiveness in teaching the subject matter was', NULL),
(5, 1, 1, 'admin', 'The available projects were', NULL),
(6, 1, 1, 'admin', 'The available projects to choose from were', NULL),
(7, 1, 1, 'admin', 'The projects available to choose from were', NULL),
(13, 0, 3, 'admin', 'The projects available to choose from wer', NULL),
(30, 0, 1, 'admin', 'Sample question', NULL),
(32, 0, 2, 'admin', 'aadfasd', NULL),
(35, 0, 1, 'admin', 'sdfsdf', NULL),
(36, 0, 3, 'admin', 'Hiiii', NULL),
(39, 0, 0, 'admin', 'The instructor''s contribution to the course was a', NULL),
(40, 0, 0, 'admin', 'The instructor''s effectiveness in teaching the subject matter was', NULL),
(41, 0, 0, 'admin', 'The course as a whole was a', NULL),
(43, 0, 0, 'admin', 'The course content was', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_subject` varchar(4) NOT NULL,
  `course_num` int(11) NOT NULL,
  `course_section` int(4) NOT NULL,
  `term` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `instructor` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `eval_start` date NOT NULL,
  `eval_end` date NOT NULL,
  `student_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`),
  KEY `instructor` (`instructor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=128 ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `course_subject`, `course_num`, `course_section`, `term`, `title`, `instructor`, `start_date`, `end_date`, `eval_start`, `eval_end`, `student_count`) VALUES
(0, 'CPLA', 120, 1, 20, 'COMPUTER APPLICATIONS LITERACY', '19568f7034bb0406137331b8b2670c16', '2015-03-30', '2015-06-12', '2015-05-24', '2015-06-12', 52),
(1, 'CSCD', 488, 1, 10, 'SENIOR PROJECT', 'c7eec92ea3bb024db28e9c0a5b4df566', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 52),
(12, 'CSCD', 260, 1, 10, 'ARCHITECTURE & ORGANIZATION', 'e0fffeecdb4a7371928f682880dac309', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 31),
(17, 'CPLA', 100, 2, 10, 'COMPUTER LITERACY I', 'd3cf0605426ae1b53386d40b2b9fb937', '2015-01-05', '2015-02-06', '2015-01-29', '2015-02-06', 20),
(18, 'CPLA', 100, 3, 10, 'COMPUTER LITERACY I', '3f360fd2a30edf679d217c54026b9347', '2015-01-05', '2015-02-06', '2015-01-29', '2015-02-06', 18),
(19, 'CPLA', 100, 4, 10, 'COMPUTER LITERACY I', 'd2e7b89b14a5f83f2c4050a5467ff50b', '2015-01-05', '2015-02-06', '2015-01-29', '2015-02-06', 20),
(20, 'CPLA', 100, 10, 10, 'COMPUTER LITERACY I', '3f360fd2a30edf679d217c54026b9347', '2015-01-05', '2015-02-06', '2015-01-29', '2015-02-06', 19),
(21, 'CPLA', 101, 1, 10, 'COMPUTER LITERACY II', 'd2e7b89b14a5f83f2c4050a5467ff50b', '2015-02-09', '2015-03-20', '2015-03-10', '2015-03-20', 18),
(22, 'CPLA', 101, 2, 10, 'COMPUTER LITERACY II', '3f360fd2a30edf679d217c54026b9347', '2015-02-09', '2015-03-20', '2015-03-10', '2015-03-20', 21),
(23, 'CPLA', 101, 3, 10, 'COMPUTER LITERACY II', '3f360fd2a30edf679d217c54026b9347', '2015-02-09', '2015-03-20', '2015-03-10', '2015-03-20', 24),
(24, 'CPLA', 101, 4, 10, 'COMPUTER LITERACY II', 'd2e7b89b14a5f83f2c4050a5467ff50b', '2015-02-09', '2015-03-20', '2015-03-10', '2015-03-20', 17),
(25, 'CPLA', 101, 10, 10, 'COMPUTER LITERACY II', '3f360fd2a30edf679d217c54026b9347', '2015-02-09', '2015-03-20', '2015-03-10', '2015-03-20', 23),
(27, 'CPLA', 120, 2, 10, 'COMPUTER APPLICATIONS LITERACY', '9b495250254dd487d42a5ea25238f71d', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 57),
(28, 'CPLA', 120, 4, 10, 'COMPUTER APPLICATIONS LITERACY', '9b495250254dd487d42a5ea25238f71d', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 54),
(29, 'CPLA', 120, 5, 10, 'COMPUTER APPLICATIONS LITERACY', '5635d36828c12b177ba3aea2738cdf69', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 54),
(30, 'CPLA', 120, 6, 10, 'COMPUTER APPLICATIONS LITERACY', '17e4c97b9ee93046eb0c56168dd61e0b', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 40),
(31, 'CPLA', 120, 8, 10, 'COMPUTER APPLICATIONS LITERACY', 'ec939b43615146c41a0e909abd04a9b8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 52),
(32, 'CPLA', 120, 9, 10, 'COMPUTER APPLICATIONS LITERACY', '670af5e3534906f2f850bb50f33d8f0a', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 55),
(33, 'CPLA', 120, 10, 10, 'COMPUTER APPLICATIONS LITERACY', '9b495250254dd487d42a5ea25238f71d', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 54),
(34, 'CPLA', 120, 12, 10, 'COMPUTER APPLICATIONS LITERACY', 'c17fdc557b8f677e30c5984127720349', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 52),
(35, 'CPLA', 120, 14, 10, 'COMPUTER APPLICATIONS LITERACY', '316e906f83d62efbedce1103cb84d976', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 49),
(36, 'CPLA', 120, 45, 10, 'COMPUTER APPLICATIONS LITERACY', 'bab0ee2f2c7a574ce9bbf43872a5699c', '2015-01-05', '2015-06-12', '2015-05-03', '2015-06-12', 0),
(37, 'CPLA', 199, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(38, 'CPLA', 199, 1, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(39, 'CPLA', 215, 1, 10, 'INTERNET & WWW BASICS', '3f360fd2a30edf679d217c54026b9347', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 6),
(40, 'CPLA', 299, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(41, 'CPLA', 299, 1, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(42, 'CPLA', 399, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(43, 'CPLA', 399, 1, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(44, 'CPLA', 499, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(45, 'CPLA', 499, 1, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(46, 'CSCD', 110, 1, 10, 'INTRODUCTION TO PROGRAMMING', '3f360fd2a30edf679d217c54026b9347', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 36),
(47, 'CSCD', 110, 2, 10, 'INTRODUCTION TO PROGRAMMING', '777cd020f9a1450ac7ef0414d7389cce', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 37),
(48, 'CSCD', 110, 80, 10, 'INTRODUCTION TO PROGRAMMING', '850063a0ac039f189da47d4dc6e50493', '2015-01-05', '2015-06-12', '2015-05-03', '2015-06-12', 20),
(49, 'CSCD', 199, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(50, 'CSCD', 210, 1, 10, 'PROGRAMMING PRINCIPLES I', '7bf8519d61df246a474de43dc4a622f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 35),
(51, 'CSCD', 210, 2, 10, 'PROGRAMMING PRINCIPLES I', '7bf8519d61df246a474de43dc4a622f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 38),
(52, 'CSCD', 211, 1, 10, 'PROGRAMMING PRINCIPLES II', 'b7314d556d11031959abc251a1d1eca8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 47),
(53, 'CSCD', 240, 1, 10, 'C AND UNIX PROGRAMMING', '993c78edf0d44a75a4362ccbb4b34178', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 37),
(54, 'CSCD', 255, 1, 10, 'C PROGRAMMING FOR ENGINEERS', 'b6b5f9b4571cf110fb4f4475a078559f', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 30),
(55, 'CSCD', 299, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(56, 'CSCD', 300, 1, 10, 'DATA STRUCTURES', '7574ec0279bdd6e9dddc9c9a1c8b6da0', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 40),
(57, 'CSCD', 320, 1, 10, 'ALGORITHMS', '7574ec0279bdd6e9dddc9c9a1c8b6da0', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 30),
(58, 'CSCD', 327, 1, 10, 'RELATIONAL DATABASE SYSTEMS', '7bf8519d61df246a474de43dc4a622f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 36),
(59, 'CSCD', 330, 1, 10, 'COMPUTER NETWORKS', 'd8591e04de9c010e1a47939d4d17c0f4', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 28),
(60, 'CSCD', 340, 1, 10, 'OPERATING SYSTEMS', 'b7314d556d11031959abc251a1d1eca8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 33),
(61, 'CSCD', 349, 1, 10, 'DESIGN PATTERNS', 'c7eec92ea3bb024db28e9c0a5b4df566', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 55),
(62, 'CSCD', 350, 1, 10, 'SOFTWARE ENGINEERING', 'fe99b3ccfc2c7e099788257ce4e04b49', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 14),
(63, 'CSCD', 371, 1, 10, '.NET PROGRAMMING', 'c7eec92ea3bb024db28e9c0a5b4df566', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 47),
(64, 'CSCD', 395, 0, 10, 'INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(65, 'CSCD', 399, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(66, 'CSCD', 399, 1, 10, 'DIRECTED STUDY', 'd8591e04de9c010e1a47939d4d17c0f4', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(67, 'CSCD', 416, 1, 10, '3D MODELING AND ANIMATION II', '777cd020f9a1450ac7ef0414d7389cce', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 23),
(68, 'CSCD', 429, 1, 10, 'DATA MINING', 'a010cf30f0d09c3192430e74e0af6bd9', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 30),
(69, 'CSCD', 461, 1, 10, 'EMBEDDED SYSTEMS', 'e0fffeecdb4a7371928f682880dac309', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 13),
(70, 'CSCD', 467, 77, 10, 'CONCURRENT SYSTEMS', '993c78edf0d44a75a4362ccbb4b34178', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 22),
(71, 'CSCD', 474, 1, 10, 'COMPUTER GAMES DEVELOPMENT', '3c5b8856ad1a2ef10a74fd0e7ee408bc', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 13),
(72, 'CSCD', 490, 1, 10, 'SENIOR CAPSTONE', 'fe99b3ccfc2c7e099788257ce4e04b49', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 25),
(73, 'CSCD', 495, 0, 10, 'INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(74, 'CSCD', 495, 1, 10, 'INTERNSHIP', 'b7314d556d11031959abc251a1d1eca8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 6),
(75, 'CSCD', 495, 2, 10, 'INTERNSHIP', 'd8591e04de9c010e1a47939d4d17c0f4', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(76, 'CSCD', 495, 21, 10, 'INTERNSHIP', 'b7314d556d11031959abc251a1d1eca8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 2),
(77, 'CSCD', 499, 0, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(78, 'CSCD', 499, 1, 10, 'DS/WEB APPLICATION DEVELOPMENT', '777cd020f9a1450ac7ef0414d7389cce', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(79, 'CSCD', 499, 2, 10, 'DS/ADV''D 3D GRAPHICS PROGRAMMI', '088d7a9ad06a03be3a1c1f2e979f83ff', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 2),
(80, 'CSCD', 499, 3, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(81, 'CSCD', 499, 4, 10, 'DIRECTED STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(82, 'CSCD', 506, 1, 10, 'RESEARCH METHODS IN CS', 'b7314d556d11031959abc251a1d1eca8', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 12),
(83, 'CSCD', 525, 1, 10, 'ADV DATABASE MGMT SYSTEMS', 'a010cf30f0d09c3192430e74e0af6bd9', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 17),
(84, 'CSCD', 567, 77, 10, 'CONCURRENT SYSTEMS', '993c78edf0d44a75a4362ccbb4b34178', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 2),
(85, 'CSCD', 595, 0, 10, 'PROF INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(86, 'CSCD', 595, 1, 10, 'PROF INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(87, 'CSCD', 595, 2, 10, 'PROF INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(88, 'CSCD', 599, 0, 10, 'INDEPENDENT STUDY', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(89, 'CSCD', 599, 1, 10, 'DS/ADVANCED 3D GRAPHICS', '088d7a9ad06a03be3a1c1f2e979f83ff', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(90, 'CSCD', 599, 2, 10, 'DS/MEDIA LAW & REGULATION', '5d0202520f4dc6e510a0ef2aec56d5c7', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(91, 'CSCD', 599, 3, 10, 'IS/MED APP SECURITY RESEARCH', 'a010cf30f0d09c3192430e74e0af6bd9', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(92, 'CSCD', 599, 4, 10, 'IS/SPATIO-TEMPORAL DATABASE', '993c78edf0d44a75a4362ccbb4b34178', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 3),
(93, 'CSCD', 600, 0, 10, 'THESIS', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(94, 'CSCD', 600, 1, 10, 'THESIS', '993c78edf0d44a75a4362ccbb4b34178', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(95, 'CSCD', 600, 2, 10, 'THESIS', 'a010cf30f0d09c3192430e74e0af6bd9', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 3),
(96, 'CSCD', 600, 3, 10, 'THESIS', 'd8591e04de9c010e1a47939d4d17c0f4', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 6),
(97, 'CSCD', 600, 4, 10, 'THESIS', 'fe99b3ccfc2c7e099788257ce4e04b49', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(98, 'CSCD', 601, 0, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(99, 'CSCD', 601, 1, 10, 'RESEARCH REPORT', 'fe99b3ccfc2c7e099788257ce4e04b49', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(100, 'CSCD', 601, 2, 10, 'RESEARCH REPORT', 'a010cf30f0d09c3192430e74e0af6bd9', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 1),
(101, 'CSCD', 601, 3, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(102, 'CSCD', 601, 4, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(103, 'CSCD', 601, 5, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(104, 'CSCD', 601, 6, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(105, 'CSCD', 601, 7, 10, 'RESEARCH REPORT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(106, 'CSCD', 602, 1, 10, 'INDUSTRY PROJECT', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(107, 'CSCD', 695, 0, 10, 'DEPARTMENTAL INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(108, 'CSCD', 695, 1, 10, 'DEPARTMENTAL INTERNSHIP', '01a35194531f77be8b0b8efe6d06aa46', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 0),
(109, 'CSCD', 695, 2, 10, 'DEPARTMENTAL INTERNSHIP', 'd8591e04de9c010e1a47939d4d17c0f4', '2015-01-05', '2015-03-20', '2015-03-01', '2015-03-20', 3),
(110, 'CSCD', 495, 0, 20, 'INTERNSHIP', 'dd4b21e9ef71e1291183a46b913ae6f2', '2015-03-30', '2015-06-12', '2015-05-24', '2015-06-12', 0),
(111, 'CSCD', 495, 1, 20, 'INTERNSHIP', 'b7314d556d11031959abc251a1d1eca8', '2015-03-30', '2015-06-12', '2015-05-24', '2015-06-12', 12),
(113, 'CPLA', 100, 2, 20, 'COMPUTER LITERACY I', '316e906f83d62efbedce1103cb84d976', '2015-03-30', '2015-05-01', '2015-04-23', '2015-05-01', 16),
(114, 'CPLA', 100, 1, 20, 'COMPUTER LITERACY I', 'd2e7b89b14a5f83f2c4050a5467ff50b', '2015-03-30', '2015-05-01', '2015-04-23', '2015-05-01', 19),
(115, 'CPLA', 100, 4, 20, 'COMPUTER LITERACY I', '316e906f83d62efbedce1103cb84d976', '2015-03-30', '2015-05-01', '2015-04-23', '2015-05-01', 22),
(116, 'CPLA', 100, 3, 20, 'COMPUTER LITERACY I', 'd2e7b89b14a5f83f2c4050a5467ff50b', '2015-03-30', '2015-05-01', '2015-04-23', '2015-05-01', 17),
(117, 'CPLA', 120, 3, 20, 'COMPUTER APPLICATIONS LITERACY', '670af5e3534906f2f850bb50f33d8f0a', '2015-03-30', '2015-06-12', '2015-05-24', '2015-06-12', 30),
(118, 'CPLA', 101, 1, 20, 'COMPUTER LITERACY II', 'daa13b178dd81b68117aa4c6692ad900', '2015-05-04', '2015-06-12', '2015-06-02', '2015-06-12', 21),
(127, 'CPLA', 101, 1, 20, 'COMPUTER LITERACY II', '19568f7034bb0406137331b8b2670c16', '2015-05-04', '2015-06-12', '2015-06-02', '2015-06-12', 21);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('2e1984c021a20a8d91f54dd3d2b43337', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.37 Safari/537.36', 1430330004, 'a:8:{s:9:"user_data";s:0:"";s:6:"groups";a:2:{i:0;s:5:"admin";i:1;s:7:"student";}s:5:"admin";a:6:{s:8:"username";s:8:"shoerner";s:4:"name";s:15:"Stephen Hoerner";s:5:"email";s:17:"gupocca@gmail.com";s:5:"valid";b:1;s:5:"group";s:5:"admin";s:10:"controller";s:10:"admin_home";}s:16:"student-course-0";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"490";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:16:"student-course-1";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"495";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:16:"student-course-2";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"371";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:7:"student";a:5:{s:8:"username";s:32:"1b1116ba630fa3f84a4d2ec871e2a482";s:5:"group";s:7:"student";s:5:"valid";b:1;s:5:"count";i:3;s:10:"controller";s:12:"student_home";}s:7:"courses";a:87:{i:0;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"100";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:19:"COMPUTER LITERACY I";s:13:"student_count";N;s:3:"crn";s:5:"13120";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-05-01";s:10:"eval_start";s:10:"2015-04-23";s:8:"eval_end";s:10:"2015-05-01";s:10:"instructor";s:32:"d2e7b89b14a5f83f2c4050a5467ff50b";s:9:"last_name";s:5:"Herve";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:1;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"100";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:19:"COMPUTER LITERACY I";s:13:"student_count";N;s:3:"crn";s:5:"13121";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-05-01";s:10:"eval_start";s:10:"2015-04-23";s:8:"eval_end";s:10:"2015-05-01";s:10:"instructor";s:32:"316e906f83d62efbedce1103cb84d976";s:9:"last_name";s:6:"Murphy";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:2;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"100";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:19:"COMPUTER LITERACY I";s:13:"student_count";N;s:3:"crn";s:5:"13203";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-05-01";s:10:"eval_start";s:10:"2015-04-23";s:8:"eval_end";s:10:"2015-05-01";s:10:"instructor";s:32:"d2e7b89b14a5f83f2c4050a5467ff50b";s:9:"last_name";s:5:"Herve";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:3;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"100";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:19:"COMPUTER LITERACY I";s:13:"student_count";N;s:3:"crn";s:5:"14386";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-05-01";s:10:"eval_start";s:10:"2015-04-23";s:8:"eval_end";s:10:"2015-05-01";s:10:"instructor";s:32:"316e906f83d62efbedce1103cb84d976";s:9:"last_name";s:6:"Murphy";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:4;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"100";s:14:"course_section";s:2:"10";s:4:"term";s:2:"20";s:5:"title";s:19:"COMPUTER LITERACY I";s:13:"student_count";N;s:3:"crn";s:5:"13122";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-05-01";s:10:"eval_start";s:10:"2015-04-23";s:8:"eval_end";s:10:"2015-05-01";s:10:"instructor";s:32:"316e906f83d62efbedce1103cb84d976";s:9:"last_name";s:6:"Murphy";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:5;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"101";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:20:"COMPUTER LITERACY II";s:13:"student_count";N;s:3:"crn";s:5:"13123";s:10:"start_date";s:10:"2015-05-04";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-06-02";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d2e7b89b14a5f83f2c4050a5467ff50b";s:9:"last_name";s:5:"Herve";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:6;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"101";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:20:"COMPUTER LITERACY II";s:13:"student_count";N;s:3:"crn";s:5:"13124";s:10:"start_date";s:10:"2015-05-04";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-06-02";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"316e906f83d62efbedce1103cb84d976";s:9:"last_name";s:6:"Murphy";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:7;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"101";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:20:"COMPUTER LITERACY II";s:13:"student_count";N;s:3:"crn";s:5:"13202";s:10:"start_date";s:10:"2015-05-04";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-06-02";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d2e7b89b14a5f83f2c4050a5467ff50b";s:9:"last_name";s:5:"Herve";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:8;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"101";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:20:"COMPUTER LITERACY II";s:13:"student_count";N;s:3:"crn";s:5:"14387";s:10:"start_date";s:10:"2015-05-04";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-06-02";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"316e906f83d62efbedce1103cb84d976";s:9:"last_name";s:6:"Murphy";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:9;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"101";s:14:"course_section";s:2:"10";s:4:"term";s:2:"20";s:5:"title";s:20:"COMPUTER LITERACY II";s:13:"student_count";N;s:3:"crn";s:5:"13125";s:10:"start_date";s:10:"2015-05-04";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-06-02";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d2e7b89b14a5f83f2c4050a5467ff50b";s:9:"last_name";s:5:"Herve";s:10:"first_name";s:6:"Daniel";s:5:"email";N;}i:10;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"10307";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"19568f7034bb0406137331b8b2670c16";s:9:"last_name";s:8:"Anderson";s:10:"first_name";s:4:"Olin";s:5:"email";N;}i:11;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"10308";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"9b495250254dd487d42a5ea25238f71d";s:9:"last_name";s:7:"Pickett";s:10:"first_name";s:6:"Rickie";s:5:"email";N;}i:12;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"14390";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"670af5e3534906f2f850bb50f33d8f0a";s:9:"last_name";s:7:"Nielsen";s:10:"first_name";s:4:"Eric";s:5:"email";N;}i:13;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"10310";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"670af5e3534906f2f850bb50f33d8f0a";s:9:"last_name";s:7:"Nielsen";s:10:"first_name";s:4:"Eric";s:5:"email";N;}i:14;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"05";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"15655";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"ec939b43615146c41a0e909abd04a9b8";s:9:"last_name";s:8:"Pfleegor";s:10:"first_name";s:5:"Isaac";s:5:"email";N;}i:15;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"06";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"10312";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"17e4c97b9ee93046eb0c56168dd61e0b";s:9:"last_name";s:8:"Reineman";s:10:"first_name";s:6:"Jeremy";s:5:"email";N;}i:16;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"07";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"14389";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"faf4571ac4a8dbbee8c31f196358a080";s:9:"last_name";s:8:"Phillips";s:10:"first_name";s:4:"Kyle";s:5:"email";N;}i:17;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"08";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"10314";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"9b495250254dd487d42a5ea25238f71d";s:9:"last_name";s:7:"Pickett";s:10:"first_name";s:6:"Rickie";s:5:"email";N;}i:18;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"120";s:14:"course_section";s:2:"10";s:4:"term";s:2:"20";s:5:"title";s:30:"COMPUTER APPLICATIONS LITERACY";s:13:"student_count";N;s:3:"crn";s:5:"14892";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"5635d36828c12b177ba3aea2738cdf69";s:9:"last_name";s:5:"Sipes";s:10:"first_name";s:7:"Richard";s:5:"email";N;}i:19;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"199";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10316";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:20;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"215";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:21:"INTERNET & WWW BASICS";s:13:"student_count";N;s:3:"crn";s:5:"10317";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"3f360fd2a30edf679d217c54026b9347";s:9:"last_name";s:7:"Lemelin";s:10:"first_name";s:6:"Robert";s:5:"email";N;}i:21;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"299";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10318";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:22;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"399";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10319";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:23;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CPLA";s:10:"course_num";s:3:"499";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10320";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:24;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"110";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:27:"INTRODUCTION TO PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"11481";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"3f360fd2a30edf679d217c54026b9347";s:9:"last_name";s:7:"Lemelin";s:10:"first_name";s:6:"Robert";s:5:"email";N;}i:25;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"110";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:27:"INTRODUCTION TO PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"15190";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"cb9f1fec3413e3d66c79265559203123";s:9:"last_name";s:9:"Henderson";s:10:"first_name";s:5:"Sarah";s:5:"email";N;}i:26;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"199";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10349";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:27;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"199";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:22:"DS/FOUNDATIONS OF JAVA";s:13:"student_count";N;s:3:"crn";s:5:"16240";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7bf8519d61df246a474de43dc4a622f2";s:9:"last_name";s:6:"Peters";s:10:"first_name";s:5:"Chris";s:5:"email";N;}i:28;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"210";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:24:"PROGRAMMING PRINCIPLES I";s:13:"student_count";N;s:3:"crn";s:5:"11484";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"b7314d556d11031959abc251a1d1eca8";s:9:"last_name";s:7:"Steiner";s:10:"first_name";s:6:"Stuart";s:5:"email";N;}i:29;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"211";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:25:"PROGRAMMING PRINCIPLES II";s:13:"student_count";N;s:3:"crn";s:5:"12432";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7bf8519d61df246a474de43dc4a622f2";s:9:"last_name";s:6:"Peters";s:10:"first_name";s:5:"Chris";s:5:"email";N;}i:30;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"211";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:25:"PROGRAMMING PRINCIPLES II";s:13:"student_count";N;s:3:"crn";s:5:"13342";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7bf8519d61df246a474de43dc4a622f2";s:9:"last_name";s:6:"Peters";s:10:"first_name";s:5:"Chris";s:5:"email";N;}i:31;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"216";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:25:"3D MODELING & ANIMATION I";s:13:"student_count";N;s:3:"crn";s:5:"14095";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"777cd020f9a1450ac7ef0414d7389cce";s:9:"last_name";s:4:"Kamp";s:10:"first_name";s:5:"Brian";s:5:"email";N;}i:32;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"240";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:22:"C AND UNIX PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"11486";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"993c78edf0d44a75a4362ccbb4b34178";s:9:"last_name";s:4:"Tian";s:10:"first_name";s:3:"Yun";s:5:"email";N;}i:33;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"299";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:23:"SPEC ST IN COMP SCIENCE";s:13:"student_count";N;s:3:"crn";s:5:"10350";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:34;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"300";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:15:"DATA STRUCTURES";s:13:"student_count";N;s:3:"crn";s:5:"11487";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7574ec0279bdd6e9dddc9c9a1c8b6da0";s:9:"last_name";s:2:"Xu";s:10:"first_name";s:6:"Bojian";s:5:"email";N;}i:35;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"316";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:25:"PRACTICAL PROBLEM SOLVING";s:13:"student_count";N;s:3:"crn";s:5:"15661";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"c7eec92ea3bb024db28e9c0a5b4df566";s:9:"last_name";s:6:"Capaul";s:10:"first_name";s:6:"Thomas";s:5:"email";N;}i:36;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"320";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:10:"ALGORITHMS";s:13:"student_count";N;s:3:"crn";s:5:"11483";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7574ec0279bdd6e9dddc9c9a1c8b6da0";s:9:"last_name";s:2:"Xu";s:10:"first_name";s:6:"Bojian";s:5:"email";N;}i:37;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"327";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:27:"RELATIONAL DATABASE SYSTEMS";s:13:"student_count";N;s:3:"crn";s:5:"13882";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"a010cf30f0d09c3192430e74e0af6bd9";s:9:"last_name";s:2:"Li";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:38;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"330";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:17:"COMPUTER NETWORKS";s:13:"student_count";N;s:3:"crn";s:5:"11488";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"e0fffeecdb4a7371928f682880dac309";s:9:"last_name";s:7:"Imamura";s:10:"first_name";s:6:"Kosuke";s:5:"email";N;}i:39;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"340";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:17:"OPERATING SYSTEMS";s:13:"student_count";N;s:3:"crn";s:5:"12810";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"b7314d556d11031959abc251a1d1eca8";s:9:"last_name";s:7:"Steiner";s:10:"first_name";s:6:"Stuart";s:5:"email";N;}i:40;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"349";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:15:"DESIGN PATTERNS";s:13:"student_count";N;s:3:"crn";s:5:"15357";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"c7eec92ea3bb024db28e9c0a5b4df566";s:9:"last_name";s:6:"Capaul";s:10:"first_name";s:6:"Thomas";s:5:"email";N;}i:41;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"350";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:20:"SOFTWARE ENGINEERING";s:13:"student_count";N;s:3:"crn";s:5:"13343";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"c7eec92ea3bb024db28e9c0a5b4df566";s:9:"last_name";s:6:"Capaul";s:10:"first_name";s:6:"Thomas";s:5:"email";N;}i:42;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"371";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:16:".NET PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"14897";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d3cf0605426ae1b53386d40b2b9fb937";s:9:"last_name";s:5:"Bondo";s:10:"first_name";s:1:"R";s:5:"email";N;}i:43;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"378";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:27:"WEB APPLICATION DEVELOPMENT";s:13:"student_count";N;s:3:"crn";s:5:"15358";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"777cd020f9a1450ac7ef0414d7389cce";s:9:"last_name";s:4:"Kamp";s:10:"first_name";s:5:"Brian";s:5:"email";N;}i:44;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"395";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"10352";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:45;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"395";s:14:"course_section";s:2:"21";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"10353";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:46;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"399";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10354";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:47;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"417";s:14:"course_section";s:2:"55";s:4:"term";s:2:"20";s:5:"title";s:27:"3D MODELING & ANIMATION III";s:13:"student_count";N;s:3:"crn";s:5:"11849";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"777cd020f9a1450ac7ef0414d7389cce";s:9:"last_name";s:4:"Kamp";s:10:"first_name";s:5:"Brian";s:5:"email";N;}i:48;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"427";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:13:"ADVANCED DBMS";s:13:"student_count";N;s:3:"crn";s:5:"15664";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"a010cf30f0d09c3192430e74e0af6bd9";s:9:"last_name";s:2:"Li";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:49;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"434";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:16:"NETWORK SECURITY";s:13:"student_count";N;s:3:"crn";s:5:"14898";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"8b8affcf19df4980af3d8a21ae027a60";s:9:"last_name";s:5:"Heath";s:10:"first_name";s:7:"Stephen";s:5:"email";N;}i:50;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"439";s:14:"course_section";s:2:"77";s:4:"term";s:2:"20";s:5:"title";s:15:"GPU PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"13351";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"993c78edf0d44a75a4362ccbb4b34178";s:9:"last_name";s:4:"Tian";s:10:"first_name";s:3:"Yun";s:5:"email";N;}i:51;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"480";s:14:"course_section";s:2:"77";s:4:"term";s:2:"20";s:5:"title";s:19:"INTELLIGENT SYSTEMS";s:13:"student_count";N;s:3:"crn";s:5:"15360";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"fe99b3ccfc2c7e099788257ce4e04b49";s:9:"last_name";s:6:"Tappan";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:52;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"488";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:14:"SENIOR PROJECT";s:13:"student_count";N;s:3:"crn";s:5:"14096";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7bf8519d61df246a474de43dc4a622f2";s:9:"last_name";s:6:"Peters";s:10:"first_name";s:5:"Chris";s:5:"email";N;}i:53;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"490";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:15:"SENIOR CAPSTONE";s:13:"student_count";N;s:3:"crn";s:5:"10355";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"c7eec92ea3bb024db28e9c0a5b4df566";s:9:"last_name";s:6:"Capaul";s:10:"first_name";s:6:"Thomas";s:5:"email";N;}i:54;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"495";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"10356";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:55;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"495";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"10357";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"b7314d556d11031959abc251a1d1eca8";s:9:"last_name";s:7:"Steiner";s:10:"first_name";s:6:"Stuart";s:5:"email";N;}i:56;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"499";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"10358";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:57;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"499";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:18:"DS/WEB APPLICATION";s:13:"student_count";N;s:3:"crn";s:5:"16077";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"777cd020f9a1450ac7ef0414d7389cce";s:9:"last_name";s:4:"Kamp";s:10:"first_name";s:5:"Brian";s:5:"email";N;}i:58;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"524";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:29:"ADVANCED SOFTWARE ENGINEERING";s:13:"student_count";N;s:3:"crn";s:5:"15193";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"fe99b3ccfc2c7e099788257ce4e04b49";s:9:"last_name";s:6:"Tappan";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:59;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"539";s:14:"course_section";s:2:"77";s:4:"term";s:2:"20";s:5:"title";s:22:"TOPIC: GPU PROGRAMMING";s:13:"student_count";N;s:3:"crn";s:5:"14899";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"993c78edf0d44a75a4362ccbb4b34178";s:9:"last_name";s:4:"Tian";s:10:"first_name";s:3:"Yun";s:5:"email";N;}i:60;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"540";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:26:"ADVANCED OPERATING SYSTEMS";s:13:"student_count";N;s:3:"crn";s:5:"15665";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"e0fffeecdb4a7371928f682880dac309";s:9:"last_name";s:7:"Imamura";s:10:"first_name";s:6:"Kosuke";s:5:"email";N;}i:61;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"580";s:14:"course_section";s:2:"77";s:4:"term";s:2:"20";s:5:"title";s:19:"INTELLIGENT SYSTEMS";s:13:"student_count";N;s:3:"crn";s:5:"15361";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"fe99b3ccfc2c7e099788257ce4e04b49";s:9:"last_name";s:6:"Tappan";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:62;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"595";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:15:"PROF INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"10361";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:63;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"595";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:15:"PROF INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"11854";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:64;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"595";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:15:"PROF INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"12245";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:65;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"595";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:15:"PROF INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"12246";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:66;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"595";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:15:"PROF INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"12247";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:67;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"599";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"DIR ST";s:13:"student_count";N;s:3:"crn";s:5:"16228";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:68;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"599";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:18:"DS/CLOUD COMPUTING";s:13:"student_count";N;s:3:"crn";s:5:"15996";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"993c78edf0d44a75a4362ccbb4b34178";s:9:"last_name";s:4:"Tian";s:10:"first_name";s:3:"Yun";s:5:"email";N;}i:69;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"599";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:25:"DS/MEDICAL DATA RELATIONS";s:13:"student_count";N;s:3:"crn";s:5:"15997";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"a010cf30f0d09c3192430e74e0af6bd9";s:9:"last_name";s:2:"Li";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:70;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"599";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:28:"DS/COMPUTER SCIENCE RESEARCH";s:13:"student_count";N;s:3:"crn";s:5:"10362";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d8591e04de9c010e1a47939d4d17c0f4";s:9:"last_name";s:6:"Taylor";s:10:"first_name";s:5:"Carol";s:5:"email";N;}i:71;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"599";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:20:"DS/STRING ALGORITHMS";s:13:"student_count";N;s:3:"crn";s:5:"16229";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7574ec0279bdd6e9dddc9c9a1c8b6da0";s:9:"last_name";s:2:"Xu";s:10:"first_name";s:6:"Bojian";s:5:"email";N;}i:72;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"10363";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:73;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"11855";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"a010cf30f0d09c3192430e74e0af6bd9";s:9:"last_name";s:2:"Li";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:74;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"11856";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"fe99b3ccfc2c7e099788257ce4e04b49";s:9:"last_name";s:6:"Tappan";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:75;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"11857";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"993c78edf0d44a75a4362ccbb4b34178";s:9:"last_name";s:4:"Tian";s:10:"first_name";s:3:"Yun";s:5:"email";N;}i:76;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"11858";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d8591e04de9c010e1a47939d4d17c0f4";s:9:"last_name";s:6:"Taylor";s:10:"first_name";s:5:"Carol";s:5:"email";N;}i:77;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"05";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"11859";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"01a35194531f77be8b0b8efe6d06aa46";s:9:"last_name";s:7:"Schimpf";s:10:"first_name";s:4:"Paul";s:5:"email";N;}i:78;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"600";s:14:"course_section";s:2:"06";s:4:"term";s:2:"20";s:5:"title";s:6:"THESIS";s:13:"student_count";N;s:3:"crn";s:5:"16227";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"7574ec0279bdd6e9dddc9c9a1c8b6da0";s:9:"last_name";s:2:"Xu";s:10:"first_name";s:6:"Bojian";s:5:"email";N;}i:79;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"10364";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:80;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"11860";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"a010cf30f0d09c3192430e74e0af6bd9";s:9:"last_name";s:2:"Li";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:81;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:2:"02";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"11861";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"fe99b3ccfc2c7e099788257ce4e04b49";s:9:"last_name";s:6:"Tappan";s:10:"first_name";s:3:"Dan";s:5:"email";N;}i:82;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:2:"03";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"11862";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:83;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:2:"04";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"11863";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:84;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"601";s:14:"course_section";s:2:"06";s:4:"term";s:2:"20";s:5:"title";s:15:"RESEARCH REPORT";s:13:"student_count";N;s:3:"crn";s:5:"11864";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"dd4b21e9ef71e1291183a46b913ae6f2";s:9:"last_name";s:3:"TBA";s:10:"first_name";s:3:"TBA";s:5:"email";N;}i:85;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"695";s:14:"course_section";s:1:"0";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"13353";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"01a35194531f77be8b0b8efe6d06aa46";s:9:"last_name";s:7:"Schimpf";s:10:"first_name";s:4:"Paul";s:5:"email";N;}i:86;O:12:"Course_model":16:{s:10:"section_id";N;s:14:"course_subject";s:4:"CSCD";s:10:"course_num";s:3:"695";s:14:"course_section";s:2:"01";s:4:"term";s:2:"20";s:5:"title";s:10:"INTERNSHIP";s:13:"student_count";N;s:3:"crn";s:5:"16058";s:10:"start_date";s:10:"2015-03-30";s:8:"end_date";s:10:"2015-06-12";s:10:"eval_start";s:10:"2015-05-24";s:8:"eval_end";s:10:"2015-06-12";s:10:"instructor";s:32:"d8591e04de9c010e1a47939d4d17c0f4";s:9:"last_name";s:6:"Taylor";s:10:"first_name";s:5:"Carol";s:5:"email";N;}}}'),
('a2e70e518e45f2f936df58ec3aa10bed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.45 Safari/537.36', 1430514449, 'a:7:{s:9:"user_data";s:0:"";s:6:"groups";a:2:{i:0;s:5:"admin";i:1;s:7:"student";}s:5:"admin";a:7:{s:8:"username";s:8:"shoerner";s:4:"name";s:15:"Stephen Hoerner";s:5:"email";s:17:"gupocca@gmail.com";s:5:"super";s:1:"0";s:5:"valid";b:1;s:5:"group";s:5:"admin";s:10:"controller";s:10:"admin_home";}s:16:"student-course-0";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"495";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:16:"student-course-1";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"490";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:16:"student-course-2";a:5:{s:7:"subject";s:4:"CSCD";s:6:"number";s:3:"371";s:7:"section";s:2:"01";s:7:"quarter";s:2:"20";s:4:"year";s:4:"2015";}s:7:"student";a:5:{s:8:"username";s:32:"1b1116ba630fa3f84a4d2ec871e2a482";s:5:"group";s:7:"student";s:5:"valid";b:1;s:5:"count";i:3;s:10:"controller";s:12:"student_home";}}');

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE IF NOT EXISTS `submission` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id_hashed` varchar(128) NOT NULL,
  `section_id` int(11) NOT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT '0',
  `general_comment` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `s_id_hashed` (`s_id_hashed`,`section_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`sub_id`, `s_id_hashed`, `section_id`, `submitted`, `general_comment`) VALUES
(1, '1b1116ba630fa3f84a4d2ec871e2a482', 1, 0, ''),
(2, '1b1116ba630fa3f84a4d2ec871e2a482', 12, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nisi nisl, tincidunt eget lacus non, finibus maximus nibh. Donec suscipit sagittis lectus id dignissim. Phasellus vestibulum tortor ac nulla imperdiet condimentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas lobortis quis lacus et sollicitudin. Pellentesque posuere commodo lectus, ac venenatis justo finibus nec. Nunc quis risus in nibh euismod aliquam. Proin metus erat, blandit non ipsum ac, gravida commodo tortor. Proin lor'),
(3, '1d4768949e0dc2448a837643732bc641', 1, 1, 'A final comment. I would have tossed xss at this but I''m not sure if that would have resulted in me getting in trouble so I decided against it.\n'),
(4, 'f7ffac0215781195d71370e6cf317bc9', 76, 1, 'Stu you make my life better'),
(5, 'f7ffac0215781195d71370e6cf317bc9', 61, 1, '&amp; &#47;&#47;&#47;&#47; &#46;&#46;&#47;&#46;&#46;&#47;&#46;&#46;&#47;&#46;&#46;&#47; These are testing things. What do you see?'),
(6, 'f7ffac0215781195d71370e6cf317bc9', 1, 1, 'You can''t parse [X]HTML with regex. Because HTML can''t be parsed by regex. Regex is not a tool that can be used to correctly parse HTML. As I have answered in HTML-and-regex questions here so many times before, the use of regex will not allow you to consume HTML. Regular expressions are a tool that is insufficiently sophisticated to understand the constructs employed by HTML. HTML is not a regular language and hence cannot be parsed by regular expressions. Regex queries are not equipped to break down HTML i'),
(7, '1b1116ba630fa3f84a4d2ec871e2a482', 111, 0, 'You can''t parse [X]HTML with regex. Because HTML can''t be parsed by regex. Regex is not a tool that can be used to correctly parse HTML. As I have answered in HTML-and-regex questions here so many times before, the use of regex will not allow you to consume HTML. Regular expressions are a tool that is insufficiently sophisticated to understand the constructs employed by HTML. HTML is not a regular language and hence cannot be parsed by regular expressions. Regex queries are not equipped to break down HTML into its meaningful parts. so many times but it is not getting to me. Even enhanced irregular regular expressions as used by Perl are not up to the task of parsing HTML. You will never make me crack. HTML is a language of sufficient complexity that it cannot be parsed by regular expressions. Even Jon Skeet cannot parse HTML using regular expressions. Every time you attempt to parse HTML with regular expressions, the unholy child weeps the blood of virgins, and Russian hackers pwn your webapp. Parsing HTML with regex summons tainted souls into the realm of the living. HTML and regex go together like love, marriage, and ritual infanticide. The <center> cannot hold it is too late. The force of regex and HTML together in the same conceptual space will destroy your mind like so much watery putty. If you parse HTML with regex you are giving in to Them and their blasphemous ways which doom us all to inhuman toil for the One whose Name cannot be expressed in the Basic Multilingual Plane, he comes. HTML-plus-regexp will liquify the n?erves of the sentient whilst you observe, your psyche withering in the onslaught of horror. Rege???x-based HTML parsers are the cancer that is killing StackOverflow it is too late it is too late we cannot be saved the trangession of a chi?ld ensures regex will consume all living tissue (except for HTML which it cannot, as previously prophesied) dear lord help us how can anyone survive this scourge using regex to parse HTML has doomed humanity to an eternity of dread torture and security holes using regex as a tool to process HTML establishes a breach between this world and the dread realm of c??o??rrupt entities (like SGML entities, but more corrupt) a mere glimpse of the world of reg?ex parsers for HTML will ins?tantly transport a programmer''s consciousness into a world of ceaseless screaming, he comes, the pestilent slithy regex-infection wil?l devour your HT?ML parser, application and existence for all time like Visual Basic only worse he comes he comes do not fi?ght he com?e?s, ?h?i?s un?ho?ly radian?ce? destro?ying all enli????ghtenment, HTML tags lea?ki?n?g fr?o?m ?yo??ur eye?s? ?l?ik?e liq?uid pain, the song of re?gular exp?ression parsing will exti?nguish the voices of mor?tal man from the sp?here I can see it can you see ?????i???t???????? it is beautiful t?he final snuffing of the lie?s of Man ALL IS LOS????????T ALL I?S LOST the pon?y he comes he c??omes he comes the ich?or permeates all MY FACE MY FACE ?h god no NO NOO?O?O N? stop the an?*??????????g????????l??????????e??s ?a???r?????e n?ot re????a?l???????? ZA????LG? IS????????? TO???????? TH?E??? ?P???O??N?Y? H??????????E?????????? ??????????C??????????O??????M??????????E?????????S??????????\r\n\r\n');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `submission` (`sub_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`);

--
-- Constraints for table `course_question`
--
ALTER TABLE `course_question`
  ADD CONSTRAINT `course_question_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_question_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructor` (`inst_id_hashed`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructor` (`inst_id_hashed`);

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
