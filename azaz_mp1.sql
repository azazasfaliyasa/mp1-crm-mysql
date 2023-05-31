-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 12:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azaz_mp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `Id` bigint(20) UNSIGNED NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role_id` int(10) UNSIGNED DEFAULT NULL,
  `Verified` enum('true','false') DEFAULT NULL,
  `Active` enum('true','false') DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`Id`, `Username`, `Password`, `Role_id`, `Verified`, `Active`, `Created_at`, `Updated_at`) VALUES
(1, 'admin', 'admin123', 1, 'true', 'true', '2023-05-30 18:54:39', '2023-05-30 18:54:39'),
(2, 'superadmin', 'superadmin123', 2, 'true', 'true', '2023-05-30 18:55:22', '2023-05-30 18:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `Avatar`, `Created_at`, `Updated_at`) VALUES
(7, 'Michael', 'Lawson', 'michael.lawson@reqres.in', 'https://reqres.in/img/faces/7-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29'),
(8, 'Lindsay', 'Ferguson', 'lindsay.ferguson@reqres.in', 'https://reqres.in/img/faces/8-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29'),
(9, 'Tobias', 'Funke', 'tobias.funke@reqres.in', 'https://reqres.in/img/faces/9-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29'),
(10, 'Byron', 'Fields', 'byron.fields@reqres.in', 'https://reqres.in/img/faces/10-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29'),
(11, 'George', 'Edwards', 'george.edwards@reqres.in', 'https://reqres.in/img/faces/11-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29'),
(12, 'Rachel', 'Howell', 'rachel.howell@reqres.in', 'https://reqres.in/img/faces/12-image.jpg', '2023-05-30 19:05:29', '2023-05-30 19:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `register_approval`
--

CREATE TABLE `register_approval` (
  `id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `Role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `Role_name`) VALUES
(1, 'admin'),
(2, 'super_admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Role_id` (`Role_id`);

--
-- Indexes for table `register_approval`
--
ALTER TABLE `register_approval`
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `super_admin_id` (`super_admin_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actors`
--
ALTER TABLE `actors`
  ADD CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `register_approval`
--
ALTER TABLE `register_approval`
  ADD CONSTRAINT `register_approval_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `actors` (`Id`),
  ADD CONSTRAINT `register_approval_ibfk_2` FOREIGN KEY (`super_admin_id`) REFERENCES `actors` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
