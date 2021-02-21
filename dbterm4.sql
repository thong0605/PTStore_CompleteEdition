-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 11:27 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbterm4`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `fullname`, `photo`, `email`, `birthday`, `phone`, `gender`, `address`, `activated`, `status`, `created`, `roleId`) VALUES
(2, 'hongson123', '$2a$10$5J9Yh1T2d/qXyWgm/wIwlOvRCdS3CDTH3yD29gdEdIWpPEmkpA.di', 'Nguyen Hong Son', 'signup.png', 'son.neh260@aptechlearning.edu.vn', NULL, '+84704118881', NULL, 'Thanh Xuan ', 1, 1, '2020-12-22', 2),
(3, 'ngoctu123', '$2a$10$CSB6g0M8Nn7EKqtrF35nrOdGnemmDmWNZWfRPOtkpl/8Kq0oelBDW', 'Le Ngoc Tu', 'retrieve.png', 'ngoctu123@gmail.com', NULL, '0123456789', NULL, 'Thanh Xuan 14, District 12', 1, 1, '2020-12-23', 2),
(8, 'ngoctu1234', '$2a$10$b0Jh1b0ngZMjxjsKFIpRsee6/l3kpAlpvh3/XC2wF8mNhJLxtcNXm', 'Le Ngoc Kien', 'retrieve.png', 'son.nh260@aptechlearning.edu.vn', '2020-12-01', '+84704118881', b'1', 'Thanh Xuan 14, District 12', 1, 1, '2020-12-25', 3),
(10, 'nguyensao12', '$2a$10$52fpCiTr1/UEk1DQWFG44.ORi3iyqye5QsVFCnSSOQsFYuJYfu3oy', 'Nguyen Sao', 'retrieve.png', 'son.nh260@aptechlearning.edu.vn', NULL, '+84704118881', NULL, 'Thanh Xuan 14, District 12', 1, 1, '2021-01-03', 2),
(11, 'thuhuyen12', '$2a$10$tAZDR4vZGjDb2U36I5Xq.uCtoPD7o7wLuLARN1yHQWFJwlgWZCX9.', 'Nguyen Thu Huyen', 'retrieve.png', 'huyen26@aptechlearning.edu.vn', NULL, '+8470411987', NULL, 'Thanh An', 1, 1, '2021-01-03', 1),
(12, 'phuongthong12', '$2a$10$PBe57J8Nz4ATvumZSzlGxeD0kaos0ItPyKI/ucMe2h93jf7yl5/gm', 'Nguyen Phuong Minh Thong', 'retrieve.png', 'son.nh260@aptechlearning.vn', '2021-01-01', '+84704118881', b'1', 'Thanh Xuan 14, District 12', 1, 1, '2021-01-06', 3),
(13, 'hoangphuc123', '$2a$10$XXe.NqcsOf1PDkMy7nmNle2YuCgK8.Njj24AC8sch23AEkiiNgHc6', 'Ngo Hoang Le Phuc', 'retrieve.png', 's260@aptechlearning.edu.vn', NULL, '+84704123412', NULL, 'Thanh Xuan 14, District 12', 1, 1, '2021-01-06', 2),
(14, 'username12', '$2a$10$nV.3XVnqAcC5Ghb3hd06eOwFVB.h.mPWShF4npPzo5Tgj2nUijUWa', 'nguyen hong phuc', 'retrieve.png', 'heyboykute2000@gmail.com', '2021-01-20', '0389271514', b'1', 'Thanh Xuan 14, District 12', 1, 1, '2021-01-06', 3),
(15, 'ngocphuc123', '$2a$10$iugw.r0J/rd4RxGidVlYN.re0N3laP6H1AnRfx5ISDnCr0PMMJReO', 'Le Ngoc Phuc', 'retrieve.png', 'son.nh260@aptechlearning.edu.vn', NULL, '+847041352345', NULL, 'Thanh Xuan 14, District 12', 1, 1, '2021-01-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `logo`) VALUES
(1, 'SAMSUNG', 'Samsung.jpg'),
(2, 'OPPO', 'Oppo.jpg'),
(3, 'acer', 'Acer.png'),
(4, 'APPLE', 'Apple.png'),
(5, 'ASUS', 'Asus.png'),
(6, 'Canon', 'Canon.png'),
(7, 'DELL', 'Dell.png'),
(8, 'mSi', 'Msi.jpg'),
(9, 'Nikon', 'Nikon.png'),
(10, 'NOKIA', 'Nokia.jpg'),
(11, 'SONY', 'Sony.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Smart Phone', 1),
(2, 'Smart TV', 1),
(3, 'CAMERA', 1),
(4, 'LAPTOP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderId`, `productId`, `quantity`, `amount`) VALUES
(1, 2, 1, 6.3),
(2, 3, 1, 8),
(2, 4, 1, 10),
(3, 3, 1, 10),
(4, 10, 1, 0),
(4, 11, 1, 11.27),
(5, 10, 1, 8.91),
(6, 1, 3, 18.9),
(6, 20, 2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `accountId` int(11) NOT NULL,
  `payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderDate`, `address`, `description`, `phone`, `status`, `accountId`, `payment`) VALUES
