-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 08:54 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `minBalance` varchar(200) NOT NULL,
  `interestRate` varchar(200) NOT NULL,
  `overdraft` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `type`, `minBalance`, `interestRate`, `overdraft`) VALUES
(1, 'saving', '1000', '6.0', '0'),
(2, 'current', '5000', '0.0', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `authority_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `authority` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`authority_id`, `username`, `authority`) VALUES
(1, 'georgenoah40231@gmail.com', 'executive'),
(2, 'oliver_jackson32@gmail.com', 'executive'),
(3, 'sophiaeavn324@gmail.com', 'manager'),
(4, 'jacob_sinha@gmail.com', 'clerk'),
(5, 'moonedward543@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `mname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `panNumber` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `postalCode` varchar(200) NOT NULL,
  `balance` varchar(200) NOT NULL,
  `accountNumber` varchar(200) NOT NULL,
  `createdBy` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fname`, `mname`, `lname`, `contact`, `email`, `address`, `panNumber`, `city`, `country`, `postalCode`, `balance`, `accountNumber`, `createdBy`) VALUES
(1, 'Anirudh', 'Rakesh', 'Shingala', '9969504321', 'anirudh14@gmail.com', '303 Mahavir Sadan', 'ADEFS4567M', 'Mumbai', 'India', '400089', '1000', 'AC2085718399L', 'oliver_jackson32@gmail.com'),
(2, 'Nilesh', 'Prakash', 'Singh', '8453245389', 'nilesh1698@gmail.com', '503 Hari Mahadev', 'FEDGS3245C', 'Pune', 'India', '780008', '6000', 'AC2235718399L', 'oliver_jackson32@gmail.com'),
(3, 'Buddghosh', 'Ramdhan', 'Shirsat', '8421536700', 'buddghosh1411@gmail.com', '304 Ramweshwar Park', 'REDBS2365H', 'Bangalore', 'India', '890007', '6000', 'AC2085700099L', 'oliver_jackson32@gmail.com'),
(4, 'Tarun', 'Shaam', 'Parmar', '7797860054', 'tarun111@gmail.com', '404 Nahpravesh', 'BHEDP3268L', 'Gujarat', 'India', '400990', '23000', 'AC2056818399L', 'georgenoah40231@gmail.com'),
(5, 'Sanchit', 'Manoj', 'Singh', '9869505118', 'sanchit0210@gmail.com', '202 Sundar Darshan', 'BHRES2356T', 'Mumbai', 'India', '401105', '307500', 'AC3425718399L', 'georgenoah40231@gmail.com'),
(6, 'Ravikant', 'Ramgopal', 'Sharma', '9029956790', 'ravikant1611@gmail.com', '305 Nirmal Park', 'FHTYS3478P', 'Delhi', 'India', '401105', '45200', 'AC8184518699L', 'georgenoah40231@gmail.com'),
(7, 'Shreyans', 'Ritik', 'Ghosalia', '8764533214', 'shreyans1202@gmail.com', '103 Shanti Park', 'BNGHG4793E', 'Bhagalpur', 'India', '402304', '66000', 'AC4582412399L', 'oliver_jackson32@gmail.com'),
(8, 'Kalpesh', 'Suresh', 'Kolwanda', '9021375649', 'kalpesh0812@gmail.com', '204 Swati Nagar', 'RTYEK2232H', 'Noida', 'India', '345490', '234534', 'AC4267658399L', 'oliver_jackson32@gmail.com'),
(9, 'Sumil', 'Aakash', 'Jain', '9323853675', 'sumil140@gmail.com', '605 Sheetal Shopping Center', 'NMGJJ2316R', 'Chennai', 'India', '600098', '89000', 'AC7085342839L', 'oliver_jackson32@gmail.com'),
(10, 'Shaurya', 'Swapnil', 'Roy', '9866095467', 'shaurya342@gmail.com', '401 Swaparan Tower', 'FDERR1243U', 'Pune', 'India', '503291', '81111', 'AC8084130857L', 'georgenoah40231@gmail.com'),
(11, 'Shawn', 'Brad', 'Mathew', '8573426780', 'shawn213@gmail.com', '301 Swami Complex', 'AFRTM4948S', 'Igatpuri', 'India', '600362', '5000', 'AC1184594588L', 'georgenoah40231@gmail.com'),
(12, 'Charlie', 'Noah', 'Twister', '8649328941', 'charlie32@abc.com', 'Time Square', 'BHRED2134D', 'New York', 'United States of America', '302134', '23500', 'AC1388451879L', 'georgenoah40231@gmail.com'),
(13, 'Karan', 'Singh', 'Rajput', '76453621832', 'abc@def.ghi', 'Anywhere', 'QWERT1234A', 'Mumbai', 'United States of America', '123456', '22250', 'AC8398877420L', 'georgenoah40231@gmail.com'),
(14, 'Raj', 'Suresh', 'Kotadia', '98765458761', 'abc@pqr.xyz', 'SomeWhere', 'QWERT1234Q', 'Time Square', 'USA', '567432', '13500', 'AC8398877580L', 'georgenoah40231@gmail.com'),
(15, 'Hyatt Kirkland', 'Hall Kramer', 'Amethyst Simmons', 'Sit rerum sed incidunt illo rem', 'xyme@mailinator.net', 'Quos omnis vel ullamco quos dolor nostrud facere earum voluptates consectetur cillum debitis et dolores tempor incididunt in', '970', 'Cum pariatur Adipisci est tempore facere sint laudantium minim', 'Aperiam praesentium ab adipisicing et', '31', '1000', 'AC5653000000L', 'georgenoah40231@gmail.com');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `accountAssign` AFTER INSERT ON `customer` FOR EACH ROW BEGIN 
DECLARE acctId int(10) DEFAULT 0;
SELECT account_type.id into acctId FROM account_type WHERE account_type.minBalance = new.balance;
INSERT INTO customer_has_account(customer_id,account_id,date) values(new.id,acctId,NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_has_account`
--

CREATE TABLE `customer_has_account` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(200) NOT NULL,
  `account_id` varchar(200) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_has_account`
--

INSERT INTO `customer_has_account` (`id`, `customer_id`, `account_id`, `date`) VALUES
(1, '1', '1', '2018-07-15 23:07:52'),
(2, '2', '2', '2018-07-15 23:07:52'),
(3, '3', '2', '2018-07-15 23:07:52'),
(4, '4', '1', '2018-07-15 23:07:52'),
(5, '5', '1', '2018-07-15 23:07:52'),
(6, '6', '2', '2018-07-15 23:07:52'),
(7, '7', '1', '2018-07-15 23:07:52'),
(8, '8', '2', '2018-07-15 23:07:52'),
(9, '9', '1', '2018-07-15 23:07:52'),
(10, '10', '1', '2018-07-15 23:07:52'),
(11, '11', '2', '2018-07-17 05:56:37'),
(12, '12', '1', '2018-07-29 00:24:04'),
(13, '13', '1', '2018-08-04 12:00:36'),
(14, '14', '1', '2018-08-04 12:25:11'),
(15, '15', '1', '2018-08-10 11:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `fromAccount` varchar(200) NOT NULL,
  `toAccount` varchar(200) NOT NULL,
  `mode` varchar(200) NOT NULL,
  `method` varchar(200) NOT NULL,
  `date` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  `transferredBy` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `fromAccount`, `toAccount`, `mode`, `method`, `date`, `amount`, `transferredBy`) VALUES
(13, 'AC2085718399L', 'self', 'cash', 'Deposit', '2018/07/21 22:01:19', '1000', 'georgenoah40231@gmail.com'),
(14, 'AC2085718399L', 'self', 'cash', 'Withdraw', '2018/07/21 22:04:27', '1000', 'georgenoah40231@gmail.com'),
(15, 'AC2085718399L', 'self', 'cash', 'Withdraw', '2018/07/21 22:04:36', '1000', 'georgenoah40231@gmail.com'),
(16, 'AC2085718399L', 'self', 'cash', 'Withdraw', '2018/07/21 22:04:45', '1000', 'georgenoah40231@gmail.com'),
(17, 'AC2235718399L', 'self', 'cash', 'Withdraw', '2018/07/21 22:07:44', '300', 'georgenoah40231@gmail.com'),
(18, 'AC2235718399L', 'self', 'cash', 'Deposit', '2018/07/21 22:07:59', '400', 'georgenoah40231@gmail.com'),
(19, 'AC2235718399L', 'self', 'cash', 'Withdraw', '2018/07/21 22:08:11', '100', 'georgenoah40231@gmail.com'),
(20, 'AC2235718399L', 'AC2085700099L', 'imps', 'Other Bank Account', '2018/07/21 23:50:38', '1000', 'georgenoah40231@gmail.com'),
(21, 'AC2085700099L', 'self', 'cash', 'Withdraw', '2018/07/21 23:53:49', '1000', 'georgenoah40231@gmail.com'),
(22, 'AC2085700099L', 'self', 'cash', 'Withdraw', '2018/07/21 23:54:01', '1000', 'georgenoah40231@gmail.com'),
(23, 'AC2085700099L', 'self', 'cash', 'Withdraw', '2018/07/21 23:54:12', '1000', 'georgenoah40231@gmail.com'),
(24, 'AC2085700099L', 'self', 'cash', 'Deposit', '2018/07/22 00:01:19', '3000', 'georgenoah40231@gmail.com'),
(25, 'AC2235718399L', 'self', 'cash', 'Deposit', '2018/07/22 00:05:19', '1000', 'georgenoah40231@gmail.com'),
(26, 'AC3425718399L', 'AC8184518699L', 'imps', 'Other Bank Account', '2018/07/22 00:06:07', '200', 'georgenoah40231@gmail.com'),
(27, 'AC3425718399L', 'self', 'cash', 'Deposit', '2018/07/22 00:06:18', '200', 'georgenoah40231@gmail.com'),
(28, 'AC1388451879L', 'self', 'cash', 'Deposit', '2018/07/29 00:26:18', '12500', 'georgenoah40231@gmail.com'),
(29, 'AC3425718399L', 'AC1388451879L', 'imps', 'Other Bank Account', '2018/07/29 00:28:55', '10000', 'georgenoah40231@gmail.com'),
(30, 'AC8398877420L', 'self', 'cash', 'Deposit', '2018/08/04 12:01:22', '12500', 'georgenoah40231@gmail.com'),
(31, 'AC8398877420L', 'self', 'cash', 'Withdraw', '2018/08/04 12:01:59', '1250', 'georgenoah40231@gmail.com'),
(32, 'AC3425718399L', 'AC8398877420L', 'imps', 'Other Bank Account', '2018/08/04 12:02:42', '10000', 'georgenoah40231@gmail.com'),
(33, 'AC8398877580L', 'self', 'cheque', 'Deposit', '2018/08/04 12:27:07', '500', 'georgenoah40231@gmail.com'),
(34, 'AC8398877580L', 'self', 'cash', 'Withdraw', '2018/08/04 12:27:44', '500', 'georgenoah40231@gmail.com'),
(35, 'AC3425718399L', 'AC8398877580L', 'imps', 'Other Bank Account', '2018/08/04 12:28:24', '12500', 'georgenoah40231@gmail.com'),
(36, 'AC8084130857L', 'self', 'cash', 'Deposit', '2018/08/10 11:52:40', '12345', 'georgenoah40231@gmail.com'),
(37, 'AC8084130857L', 'self', 'cash', 'Withdraw', '2018/08/10 11:53:04', '1234', 'georgenoah40231@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `enabled` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `enabled`) VALUES
(1, 'George Noah', 'georgenoah40231@gmail.com', '1234', 'false'),
(2, 'Oliver Jackson', 'oliver_jackson32@gmail.com', '1234', 'true'),
(3, 'Sophia Evan', 'sophiaeavn324@gmail.com', '1234', 'true'),
(4, 'Jacob Sinha', 'jacob_sinha@gmail.com', '1234', 'true'),
(5, 'Edward Moon', 'moonedward543@gmail.com', '1234', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`authority_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_has_account`
--
ALTER TABLE `customer_has_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `authority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer_has_account`
--
ALTER TABLE `customer_has_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
