-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 08:03 PM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` char(255) NOT NULL,
  `course_description` char(255) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_description`, `department_id`, `professor_id`) VALUES
(10, 'Data Structures', 'stacks, queues.', 1, 2),
(11, 'Digital Signal Processing', 'Purpose of digital signal processing (DSP).', 2, 1),
(12, 'Digital Communications', 'Analog to digital.', 2, 2),
(13, 'Computer Architecture', 'micro-programming and pipelining.', 1, 3),
(14, 'Data Structures 2', 'binary search trees and heaps.', 1, 4),
(15, 'Computer Networks', 'The OSI and the IP models.', 1, 5),
(16, 'Programming', 'Problem Solving.', 1, 6),
(17, 'Control Systems', 'frequency domain representation.', 2, 6),
(18, 'Computer Organization', 'Register level.', 1, 2),
(19, 'Signals', 'Signaling. Principles of Signals.', 3, 6),
(20, 'Control Mechanics', 'frequency domain representation.', 3, 6),
(21, 'System Programming', ' description of .', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` char(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'Computer Engineering'),
(2, 'Communications Engineering'),
(3, 'Architecture'),
(4, 'Dynamics'),
(5, 'Materials Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `professor_name` char(255) NOT NULL,
  PRIMARY KEY (`professor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `professor_name`) VALUES
(1, 'Yasser Fouad'),
(2, 'Amr Elmasry'),
(3, 'Marwan Eltorky'),
(4, 'Adam Muhammed'),
(5, 'Hicham Elmongy'),
(6, 'Ali Jibela');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
