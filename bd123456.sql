-- phpMyAdmin SQL Dump
-- version 2.6.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: May 21, 2023 at 12:17 PM
-- Server version: 4.1.9
-- PHP Version: 4.3.10
-- 
-- Database: `bd123456`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `evaluation`
-- 

CREATE TABLE `evaluation` (
  `numPermis` varchar(8) NOT NULL default '',
  `idModele` int(11) NOT NULL default '0',
  `dateTest` datetime NOT NULL default '0000-00-00 00:00:00',
  `securite` int(11) NOT NULL default '0',
  `conduite` int(11) NOT NULL default '0',
  `confort` int(11) NOT NULL default '0',
  PRIMARY KEY  (`numPermis`,`idModele`),
  KEY `idModele` (`idModele`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `evaluation`
-- 

INSERT INTO `evaluation` VALUES ('21/12345', 15, '2022-11-19 11:00:02', 1, 1, 1);
INSERT INTO `evaluation` VALUES ('21/12345', 26, '2022-11-20 11:00:21', 5, 5, 5);
INSERT INTO `evaluation` VALUES ('22/55555', 15, '2022-11-21 10:59:14', 3, 2, 4);

-- --------------------------------------------------------

-- 
-- Table structure for table `modelevoiture`
-- 

CREATE TABLE `modelevoiture` (
  `idModele` int(11) NOT NULL default '0',
  `libelle` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`idModele`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `modelevoiture`
-- 

INSERT INTO `modelevoiture` VALUES (38, 'WALLYS 216');
INSERT INTO `modelevoiture` VALUES (26, 'WALLYS 619');
INSERT INTO `modelevoiture` VALUES (15, 'WALLYS IRIS');

-- --------------------------------------------------------

-- 
-- Table structure for table `testeur`
-- 

CREATE TABLE `testeur` (
  `numPermis` varchar(8) NOT NULL default '',
  `nom` varchar(30) NOT NULL default '',
  `prenom` varchar(30) NOT NULL default '',
  `genre` char(1) NOT NULL default '',
  `idVille` int(11) NOT NULL default '0',
  PRIMARY KEY  (`numPermis`),
  KEY `idVille` (`idVille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table `testeur`
-- 

INSERT INTO `testeur` VALUES ('21/12345', 'Barhoumi', 'Ahmed', 'M', 3);
INSERT INTO `testeur` VALUES ('22/55555', 'Mouradi', 'Ines', 'F', 2);
INSERT INTO `testeur` VALUES ('23/66666', 'Ayari', 'Mounir', 'M', 3);
INSERT INTO `testeur` VALUES ('33/44444', 'Jebri', 'Mouna', 'F', 1);
INSERT INTO `testeur` VALUES ('58/98765', 'Jouini', 'Ramzi', 'M', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `ville`
-- 

CREATE TABLE `ville` (
  `idVille` int(11) NOT NULL auto_increment,
  `libVille` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`idVille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `ville`
-- 

INSERT INTO `ville` VALUES (1, 'Gafsa');
INSERT INTO `ville` VALUES (2, 'Kef');
INSERT INTO `ville` VALUES (3, 'Sousse');
INSERT INTO `ville` VALUES (4, 'Tunis');

-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `evaluation`
-- 
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`numPermis`) REFERENCES `testeur` (`numPermis`),
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`idModele`) REFERENCES `modelevoiture` (`idModele`),
  ADD CONSTRAINT `evaluation_ibfk_3` FOREIGN KEY (`numPermis`) REFERENCES `testeur` (`numPermis`),
  ADD CONSTRAINT `evaluation_ibfk_4` FOREIGN KEY (`idModele`) REFERENCES `modelevoiture` (`idModele`);

-- 
-- Constraints for table `testeur`
-- 
ALTER TABLE `testeur`
  ADD CONSTRAINT `testeur_ibfk_1` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`) ON DELETE CASCADE ON UPDATE CASCADE;
