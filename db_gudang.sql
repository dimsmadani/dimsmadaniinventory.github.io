-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 31 Agu 2023 pada 13.21
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_warungmadura`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_account`
--

CREATE TABLE `tb_account` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(15000) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_account`
--

INSERT INTO `tb_account` (`id`, `name`, `email`, `username`, `password`, `type`, `date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '$2y$10$2BgUnGCd/E3G3AbMacEoaeMRwPMSc9XvXmgLCtvB349AzsVhnWTe6', 'Admin', '2023-08-08 07:04:55'),
(6, 'gudang', 'gudang@gmail.com', 'gudang', '$2y$10$f03suAIx9W1Lsf/YXsplmuCOdu.pViX7sjBHTN3Hr4t2cJbPqadPO', 'Gudang', '2023-08-31 06:42:30'),
(7, 'manager', 'manager@gmail.com', 'manager', '$2y$10$zqgAlQBNrHjDbYp.0IKSDuFmKMxmW8az2d4cab6fC/BZ.xV1yQB96', 'manager', '2023-08-31 06:43:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`id`, `category`, `date`, `user`) VALUES
(1, 'BOX', '2023-03-15 22:01:01', 1),
(2, 'RENCENG', '2023-08-02 23:49:43', 1),
(3, 'PCS', '2023-03-15 22:02:07', 1),
(4, 'BOTOL', '2023-08-01 01:27:06', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_incoming_stock`
--

CREATE TABLE `tb_incoming_stock` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_incoming_stock`
--

INSERT INTO `tb_incoming_stock` (`id`, `name`, `supplier`, `amount`, `description`, `date`, `user`) VALUES
(10, 6, 1, 4, '', '2023-08-31 10:44:41', 1),
(11, 7, 1, 10, '', '2023-08-31 10:46:41', 1),
(12, 8, 1, 20, '', '2023-08-31 10:46:57', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_item`
--

CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_item`
--

INSERT INTO `tb_item` (`id`, `name`, `category`, `description`, `date`, `user`) VALUES
(6, 'KOPI GOODDAY', 2, 'RASA MOCACHINNO', '2023-08-31 10:42:20', 1),
(7, 'MIE TELUR', 3, 'POLOS', '2023-08-31 10:43:20', 1),
(8, 'TEH CELUP', 1, 'SARIWANGI', '2023-08-31 10:43:41', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outstock`
--

CREATE TABLE `tb_outstock` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_outstock`
--

INSERT INTO `tb_outstock` (`id`, `name`, `supplier`, `amount`, `description`, `date`, `user`) VALUES
(5, 6, 1, 1, '', '2023-08-31 10:44:56', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_reset_token`
--

CREATE TABLE `tb_reset_token` (
  `id` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `token` varchar(250) NOT NULL,
  `expdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stock`
--

CREATE TABLE `tb_stock` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_stock`
--

INSERT INTO `tb_stock` (`id`, `item`, `supplier`, `stock`, `date`, `user`) VALUES
(10, 6, 1, 3, '2023-08-31 10:44:20', 1),
(11, 7, 1, 10, '2023-08-31 10:46:17', 1),
(12, 8, 1, 20, '2023-08-31 10:46:25', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `name`, `address`, `telephone`, `description`, `date`, `user`) VALUES
(1, 'PT XYZGROSIR', 'Gedung XYZ, XXth floor, JL. XYZ Kav 18, Jakarta 14420, Indonesia', '082164701178', 'Perusahaan perdagangan dibidang ritel perkulakan modern yang menyediakan kebutuhan pokok sehari-hari.', '2023-08-31 10:26:10', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_account`
--
ALTER TABLE `tb_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`);

--
-- Indexes for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NAME` (`name`),
  ADD KEY `USER` (`user`),
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE;

--
-- Indexes for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`),
  ADD KEY `CATEGORY` (`category`);

--
-- Indexes for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NAME` (`name`),
  ADD KEY `USER` (`user`) USING BTREE,
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE;

--
-- Indexes for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EMAIL` (`email`);

--
-- Indexes for table `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE,
  ADD KEY `ITEM` (`item`),
  ADD KEY `USER` (`user`) USING BTREE;

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_account`
--
ALTER TABLE `tb_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_stock`
--
ALTER TABLE `tb_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD CONSTRAINT `tb_category_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  ADD CONSTRAINT `tb_incoming_stock_ibfk_1` FOREIGN KEY (`name`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_incoming_stock_ibfk_2` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_incoming_stock_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_item`
--
ALTER TABLE `tb_item`
  ADD CONSTRAINT `tb_item_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_ibfk_2` FOREIGN KEY (`category`) REFERENCES `tb_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_outstock`
--
ALTER TABLE `tb_outstock`
  ADD CONSTRAINT `tb_outstock_ibfk_1` FOREIGN KEY (`name`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_outstock_ibfk_2` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_outstock_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  ADD CONSTRAINT `tb_reset_token_ibfk_1` FOREIGN KEY (`email`) REFERENCES `tb_account` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD CONSTRAINT `tb_stock_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stock_ibfk_3` FOREIGN KEY (`item`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stock_ibfk_4` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD CONSTRAINT `tb_supplier_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
