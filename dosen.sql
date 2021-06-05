-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 03:48 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dosen`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_data`
--

CREATE TABLE `log_data` (
  `id_log` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `total_gaji_lama` varchar(20) DEFAULT NULL,
  `total_gaji_baru` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `pengedit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_data`
--

INSERT INTO `log_data` (`id_log`, `id_dosen`, `total_gaji_lama`, `total_gaji_baru`, `waktu`, `pengedit`) VALUES
(1, 1, '1875000', '2250000', '2021-06-01 21:27:40', 'admin'),
(2, 1, '2250000', '9000000', '2021-06-01 21:28:38', 'mimi');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_dosen`
--

CREATE TABLE `tabel_dosen` (
  `id_dosen` int(11) NOT NULL,
  `nidn` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tmpLahir` varchar(50) DEFAULT NULL,
  `tglLahir` date DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `pendidikan` enum('S2','S3') DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `golongan` enum('3A','3B','3C','4A','4B','4C') DEFAULT NULL,
  `pangkat` enum('AA','L','LK','GB') DEFAULT NULL,
  `pengalaman` text DEFAULT NULL,
  `gajiPokok` int(15) NOT NULL DEFAULT 0,
  `total_gaji` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_dosen`
--

INSERT INTO `tabel_dosen` (`id_dosen`, `nidn`, `nama`, `tmpLahir`, `tglLahir`, `telepon`, `pendidikan`, `gender`, `spesialisasi`, `username`, `pass`, `golongan`, `pangkat`, `pengalaman`, `gajiPokok`, `total_gaji`) VALUES
(1, 123456, 'Paramita Aditung', 'Makassar', '2021-06-01', '0852-0000-1111', 'S2', 'P', 'Programming, Database, ', 'paramitaaditung@yahoo.com', '123', '3B', 'GB', 'Haiiii', 1000000, 9000000);

-- --------------------------------------------------------

--
-- Table structure for table `tabel_login`
--

CREATE TABLE `tabel_login` (
  `id_login` int(11) NOT NULL,
  `user` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tabel_login`
--

INSERT INTO `tabel_login` (`id_login`, `user`, `pass`) VALUES
(1, 'mimi', '123'),
(2, 'admin', '111'),
(3, 'akun', '321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_data`
--
ALTER TABLE `log_data`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `tabel_login`
--
ALTER TABLE `tabel_login`
  ADD PRIMARY KEY (`id_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_data`
--
ALTER TABLE `log_data`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabel_dosen`
--
ALTER TABLE `tabel_dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tabel_login`
--
ALTER TABLE `tabel_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
