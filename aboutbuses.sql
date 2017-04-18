-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2017 at 09:00 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aboutbuses`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bus`
--

CREATE TABLE `Bus` (
  `BusNo` text NOT NULL,
  `BusDesc` text NOT NULL,
  `BusType` text NOT NULL,
  `Gate` text NOT NULL,
  `DistrictID` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bus`
--

INSERT INTO `Bus` (`BusNo`, `BusDesc`, `BusType`, `Gate`, `DistrictID`) VALUES
('24', 'Prachaniwet 3 - Kasetsart University', 'Normal', 'Ngamwongwan', 'D8'),
('29', 'Thammasat University (Rangsit) - Kasetsart University', 'Normal', 'Wipavadee', 'D1'),
('29', 'Thammasat University (Rangsit) - Kasetsart University', 'Air', 'Wipavadee', 'D1'),
('39', 'Talaadthai - Kasetsart University', 'Normal', 'Phaholyothin', 'D1'),
('39', 'Bang Khan - Kasetsart University', 'Air', 'Ngamwongwan', 'D1'),
('59', 'Rangsit - Kasetsart University', 'Normal', 'Phaholyothin', 'D1'),
('59', 'Rangsit - Kasetsart University', 'Normal', 'Phaholyothin', 'D1'),
('59', 'Rangsit - Kasetsart University', 'Air', 'Phaholyothin', 'D1'),
('104', 'Mochit 2 - Kasetsart University', 'Normal', 'Ngamwongwan', 'D7'),
('104', 'Mochit 2 - Kasetsart University', 'Air', 'Ngamwongwan', 'D7'),
('510', 'Thammasat University (Rangsit) - Kasetsart University', 'Air', 'Wipavadee', 'D1');

-- --------------------------------------------------------

--
-- Table structure for table `Garage`
--

CREATE TABLE `Garage` (
  `GarageNo` text NOT NULL,
  `GarageDesc` text NOT NULL,
  `BusNo` text NOT NULL,
  `BusType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Garage`
--

INSERT INTO `Garage` (`GarageNo`, `GarageDesc`, `BusNo`, `BusType`) VALUES
('G1', 'Prachaniwet 3', '24', 'Normal'),
('G2', 'Rangsit', '29', 'Normal'),
('G3', 'Rangsit', '29', 'Air'),
('G4', 'Rangsit', '39', 'Normal'),
('G5', 'Khlong Luang', '39', 'Air'),
('G6', 'Rangsit', '59', 'Normal'),
('G7', 'Rangsit', '59', 'Air'),
('G8', 'Mochit', '104', 'Normal'),
('G9', 'Mochit', '104', 'Air'),
('G10', 'Rangsit', '510', 'Air');

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE `Schedule` (
  `BusNo` text NOT NULL,
  `BusType` text NOT NULL,
  `FirstTime` text NOT NULL,
  `LastTime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`BusNo`, `BusType`, `FirstTime`, `LastTime`) VALUES
('24', 'Normal', '04:30', '22:00'),
('29', 'Normal', '05:00', '22:00'),
('29', 'Air', '05:00', '22:00'),
('39', 'Normal', '05:00', '22:00'),
('39', 'Air', '05:00', '22:00'),
('59', 'Normal', '04:30', '22:00'),
('59', 'Air', '05:00', '23:00'),
('104', 'Normal', '05:00', '23:00'),
('104', 'Air', '04:30', '22:00'),
('510', 'Air', '04:00', '22:00');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` text NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `Gender` text NOT NULL,
  `Age` int(2) NOT NULL,
  `StaffType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `FirstName`, `LastName`, `Gender`, `Age`, `StaffType`) VALUES
('S1', 'Somsak', 'Rakchat', 'Male', 46, 'Driver'),
('S2', 'Wanpen', 'Thongsuk', 'Female', 31, 'Bag'),
('S3', 'Wisarugy', 'Leelup', 'Male', 42, 'Driver'),
('S4', 'Montol', 'Kondee', 'Male', 35, 'Bag'),
('S5', 'Settapong', 'Saelee', 'Male', 51, 'Driver'),
('S6', 'Warisara', 'Ngan-prom', 'Female', 29, 'Bag'),
('S7', 'Tanya', 'Wittiya', 'Female', 55, 'Driver'),
('S8', 'Thananut', 'Santi', 'Male', 57, 'Bag'),
('S9', 'Nuttapoon', 'Ngean-roi', 'Male', 38, 'Driver'),
('S10', 'Jirarayut', 'Ngean-sib', 'Male', 46, 'Bag'),
('S11', 'Palitay', 'Sannana', 'Female', 60, 'Bag'),
('S12', 'Sorayee', 'Samrong', 'Female', 34, 'Driver'),
('S13', 'Kanuchy', 'Komlanontaburi', 'Female', 28, 'Driver'),
('S14', 'Romdone', 'Finish-leaw', 'Male', 37, 'Bag'),
('S15', 'Nunthida', 'Phapern', 'Female', 24, 'Bag');

