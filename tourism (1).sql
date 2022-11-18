-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2022 at 01:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) CHARACTER SET latin1 NOT NULL,
  `createuser` varchar(255) DEFAULT NULL,
  `deleteuser` varchar(255) DEFAULT NULL,
  `createbid` varchar(255) DEFAULT NULL,
  `updatebid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`, `createuser`, `deleteuser`, `createbid`, `updatebid`) VALUES
(1, 'Superuser', NULL, '1', '1', '1'),
(2, 'Admin', NULL, '1', '1', '1'),
(3, 'User', NULL, NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `CustomerId` int(5) NOT NULL,
  `RequestId` int(5) NOT NULL,
  `RequestDate` date NOT NULL,
  `PackageId` int(5) NOT NULL,
  `Manager` varchar(50) NOT NULL,
  `NoOfppl` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `packageid` int(50) NOT NULL,
  `enquiry` int(50) NOT NULL,
  `booking` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `Staffid` varchar(255) DEFAULT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `Photo` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'avatar15.jpg',
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `Staffid`, `AdminName`, `UserName`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Status`, `Photo`, `Password`, `AdminRegdate`) VALUES
(2, '10002', 'Admin', 'admin', 'John', 'Smith  ', 770546590, 'admin@gmail.com', 1, 'face19.jpg', '81dc9bdb52d04dc20036dbd8313ed055', '2021-06-21 10:18:39'),
(9, '10003', 'Admin', 'harry', 'Harry', 'Ronald ', 757537271, 'harry@gmail.com', 1, 'face27.jpg', '81dc9bdb52d04dc20036dbd8313ed055', '2021-06-21 07:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `FromDate` varchar(100) DEFAULT NULL,
  `ToDate` varchar(100) DEFAULT NULL,
  `Comment` mediumtext DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `CancelledBy` varchar(5) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `NoOfAdults` int(11) NOT NULL,
  `NoOfChildren` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`BookingId`, `PackageId`, `UserEmail`, `FromDate`, `ToDate`, `Comment`, `RegDate`, `status`, `CancelledBy`, `UpdationDate`, `NoOfAdults`, `NoOfChildren`) VALUES
(13, 5, 'gerald@gmail.com', '2020-12-11', '2020-12-11', 'Real i need to tour that place', '2020-12-11 12:13:17', 1, '', '2021-01-14 18:35:06', 0, 0),
(14, 2, 'gerald@gmail.com', '2021-01-12', '2021-01-15', 'kk', '2021-01-12 19:49:39', 2, 'u', '2021-01-14 11:20:42', 0, 0),
(15, 4, 'gerald@gmail.com', '2021-01-14', '2021-01-16', 'tour', '2021-01-14 08:19:44', 2, 'u', '2021-02-15 08:56:58', 0, 0),
(16, 2, 'gerald@gmail.com', '2021-03-26', '2021-03-31', 'I Really need to visit that place', '2021-03-24 22:48:36', 1, NULL, '2022-11-10 01:01:03', 0, 0),
(17, 6, 'admin@gmail.com', '2021-07-28', '2021-07-30', 'Test', '2021-07-24 09:51:52', 2, 'a', '2021-07-24 10:04:22', 0, 0),
(18, 1, 'admin@gmail.com', '2021-07-24', '2021-07-26', 'smart travel test', '2021-07-24 09:59:34', 1, NULL, '2021-07-24 10:01:21', 0, 0),
(19, 4, 'janhavikokadwar@gmail.com', '2022-11-12', '2022-11-25', 'asdfghjkl;', '2022-11-10 08:45:19', 1, NULL, '2022-11-10 08:46:05', 0, 0),
(20, 4, 'janhavikokadwar@gmail.com', '2022-11-11', '2022-12-02', 'asdfghjkl[]poiuytfdcvbn', '2022-11-13 07:16:20', 1, NULL, '2022-11-13 07:16:47', 0, 0),
(21, 6, 'janhavikokadwar@gmail.com', '2022-11-24', '2022-12-03', 'sdfghjkl;', '2022-11-13 09:35:54', 1, NULL, '2022-11-15 04:06:08', 0, 0),
(22, 17, 'abc@gml', '2020-12-11', '2020-12-16', 'aldshj', '2022-11-13 10:41:38', 1, NULL, NULL, 0, 0),
(23, 4, 'janhavikokadwar@gmail.com', '2022-11-25', '2022-11-10', 'dfghjkl;\'\r\n', '2022-11-13 11:11:02', 0, NULL, NULL, 0, 0),
(24, 2, 'janhavikokadwar@gmail.com', '2022-11-13', '2022-11-19', 'lsnlsnd', '2022-11-13 11:19:33', 0, NULL, NULL, 55, 0),
(25, 2, 'janhavikokadwar@gmail.com', '2022-11-12', '2022-11-20', 'qqq', '2022-11-13 11:54:05', 0, NULL, NULL, 66, 0),
(26, 1, 'janhavikokadwar@gmail.com', '2022-11-13', '2022-11-17', 'jjj', '2022-11-13 12:00:01', 0, NULL, NULL, 55, 0),
(27, 1, 'janhavikokadwar@gmail.com', '2022-11-06', '2022-11-13', 'qwert', '2022-11-13 12:00:49', 0, NULL, NULL, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `id` int(11) NOT NULL,
  `regno` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `companyname` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `companyemail` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `companyphone` int(10) NOT NULL,
  `companyaddress` varchar(255) CHARACTER SET latin1 NOT NULL,
  `companylogo` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'avatar15.jpg',
  `status` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `developer` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`id`, `regno`, `companyname`, `companyemail`, `country`, `companyphone`, `companyaddress`, `companylogo`, `status`, `developer`, `creationdate`) VALUES
(4, '1002', 'St. Paul Church', 'stpaul@gmail.com', 'Uganda', 770546590, 'Kyebando', 'church.jpg', '1', 'gerald', '2021-02-02 12:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbltourpackages`
--

CREATE TABLE `tbltourpackages` (
  `PackageId` int(11) NOT NULL,
  `PackageName` varchar(200) DEFAULT NULL,
  `PackageType` varchar(150) DEFAULT NULL,
  `PackageLocation` varchar(100) DEFAULT NULL,
  `PackagePrice` int(11) DEFAULT NULL,
  `PackageFetures` varchar(255) DEFAULT NULL,
  `PackageDetails` mediumtext DEFAULT NULL,
  `PackageImage` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `AvailableBookings` int(50) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltourpackages`
--

INSERT INTO `tbltourpackages` (`PackageId`, `PackageName`, `PackageType`, `PackageLocation`, `PackagePrice`, `PackageFetures`, `PackageDetails`, `PackageImage`, `Creationdate`, `UpdationDate`, `AvailableBookings`) VALUES
(1, 'kidepo valley Np', 'General', 'Kullu Manali India', 50000, 'Air Conditioning ,Balcony / Terrace,Cable / Satellite / Pay TV available,Ceiling Fan,Hairdryer', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'lake.jpg', '2017-05-13 14:23:44', '2022-11-16 08:16:24', 67),
(2, 'Entebbe Zoo', 'Indoor animals', 'Entebbe, Kampala,Uganda', 5433, 'Air Conditioning ,Balcony / Terrace,Cable / Satellite / Pay TV available,Ceiling Fan,Hairdryer', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'zoo.jpg', '2017-05-13 15:24:26', '2022-11-16 08:03:22', 100),
(3, 'Marchision Falls NP', 'Outdoor animals', 'Demo Demo Demo Demo Demo Demo  test', 1000, 'Air Conditioning ,Balcony / Terrace,Cable / Satellite / Pay TV available,Ceiling Fan,Hairdryer', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'mac4.jpg', '2017-05-13 16:00:58', '2022-11-16 08:03:29', 100),
(4, 'Lake Mburo NP', 'Familty and Couple', 'Kerlal', 2000, 'Air Conditioning ,Balcony / Terrace,Cable / Satellite / Pay TV available,Ceiling Fan,Hairdryer', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'images.jpg', '2017-05-13 22:39:37', '2022-11-16 08:03:35', 100),
(5, 'Queen Elizabeth', 'Outdoor animals', 'Uganda', 3000, 'Air Conditioning ,Balcony / Terrace,Cable / Satellite / Pay TV available,Ceiling Fan,Hairdryer', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'park6.jpg', '2017-05-13 22:42:10', '2022-11-16 08:04:42', 100),
(6, 'Bwindi  NP', 'Outdoor animals', 'Indonesia', 5000, 'Frree wifi, pickup and drop etc', 'Our holiday consulting is an extension of corporate travel management program and likewise we are in process of implementing online holiday solutions for clients. Apart from this we have invested heavily in employing and training our people as its primary asset differentiating between a dream and ordinary holiday. They recommend the must see places, and plan your itinerary with utmost care.\r\n\r\n', 'bwindi5.jpg', '2017-05-14 08:01:08', '2022-11-16 08:04:52', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(10) DEFAULT NULL,
  `EmailId` varchar(70) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Password`, `RegDate`, `UpdationDate`) VALUES
(16, 'John Simith', '0770546590', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-07-24 08:34:08', NULL),
(17, 'Janhavi Kokadwar', '7385404777', 'janhavikokadwar@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2022-11-10 08:44:23', NULL),
(18, 'Janhavi Kokadwar', '7385404777', '123@gmai.com', '71b3b26aaa319e0cdf6fdb8429c112b0', '2022-11-12 07:43:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`RequestId`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD KEY `FOREIGNKEY` (`packageid`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  ADD PRIMARY KEY (`PackageId`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`),
  ADD KEY `EmailId_2` (`EmailId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  MODIFY `PackageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `FOREIGNKEY` FOREIGN KEY (`packageid`) REFERENCES `tbltourpackages` (`PackageId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
