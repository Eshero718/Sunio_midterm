-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2025 at 07:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment table`
--

CREATE TABLE `appointment table` (
  `appointmentID` varchar(25) NOT NULL,
  `doctorID` varchar(25) NOT NULL,
  `patientID` varchar(25) NOT NULL,
  `date` varchar(25) NOT NULL,
  `time` varchar(25) NOT NULL,
  `room` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment table`
--

INSERT INTO `appointment table` (`appointmentID`, `doctorID`, `patientID`, `date`, `time`, `room`) VALUES
('01', '09', '1', '09/10/25', '1:37pm', '03'),
('02', '08', '2', '09/12/25', '2:31pm', '4');

-- --------------------------------------------------------

--
-- Table structure for table `billing table`
--

CREATE TABLE `billing table` (
  `billID` varchar(25) NOT NULL,
  `patientID` varchar(25) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `paymentStatus` varchar(25) NOT NULL,
  `paymentDate` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing table`
--

INSERT INTO `billing table` (`billID`, `patientID`, `amount`, `paymentStatus`, `paymentDate`) VALUES
('01', '1', '10000', 'paid', '09/19/25'),
('02', '2', '15000', 'paid', '09/18/25');

-- --------------------------------------------------------

--
-- Table structure for table `doctors table`
--

CREATE TABLE `doctors table` (
  `doctorID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `specialization` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors table`
--

INSERT INTO `doctors table` (`doctorID`, `name`, `lastname`, `specialization`, `email`) VALUES
('08', 'Curl', 'Sumugat', 'Doctor in Heart Failure', 'drcurl@gmail.com'),
('09', 'Jian', 'Tio', 'doctor in Cancer', 'jian@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patients table`
--

CREATE TABLE `patients table` (
  `patientID` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `middleinitials` varchar(25) NOT NULL,
  `age` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `address` varchar(25) NOT NULL,
  `dataofbirth` varchar(25) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `diagnosis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients table`
--

INSERT INTO `patients table` (`patientID`, `name`, `lastname`, `middleinitials`, `age`, `gender`, `address`, `dataofbirth`, `mobile`, `diagnosis`) VALUES
('1', 'Jose', 'Diaz', 'C', '25', 'Male', 'Calumpang Molo Iloilo Cit', '07/29/2000', '09071544962', 'Cancer'),
('2', 'Glaiza', 'Manjero', 'E', '30', 'Female', 'Cochero Molo Iloilo City', '04/5/1995', '09956683425', 'Heart failure');

-- --------------------------------------------------------

--
-- Table structure for table `staff table`
--

CREATE TABLE `staff table` (
  `staffID` varchar(25) NOT NULL,
  `fullname` varchar(25) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff table`
--

INSERT INTO `staff table` (`staffID`, `fullname`, `mobile`, `email`, `password`) VALUES
('05', 'Jian Tio', '09706372629', 'jian@gmail.com', 'jian34'),
('04', 'Curl Sumugat', '09955409121', 'drcurl@gmail.com', 'curl12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment table`
--
ALTER TABLE `appointment table`
  ADD PRIMARY KEY (`appointmentID`),
  ADD UNIQUE KEY `doctorID` (`doctorID`,`patientID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `billing table`
--
ALTER TABLE `billing table`
  ADD PRIMARY KEY (`billID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `doctors table`
--
ALTER TABLE `doctors table`
  ADD PRIMARY KEY (`doctorID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `patients table`
--
ALTER TABLE `patients table`
  ADD PRIMARY KEY (`patientID`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `staff table`
--
ALTER TABLE `staff table`
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment table`
--
ALTER TABLE `appointment table`
  ADD CONSTRAINT `appointment table_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients table` (`patientID`);

--
-- Constraints for table `billing table`
--
ALTER TABLE `billing table`
  ADD CONSTRAINT `billing table_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patients table` (`patientID`);

--
-- Constraints for table `doctors table`
--
ALTER TABLE `doctors table`
  ADD CONSTRAINT `doctors table_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `appointment table` (`doctorID`);

--
-- Constraints for table `staff table`
--
ALTER TABLE `staff table`
  ADD CONSTRAINT `staff table_ibfk_1` FOREIGN KEY (`email`) REFERENCES `doctors table` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
