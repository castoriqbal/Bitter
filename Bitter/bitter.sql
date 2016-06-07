-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2016 at 04:39 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitterness`
--

CREATE TABLE IF NOT EXISTS `bitterness` (
  `bitternessID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `message` varchar(140) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bitternessID`),
  KEY `userid` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `bitterness`
--

INSERT INTO `bitterness` (`bitternessID`, `userID`, `message`, `time`) VALUES
(1, 1, 'Running away from your problems won''t make you skinny', '2016-05-27 17:00:00'),
(2, 1, 'Maybe senpai isn''t noticing you for a reason', '2016-05-27 22:18:07'),
(3, 2, 'Don''t sugarcoat everything... you''ll get diabetes', '2016-05-28 17:00:00'),
(4, 2, 'If you ever feel sad just remember: even unicorns probably have diarrhea every once in a while', '2016-05-30 13:59:56'),
(14, 1, 'Don Quan', '2016-05-31 14:35:18'),
(16, 1, 'Don''t', '2016-05-31 14:38:01'),
(17, 2, 'this is what she said "you disgust me"', '2016-05-31 15:47:05'),
(19, 1, 'Baby baby baby baby baby baby baby baby aaaaaa', '2016-05-31 16:09:26'),
(20, 1, 'Test', '2016-06-01 03:10:13'),
(21, 1, 'Test', '2016-06-01 03:11:00'),
(22, 1, 'Another test', '2016-06-01 03:11:58'),
(23, 1, 'Don''t cry over spilled milk. Cry over how sad your life is.', '2016-06-01 03:12:40'),
(25, 2, 'Hey dude! stop lamenting "Another Test"', '2016-06-01 03:16:44'),
(27, 2, 'Dude stop it!', '2016-06-01 03:29:03'),
(30, 2, 'I had enough', '2016-06-02 11:18:35'),
(37, 3, 'The truth is this: I rejoined X-Force because I couldn''t bear to stay away. My name is Elizabeth Braddock, and I''m an addict.', '2016-06-04 09:56:14'),
(38, 18, 'Who am I? That, my dear, is an excellent question. Though not one easily answered.', '2016-06-04 10:46:25'),
(39, 4, 'You believe yourselves immune to death? I bring you a gospel of oblivion. I bring you the Soulsword. Taste it and cease to be.', '2016-06-04 10:55:29'),
(40, 19, 'Humanity sucks and they don''t deserve saving.', '2016-06-04 11:00:09'),
(41, 20, 'I don''t care about titles...\r\nBut I''ll make sure "Lugina" becomes\r\nknown as the strongest in the land!', '2016-06-04 11:22:33'),
(46, 21, 'Lets play some dota ', '2016-06-06 04:45:00'),
(47, 1, 'Hassou Tobi', '2016-06-06 10:27:11'),
(48, 1, 'Masamune', '2016-06-06 13:15:03'),
(49, 21, 'RAMPAGE!', '2016-06-06 13:16:15'),
(50, 1, 'Niffleheim', '2016-06-06 16:56:45'),
(51, 18, 'Mutant and Proud', '2016-06-06 17:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `follower`
--

CREATE TABLE IF NOT EXISTS `follower` (
  `followerID` int(11) NOT NULL AUTO_INCREMENT,
  `userID1` int(11) NOT NULL,
  `userID2` int(11) NOT NULL,
  PRIMARY KEY (`followerID`),
  KEY `userid1` (`userID1`),
  KEY `userid2` (`userID2`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `follower`
--

INSERT INTO `follower` (`followerID`, `userID1`, `userID2`) VALUES
(1, 1, 1),
(5, 2, 2),
(6, 3, 3),
(7, 4, 4),
(8, 18, 18),
(9, 19, 19),
(10, 20, 20),
(11, 21, 21),
(12, 1, 4),
(13, 2, 1),
(14, 2, 18),
(15, 2, 4),
(16, 1, 3),
(17, 1, 19),
(19, 21, 20),
(20, 21, 3),
(21, 21, 4),
(22, 4, 3),
(23, 4, 21),
(24, 18, 3),
(25, 18, 4),
(26, 18, 1),
(27, 3, 1),
(28, 3, 4),
(29, 3, 20),
(30, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullname`, `username`, `password`, `birthdate`) VALUES
(1, 'Fikar', 'Yoshitsune', 'baskerville', '1995-10-04'),
(2, 'Muhammad Iqbal Zulfikar Aliansyah', 'Benkei', 'bishamon', '1995-10-04'),
(3, 'Elizabeth Braddock', 'Betsy', 'psylocke', '1976-04-23'),
(4, 'Illyana Nikolievna Rasputina', 'Illyana', 'magik', '1975-01-01'),
(18, 'Raven Darkholme', 'Raven', 'mystique', '1978-04-12'),
(19, 'Jessica Jones', 'Jessica', 'jessicajones', '2001-11-01'),
(20, 'Lugina', 'Zelban', 'mortaskygarden', '1974-01-08'),
(21, 'Gradiyanto Rendragraha', 'Anto', 'masterdota', '1995-07-11');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitterness`
--
ALTER TABLE `bitterness`
  ADD CONSTRAINT `bitterness_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `bitterness_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userid`);

--
-- Constraints for table `follower`
--
ALTER TABLE `follower`
  ADD CONSTRAINT `follower_ibfk_1` FOREIGN KEY (`userid1`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `follower_ibfk_2` FOREIGN KEY (`userid2`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `follower_ibfk_3` FOREIGN KEY (`userID1`) REFERENCES `user` (`userid`),
  ADD CONSTRAINT `follower_ibfk_4` FOREIGN KEY (`userID2`) REFERENCES `user` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
