CREATE DATABASE  IF NOT EXISTS `jobportal` 

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `adminuser` WRITE;

INSERT INTO `adminuser` VALUES ('admin','admin');

UNLOCK TABLES;

DROP TABLE IF EXISTS `appliedjobs`;

CREATE TABLE `appliedjobs` (
  `ajid` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(45) NOT NULL,
  `empusername` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`ajid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `appliedjobs` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `employer`;

CREATE TABLE `employer` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `cmpname` varchar(45) NOT NULL,
  `contactname` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`empid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `employer` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jobid` varchar(45) NOT NULL,
  `empusername` varchar(45) NOT NULL,
  `companyname` varchar(45) NOT NULL,
  `contactname` varchar(45) NOT NULL,
  `jobtitle` varchar(45) NOT NULL,
  `workexp` varchar(45) NOT NULL,
  `education` varchar(45) NOT NULL,
  `jobcategory` varchar(100) NOT NULL,
  `jobskills` varchar(150) CHARACTER SET big5 NOT NULL,
  `jobdescription` varchar(400) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `jobs` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `jobseeker`;

CREATE TABLE `jobseeker` (
  `jskid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `education` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `workexp` varchar(45) NOT NULL,
  `category` varchar(100) NOT NULL,
  `resumefile` varchar(45) NOT NULL,
  PRIMARY KEY (`jskid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `jobseeker` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `authorization` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `login` WRITE;

UNLOCK TABLES;