(1, '2020-01-02', 'District 12', 'fast', '0767291946', 1, 8, 1),
(2, '2020-01-02', 'district 1', 'fast', '0123456789', 1, 8, 2),
(3, '2020-12-28', 'district 4', 'fasst', '012345678', 1, 8, 2),
(4, '2021-01-04', 'District 12', 'fast', '+84704118854', 1, 8, 1),
(5, '2021-01-05', 'Ho Chi Minh City', 'fast and furious', '+8470413245', 1, 8, 1),
(6, '2021-01-06', 'Thanh Xuan 14, District 12, hcm', 'fast and furious', '0704118881', 1, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` double NOT NULL,
  `unitBrief` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `special` bit(1) NOT NULL,
  `discount` double NOT NULL,
  `categoryId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `accountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `photo`, `quantity`, `unitPrice`, `unitBrief`, `description`, `special`, `discount`, `categoryId`, `brandId`, `activated`, `status`, `created`, `accountId`) VALUES
(1, 'Samsung j7 Prime', 'DT005.jpg', 2, 7, 'one', 'wellllllllllllllllllllll\r\n', b'1', 10, 1, 1, 1, 1, '2020-12-25', 2),
(2, 'OppoF7', 'DT009.jpg', 2, 10, 'one', 'new product', b'1', 10, 1, 2, 1, 1, '2020-12-26', 2),
(3, 'Iphone X', 'DT001.jpg', 2, 7, 'one', '<p>wellllllllllllllllllllll</p>\r\n', b'1', 10, 1, 4, 1, 1, '2020-12-26', 2),
(4, 'Iphone6', 'DT002.jpg', 2, 7, 'one', '<p>wellllllllllllllllllllll</p>\r\n', b'1', 10, 1, 4, 1, 1, '2020-12-26', 2),
(5, 'IphoneXR', 'DT001.jpg', 2, 7, 'one', '<b><i>welllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll</i></b>\r\n', b'1', 10, 1, 4, 1, 1, '2020-12-25', 2),
(6, 'Iphone 6S', 'DT002.jpg', 2, 9.5, 'one', 'dagfdsfhsfdh', b'1', 10, 1, 4, 1, 1, '2020-12-27', 2),
(7, 'Nokia 5', 'DT013.jpg', 2, 5.5, 'one', 'new product', b'1', 5, 1, 10, 1, 1, '2020-12-02', 2),
(8, 'Iphone12 ProMax', 'DT001.jpg', 1, 4.5, 'one', 'new product ', b'1', 2, 1, 4, 1, 1, '2021-01-03', 2),
(9, 'Samsung j5 Prime', 'DT008.jpg', 2, 10, 'one', 'made in vietnam', b'1', 3, 1, 1, 1, 1, '2021-01-03', 2),
(10, 'Nokia 3', 'DT015.jpg', 1, 9, 'one', 'made in viet nam', b'1', 1, 1, 10, 1, 1, '2021-01-02', 2),
(11, 'camera lumix', 'MA006.jpg', 1, 11.5, 'one', '<p><strong>new one</strong></p>\r\n\r\n<p><strong><em>limited</em></strong></p>\r\n', b'1', 2, 3, 6, 1, 1, '2021-01-03', 3),
(12, 'msi no1', 'MT014.jpg', 1, 5, 'one', 'agc', b'1', 0, 4, 8, 1, 1, '2021-01-03', 10),
(13, 'Canon G7X', 'MA004.jpg', 2, 10, 'one', '<p><strong>Beatiful and good</strong></p>\r\n', b'1', 0, 3, 6, 1, 1, '2021-01-05', 3),
(14, 'Nikon MA013', 'MA013.jpg', 3, 8, 'one', '<p><strong>Good product, great, innovative</strong></p>\r\n', b'1', 6, 3, 9, 1, 1, '2021-01-05', 3),
(15, 'Sony MA009', 'MA009.jpg', 4, 12, 'one', '<p><em>Good product, great, innovative</em></p>\r\n', b'1', 10, 3, 11, 1, 1, '2021-01-05', 3),
(16, 'Sony TV008', 'TV008.jpg', 2, 16, 'one', '<p><strong>Good product, great, innovative, inventor, save energy</strong></p>\r\n', b'1', 10, 2, 11, 1, 1, '2021-01-05', 3),
(17, 'Samsung TV007', 'TV007.jpg', 1, 16, 'one', '<p><strong>Good product, great, innovative, inventor, save energy</strong></p>\r\n', b'1', 20, 2, 1, 1, 1, '2021-01-05', 3),
(18, 'DELL MT012', 'MT012.jpg', 2, 12, 'one', '<p><strong>Technology is power</strong></p>\r\n', b'1', 10, 4, 7, 1, 1, '2021-01-05', 10),
(19, 'Dell MT011', 'MT011.jpg', 2, 20, 'one', '<p><strong>Technology is power</strong></p>\r\n', b'1', 0, 4, 7, 1, 1, '2021-01-05', 10),
(20, 'Canon EOS75000', 'MA003.jpg', 2, 20, 'one', '<p>Power and good and inventor</p>\r\n', b'1', 10, 3, 6, 1, 1, '2021-01-06', 13);

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `star1` int(11) NOT NULL,
  `star2` int(11) NOT NULL,
  `star3` int(11) NOT NULL,
  `star4` int(11) NOT NULL,
  `star5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`id`, `productId`, `star1`, `star2`, `star3`, `star4`, `star5`) VALUES
(1, 7, 0, 0, 0, 0, 0),
(2, 6, 0, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0, 0),
(4, 2, 15, 0, 2, 1, 2),
(5, 5, 0, 0, 0, 0, 0),
(6, 8, 0, 0, 0, 0, 0),
(7, 9, 0, 0, 0, 0, 0),
(8, 10, 0, 0, 0, 0, 0),
(9, 11, 0, 0, 0, 0, 0),
(10, 12, 0, 0, 0, 0, 0),
(11, 1, 0, 0, 0, 0, 0),
(12, 4, 0, 0, 0, 0, 0),
(13, 13, 0, 0, 0, 0, 0),
(14, 14, 0, 0, 0, 0, 0),
(15, 15, 0, 0, 0, 0, 0),
(16, 16, 0, 0, 0, 0, 0),
(17, 17, 0, 0, 0, 0, 0),
(18, 18, 0, 0, 0, 0, 0),
(19, 19, 0, 0, 0, 0, 2),
(20, 20, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_VENDOR'),
(3, 'ROLE_CUSTOMER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brandId` (`brandId`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`);

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
