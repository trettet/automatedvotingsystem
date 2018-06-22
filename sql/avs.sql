-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2018 at 10:30 PM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avs`
--
CREATE DATABASE IF NOT EXISTS `avs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `avs`;

-- --------------------------------------------------------

--
-- Table structure for table `districtreps`
--

DROP TABLE IF EXISTS `districtreps`;
CREATE TABLE IF NOT EXISTS `districtreps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `districtrepToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='List of District Representatives';

--
-- Dumping data for table `districtreps`
--

INSERT INTO `districtreps` (`id`, `name`, `party_id`) VALUES
(1, 'Doe, John', 1),
(2, 'The Solitary Bird', 3),
(3, 'Dela Cruz, Juan', 2),
(4, 'Cho, Jared', 4),
(5, 'Collins, Warren', 1),
(6, 'Wagner, Nicole', 9),
(7, 'Zítková, Lucie', 4),
(8, 'Napolitani, Ciriaco', 5),
(9, 'Riley, Jennifer', 8),
(10, 'Mancuso, Wilson', 4);

-- --------------------------------------------------------

--
-- Table structure for table `governors`
--

DROP TABLE IF EXISTS `governors`;
CREATE TABLE IF NOT EXISTS `governors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `governorsToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='List of Governors';

--
-- Dumping data for table `governors`
--

INSERT INTO `governors` (`id`, `name`, `party_id`) VALUES
(1, 'Coster, Kenny', 5),
(2, 'Aaronson, Krystina', 1),
(3, 'Spino, Fairy', 7);

-- --------------------------------------------------------

--
-- Table structure for table `mayors`
--

DROP TABLE IF EXISTS `mayors`;
CREATE TABLE IF NOT EXISTS `mayors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mayorsToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='List of Mayors';

--
-- Dumping data for table `mayors`
--

INSERT INTO `mayors` (`id`, `name`, `party_id`) VALUES
(1, 'Via, Jacalyn', 2),
(2, 'Jayme, Jaime', 6),
(3, 'Wellington, Beef', 3);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
CREATE TABLE IF NOT EXISTS `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='List of Parties';

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `color`) VALUES
(1, 'Independent', 'White'),
(2, 'Dilawan', 'Yellow'),
(3, 'Lana Del Rey Fans Club', 'Gold'),
(4, 'Party Party', 'Red'),
(5, 'Neo Rubber Duckies', 'Green'),
(6, 'TEAMbangan', 'Gray'),
(7, 'Pancake', 'Pink'),
(8, 'NyuBake', 'Orchid'),
(9, 'Kirk Klub', 'Orange');

-- --------------------------------------------------------

--
-- Table structure for table `presidents`
--

DROP TABLE IF EXISTS `presidents`;
CREATE TABLE IF NOT EXISTS `presidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `presidentsToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='List of Presidents';

--
-- Dumping data for table `presidents`
--

INSERT INTO `presidents` (`id`, `name`, `party_id`) VALUES
(1, 'Enriquez, Kirk Yngwie', 1),
(2, 'Sorrowsad, Zairiel', 2),
(3, 'Hi Me, John Paul', 3);

-- --------------------------------------------------------

--
-- Table structure for table `senators`
--

DROP TABLE IF EXISTS `senators`;
CREATE TABLE IF NOT EXISTS `senators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `senatorsToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Table of Senators';

--
-- Dumping data for table `senators`
--

INSERT INTO `senators` (`id`, `name`, `party_id`) VALUES
(1, 'Bernados, Renz Carlyle', 8),
(2, 'Cuyos, Kasey', 8),
(3, 'Mesina, Jericho', 9),
(4, 'Isanan, Joshua Louis', 9),
(5, 'Cavite, Hazel', 6),
(6, 'Maureal, Mary Grace', 7),
(7, 'Zamoras, Allena Denise', 4),
(8, 'Ubanan, Daniel', 8),
(9, 'Mosqueda, Ethan Ray', 6),
(10, 'Michael, Kobe', 9);

-- --------------------------------------------------------

--
-- Table structure for table `vicepresidents`
--

DROP TABLE IF EXISTS `vicepresidents`;
CREATE TABLE IF NOT EXISTS `vicepresidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vicepresidentsToParties` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Table of Vice Presidents';

--
-- Dumping data for table `vicepresidents`
--

INSERT INTO `vicepresidents` (`id`, `name`, `party_id`) VALUES
(1, 'Ty, Joshua', 6),
(2, 'Palacio, Jerly', 7),
(3, 'Duenas, Janel', 7);

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
CREATE TABLE IF NOT EXISTS `voters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of Voters';

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `name`, `username`) VALUES
(1, 'Lim, Marvin', 'mrvn_lm'),
(2, 'Lim, Robert', 'robertlim');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districtreps`
--
ALTER TABLE `districtreps`
  ADD CONSTRAINT `districtrepToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);

--
-- Constraints for table `governors`
--
ALTER TABLE `governors`
  ADD CONSTRAINT `governorsToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);

--
-- Constraints for table `mayors`
--
ALTER TABLE `mayors`
  ADD CONSTRAINT `mayorsToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);

--
-- Constraints for table `presidents`
--
ALTER TABLE `presidents`
  ADD CONSTRAINT `presidentsToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);

--
-- Constraints for table `senators`
--
ALTER TABLE `senators`
  ADD CONSTRAINT `senatorsToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);

--
-- Constraints for table `vicepresidents`
--
ALTER TABLE `vicepresidents`
  ADD CONSTRAINT `vicepresidentsToParties` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
