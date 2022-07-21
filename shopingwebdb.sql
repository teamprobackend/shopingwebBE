-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 21, 2022 at 03:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopingwebdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `BillProducts`
--

CREATE TABLE `BillProducts` (
  `id` int(11) NOT NULL,
  `billId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Bills`
--

CREATE TABLE `Bills` (
  `id` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `receiverName` varchar(255) DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverPhone` varchar(255) DEFAULT NULL,
  `status` enum('waiting','on process','finish') DEFAULT 'waiting',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`id`, `name`, `quantity`, `createdAt`, `updatedAt`) VALUES
(1, 'ĐIỆN THOẠI NỔI BẬT NHẤT', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(2, 'LAPTOP', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(3, 'MÀN HÌNH, MÁY TÍNH ĐỂ BÀN', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(4, 'ÂM THANH', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(5, 'ĐỒNG HỒ THÔNG MINH', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(6, 'NHÀ THÔNG MINH', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(7, 'MÁY TÍNH BẢNG', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07'),
(8, 'TIVI', NULL, '2022-07-14 07:14:07', '2022-07-14 07:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `IpadCategories`
--

CREATE TABLE `IpadCategories` (
  `id` int(11) NOT NULL,
  `STT` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `screenSize` varchar(255) DEFAULT NULL,
  `screenTechnology` varchar(255) DEFAULT NULL,
  `cameraBack` varchar(255) DEFAULT NULL,
  `cameraFont` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `OS` varchar(255) DEFAULT NULL,
  `screenResolution` varchar(255) DEFAULT NULL,
  `screenFeatures` varchar(255) DEFAULT NULL,
  `CPU` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `bluetooth` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Labels`
--

CREATE TABLE `Labels` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Labels`
--

INSERT INTO `Labels` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Xiaomi', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(2, 'Samsung', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(3, 'Apple', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(4, 'Asus', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(5, 'HP', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(6, 'Lenovo', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(7, 'Dell', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(8, 'Sony', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(9, 'LG', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(10, 'VSmart', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(11, 'Huawei', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(12, 'Oppo', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(13, 'MSI', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(14, 'Nubia', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(15, 'Acer', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(16, 'Surface', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(17, 'JBL', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(18, 'Myalo', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(19, 'Coocaa', '2022-07-14 07:13:38', '2022-07-14 07:13:38'),
(20, 'CPS', '2022-07-14 07:13:38', '2022-07-14 07:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `LaptopCategories`
--

CREATE TABLE `LaptopCategories` (
  `id` int(11) NOT NULL,
  `STT` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `CPU` varchar(255) DEFAULT NULL,
  `VGA` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `ramType` varchar(255) DEFAULT NULL,
  `ramSlots` varchar(255) DEFAULT NULL,
  `hardDisk` varchar(255) DEFAULT NULL,
  `screenSize` varchar(255) DEFAULT NULL,
  `screenResolution` varchar(255) DEFAULT NULL,
  `ports` varchar(255) DEFAULT NULL,
  `OS` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `screenTechnology` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PhonesCategories`
--

CREATE TABLE `PhonesCategories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `screenSize` varchar(255) DEFAULT NULL,
  `screenTechnology` varchar(255) DEFAULT NULL,
  `cameraBack` varchar(255) DEFAULT NULL,
  `cameraFont` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `OS` varchar(255) DEFAULT NULL,
  `screenResolution` varchar(255) DEFAULT NULL,
  `screenFeature` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `bluetooth` varchar(255) DEFAULT NULL,
  `refreshRate` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PhonesCategories`
--

INSERT INTO `PhonesCategories` (`id`, `product_id`, `categoryId`, `screenSize`, `screenTechnology`, `cameraBack`, `cameraFont`, `chipset`, `ram`, `rom`, `battery`, `OS`, `screenResolution`, `screenFeature`, `weight`, `bluetooth`, `refreshRate`, `quantity`, `createdAt`, `updatedAt`) VALUES
(1, 4, NULL, '6.1 inches', 'IPS LCD', 'Camera kép 12MP:\n- Camera góc rộng: ƒ/1.8 aperture\n- Camera siêu rộng: ƒ/2.4 aperture', '12 MP, ƒ/2.2 aperture', 'A13 Bionic', '4 GB', '64 GB', '3110 mAh', 'iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành)', '1792 x 828 pixel', 'True-tone', '194 g', '5.0', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(2, 1, NULL, '6.7 inches', 'OLED', 'Camera góc rộng: 12MP, ƒ/1.5\nCamera góc siêu rộng: 12MP, ƒ/1.8\nCamera tele : 12MP, /2.8', '12MP, ƒ/2.2', 'Apple A15', '6 GB', '128 GB', '4,325mAh', 'iOS15', '2778 x 1284 pixel', '120Hz, Super Retina XDR với ProMotion 6.1‑inch, OLED, 458 pp, HDR display, True Tone, Wide color (P3), Haptic Touch', '240g', 'v5.0', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(3, 7, NULL, '6.1 inches', 'OLED', 'Camera góc rộng: 12MP, f/1.6\nCamera góc siêu rộng: 12MP, ƒ/2.4', '12MP, f/2.2', 'Apple A15', '4 GB', '128 GB', '3.240mAh', 'iOS 15', '2532 x 1170 pixels', 'Màn hình super Retina XDR, OLED, 460 ppi, HDR display, công nghệ True Tone Wide color (P3), Haptic Touch, Lớp phủ oleophobic chống bám vân tay', '174g', 'v5.0', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(4, 6, NULL, '6.8 inches', 'Dynamic AMOLED 2X', '108 MP, f/1.8 góc rộng\n10 MP, f/4.9\n10 MP, f/2.4\n12 MP, f/2.2 góc siêu rộng', '40 MP, f/2.2', 'Qualcomm Snapdragon 8 Gen 1 (4 nm)', '8 GB', '128 GB', 'Li-Ion 5000 mAh', 'Android 12, One UI 4.1', '1440 x 3088 pixels (QHD+)', 'Tần số quét 120Hz\nCông nghệ HDR10+', '229 g', '5.2, A2DP, LE', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(5, 2, NULL, '6.7 inches', 'OLED', 'Camera chính: 12 MP, f/1.6, 26mm, 1.4µm, dual pixel PDAF, OIS\nCamera tele: 12 MP, f/2.0, 52mm, 1/3.4\", 1.0µm, PDAF, OIS, 2x optical zoom\nCamera góc siêu rộng: 12 MP, f/2.4, 120˚, 13mm, 1/3.6\"\nCảm biến: TOF 3D LiDAR scanner', '12 MP, f/2.2, 23mm (wide), 1/3.6\"\nSL 3D, (depth/biometrics sensor)', 'Apple A14 Bionic (5 nm)', '6 GB', '128 GB', 'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0', 'iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)', '1284 x 2778 pixels', 'HDR10\nDolby Vision\nTrue-tone\nĐộ sáng 800 nits', '228', '5.0, A2DP, LE', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(6, 5, NULL, '6.1 inches', 'OLED', '12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF, OIS\n12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6\"', '12 MP, f/2.2, 23mm (wide), 1/3.6\"\nSL 3D, (depth/biometrics sensor)', 'Apple A14 Bionic (5 nm)', '4 GB', '64 GB', 'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Power Delivery 2.0', 'iOS 14.1 hoặc cao hơn (Tùy vào phiên bản phát hành)', '1170 x 2532 pixels', 'HDR10\nDolby Vision\nTrue-tone', '164 g', '5.0, A2DP, LE', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(7, 12, NULL, '6.67 inches', 'AMOLED', 'Camera góc rộng: 108 MP, f/1.9, PDAF\nCamera góc siêu rộng: 8 MP\nCamera macro: 2 MP, f/2.4', '16 MP', 'MediaTek Dimensity 920 5G (6 nm)', '8 GB', '256 GB', 'Li-Po 4500 mAh', 'Android 11, MIUI 12.5', '1080 x 2400 pixels (FullHD+)', 'Tần số quét 120 Hz, Corning Gorilla Glass 5, HDR10, 700 nits, 1200 nits (peak)', '204 g', '5.2, A2DP, LE', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(8, 8, NULL, '6.1 inches', 'IPS LCD', 'Camera kép 12MP:\n- Camera góc rộng: ƒ/1.8 aperture\n- Camera siêu rộng: ƒ/2.4 aperture', '12 MP, ƒ/2.2 aperture', 'A13 Bionic', '4 GB', '128 GB', '3110 mAh', 'iOS 13 hoặc cao hơn (Tùy vào phiên bản phát hành)', '1792 x 828 pixel', 'True-tone', '194 g', '5.0', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(9, 3, NULL, '6.43 inches', 'AMOLED', 'Camera góc rộng: 50 MP, f/1.8, PDAF\nCamera góc siêu rộng: 8 MP\nCamera Macro: 2MP f/2.4\nCamera chân dung: 2MP', '13 MP, f/2.5', 'Snapdragon 680 8 nhân', '4 GB', '64 GB', 'Li-Po 5000 mAh', 'Android 11, MIUI 12.5', '1080 x 2400 pixels (FullHD+)', '90Hz', '179 g', '5.0, A2DP, LE', '90Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(10, 9, NULL, '6.67 inches', 'AMOLED', 'Camera góc rộng: 108 MP, f/1.9, PDAF\nCamera góc siêu rộng: 8 MP\nCamera Tele: 2 MP, f/2.4\nCamera chân dung: 2MP f/2.4', '16MP f/2.4', 'MediaTek Helio G96', '8 GB', '128 GB', '5000mAh (typ)', 'Android 11, MIUI 12.5', '1080 x 2400 pixels (FullHD+)', 'DCI-P3, 120Hz, 4,500,000:1, 395 ppi', '202g', '5.2, A2DP, LE', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(11, 11, NULL, '6.43 inches', 'AMOLED', 'Camera góc rộng: 50 MP, f/1.8, PDAF\nCamera góc siêu rộng: 8 MP\nCamera macro: 2MP\nCamera chân dung: 2MP', '13 MP, f/2.5', 'Snapdragon 680 8 nhân', '4 GB', '128 GB', 'Li-Po 5000 mAh', 'Android 11, MIUI 12.5', '1080 x 2400 pixels (FullHD+)', '90Hz', '195 g', '5.1, A2DP, LE', '90Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(12, 13, NULL, '6.6 inches', 'Dynamic AMOLED 2X', 'Camera chính: 50 MP, f/1.8\nCamera góc siêu rộng: 12 MP, f/2.2\nCamera tele:10 MP, f/2.4', '10 MP, f/2.2', 'Snapdragon 8 Gen 1', '8 GB', '128 GB', '4500 mAh', 'Android 12', '1080 x 2340 pixels (FullHD+)', 'Kính cường lực Corning Gorilla Glass Victus+\nĐộ sáng tối đa 1500 nits\nTần số quét 120 Hz', '195 g', 'A2DP, LE', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(13, 14, NULL, '6.43 inches', 'AMOLED', '64MP (Chính) + 8MP (Góc rộng) + 2MP (Marco)', '32 MP', 'MediaTek Dimensity 800U 5G 8 nhân', '8 GB', '128 GB', '4310mAh (Typ)', 'ColorOS 11.3, nền tảng Android 11', '1080 x 2400 pixels (FullHD+)', 'Tần số quét 60 Hz, Độ sáng tối đa 430 nits', '173g', 'v5.2', '60Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(14, 10, NULL, '7.6 inches', 'Dynamic AMOLED', 'Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PDAF, OIS\nCamera tele: 12 MP, f/2.4, 52mm, PDAF, OIS, 2x Zoom quang học\nCamera góc siêu rộng: 12 MP, f/2.2\nCamera màn hình phụ: 10MP, f/2.2', 'Camera ẩn dưới màn hình: 4MP, f/1.8', 'Snapdragon 888 5G (5 nm)', '12 GB', '256 GB', 'Li-Po 4400 mAh', 'Android 11', NULL, 'Màn hình chính: 7.9\" 2208x1768, 374ppi, HDR10+, 120Hz\nMàn hình phụ: 6.23\" 2268x832, HD+ Dynamic AMOLED 2X (24.5:9) Infinity-O Display, 38ppi, 120Hz', '271g', 'v 5.0', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(15, 16, NULL, '6.1 inches', 'OLED', 'Camera góc rộng: 12MP, ƒ/1.5\nCamera góc siêu rộng: 12MP, ƒ/1.8\nCamera tele : 12MP, /2.8', '12MP, ƒ/2.2', 'Apple A15', '6 GB', '128 GB', '3,095mAh', 'iOS15', '1170 x 2532 pixels', '120Hz, Super Retina XDR với ProMotion 6.1‑inch, OLED, 460 pp, HDR display, True Tone, Wide color (P3), Haptic Touch', '204g', 'v5.0', '120Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(16, 18, NULL, '6.9 inches', 'Dynamic AMOLED', '108 MP, f/1.8, 26mm (wide), 1/1.33\", 0.8µm, PDAF, Laser AF, OIS\n12 MP, f/3.0, 103mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom\n12 MP, f/2.2, 13mm (ultrawide), 1/2.55\", 1.4µm', '10 MP, f/2.2, 26mm (wide), 1/3.2\", 1.22µm, Dual Pixel PDAF', 'Exynos 990 (7 nm+)', '12 GB', '256 GB', 'Non-removable Li-Ion 4500 mAh battery\nFast charging 25W\nUSB Power Delivery 3.0\nFast Qi/PMA wireless charging\nReverse wireless charging 9W', 'Android 10, One UI 2.1', '1440 x 3088 pixels (QHD+)', '120Hz\nHDR10+\nCorning Gorilla Glass Victus', '208 g', '5.0, A2DP, LE, aptX', '90Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(17, 15, NULL, '6.7 inches', 'Super AMOLED', 'Camera chính: 108 MP, f/1.8, PDAF, OIS\nCamera gó siêu rộng: 12 MP, f/2.2\nCamera macro: 5 MP, f/2.4\nCamera chân dung: 5 MP, f/2.4', '32 MP, f/2.2', 'Snapdragon 778G 5G 8 nhân', '8 GB', '256 GB', '5000 mAh', 'Android 12, One UI 4.1', '1080 x 2400 pixels (FullHD+)', 'Tần số quét 120 Hz, Kính cường lực Corning Gorilla Glass 5', '181 g', 'v5.0', NULL, NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(18, 20, NULL, '6.4 inches', 'Super AMOLED', 'Camera chính: 48 MP, F1.8\nCamera góc siêu rộng: 8 MP, F2.2\nCamera macro: 5 MP, F2.4\nCamera chân dung: 2.0 MP, F2.4', '13 MP, f/2.2', 'Vi xử lý 8 nhân Exynos 1280', '6 GB', '128 GB', '5000 mAh', 'Android 12', '1080 x 2400 pixels (FullHD+)', 'Tần số quét 90 Hz, Kính cường lực Corning Gorilla Glass 5', '186 g', '5.1, A2DP, LE', '90Hz', NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(19, 17, NULL, '6.8 inches', 'AMOLED', 'Camera góc rộng: 64 MP, f/1.8, PDAF\nCamera góc siêu rộng: 8 MP, f/2.0\nCamera macro: 2 MP, f/2.4', '8 MP, f/2.0', 'Qualcomm SM8450 Snapdragon 8 Gen 1', '12 GB', '128 GB', 'Li-Po 4500 mAh', 'Android 12, Redmagic 5.0', '1080 x 2400 pixels (FullHD+)', 'Corning Gorilla Glass 5', '215 g', '5.2', NULL, NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05'),
(20, 19, NULL, '6.43 inches', 'AMOLED', 'Cụm 3 camera Chính 64 MP & Phụ 2 MP, 2 MP', '16 MP', 'Snapdragon 695 5G 8 nhân', '8 GB', '128 GB', '4,500 mAh', 'Android 11 - ColorOS 12', '1080 x 2400 pixels (FullHD+)', 'Tần số quét 60 Hz, Độ sáng tối đa: 600 nits, Kính cường lực Schott Xensation UP', '173g', 'v5.1', NULL, NULL, '2022-07-20 07:03:05', '2022-07-20 07:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `id` int(11) NOT NULL,
  `STT` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `labelId` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`id`, `STT`, `productName`, `price`, `quantity`, `image1`, `image2`, `image3`, `categoryId`, `labelId`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', 27390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(2, 3, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', 25590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(3, 5, 'iPhone 13 128GB | Chính hãng VN/A', 19590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(4, 1, 'iPhone 11 64GB I Chính hãng VN/A', 10790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(5, 7, 'iPhone 12 64GB I Chính hãng VN/A', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(6, 6, 'Xiaomi Redmi Note 11', 3850000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(7, 4, 'Samsung Galaxy S22 Ultra (8GB - 128GB)', 25090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Dịch vụ phòng chờ hạng thương gia tại sân bay và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(8, 9, 'Samsung Galaxy Z Fold3 5G', 30990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Giảm ngay 2.000.000đ khi thanh toán qua Moca', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(9, 10, 'Nubia Red Magic 7 Obsidian 12GB 128GB', 18490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 14, 'Thu cũ đổi mới - Trợ giá 500.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(10, 11, 'Samsung Galaxy S22 Plus (8GB + 128GB)', 20190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Dịch vụ phòng chờ hạng thương gia tại sân bay và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(11, 12, 'iPhone 11 128GB I Chính hãng VN/A', 13390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, '[HOT] Thu cũ lên đời giá cao - Thủ tục nhanh - Trợ giá lên tới 1.000.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(12, 8, 'Xiaomi Redmi Note 11 Pro Plus 5G', 8890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ lên đời trợ giá 500.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(13, 13, 'Xiaomi Redmi Note 11 Pro', 6450000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(14, 14, 'Samsung Galaxy A73 (5G) 256GB', 11990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 2, 'Thu cũ đổi mới - Trợ giá đến 300.000đ và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(15, 15, 'Xiaomi Redmi Note 11 128GB', 4130000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(16, 16, 'OPPO Reno6 Z 5G', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 12, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(17, 17, 'iPhone 13 Pro 128GB | Chính hãng VN/A', 24790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(18, 18, 'Xiaomi 11T Pro', 11690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(19, 19, 'iPhone SE 2022 | Chính hãng VN/A', 11390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 3, 'Giảm thêm đến 1.000.000đ khi thanh toán qua thẻ tín dụng Citibank', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(20, 20, 'OPPO Reno7 Z (5G)', 9090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 1, 12, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(21, 21, 'Apple Macbook Air M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 31490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Giảm đến 2 triệu khi thanh toán qua thẻ tín dụng VIB, Sacombank, VP Bank và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(22, 22, 'Apple MacBook Air M1 256GB 2020 I Chính hãng Apple Việt Nam', 22290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(23, 23, 'Apple Macbook Pro 13 M2 2022 8GB 256GB I Chính hãng Apple Việt Nam', 32990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Thu cũ lên đời - Trợ giá 1 triệu', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(24, 24, 'Apple MacBook Pro 13 Touch Bar M1 256GB 2020 I Chính hãng Apple Việt Nam', 29590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(25, 25, 'Laptop Asus Vivobook 13 Slate Oled T3300KA', 14790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(26, 26, 'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', 17990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(27, 27, 'Laptop Gaming MSI Bravo 15 B5DD 276VN', 14890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 13, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(28, 28, 'Laptop ASUS VivoBook D515DA-EJ845T', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(29, 29, 'Laptop MSI Modern 14 B11MOU 1030VN', 11790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 13, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(30, 30, 'Laptop Gaming Acer Nitro 5 AN515 45 R6EV', 17990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 15, 'Tặng bàn phím cơ Gaming Predator Aethon TKL 301', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(31, 31, 'Laptop HP 14-CF2033WM 3V7G4UA', 6490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 5, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(32, 32, 'Macbook Pro 14 inch 2021 | Chính hãng Apple Việt Nam', 48590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(33, 33, 'Laptop Lenovo Legion 5 15ACH6 82JW00JPVN', 20790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 6, 'Phần Mềm Diệt Virus, Office chính hãng chỉ từ 150k', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(34, 34, 'Laptop Dell Insprion 14 5406-3661SLV Nhập khẩu chính hãng', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 7, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(35, 35, 'Laptop ASUS ZenBook UM5302TA-LX087W', 27990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(36, 36, 'Laptop Xiaomi RedmiBook 15 JYU4505AP', 11490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 1, 'Tặng balo xiaomi', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(37, 37, 'Laptop Asus Flip BR1100FKA-BP1088W', 5690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(38, 38, 'Surface Pro 7 Core i5 / 8GB / 128GB Nhập Khẩu Chính Hãng', 19990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 16, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(39, 39, 'Laptop ASUS VivoBook A515EA-L12033W', 16590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(40, 40, 'iMac 24 2021 M1 7GPU 8GB 256GB I Chính hãng Apple Việt Nam', 28990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 3, 'Mua Office Home & Student 2021 kèm Macbook chỉ còn 2,090,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(41, 41, 'Laptop Lenovo IdeaPad Gaming 3 15ACH6 82K201BBVN', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 2, 6, 'Phần Mềm Diệt Virus, Office chính hãng chỉ từ 150k', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(42, 42, 'PC Gaming CPS 001', 8730000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 20, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(43, 43, 'Màn Hình Thông Minh Samsung M8 LS32BM801UEXXV 32 (4K/VA/60Hz/USB-C)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(44, 44, 'Màn hình Xiaomi Monitor 1C BHR4510GL 23.8 inch', 3290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 1, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(45, 45, 'Màn hình LG UltraWide 29WP500 29 inch', 5690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 9, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(46, 46, 'Màn hình đồ hoạ HUAWEI MateView 28', 15990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 11, 'Tặng kèm chuột Huawei CD20 và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(47, 47, 'Màn hình thông minh Samsung LS27AM500NEXXV 27 inch', 4990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(48, 48, 'Màn hình Dell UltraSharp 23.8 inch U2422H', 7190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 7, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(49, 49, 'Màn hình Dell Monitor S2721DS 27', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 7, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(50, 50, 'Màn hình Samsung LU28R550UQEXXV 28 inch', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 2, 'Ưu đãi giảm 50,000 khi mua giá treo màn hình', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(51, 51, 'PC Gaming ASUS ROG STRIX GA35 G35DX-VN003W', 43490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 3, 4, 'Ưu đãi 200.000đ khi mua kèm màn hình đồ họa ASUS USB-C', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(52, 52, 'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(53, 53, 'iPad Air 5 (2022) 64GB I Chính hãng Apple Việt Nam', 15590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(54, 54, 'Samsung Galaxy Tab S8 Ultra', 28890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 2, 'Tặng bao da kiêm bàn phím Galaxy Tab S8 Ultra chính hãng và 2 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(55, 55, 'Apple iPad Pro 11 2021 M1 WiFi 128GB I Chính hãng Apple Việt Nam', 19790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Thu cũ lên đời - Trợ giá 1 triệu và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(56, 56, 'Apple iPad mini 6 WiFi 64GB | Chính hãng Apple Việt Nam', 13190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(57, 57, 'iPad Air 10.9 2020 WiFi 64GB I Chính hãng Apple Việt Nam', 14190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(58, 58, 'Samsung Galaxy Tab A7 Lite', 3750000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 2, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(59, 59, 'Xiaomi Pad 5', 8990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 1, 'Thu cũ đổi mới - Trợ giá đến 300.000đ', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(60, 60, 'Samsung Galaxy Tab A8 (2022)', 6990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 2, 'Tặng Bao da Samsung Galaxy Tab A8 2022 chính hãng và 1 km khác', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(61, 61, 'iPad 10.2 2020 WiFi 32GB I Chính hãng Apple Việt Nam', 9500000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 7, 3, 'Phần mềm bản quyền Office đi kèm 1 TB Onedrive chỉ từ 990,000', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(62, 62, 'Tai nghe Bluetooth Apple AirPods 2 VN/A', 2890000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(63, 63, 'Tai nghe Bluetooth Apple AirPods 3 | Chính hãng Apple Việt Nam', 4590000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(64, 64, 'Tai nghe chụp tai Sony WH-1000XM4', 5990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 8, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(65, 65, 'Tai nghe Bluetooth Apple AirPods Pro 2021 Magsafe | Chính hãng Apple Việt Nam', 4790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(66, 66, 'Tai nghe Bluetooth Samsung Galaxy Buds Live', 1490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 2, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(67, 67, 'Tai nghe Bluetooth Samsung Galaxy Buds Pro', 2290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 2, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(68, 68, 'Tai nghe không dây JBL Live Pro+', 2990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 17, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(69, 69, 'Loa Bluetooth JBL Charge 4', 3490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 17, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(70, 70, 'Tai nghe không dây Xiaomi Redmi Buds 3 lite', 450000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(71, 71, 'Tai nghe chụp tai chống ồn Apple AirPods Max | Chính hãng Apple Việt Nam', 9390000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 4, 3, 'Nhận gói 6 tháng Apple Music miễn phí', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(72, 72, 'Vòng đeo tay thông minh Huawei Band 7', 990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 11, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(73, 73, 'Vòng đeo tay thông minh Xiaomi Mi Band 7', 1190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(74, 74, 'Đồng hồ thông minh Huawei Watch GT3 dây da', 5990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 11, 'Dây đeo đồng hồ Huawei Watch GT3 Silicone 46mm', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(75, 75, 'Đồng hồ thông minh Xiaomi Mi Watch', 1990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(76, 76, 'Vòng đeo tay thông minh Xiaomi Mi Band 6', 799000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(77, 77, 'Đồng hồ thông minh Huawei Watch Fit 2', 2990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 11, 'QT.187', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(78, 78, 'Samsung Galaxy Watch4', 4490000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 2, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(79, 79, 'Đồng hồ thông minh Huawei Watch GT3 Pro dây silicone', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 11, 'Tặng dây đeo thời trang thay thế', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(80, 80, 'Đồng hồ thông minh trẻ em Myalo KidsPhone K84', 2750000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 18, 'Tặng Sim Mobifone C90N 4GB/Ngày', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(81, 81, 'Đồng hồ thông minh Xiaomi Redmi Watch 2 Lite', 1072000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 5, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(82, 82, 'Robot hút bụi Dreame bot W10', 16990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(83, 83, 'Apple AirTag | Chính hãng Apple Việt Nam', 790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 3, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(84, 84, 'Quạt thông minh Mi Smart Standing Fan 2 Lite', 1290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(85, 85, 'Máy chiếu Xiaomi Mi Smart Projector 2', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(86, 86, 'Robot hút bụi Dreame D9 Pro', 6790000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(87, 87, 'Robot hút bụi Dreame D9', 6290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(88, 88, 'Máy lọc không khí Xiaomi Air Purifier 4 Pro', 5190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(89, 89, 'Robot hút bụi Dreame Z10 Pro', 10290000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(90, 90, 'Máy Chiếu Smart TV 100 inch Bỏ Túi Samsung The Freestyle SP-LSP3', 20990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 2, 'Quà tặng túi đựng Samsung The Freestyle Xanh đen', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(91, 91, 'Máy lọc không khí Xiaomi Air Purifier 4 Lite', 3090000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 6, 1, '', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(92, 92, 'Smart tivi Xiaomi P1 55 inch', 9990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 1, 'Tặng Cân Xiaomi Mi Body Compsition Scale 2', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(93, 93, 'Smart tivi Xiaomi P1 43 inch', 7990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 1, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(94, 94, 'Smart Tivi màn hình cong Samsung 4K 55 inch 55TU8300', 11990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(95, 95, 'Smart Tivi 4K The Serif Samsung 55 inch QA55LS01TA (Model 2021)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(96, 96, 'Smart TV Coocaa HD 32 inch WIFI 32S3U', 3690000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 19, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(97, 97, 'Smart TV Nanocell LG 4K 43 INCH 43NANO77TPA', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 9, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(98, 98, 'Smart Tivi Samsung Crystal UHD 4K 55 INCH UA55AU7700KXXV', 12990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(99, 99, 'Smart Tivi di động LG Stanby Me 27inch', 18190000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 9, '[01/07 - 30/09/2022]Tặng tai nghe Tone Free trị giá 2.990.000đ qua ứng dụng Urbox', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(100, 100, 'Smart Tivi Samsung Crystal UHD 4K 55 inch UA55AU8000KXXV', 13990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28'),
(101, 101, 'Smart Tivi Samsung QLED 55 inch QA55Q60AA (Model 2021)', 14990000, 10, 'https://cdn2.cellphones.com.vn/100x/media/wysiwyg/placehoder.png', NULL, NULL, 8, 2, 'Giảm 10% loa Soundbar khi mua kèm TV', '2022-07-14 07:14:28', '2022-07-14 07:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2022-07-17 09:09:45', '2022-07-17 09:09:45'),
(2, 'staff', '2022-07-17 09:09:46', '2022-07-17 09:09:46'),
(3, 'admin', '2022-07-17 09:09:46', '2022-07-17 09:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20220708152858-create-roles.js'),
('20220708152859-create-user.js'),
('20220708153218-create-bill.js'),
('20220708153219-create-labels.js'),
('20220708153504-create-category.js'),
('20220708153737-create-product.js'),
('20220708153738-create-bill-product.js'),
('20220711133128-create-phones-category.js'),
('20220711133654-create-laptop-category.js'),
('20220711134226-create-television-category.js'),
('20220711134729-create-ipad-category.js');

-- --------------------------------------------------------

--
-- Table structure for table `TelevisionCategories`
--

CREATE TABLE `TelevisionCategories` (
  `id` int(11) NOT NULL,
  `STT` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `screenSize` varchar(255) DEFAULT NULL,
  `imageTechnology` varchar(255) DEFAULT NULL,
  `screenResolution` varchar(255) DEFAULT NULL,
  `screenType` varchar(255) DEFAULT NULL,
  `refreshRate` varchar(255) DEFAULT NULL,
  `televisionType` varchar(255) DEFAULT NULL,
  `audioTechnology` varchar(255) DEFAULT NULL,
  `OS` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `feature` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BillProducts`
--
ALTER TABLE `BillProducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `billId` (`billId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `Bills`
--
ALTER TABLE `Bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `IpadCategories`
--
ALTER TABLE `IpadCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `Labels`
--
ALTER TABLE `Labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LaptopCategories`
--
ALTER TABLE `LaptopCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `PhonesCategories`
--
ALTER TABLE `PhonesCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `labelId` (`labelId`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `TelevisionCategories`
--
ALTER TABLE `TelevisionCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleId` (`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BillProducts`
--
ALTER TABLE `BillProducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bills`
--
ALTER TABLE `Bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `IpadCategories`
--
ALTER TABLE `IpadCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Labels`
--
ALTER TABLE `Labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `LaptopCategories`
--
ALTER TABLE `LaptopCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PhonesCategories`
--
ALTER TABLE `PhonesCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TelevisionCategories`
--
ALTER TABLE `TelevisionCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BillProducts`
--
ALTER TABLE `BillProducts`
  ADD CONSTRAINT `BillProducts_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `Bills` (`id`),
  ADD CONSTRAINT `BillProducts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `Products` (`id`);

--
-- Constraints for table `Bills`
--
ALTER TABLE `Bills`
  ADD CONSTRAINT `Bills_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Users` (`id`);

--
-- Constraints for table `IpadCategories`
--
ALTER TABLE `IpadCategories`
  ADD CONSTRAINT `IpadCategories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`);

--
-- Constraints for table `LaptopCategories`
--
ALTER TABLE `LaptopCategories`
  ADD CONSTRAINT `LaptopCategories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`);

--
-- Constraints for table `PhonesCategories`
--
ALTER TABLE `PhonesCategories`
  ADD CONSTRAINT `PhonesCategories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`labelId`) REFERENCES `Labels` (`id`);

--
-- Constraints for table `TelevisionCategories`
--
ALTER TABLE `TelevisionCategories`
  ADD CONSTRAINT `TelevisionCategories_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `Roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
