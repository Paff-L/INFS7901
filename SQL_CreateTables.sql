-- phpMyAdmin SQL Dump
-- version 5.1.1deb3+bionic1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2022 at 02:09 PM
-- Server version: 8.0.27
-- PHP Version: 7.2.24-0ubuntu0.18.04.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `P3`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL,
  `FirstName` char(20) NOT NULL,
  `LastName` char(20) NOT NULL,
  `Gender` char(20) NOT NULL,
  `DOB` date NOT NULL,
  `Phone` char(20) NOT NULL,
  `Address` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Points` int NOT NULL,
  `VipID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Gender`, `DOB`, `Phone`, `Address`, `Points`, `VipID`) VALUES
(1, 'Luo', 'Valley', 'female', '1983-04-18', '(04) 9126 4896', '10 Insignia Way BOULDER Western Australia 6432', 3654, 3),
(2, 'Jonathan', 'Tincob', 'Male', '1971-06-08', '(04) 3909 9880', '128 Henry Street GEELONG Victoria 3220', 2547, 2),
(3, 'Elena', 'Udrea', 'female', '1970-07-11', '(04) 4033 4041', '57 Mackie Street NOWRA New South Wales 2541', 1239, 1),
(4, 'Olivia', 'Abe', 'female', '1996-01-28', '(04) 6101 7194', '99 Quayside Vista CANBERRA Australian Capital Territory 2601', 6698, 5),
(5, 'Renata', 'Lucia', 'female', '1990-03-11', '(04) 4040 1276', '36 Sydney Road MURRAGAMBA New South Wales 2850', 3586, 3),
(6, 'Martin', 'Wat', 'male', '1994-04-06', '(04) 8361 1395', '22 High Street POINT SOUTTAR South Australia 5575', 4216, 4),
(7, 'Harry', 'Crofts', 'male', '1964-05-26', '(04) 9067 5399', '47 Baker Street KRONKUP Western Australia 6330', 2658, 2),
(8, 'Jamie', 'Carllyle', 'female', '1976-01-13', '(04) 5344 5524', '99 Crofts Road NOWA Victoria 3887', 1200, 1),
(9, 'Mike', 'House', 'male', '1991-03-21', '(04) 4290 4708', '87 Jacabina Court WOLLONGONG NORTH New South Wales 2500', 726, 1),
(10, 'Lydia', 'Daisy', 'female', '1987-12-08', '(04) 3512 1440', '71 Delan Road SKYRING RESERVE Queensland 4671', 3954, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Offline`
--

CREATE TABLE `Offline` (
  `OrderID` int NOT NULL,
  `PayMethod` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Offline`
--

INSERT INTO `Offline` (`OrderID`, `PayMethod`) VALUES
(1, 'Card'),
(2, 'Cash'),
(4, 'Card'),
(5, 'Card'),
(8, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `Online`
--

CREATE TABLE `Online` (
  `OrderID` int NOT NULL,
  `Status` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Online`
--

INSERT INTO `Online` (`OrderID`, `Status`) VALUES
(3, 'Delivered'),
(6, 'Delivered'),
(7, 'Not Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItem`
--

CREATE TABLE `OrderItem` (
  `OrderID` int NOT NULL,
  `ItemName` char(20) NOT NULL,
  `Quantity` float NOT NULL,
  `Price` float NOT NULL,
  `ProductID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `OrderItem`
--

INSERT INTO `OrderItem` (`OrderID`, `ItemName`, `Quantity`, `Price`, `ProductID`) VALUES
(1, 'Yoghurt', 2, 8, 5),
(2, 'Shampoo', 1, 11, 7),
(3, 'Carrot', 2, 4, 1),
(3, 'Patato', 1, 2, 4),
(4, 'Butter', 1, 6, 6),
(5, 'Strauberry', 2, 31.2, 3),
(6, 'Yoghurt', 2, 8, 5),
(7, 'Tomato', 2, 27.6, 2),
(8, 'Shampoo', 1, 11, 7),
(8, 'Strawberry', 1, 15.6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `Date` date NOT NULL,
  `Amounts` float NOT NULL,
  `OrderType` char(20) NOT NULL,
  `AddedPoints` int NOT NULL,
  `CustomerID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `Date`, `Amounts`, `OrderType`, `AddedPoints`, `CustomerID`) VALUES
(1, '2021-11-02', 8, 'Offline', 8, 3),
(2, '2021-12-28', 11, 'Offline', 11, 1),
(3, '2022-01-02', 6, 'Online', 6, 9),
(4, '2022-02-18', 6, 'Offline', 6, 4),
(5, '2022-03-16', 31.2, 'Offline', 31, 10),
(6, '2022-03-25', 8, 'Online', 8, 2),
(7, '2022-04-04', 2, 'Online', 2, 3),
(8, '2022-04-13', 26.6, 'Offline', 26, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `ProductID` int NOT NULL,
  `PName` char(20) NOT NULL,
  `UnitPrice` float NOT NULL,
  `Stock` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`ProductID`, `PName`, `UnitPrice`, `Stock`) VALUES
(1, 'Carrot', 2, 4.7),
(2, 'Tomato', 13.8, 16.1),
(3, 'Strawberry', 15.6, 13.7),
(4, 'Patato', 2, 6.7),
(5, 'Yoghurt', 4, 26),
(6, 'Butter', 6, 15),
(7, 'Shampoo', 11, 3),
(8, 'Banana', 3.2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `VIP`
--

CREATE TABLE `VIP` (
  `VipID` int NOT NULL,
  `VipType` char(20) DEFAULT NULL,
  `Points` char(20) DEFAULT NULL,
  `Discounts` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `VIP`
--

INSERT INTO `VIP` (`VipID`, `VipType`, `Points`, `Discounts`) VALUES
(1, 'Bronze', '<2000', '1'),
(2, 'Silver', '2000-3000', '0.95'),
(3, 'Gold', '3000-4000', '0.9'),
(4, 'Diamond', '4000-5000', '0.85'),
(5, 'Platinum', '>5000', '0.8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `VipID` (`VipID`);

--
-- Indexes for table `Offline`
--
ALTER TABLE `Offline`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `Online`
--
ALTER TABLE `Online`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD PRIMARY KEY (`OrderID`,`ItemName`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `VIP`
--
ALTER TABLE `VIP`
  ADD PRIMARY KEY (`VipID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`VipID`) REFERENCES `VIP` (`VipID`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `Offline`
--
ALTER TABLE `Offline`
  ADD CONSTRAINT `Offline_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Online`
--
ALTER TABLE `Online`
  ADD CONSTRAINT `Online_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD CONSTRAINT `OrderItem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
