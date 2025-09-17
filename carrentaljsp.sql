-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 09:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrentaljsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `BookingNumber` int(10) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` varchar(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(5, 67226469, 'amit@gmail.com', 1, '2022-04-30', '2022-05-02', 'I want to book your car for 2 days', 'Confirm', '2022-04-30 06:44:39', '2022-04-30 07:08:18'),
(6, 35574449, 'abhi@gmail.com', 1, '2022-04-30', '2022-05-03', 'I want to book your car for 3 days', 'Confirm', '2022-04-30 07:36:54', '2022-04-30 07:45:20'),
(7, 6209441, 'rohit@gmail.com', 2, '2022-04-01', '2022-05-04', 'I want to book your car for 3 days', 'Confirm', '2022-04-30 07:40:20', '2022-04-30 07:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Maruti', '2022-04-25 09:45:12', '2022-04-25 09:47:27'),
(2, 'BMW', '2022-04-25 09:47:37', NULL),
(3, 'Hyundai', '2022-04-25 09:48:14', NULL),
(4, 'Toyota', '2022-04-25 09:52:40', NULL),
(5, 'KIA', '2022-04-25 09:52:47', NULL),
(6, 'Mahindra', '2022-04-25 09:53:03', NULL),
(7, 'Tata Motors', '2022-04-25 09:53:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contactusquery`
--

CREATE TABLE `contactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactusquery`
--

INSERT INTO `contactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Ankit Mathur', 'ankit123@gmail.com', '9632587410', 'I want to enquiry for car rent', '2022-04-27 11:30:34', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(1, 'Abhishek Pandey', 'abhi@gmail.com', '1234', '1234567890', '1999-07-15', 'Narela Sankari Bhopal\r\n\r\n', 'Bhopal', 'India', '2022-04-25 09:08:21', '2022-04-27 07:26:15'),
(2, 'Rohit Raj', 'rohit@gmail.com', '1234', '9632587410', '2000-08-16', 'Indrapuri Bhopal', 'Bhopal', 'India', '2022-04-25 09:10:32', '2022-04-29 07:38:10'),
(3, 'Amit Kumar', 'amit@gmail.com', '1234', '9632587410', '1999-04-18', 'Indrapuri Bhopal\r\n\r\n\r\n', 'Bhopal', 'India', '2022-04-29 16:54:09', '2022-04-30 07:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` varchar(350) DEFAULT NULL,
  `PricePerDay` decimal(15,2) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` varchar(15) DEFAULT 'no',
  `PowerDoorLocks` varchar(15) DEFAULT 'no',
  `AntiLockBrakingSystem` varchar(15) DEFAULT 'no',
  `BrakeAssist` varchar(15) DEFAULT 'no',
  `PowerSteering` varchar(15) DEFAULT 'no',
  `DriverAirbag` varchar(15) DEFAULT 'no',
  `PassengerAirbag` varchar(15) DEFAULT 'no',
  `PowerWindows` varchar(15) DEFAULT 'no',
  `CDPlayer` varchar(15) DEFAULT 'no',
  `CentralLocking` varchar(15) DEFAULT 'no',
  `CrashSensor` varchar(15) DEFAULT 'no',
  `LeatherSeats` varchar(15) DEFAULT 'no',
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'BMW Sedan', 2, 'The Diesel engine is 1995 cc while the Petrol engine is 1998 cc and 2998 cc . It is available with Automatic transmission. Depending upon the variant and fuel type the 3 Series has a mileage of 11.86 to 20.37 kmpl & Ground clearance of 3 Series is 165mm. The 3 Series is a 5 seater.', '1500.00', 'Diesel', 2020, 5, '11.jpg', '12.jpg', '13.jpg', '14.jpg', '15.jpg', 'yes', 'no', 'no', 'yes', 'no', 'yes', 'yes', 'no', 'yes', 'no', 'no', 'yes', '2022-04-30 06:33:08', '2022-04-30 06:33:08'),
(2, 'BMW 7 Series', 2, 'BMW 7 Series price starts at &#8377; 1.42 Crore and goes upto &#8377; 1.76 Crore (Avg. ex-showroom). 7 Series comes in 5 variants. The price of 7 Series diesel base ...', '1000.00', 'Diesel', 2021, 4, '21.jpg', '22.jpg', '23.jpg', '24.jpg', '25.jpg', 'yes', 'no', 'no', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'no', 'yes', 'yes', '2022-04-30 06:34:57', '2022-04-30 06:40:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactusquery`
--
ALTER TABLE `contactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contactusquery`
--
ALTER TABLE `contactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
