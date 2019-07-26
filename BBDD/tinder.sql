-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2019 at 06:30 PM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tinder`
--
CREATE DATABASE IF NOT EXISTS `tinder` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tinder`;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `user_ID` varchar(64) NOT NULL,
  `user_ID_of_liked_user` varchar(64) NOT NULL,
  `like_or_not_interested` char(16) NOT NULL,
  `Tinder_Account_user_id` int(64) NOT NULL,
  `Match_match_id` int(64) NOT NULL,
  PRIMARY KEY (`Tinder_Account_user_id`,`Match_match_id`),
  KEY `Match_match_id` (`Match_match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE IF NOT EXISTS `match` (
  `match_id` int(64) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Message_message_id` int(64) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `Message_message_id` (`Message_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(64) NOT NULL AUTO_INCREMENT,
  `match_id` int(64) NOT NULL,
  `receiver` char(64) NOT NULL,
  `message_content` varchar(512) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReportUser_user_id` int(64) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `ReportUser_user_id` (`ReportUser_user_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reportuser`
--

CREATE TABLE IF NOT EXISTS `reportuser` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cause_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tinderaccount`
--

CREATE TABLE IF NOT EXISTS `tinderaccount` (
  `user_ID` int(64) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `age` smallint(6) NOT NULL,
  `interests` varchar(512) NOT NULL,
  `gender` char(8) NOT NULL,
  `about_me` varchar(500) NOT NULL,
  `work` varchar(32) NOT NULL,
  `age_range` smallint(6) NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unmatch`
--

CREATE TABLE IF NOT EXISTS `unmatch` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cause_ID` varchar(64) NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`Match_match_id`) REFERENCES `match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`Tinder_Account_user_id`) REFERENCES `tinderaccount` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`Message_message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`ReportUser_user_id`) REFERENCES `reportuser` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
