-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2017 at 10:31 AM
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
('24', 'Prachaniwet 3 - Victory Monument', 'Normal', 'Ngamwongwan', 'D8'),
('29', 'Thammasat University - Hua Lumphong', 'Normal', 'Wipavadee', 'D1'),
('29', 'Thammasat University - Hua Lumphong', 'Air', 'Wipavadee', 'D1'),
('39', 'Talaadthai - Victory Monument', 'Normal', 'Phaholyothin', 'D1'),
('39', 'Bang Khan - Victory Monument', 'Air', 'Ngamwongwan', 'D1'),
('59', 'Rangsit - Victory Monument', 'Normal', 'Phaholyothin', 'D1'),
('59', 'Rangsit - Victory Monument', 'Air', 'Phaholyothin', 'D1'),
('104', 'Mochit 2 - Pakkred', 'Normal', 'Ngamwongwan', 'D7'),
('104', 'Mochit 2 - Pakkred', 'Air', 'Ngamwongwan', 'D7'),
('510', 'Thammasat University - Victory Monument', 'Air', 'Wipavadee', 'D1');

-- --------------------------------------------------------

--
-- Table structure for table `District`
--

CREATE TABLE `District` (
  `DistrictID` text NOT NULL,
  `DistrictName` text NOT NULL,
  `City` text NOT NULL,
  `Color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `District`
--

INSERT INTO `District` (`DistrictID`, `DistrictName`, `City`, `Color`) VALUES
('D1', 'Bang Khen', 'Bangkok', 'Purple'),
('D2', 'Siam Park City 1', 'Bangkok', 'Green'),
('D3', 'Mega Bangna', 'Bangkok', 'Red'),
('D4', 'Khlong Toei', 'Bangkok', 'Orange'),
('D5', 'Samae Dam', 'Bangkok', 'Pink'),
('D6', 'Rai Khing Temple', 'Nakhon Pathom', 'Yellow'),
('D7', 'Tha It', 'Nonthaburi', 'Blue'),
('D8', 'Siam Park City 2', 'Bangkok', 'Brown'),
('D9', 'Private Transport', '', 'Black'),
('D10', 'Other', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Enrollment`
--

CREATE TABLE `Enrollment` (
  `BusNo` text NOT NULL,
  `StaffID` text NOT NULL,
  `ExperiencedYear` text NOT NULL,
  `StaffType` text NOT NULL,
  `BusType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Enrollment`
--

INSERT INTO `Enrollment` (`BusNo`, `StaffID`, `ExperiencedYear`, `StaffType`, `BusType`) VALUES
('24', 'S1', '26', 'Driver', 'Normal'),
('24', 'S2', '2', 'Bag', 'Normal'),
('29', 'S3', '15', 'Driver', 'Normal'),
('29', 'S4', '5', 'Bag', 'Normal'),
('29', 'S5', '8', 'Driver', 'Air'),
('29', 'S6', '12', 'Bag', 'Air'),
('39', 'S7', '2', 'Driver', 'Normal'),
('39', 'S8', '25', 'Bag', 'Normal'),
('39', 'S9', '17', 'Driver', 'Air'),
('39', 'S10', '1', 'Bag', 'Air'),
('59', 'S12', '15', 'Driver', 'Normal'),
('59', 'S11', '5', 'Bag', 'Normal'),
('59', 'S13', '28', 'Driver', 'Air'),
('59', 'S14', '12', 'Bag', 'Air'),
('104', 'S18', '16', 'Driver', 'Normal'),
('104', 'S15', '9', 'Bag', 'Normal'),
('104', 'S19', '7', 'Driver', 'Air'),
('104', 'S16', '6', 'Bag', 'Air'),
('510', 'S20', '21', 'Driver', 'Air'),
('510', 'S17', '13', 'Bag', 'Air');

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
-- Table structure for table `Price`
--

CREATE TABLE `Price` (
  `BusNo` text NOT NULL,
  `BusType` text NOT NULL,
  `Price` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Price`
--

INSERT INTO `Price` (`BusNo`, `BusType`, `Price`) VALUES
('24', 'Normal', '6.50 - 9.00'),
('29', 'Normal', '6.50 - 9.00'),
('29', 'Air', '11.00 - 24.00'),
('39', 'Normal', '6.50 - 9.00'),
('39', 'Air', '11.00 - 24.00'),
('59', 'Normal', '6.50 - 9.00'),
('59', 'Air', '11.00 - 24.00'),
('104', 'Normal', '6.50 - 9.00'),
('104', 'Air', '11.00 - 24.00'),
('510', 'Air', '11.00 - 24.00');

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
('S15', 'Nunthida', 'Phapern', 'Female', 24, 'Bag'),
('S16', 'Mamitawee', 'Apimahaaumnaj', 'Female', 38, 'Bag'),
('S17', 'Kasidida', 'Jumphon', 'Male', 57, 'Bag'),
('S18', 'Chanom', 'Chob-many-sri', 'Male', 45, 'Driver'),
('S19', 'Tanatemple', 'Dok', 'Male', 43, 'Driver'),
('S20', 'Benyapee', 'Dokmai', 'Female', 55, 'Driver');

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
('Station_ID', 'StationName', 'Province', 'BusNo'),
('ST1', 'Mochit Garage 2', 'Bangkok', '104'),
('ST2', 'Queen Sirikit Park', 'Bangkok', '104'),
('ST3', 'J.J. Mall', 'Bangkok', '104'),
('ST4', 'Chatuchak Market', 'Bangkok', '104'),
('ST5', 'BTS Mochit', 'Bangkok', '24'),
('ST5', 'BTS Mochit', 'Bangkok', '29'),
('ST5', 'BTS Mochit', 'Bangkok', '39'),
('ST5', 'BTS Mochit', 'Bangkok', '59'),
('ST5', 'BTS Mochit', 'Bangkok', '104'),
('ST5', 'BTS Mochit', 'Bangkok', '510'),
('ST6', 'Headquarters of TMB Bank', 'Bangkok', '104'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '24'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '29'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '39'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '59'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '104'),
('ST7', 'Central Plaza Ladprao', 'Bangkok', '510'),
('ST8', 'Crime Suppression Division Thai Police', 'Bangkok', '104'),
('ST9', 'Elephant Building', 'Bangkok', '24'),
('ST9', 'Elephant Building', 'Bangkok', '39'),
('ST9', 'Elephant Building', 'Bangkok', '59'),
('ST9', 'Elephant Building', 'Bangkok', '104'),
('ST10', 'Paolo Hospital', 'Bangkok', '24'),
('ST10', 'Paolo Hospital', 'Bangkok', '39'),
('ST10', 'Paolo Hospital', 'Bangkok', '59'),
('ST10', 'Paolo Hospital', 'Bangkok', '104'),
('ST11', 'Kaset Intersection', 'Bangkok', '24'),
('ST11', 'Kaset Intersection', 'Bangkok', '39'),
('ST11', 'Kaset Intersection', 'Bangkok', '59'),
('ST11', 'Kaset Intersection', 'Bangkok', '104'),
('ST12', 'Klong Prem Central Prison', 'Bangkok', '24'),
('ST12', 'Klong Prem Central Prison', 'Bangkok', '104'),
('ST13', 'Don Muang Police Station', 'Bangkok', '29'),
('ST13', 'Don Muang Police Station', 'Bangkok', '59'),
('ST13', 'Don Muang Police Station', 'Bangkok', '510'),
('ST14', 'Don Mueang International Airport', 'Bangkok', '29'),
('ST14', 'Don Mueang International Airport', 'Bangkok', '59'),
('ST14', 'Don Mueang International Airport', 'Bangkok', '510'),
('ST15', 'Don Muang Railway Station', 'Bangkok', '29'),
('ST15', 'Don Muang Railway Station', 'Bangkok', '59'),
('ST15', 'Don Muang Railway Station', 'Bangkok', '510'),
('ST16', 'Jea Leng Shop', 'Bangkok', '29'),
('ST16', 'Jea Leng Shop', 'Bangkok', '59'),
('ST16', 'Jea Leng Shop', 'Bangkok', '510'),
('ST17', 'Lak Si Temple', 'Bangkok', '29'),
('ST17', 'Lak Si Temple', 'Bangkok', '59'),
('ST17', 'Lak Si Temple', 'Bangkok', '510'),
('ST18', 'Lak Si Intersection', 'Bangkok', '29'),
('ST18', 'Lak Si Intersection', 'Bangkok', '59'),
('ST18', 'Lak Si Intersection', 'Bangkok', '510'),
('ST19', 'Police Club', 'Bangkok', '29'),
('ST19', 'Police Club', 'Bangkok', '510'),
('ST20', 'ThaiPBS', 'Bangkok', '29'),
('ST20', 'ThaiPBS', 'Bangkok', '510'),
('ST21', 'Rama Garden Hotel', 'Bangkok', '29'),
('ST21', 'Rama Garden Hotel', 'Bangkok', '510'),
('ST22', 'Daily News Building', 'Bangkok', '29'),
('ST22', 'Daily News Building', 'Bangkok', '510'),
('ST23', 'Phra Si Mahathat Temple', 'Bangkok', '39'),
('ST23', 'Phra Si Mahathat Temple', 'Bangkok', '59'),
('ST24', 'Office of Electricity (Bankhen)', 'Bangkok', '39'),
('ST24', 'Office of Electricity (Bankhen)', 'Bangkok', '59'),
('ST25', 'Bangkhen Garage', 'Bangkok', '39'),
('ST25', 'Bangkhen Garage', 'Bangkok', '59'),
('ST26', 'Department of 11th Infantry', 'Bangkok', '39'),
('ST26', 'Department of 11th Infantry', 'Bangkok', '59'),
('ST27', 'Bangbua Temple', 'Bangkok', '39'),
('ST27', 'Bangbua Temple', 'Bangkok', '59'),
('ST28', 'Sripatum University', 'Bangkok', '39'),
('ST28', 'Sripatum University', 'Bangkok', '59'),
('ST29', 'Royal Thai Army Chemical Department', 'Bangkok', '39'),
('ST29', 'Royal Thai Army Chemical Department', 'Bangkok', '59'),
('ST30', 'Maruay Garden Hotel', 'Bangkok', '39'),
('ST30', 'Maruay Garden Hotel', 'Bangkok', '59'),
('ST31', 'Headquarters of Bank for Agriculture and Agricultural Cooperatives', 'Bangkok', '39'),
('ST31', 'Headquarters of Bank for Agriculture and Agricultural Cooperatives', 'Bangkok', '59'),
('ST32', 'B.Care Medical Center Hospital', 'Bangkok', '39'),
('ST33', 'Safety committee Intersection', 'Bangkok', '39'),
('ST34', 'Air Force Club', 'Bangkok', '39'),
('ST35', 'Bhumibol Adulyadej Hospital', 'Bangkok', '39'),
('ST36', 'Ko Temple Intersection', 'Bangkok', '39'),
('ST37', 'Sapan Mai', 'Bangkok', '39'),
('ST38', 'Soi Saiyood', 'Bangkok', '39'),
('ST39', 'Testco Lotus Laksi', 'Bangkok', '39'),
('ST39', 'Testco Lotus Laksi', 'Bangkok', '59'),
('ST40', 'Kasetsart University (Vipawadee Gate)', 'Bangkok', '29'),
('ST40', 'Kasetsart University (Vipawadee Gate)', 'Bangkok', '510'),
('ST41', 'Kasetsart University (Ngamwongwan Gate)', 'Bangkok', '24'),
('ST41', 'Kasetsart University (Ngamwongwan Gate)', 'Bangkok', '104'),
('ST42', 'Kasetsart University (Phaholyothin Gate)', 'Bangkok', '39'),
('ST42', 'Kasetsart University (Phaholyothin Gate)', 'Bangkok', '59'),
('ST43', 'Lam Luk Ka Intersection ', 'Bangkok', '39'),
('ST43', 'Lam Luk Ka Intersection ', 'Bangkok', '59'),
('ST44', 'Prachanivech 2 Village', 'Nonthaburi', '24'),
('ST45', 'Soi Samakkee', 'Nonthaburi', '24'),
('ST46', 'Dhurakij Pundit University', 'Nonthaburi', '24'),
('ST47', 'Pongpetch Intersection', 'Nonthaburi', '24'),
('ST48', 'Chinnakhet 1', 'Nonthaburi', '24'),
('ST49', 'Chinnakhet 2', 'Nonthaburi', '24'),
('ST50', 'Taladthai', 'Pathumtani', '39'),
('ST50', 'Taladthai', 'Pathumtani', '510'),
('ST51', 'Thammasat University', 'Pathumtani', '39'),
('ST51', 'Thammasat University', 'Pathumtani', '510'),
('ST52', 'Bangkok University', 'Pathumtani', '39'),
('ST52', 'Bangkok University', 'Pathumtani', '510'),
('ST53', 'Rangsit Garage', 'Pathumtani', '29'),
('ST53', 'Rangsit Garage', 'Pathumtani', '59'),
('ST54', 'Pathumvet Hospital', 'Pathumtani', '29'),
('ST54', 'Pathumvet Hospital', 'Pathumtani', '59'),
('ST55', 'Future Park Rangsit', 'Pathumtani', '29'),
('ST55', 'Future Park Rangsit', 'Pathumtani', '39'),
('ST55', 'Future Park Rangsit', 'Pathumtani', '59'),
('ST55', 'Future Park Rangsit', 'Pathumtani', '510'),
('ST56', 'Major Rangsit', 'Pathumtani', '29'),
('ST56', 'Major Rangsit', 'Pathumtani', '39'),
('ST56', 'Major Rangsit', 'Pathumtani', '59'),
('ST56', 'Major Rangsit', 'Pathumtani', '510'),
('ST57', 'Farm Chokchai', 'Pathumtani', '29'),
('ST57', 'Farm Chokchai', 'Pathumtani', '39'),
('ST57', 'Farm Chokchai', 'Pathumtani', '59'),
('ST57', 'Farm Chokchai', 'Pathumtani', '510'),
('ST58', 'Prayurajindarama Temple', 'Pathumtani', '29'),
('ST58', 'Prayurajindarama Temple', 'Pathumtani', '39'),
('ST58', 'Prayurajindarama Temple', 'Pathumtani', '59'),
('ST58', 'Prayurajindarama Temple', 'Pathumtani', '510'),
('ST59', 'Pat Rangsit Hospital', 'Pathumtani', '29'),
('ST59', 'Pat Rangsit Hospital', 'Pathumtani', '39'),
('ST59', 'Pat Rangsit Hospital', 'Pathumtani', '59'),
('ST59', 'Pat Rangsit Hospital', 'Pathumtani', '510'),
('ST60', 'Zeer Rangsit', 'Pathumtani', '29'),
('ST60', 'Zeer Rangsit', 'Pathumtani', '39'),
('ST60', 'Zeer Rangsit', 'Pathumtani', '59'),
('ST60', 'Zeer Rangsit', 'Pathumtani', '510'),
('ST61', 'National Memorial', 'Pathumtani', '29'),
('ST61', 'National Memorial', 'Pathumtani', '510'),
('ST62', 'Thammasat Garage', 'Pathumtani', '510'),
('ST63', 'Wibhawadi Hospital', 'Bangkok', '29'),
('ST63', 'Wibhawadi Hospital', 'Bangkok', '510'),
('ST64', 'Samian Nari Temple', 'Bangkok', '29'),
('ST64', 'Samian Nari Temple', 'Bangkok', '510'),
('ST65', 'Victory Monument', 'Bangkok', '24'),
('ST65', 'Victory Monument', 'Bangkok', '29'),
('ST65', 'Victory Monument', 'Bangkok', '39'),
('ST65', 'Victory Monument', 'Bangkok', '59'),
('ST65', 'Victory Monument', 'Bangkok', '510'),
('ST66', 'Major Ratchayothin', 'Bangkok', '24'),
('ST66', 'Major Ratchayothin', 'Bangkok', '39'),
('ST66', 'Major Ratchayothin', 'Bangkok', '59'),
('ST67', 'Democracy Monument', 'Bangkok', '59'),
('ST68', 'Sanam luang', 'Bangkok', '29'),
('ST69', 'The Mall Ngamwongwan', 'Nonthaburi', '104'),
('ST70', 'Pakkred', 'Nonthaburi', '104');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
