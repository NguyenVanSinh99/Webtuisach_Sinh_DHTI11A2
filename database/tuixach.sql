-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2020 lúc 03:56 PM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tuixach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price2` int(255) NOT NULL,
  `image_link` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `quantity` int(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `data` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`transaction_id`, `id`, `product_id`, `qty`, `amount`, `data`, `status`) VALUES
(5, 5, 5, 1, '550000.0000', 'Túi Xách Nữ Dreamwise 2020', 0),
(4, 1, 31, 2, '125000.0000', 'Ví Nữ Da Cá Sấu Thật ', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanhois`
--

CREATE TABLE `phanhois` (
  `id` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `noidung` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `ngaytao` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_msg` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `phanhois`
--

INSERT INTO `phanhois` (`id`, `hoten`, `email`, `noidung`, `ngaytao`, `read_msg`) VALUES
(0, 'Phạm Bá Hùng', 'phambahung03051999@gmail.com', 'nhân viên nhiệt tình, tâm lý', '2020-11-18 13:22:35', 0),
(0, 'Lập Bìu', 'dovanlap@gmail.com', 'nhân viên xinh gái, phúc hậu', '2020-11-18 13:24:07', 0),
(0, 'Lập Bìu', 'dovanlap@gmail.com', 'nhân viên xinh gái, phúc hậu', '2020-11-18 13:24:58', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price1` int(255) NOT NULL,
  `price2` int(255) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `view` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `price1`, `price2`, `content`, `author`, `image_link`, `created`, `view`, `quantity`) VALUES
(58, 'Túi xách nữ thời trang cao cấp', 'Việt Nam', 900000, 800000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606988729.jpg', '2020-12-03 16:45:29', 0, 20),
(57, 'Túi xách nữ thời trang cao cấp ELLY', 'Việt Nam', 650000, 500000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606988705.jpg', '2020-12-03 16:45:05', 0, 10),
(49, 'Ví Cầm Tay Cao Cấp', 'Việt Nam', 680000, 550000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606380609.jpg', '2020-11-26 15:50:09', 0, 23),
(45, 'Túi Nữ Han Edition 2020 Hợp Thời Trang Mới', 'Việt Nam', 1200000, 1000000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606380212.jpg', '2020-11-26 15:43:32', 0, 16),
(44, 'Túi xách nữ Silico sang trọng', 'Việt Nam', 700000, 600000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606380138.jpg', '2020-11-26 15:42:18', 0, 10),
(42, 'Túi xách nữ thời trang cao cấp ELLY- EL129', 'Việt Nam', 900000, 750000, '– Màu sắc: đỏ\r\n– Kích thước: 21 x 15 x 7 cm (Chiều ngang x chiều dọc x độ dày).\r\n– Chất liệu: Da tổng hợp cao cấp.\r\n– Kiểu dáng: Crossbody bag.\r\n– Bảo hành: 03 tháng (với lỗi do sản xuất).', 'ELLY', '1606379907.jpg', '2020-11-26 15:38:27', 0, 15),
(43, 'Túi Xách Nữ Thời Trang Dáng Đẹp', 'Việt Nam', 600000, 450000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật.\r\nChất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền.\r\nKiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật.\r\nTúi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606380055.jpg', '2020-11-26 15:40:55', 0, 20),
(59, 'Túi xách nữ thời trang', 'Việt Nam', 690000, 500000, 'Thiết kế trẻ trung cùng túi dạng hộp cách điệu cho bạn gái thêm nổi bật. Chất liệu simili giả da cách điệu, bền đẹp, chắc chắn cho bạn sử dụng lâu bền. Kiểu dáng túi xách đeo chéo tinh tế với dây đeo dài có nút điều chỉnh độ dài thích hợp theo ý thích, bạn có thể biến tấu thành túi xách tay sang trọng cho bạn thật nổi bật. Túi với dây kéo khóa kéo kim loại chắc chắc cùng khóa cài xinh xắn .', 'Sinh Nguyễn', '1606988752.jpg', '2020-12-03 16:45:52', 0, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_info` text COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `created` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `amount`, `payment`, `payment_info`, `message`, `created`) VALUES
(1, 1, 3, '100000.0000', '', '', '', 0),
(2, 0, 4, '250000.0000', '', '', '', 0),
(3, 0, 2, '16000.0000', '', '', '', 0),
(5, 0, 5, '100000.0000', '', '', '', 0),
(4, 0, 1, '200000.0000', '', '', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `password`) VALUES
(1, 'Lập Bìu', 'lap', 'dovanlap@gmail.com', '0327542020', ' Nam Định', '123456'),
(2, 'Cẩm Tú', 'tu', 'camtu@gmail.com', '033333444', 'Hà  Nội', '123456'),
(3, 'Linh', 'linh', 'linh@gmail.com', '0399999', 'tphcm', '123456'),
(4, 'Trần Ngân', 'ngan', 'ngan@gmail.com', '0399933', 'tphcm', '123456'),
(5, 'Bá Hùng', 'Hung', 'phambahung03051999@gmail.com', '0386133243', 'Hà  Nội', '123456'),
(27, 'nguyen xuan chien', 'nxc14111', 'nxc140199@gmail.com', '0913443395', 'ha noi', 'gachoi123'),
(28, 'gachoi123', 'nxc141', 'bay14110092@gmail.com', '0389689698', 'Viet Nam', 'gachoi123');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `FULLTEXT` (`id_user`) USING BTREE;

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `product` ADD FULLTEXT KEY `name` (`name`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
