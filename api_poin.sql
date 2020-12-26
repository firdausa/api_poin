-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2020 at 11:00 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_poin`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(8, '2019_11_17_070437_poin_siswa', 3),
(16, '2019_11_17_070252_siswa', 5),
(17, '2019_11_17_070339_kelas', 5),
(18, '2019_11_17_070413_pelanggaran', 6),
(21, '2019_11_17_070437_poinsiswa', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` int(20) NOT NULL,
  `nama_pelanggaran` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('kedisiplinan','kerapian','kerajinan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kedisiplinan',
  `poin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `nama_pelanggaran`, `kategori`, `poin`, `created_at`, `updated_at`) VALUES
(2, 'Barang tertinggal', 'kedisiplinan', 15, '2019-11-17 01:31:49', '2020-01-16 05:30:29'),
(3, 'Terlambat', 'kedisiplinan', 10, '2019-11-20 07:02:18', '2019-11-20 07:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `poin_siswa`
--

CREATE TABLE `poin_siswa` (
  `id` int(20) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_pelanggaran` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `id_petugas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poin_siswa`
--

INSERT INTO `poin_siswa` (`id`, `id_siswa`, `id_pelanggaran`, `tanggal`, `keterangan`, `id_petugas`, `created_at`, `updated_at`) VALUES
(4, 2, 3, '2019-11-20 00:00:00', 'melanggar', 1, '2019-12-05 06:55:56', '2019-12-05 06:55:56'),
(5, 3, 2, '2019-11-20 00:00:00', 'melanggar', 1, '2019-12-05 06:57:27', '2019-12-05 06:57:27'),
(6, 4, 3, '2020-01-18 00:00:00', '1 jam', 5, '2020-01-17 20:20:22', '2020-01-17 20:39:50'),
(8, 4, 3, '2020-01-20 00:00:00', '2 jam1231234444', 5, '2020-01-17 21:21:48', '2020-01-17 23:54:38'),
(9, 4, 2, '2020-02-05 00:00:00', 'sasasas', 1, '2020-02-04 23:22:13', '2020-02-04 23:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(20) NOT NULL,
  `nis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_siswa` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas`, `created_at`, `updated_at`) VALUES
(2, 'ABC/1456/2019', 'Muhammad Asrofi', 'XRPL3', '2019-11-17 01:04:49', '2020-01-15 16:12:33'),
(3, '112/80/2019.1', 'Bayu Wicaksono', 'XRPL3', '2019-11-20 06:41:09', '2020-01-15 17:36:57'),
(4, '123/CCV/2019', 'Hayyin Ahmad', 'XRPL2', '2020-01-15 03:00:18', '2020-01-15 16:11:59'),
(5, '123/aaa/aaa', 'aaa', 'XRPL1', '2020-01-16 05:35:33', '2020-01-17 20:47:22'),
(6, '123/bbb', 'bbb', 'XRPL2', '2020-01-16 05:35:44', '2020-01-16 05:35:44'),
(7, '123/ccc', 'ccc', 'XRPL3', '2020-01-16 05:35:57', '2020-01-16 05:35:57'),
(8, '123/ddd', 'ddd', 'XRPL1', '2020-01-16 05:36:07', '2020-01-16 05:36:07'),
(9, '123/eee', 'eee', 'XRPL2', '2020-01-16 05:36:17', '2020-01-16 05:36:17'),
(10, '123/fff', 'fff', 'XRPL2', '2020-01-16 05:36:26', '2020-01-16 05:36:26'),
(11, '123/ggg', 'ggg', 'XRPL3', '2020-01-16 05:36:38', '2020-01-16 05:36:38'),
(12, '123/hhh', 'hhh', 'XRPL1', '2020-01-16 05:37:45', '2020-01-16 05:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','petugas') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'petugas',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Pak Emil1', 'b@b.b', '$2y$10$e8GD1STdI8dGo1vnDdn4sOCKR9lUoYK2.Ud0LKdU3j5zO1AGcbHAC', 'admin', '2019-11-16 23:52:16', '2020-01-16 05:27:31'),
(5, 'thoriq', 'a@a.a', '$2y$10$18dJRGaC6dJiHfYO/q6HEuFnaI7C8LruEfWOfJssj7A7sZuf0HmxC', 'admin', '2020-01-14 19:33:48', '2020-01-14 19:33:48'),
(7, 'Firdausa', 'q@a.a', '$2y$10$QAXPh06hIh2njsO.4suGeOtkk9.X7QH9lsVLJXdvHvwF9cMO5zAqu', 'petugas', '2020-01-14 19:55:32', '2020-01-14 19:55:32'),
(8, 'Hayyin', 'hayyin@gmail.vom', '$2y$10$blFB27CpcgpL22rQaDV0D.C6oVN4yT9G62V7Je8BJZhT7ZaEzWYv.', 'petugas', '2020-01-28 22:48:29', '2020-01-28 22:48:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poin_siswa`
--
ALTER TABLE `poin_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_pelanggaran` (`id_pelanggaran`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswa_nis_unique` (`nis`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poin_siswa`
--
ALTER TABLE `poin_siswa`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poin_siswa`
--
ALTER TABLE `poin_siswa`
  ADD CONSTRAINT `poin_siswa_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `poin_siswa_ibfk_2` FOREIGN KEY (`id_pelanggaran`) REFERENCES `pelanggaran` (`id`),
  ADD CONSTRAINT `poin_siswa_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