-- --------------------------------------------------------

--
-- Table structure for table `Station`
--

CREATE TABLE `Station` (
  `StationID` text NOT NULL,
  `StationName` text NOT NULL,
  `Province` text NOT NULL,
  `BusNo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Station`
--

INSERT INTO `Station` (`StationID`, `StationName`, `Province`, `BusNo`) VALUES
('St1', 'Morchit Garage 2', 'Bangkok', '104'),
('St2', 'Queen Sirikit Park', 'Bangkok', '104'),
('St3', 'J.J. Mall', 'Bangkok', '104'),
('St4', 'Chatuchak Market', 'Bangkok', '104'),
('St5', 'BTS Mochit', 'Bangkok', '104'),
('St6', 'Headquarters of TMB Bank', 'Bangkok', '104'),
('St7', 'Central Plaza Ladprao', 'Bangkok', '104'),
('St8', 'Crime Suppression Division Thai Police', 'Bangkok', '104'),
('St9', 'Elephant Building', 'Bangkok', '104'),
('St10', 'Paolo hospital kaset', 'Bangkok', '104'),
('St11', 'Kaset Intersection', 'Bangkok', '104'),
('St12', 'Klong Prem Central Prison', 'Bangkok', '24'),
('St13', 'Don Muang Police Station', 'Bangkok', '29'),
('St13', 'Don Muang Police Station', 'Bangkok', '59'),
('St13', 'Don Muang Police Station', 'Bangkok', '510'),
('St14', 'Don Mueang International Airport', 'Bangkok', '29'),
('St14', 'Don Mueang International Airport', 'Bangkok', '59'),
('St14', 'Don Mueang International Airport', 'Bangkok', '510'),
('St15', 'Don Muang Railway Station', 'Bangkok', '59'),
('St15', 'Don Muang Railway Station', 'Bangkok', '29'),
('St15', 'Don Muang Railway Station', 'Bangkok', '510'),
('St16', 'Jea leng shop', 'Bangkok', '59'),
('St16', 'Jea leng shop', 'Bangkok', '29'),
('St16', 'Jea leng shop', 'Bangkok', '510'),
('St17', 'Lak si temple', 'Bangkok', '29'),
('St17', 'Lak si temple', 'Bangkok', '510'),
('St18', 'Laksi Intersection', 'Bangkok', '29'),
('St18', 'Laksi Intersection', 'Bangkok', '510'),
('St19', 'Police club', 'Bangkok', '29'),
('St19', 'Police club', 'Bangkok', '510'),
('St20', 'ThaiPBS', 'Bangkok', '29'),
('St20', 'ThaiPBS', 'Bangkok', '510'),
('St21', 'Rama Garden Hotel', 'Bangkok', '29'),
('St21', 'Rama Garden Hotel', 'Bangkok', '510'),
('St22', 'Daily News Building', 'Bangkok', '29'),
('St22', 'Daily News Building', 'Bangkok', '510'),
('St23', 'Phra Si Mahathat Temple', 'Bangkok', '39'),
('St23', 'Phra Si Mahathat Temple', 'Bangkok', '59'),
('St24', 'Office of Electricity (Bankhen)', 'Bangkok', '39'),
('St24', 'Office of Electricity (Bankhen)', 'Bangkok', '59'),
('St25', 'Bangkhen Garage', 'Bangkok', '39'),
('St25', 'Bangkhen Garage', 'Bangkok', '59'),
('St26', 'Department of 11th infantry', 'Bangkok', '39'),
('St26', 'Department of 11th infantry', 'Bangkok', '59'),
('St27', 'Bangbua temple', 'Bangkok', '39'),
('St27', 'Bangbua temple', 'Bangkok', '59'),
('St28', 'Sripatum University', 'Bangkok', '39'),
('St28', 'Sripatum University', 'Bangkok', '59'),
('St29', 'Royal Thai Army Chemical Department', 'Bangkok', '39'),
('St29', 'Royal Thai Army Chemical Department', 'Bangkok', '59'),
('St30', 'Maruay Garden Hotel', 'Bangkok', '39'),
('St30', 'Maruay Garden Hotel', 'Bangkok', '59'),
('St31', 'Headquarters of Bank for Agriculture and Agricultural Cooperatives', 'Bangkok', '39'),
('St31', 'Headquarters of Bank for Agriculture and Agricultural Cooperatives', 'Bangkok', '59'),
('St32', 'B.Care Medical Center Hospital', 'Bangkok', '39'),
('St33', 'Safety committee Intersection', 'Bangkok', '39'),
('St34', 'Air Force Club', 'Bangkok', '39'),
('St35', 'Bhumibol Adulyadej Hospital', 'Bangkok', '39'),
('St36', 'Ko Temple Intersection', 'Bangkok', '39'),
('St37', 'Sapan Mai', 'Bangkok', '39'),
('St38', 'Soi Saiyood', 'Bangkok', '39'),
('St39', 'Testco lotus Laksi', 'Bangkok', '39'),
('St39', 'Testco lotus Laksi', 'Bangkok', '59'),
('St40', 'Kasetsart university ( Vipawadee gate)', 'Bangkok', '29'),
('St40', 'Kasetsart university ( Vipawadee gate)', 'Bangkok', '510'),
('St41', 'Kasetsart university (Ngamwongwarn gate)', 'Bangkok', '24'),
('St41', 'Kasetsart university (Ngamwongwarn gate)', 'Bangkok', '104'),
('St42', 'Kasetsart university (Phaholyothin gate)', 'Bangkok', '39'),
('St42', 'Kasetsart university (Phaholyothin gate)', 'Bangkok', '59'),
('St44', 'Prachanivech 2 Village', 'Nonthaburi', '24'),
('St45', 'Soi Samakkee', 'Nonthaburi', '24'),
('St46', 'Dhurakij Pundit University', 'Nonthaburi', '24'),
('St47', 'Pongpetch Intersection', 'Nonthaburi', '24'),
('St48', 'Chinnakhet 1', 'Nonthaburi', '24'),
('St49', 'Chinnakhet 2', 'Nonthaburi', '24'),
('St43', 'Lam Luk Ka Intersecction', 'Bangkok', '39'),
('St43', 'Lam Luk Ka Intersecction', 'Bangkok', '59'),
('St50', 'Taladthai', 'Pathumtani', '39'),
('St50', 'Taladthai', 'Pathumtani', '510'),
('St51', 'Thammasat University', 'Pathumtani', '39'),
('St51', 'Thammasat University', 'Pathumtani', '510'),
('St52', 'Bangkok University', 'Pathumtani', '39'),
('St52', 'Bangkok University', 'Pathumtani', '510'),
('St53', 'Rangsit Garage', 'Pathumtani', '29'),
('St53', 'Rangsit Garage', 'Pathumtani', '59'),
('St54', 'Pathumvet Hospital', 'Pathumtani', '29'),
('St54', 'Pathumvet Hospital', 'Pathumtani', '59'),
('St55', 'Future Park Rangsit', 'Pathumtani', '29'),
('St55', 'Future Park Rangsit', 'Pathumtani', '39'),
('St55', 'Future Park Rangsit', 'Pathumtani', '59'),
('St55', 'Future Park Rangsit', 'Pathumtani', '510'),
('St56', 'Major Rangsit', 'Pathumtani', '29'),
('St56', 'Major Rangsit', 'Pathumtani', '39'),
('St56', 'Major Rangsit', 'Pathumtani', '59'),
('St56', 'Major Rangsit', 'Pathumtani', '510'),
('St57', 'Farm Chokchai', 'Pathumtani', '29'),
('St57', 'Farm Chokchai', 'Pathumtani', '39'),
('St57', 'Farm Chokchai', 'Pathumtani', '59'),
('St57', 'Farm Chokchai', 'Pathumtani', '510'),
('St58', 'Prayurajindarama Temple', 'Pathumtani', '29'),
('St58', 'Prayurajindarama Temple', 'Pathumtani', '39'),
('St58', 'Prayurajindarama Temple', 'Pathumtani', '59'),
('St58', 'Prayurajindarama Temple', 'Pathumtani', '510'),
('St59', 'Pat Rangsit Hospital', 'Pathumtani', '29'),
('St59', 'Pat Rangsit Hospital', 'Pathumtani', '39'),
('St59', 'Pat Rangsit Hospital', 'Pathumtani', '59'),
('St59', 'Pat Rangsit Hospital', 'Pathumtani', '510'),
('St60', 'Zeer Rangsit', 'Pathumtani', '29'),
('St60', 'Zeer Rangsit', 'Pathumtani', '39'),
('St60', 'Zeer Rangsit', 'Pathumtani', '59'),
('St60', 'Zeer Rangsit', 'Pathumtani', '510'),
('St61', 'National Memorial', 'Pathumtani', '29'),
('St61', 'National Memorial', 'Pathumtani', '510'),
('St62', 'Thammasat Garage', 'Pathumtani', '510');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;