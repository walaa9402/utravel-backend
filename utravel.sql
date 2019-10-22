-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2019 at 11:31 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `photo`) VALUES
(1, 'cairo', '1.jpg'),
(2, 'sharm el-shaikh', '2.jpg'),
(3, 'alexandria', '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `city_id` int(11) NOT NULL,
  `cover` varchar(2000) NOT NULL,
  `logo` varchar(2000) NOT NULL,
  `map_link` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `email`, `address`, `city_id`, `cover`, `logo`, `map_link`) VALUES
(1, 'El Hossam Travel', 'elhossam@gmail.com', '322-316 أبو قير، سيدي جابر، قسم سيدى جابر،، سيدي جابر، الإسكندرية', 3, '3.jpg', '3.jpg', 'https://goo.gl/maps/agkqWZwetEyvspz66');

-- --------------------------------------------------------

--
-- Table structure for table `company_phone`
--

CREATE TABLE `company_phone` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_phone`
--

INSERT INTO `company_phone` (`id`, `company_id`, `phone`) VALUES
(1, 1, '01120719197'),
(2, 1, '01224266864');

-- --------------------------------------------------------

--
-- Table structure for table `company_rate`
--

CREATE TABLE `company_rate` (
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_rate`
--

INSERT INTO `company_rate` (`company_id`, `user_id`, `package_id`, `rate`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `about` varchar(3000) NOT NULL,
  `date` bigint(20) NOT NULL,
  `adding_date` bigint(20) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `from_id`, `to_id`, `about`, `date`, `adding_date`, `cost`) VALUES
(1, 'Cairo Trip', 3, 1, 'If you\'ve a mobile application, you may want to send push notifications to users. There are some ways to send notifications, one of the most popular and easiest way is by using Firebase. It\'s a Backend-as-a-Service — BaaS application development platform. It has some features, one of which is Cloud Messaging, which is used to send targeted notifications to users. In this tutorial, I\'m going to give example how to send push notifications using Firebase from Node.js application. This includes how to setup the Firebase account and how to setup Node.js application to be able to send notifications.', 1575060793000, 1571777593000, 250);

-- --------------------------------------------------------

--
-- Table structure for table `package_photo`
--

CREATE TABLE `package_photo` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `path` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_photo`
--

INSERT INTO `package_photo` (`id`, `p_id`, `path`) VALUES
(3, 1, '1.jpg'),
(4, 1, '2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` text NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `passwd`, `city_id`) VALUES
(1, 'walaa alaa', '01120719197', '1111', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_comp_fav`
--

CREATE TABLE `user_comp_fav` (
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_comp_fav`
--

INSERT INTO `user_comp_fav` (`user_id`, `company_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`company_id`);

--
-- Indexes for table `company_rate`
--
ALTER TABLE `company_rate`
  ADD PRIMARY KEY (`company_id`,`user_id`,`package_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `from_id` (`from_id`);

--
-- Indexes for table `package_photo`
--
ALTER TABLE `package_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `user_comp_fav`
--
ALTER TABLE `user_comp_fav`
  ADD PRIMARY KEY (`user_id`,`company_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_phone`
--
ALTER TABLE `company_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package_photo`
--
ALTER TABLE `package_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD CONSTRAINT `company_phone_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `company_rate`
--
ALTER TABLE `company_rate`
  ADD CONSTRAINT `company_rate_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`),
  ADD CONSTRAINT `company_rate_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `company_rate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`from_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `package_photo`
--
ALTER TABLE `package_photo`
  ADD CONSTRAINT `package_photo_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `package` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `user_comp_fav`
--
ALTER TABLE `user_comp_fav`
  ADD CONSTRAINT `user_comp_fav_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_comp_fav_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
