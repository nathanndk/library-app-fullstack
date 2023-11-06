-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2023 at 04:59 PM
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
-- Database: `perpustakaan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(11) NOT NULL,
  `idbuku` int(10) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `idkategori` bigint(20) UNSIGNED NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `kota_terbit` varchar(255) NOT NULL,
  `editor` varchar(255) NOT NULL,
  `file_gambar` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_tersedia` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `idbuku`, `isbn`, `judul`, `year`, `idkategori`, `pengarang`, `penerbit`, `kota_terbit`, `editor`, `file_gambar`, `stok`, `stok_tersedia`, `created_at`, `updated_at`) VALUES
(1, 1, '123-456-789', 'Janji', '2007', 3, 'Tere Liye', 'Sabak Grid', 'Jakarta', 'Tere Liye', 'IyQUFWWh4cuc1sn11FEB3sG108t6tcwlQKyUaFyD.jpg', 3, 3, '2023-10-23 20:51:15', '2023-10-23 20:51:15'),
(2, 2, '9780747591054', 'Harry Potter and the Deathly Hallows', '2004', 2, 'Rowling J K', 'Bloomsbury', 'Wolverhampton', 'Rowling J K', 'MEfe8vrhN33JHMq2NJBsaa8Toff9u1Pvx7edPmSB.jpg', 5, 4, '2023-10-26 20:33:16', '2023-10-26 20:33:16'),
(3, 3, '978-0-316-76948-0', 'The Catcher in the Rye', '1951', 2, 'J.D. Salinger', 'Little, Brown and Company', 'Washington DC', 'J.D. Salinger', 'Bx6FFCDijtV6GBuhpnuiVkS2S1Y9m5olZYZZOju9.jpg', 10, 8, '2023-10-28 19:39:17', '2023-10-28 19:39:17'),
(4, 4, '978-1854712709', 'Moby-Dick', '1951', 8, 'Herman Melville', 'Richard Bentley', 'Washington DC', 'Herman Melville', 'wZYJRKlUKQYnRmmL9TmGyEQ3ZcWJndCNgqFNpN21.jpg', 14, 9, '2023-10-28 19:46:30', '2023-10-28 19:46:30'),
(5, 5, '978-0261103573', 'The Lord of the Rings', '1954', 2, 'J.R.R. Tolkien', 'George Allen & Unwin', 'New York', 'J.R.R. Tolkien', '5mQYl8vtBfe8jnVBVnUI67xveZEBHliv0Qq6VeB9.jpg', 15, 15, '2023-10-28 19:49:00', '2023-10-28 19:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `idkategori` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`idkategori`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Education', '2023-10-27 03:17:47', '2023-10-27 03:17:47'),
(2, 'Fiksi', '2023-10-27 03:11:08', '2023-10-27 03:11:08'),
(3, 'Novel', '2023-10-27 03:17:10', '2023-10-27 03:17:33'),
(4, 'Romance', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(5, 'Komik', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(6, 'Lifestyle', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(7, 'Teknologi', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(8, 'Sejarah', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(9, 'Horor', '2023-10-27 03:15:56', '2023-10-27 03:15:56'),
(10, 'Comedy', '2023-10-27 03:15:56', '2023-10-27 03:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `idkomentar` bigint(20) UNSIGNED NOT NULL,
  `komentar` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `book_id` bigint(20) DEFAULT NULL,
  `noktp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`idkomentar`, `komentar`, `created_at`, `updated_at`, `book_id`, `noktp`) VALUES
(5, 'mantabb', '2023-11-01 18:01:51', '2023-11-01 18:01:51', 1, '150601000000003');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `idtransaksi` int(5) NOT NULL,
  `idbuku` int(11) NOT NULL,
  `tgl_kembali` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `denda` int(11) DEFAULT NULL,
  `idpetugas` int(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`idtransaksi`, `idbuku`, `tgl_kembali`, `denda`, `idpetugas`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-10-24 17:38:51', 5000, 1, NULL, NULL),
(2, 2, '2023-10-29 00:40:08', 10000, 1, '2023-10-29 00:39:18', NULL),
(11, 2, '2023-10-29 00:44:47', NULL, 1, '2023-10-29 00:39:18', NULL),
(12, 1, '2023-10-29 00:48:27', NULL, 1, NULL, NULL),
(11, 5, '2023-10-29 02:55:40', 100000, 1, '2023-10-29 02:55:40', NULL),
(12, 4, '2023-10-29 02:56:08', NULL, 1, '2023-10-29 02:56:08', NULL),
(11, 3, '2023-10-29 02:56:41', NULL, 1, '2023-10-29 02:56:41', NULL),
(12, 4, '2023-10-29 02:57:10', NULL, 1, '2023-10-29 02:57:10', NULL),
(12, 4, '2023-10-29 02:57:22', NULL, 1, '2023-10-29 02:57:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libraries`
--

CREATE TABLE `libraries` (
  `idpetugas` int(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libraries`
--

INSERT INTO `libraries` (`idpetugas`, `nama`, `email`, `password`) VALUES
(1, 'natan', 'nat@natan.com', 'natan123');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `noktp` varchar(15) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `no_telp` varchar(255) NOT NULL,
  `file_ktp` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `noktp`, `nama`, `password`, `alamat`, `kota`, `email`, `email_verified_at`, `no_telp`, `file_ktp`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, '1000', 'zia', 'zia123', 'smrg', 'smrg', 'zi@zia.com', NULL, '08888827', 'n2AVDhUBQQFI7MM2KWWBrZ6HNr9RN56Zq8KfDgRi.jpg', '', '2023-10-24 02:32:28', '2023-10-24 02:32:28'),
(3, '1234', 'zeno', 'zen123', 'jkt', 'jkt', 'zen@zen.com', NULL, '08123', 'dPI7poCJ4D8yaDGzdQDHtn1jeQnTDnMdFxDTpDQZ.jpg', '', '2023-10-24 09:33:51', '2023-10-24 09:33:51'),
(1, '1234572757137', 'Thifa', 'thifa123', 'bulusan', 'semarang', 'thifa@thifa.com', NULL, '0812762733', '85zl2f7G7P4OznvPNrxwFsiDaQFa8thTiJ8k2C9M.jpg', '', '2023-10-23 21:09:17', '2023-10-23 21:09:17'),
(6, '150601000000001', 'athiya', '$2y$10$bQSJNNML0oEzirstQEUKsemzE3az7qWbgxjDw2cqYdVIsjBuz1nci', 'maerasari', 'jakarta', 'athiya@athiya.com', NULL, '082222333333', 'zW2Ni6KfHc7M84llV4fNLICqJFt3cvxRI6MWeYd8.jpg', NULL, '2023-10-28 14:36:37', '2023-10-28 14:36:37'),
(7, '150601000000002', 'azra', '$2y$10$7dhyuYlY.hFyiNHVMQJv6OoohJNxHfA0QjNtTuCFlctzurk7Z2DAS', 'azra', 'semarang', 'azra@azra.com', NULL, '082222333334', 'XQ5Uyg0n0OHsrzSC7EGNfDETIj6NeKEQXNu6oY7g.jpg', NULL, '2023-10-28 14:47:10', '2023-10-28 14:47:10'),
(8, '150601000000003', 'nathan', '$2y$10$9oRjAATbfZqtROVwqpNGnOBLNblaCWidWWA6Yzkeyr.V3loL87/4u', 'jakarta', 'semarang', 'nathan@nathan.com', NULL, '082222333335', 'LkITqL657QqwfADg6ZfMxDO7rStwFE4zWBpgjjPZ.jpg', NULL, '2023-10-28 15:49:01', '2023-10-28 15:49:01'),
(4, '150601111111111', 'Zhafira Amanda', 'zhafira123', 'JL. Timoho 4 Bulusan', 'Bangka Belitung', 'zhafira@zhafira.com', NULL, '082111111111', '', '', NULL, NULL),
(9, '150601111111113', 'natan brokoli', '$2y$10$lu/Sc7NhNeDkd23Ggax0je/VyPmqTV6QPFLfjqCZ/y6.TeWG2MtvW', 'Jalan Classic 1 blok E nomor 16', 'Kota Medan', 'brokoli@brokoli.com', NULL, '081294947677', 'UL5OfeJW8SuR9DhsVwYvv6Kq19SnM2JSXh7Bn985.jpg', NULL, '2023-11-01 03:20:33', '2023-11-01 03:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_22_061922_create_books_table', 2),
(6, '2023_10_22_070555_create_categories_table', 2),
(7, '2023_10_23_130901_create_members_table', 3),
(8, '2023_10_24_041342_create_ratings_table', 4),
(9, '2014_10_12_100000_create_password_reset_tokens_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Member', 8, 'auth_token', '934119ada55bbe4be6d3b9707f4e23bb3f34678a0a4baaa8eb476da2e5202381', '[\"*\"]', NULL, NULL, '2023-10-28 15:49:01', '2023-10-28 15:49:01'),
(2, 'App\\Models\\Member', 8, 'auth_token', 'bf851efd3a4f80154214317c4fdb1537d18d7117b8f2617a96b84067d01581b1', '[\"*\"]', NULL, NULL, '2023-10-28 15:50:38', '2023-10-28 15:50:38'),
(3, 'App\\Models\\Member', 8, 'auth_token', '6c6cce000dcc3577c0d8d3a1aec4eb419d7b0b761c363fc8ffc7742fcfedcfd2', '[\"*\"]', NULL, NULL, '2023-10-28 15:52:23', '2023-10-28 15:52:23'),
(4, 'App\\Models\\Member', 8, 'auth_token', '1001c8cff68aabbfd872219a04126722f83f861052d5d231249bd5a41f8a907b', '[\"*\"]', NULL, NULL, '2023-10-28 16:16:47', '2023-10-28 16:16:47'),
(5, 'App\\Models\\Member', 8, 'auth_token', 'ece1e909f0f34893ebb33a54003950eaa39e75c519a2ce4c61ecb8adb6f538a1', '[\"*\"]', NULL, NULL, '2023-10-28 16:30:29', '2023-10-28 16:30:29'),
(6, 'App\\Models\\Member', 8, 'auth_token', '0d4dd3355c2473171ee2fe25c95aac0b14c63c3539a48858ada745ec422b3d27', '[\"*\"]', NULL, NULL, '2023-10-28 16:31:02', '2023-10-28 16:31:02'),
(7, 'App\\Models\\Member', 8, 'auth_token', 'ae3362e7c76cf674043992df79eff5f028300e387eba7e39d5e576048e14a581', '[\"*\"]', NULL, NULL, '2023-10-28 16:31:22', '2023-10-28 16:31:22'),
(8, 'App\\Models\\Member', 8, 'auth_token', '38db9837ba0a5c1ee88e3dba9003bc033f8dbbb6edbd7020b3f87d21871903de', '[\"*\"]', NULL, NULL, '2023-10-28 16:31:24', '2023-10-28 16:31:24'),
(9, 'App\\Models\\Member', 8, 'auth_token', 'b28ff47952ae4303789b0cac2d8b88824d1d18061668525a21f801106bebff93', '[\"*\"]', NULL, NULL, '2023-10-28 16:32:08', '2023-10-28 16:32:08'),
(10, 'App\\Models\\Member', 8, 'auth_token', '12a971267862ae763fda72ed95380ba9ccf12b473f0b5c567511e83c77b3fdf0', '[\"*\"]', NULL, NULL, '2023-10-28 16:32:46', '2023-10-28 16:32:46'),
(11, 'App\\Models\\Member', 8, 'auth_token', '860d01ad90eaee10717de81074d55fbd8ba98aea2f150c816c00539164d58b59', '[\"*\"]', NULL, NULL, '2023-10-28 16:33:57', '2023-10-28 16:33:57'),
(12, 'App\\Models\\Member', 8, 'auth_token', '653aaebf080d4d3042ae12fe9ff3786a76d38a63cee4f247eb4f779cbb728068', '[\"*\"]', NULL, NULL, '2023-10-28 16:34:08', '2023-10-28 16:34:08'),
(13, 'App\\Models\\Member', 8, 'auth_token', 'ace5e8a653f4065c97ea7821bd8cb8b3b62ef245affaa933fcf7b07a53b454f2', '[\"*\"]', NULL, NULL, '2023-10-28 18:24:31', '2023-10-28 18:24:31'),
(14, 'App\\Models\\Member', 8, 'auth_token', 'c422f7b2c1e521b07a5d865503c5a9bb82ecc64e34e37d492db13185d98b99bf', '[\"*\"]', NULL, NULL, '2023-10-28 18:25:12', '2023-10-28 18:25:12'),
(15, 'App\\Models\\Member', 8, 'auth_token', '62625ce45194f0f0adafc37fe30d50e885126e073cfd0f5fea465c3947c0f51e', '[\"*\"]', NULL, NULL, '2023-10-28 18:25:45', '2023-10-28 18:25:45'),
(16, 'App\\Models\\Member', 8, 'auth_token', 'fcdc7f748daf560966bb1eb03122b12294aec0fe349582bd8841774981bcb08d', '[\"*\"]', NULL, NULL, '2023-10-28 18:26:10', '2023-10-28 18:26:10'),
(17, 'App\\Models\\Member', 8, 'auth_token', '1af83f6f427a6637e755b55cb9f9a287044deac47a870cb71823db16ab0bc1d6', '[\"*\"]', NULL, NULL, '2023-10-28 21:42:11', '2023-10-28 21:42:11'),
(18, 'App\\Models\\Member', 8, 'auth_token', 'e2caf189948fbd6573fc967581df438be9619d6eea6c5ef2a398a5bcec070e79', '[\"*\"]', NULL, NULL, '2023-10-30 17:28:27', '2023-10-30 17:28:27'),
(19, 'App\\Models\\Member', 8, 'auth_token', '51ab469ff0b680521307833a831a08122898bb4319607ebf0d058af00204402a', '[\"*\"]', NULL, NULL, '2023-11-01 01:59:06', '2023-11-01 01:59:06'),
(20, 'App\\Models\\Member', 9, 'auth_token', '244975363b4e58fbee4695f1714b5075b069cc2d7708bd855a74e50bfcef1f90', '[\"*\"]', NULL, NULL, '2023-11-01 03:20:33', '2023-11-01 03:20:33'),
(21, 'App\\Models\\Member', 8, 'auth_token', '15bca5164af3405ec494ee4c04925b87b71a3c628a2cb345fe66f87f0cd1b384', '[\"*\"]', NULL, NULL, '2023-11-01 14:45:30', '2023-11-01 14:45:30'),
(22, 'App\\Models\\Member', 8, 'auth_token', '193d25e44e4c34b122a00ccfcb8c3f3aecd948ca57318715fd8fcd75e8baa5ca', '[\"*\"]', NULL, NULL, '2023-11-01 14:47:44', '2023-11-01 14:47:44'),
(23, 'App\\Models\\Member', 8, 'auth_token', '7b8d6abf05e29f3f0854d5d018e97303d4fe02d99e72c2634626cdd437c56a7f', '[\"*\"]', NULL, NULL, '2023-11-01 14:50:24', '2023-11-01 14:50:24'),
(24, 'App\\Models\\Member', 8, 'auth_token', '5d01ef6efabce32e08b8cccf90d0bb9aaf006cc6a805d5814d32a0ca82c805a6', '[\"*\"]', NULL, NULL, '2023-11-01 14:54:06', '2023-11-01 14:54:06'),
(25, 'App\\Models\\Member', 8, 'auth_token', '92c945c66afe181d3bb62ca5dd14c8072b7c3b96c7b62cf0f8dae63ecb02b48c', '[\"*\"]', NULL, NULL, '2023-11-01 15:20:30', '2023-11-01 15:20:30'),
(26, 'App\\Models\\Member', 8, 'auth_token', '8d56e677d8f39e1768d854a3b20b39656b6b65f09632888f415a535ac634d693', '[\"*\"]', NULL, NULL, '2023-11-01 15:23:09', '2023-11-01 15:23:09'),
(27, 'App\\Models\\Member', 8, 'auth_token', 'c2f75266b5e735b477183181b3291287935696992ed4c508b0d34d9c0e1bfc40', '[\"*\"]', NULL, NULL, '2023-11-01 15:25:16', '2023-11-01 15:25:16'),
(28, 'App\\Models\\Member', 8, 'auth_token', '21fb483f0a011d31da503635b3742360dee37597b5c8ee6261c9a517e771e438', '[\"*\"]', NULL, NULL, '2023-11-01 15:39:54', '2023-11-01 15:39:54'),
(29, 'App\\Models\\Member', 8, 'auth_token', 'c4f6ec12576a0bc5eb799ee97c422847fc19cf70dcccc05c13475ff627bd748e', '[\"*\"]', NULL, NULL, '2023-11-01 16:27:55', '2023-11-01 16:27:55'),
(30, 'App\\Models\\Member', 8, 'auth_token', 'f8f8a01fc56a4e341e5e77e71688517ff50c09afa0f4c00b8c4cb483ac678c43', '[\"*\"]', NULL, NULL, '2023-11-01 16:28:14', '2023-11-01 16:28:14'),
(31, 'App\\Models\\Member', 8, 'auth_token', '32beba6b28b195698d433a19b49a81f9591c6b041cd8402eba1bc48d72df2a58', '[\"*\"]', NULL, NULL, '2023-11-01 16:29:44', '2023-11-01 16:29:44'),
(32, 'App\\Models\\Member', 8, 'auth_token', 'bea7481823e27a8aa09d9bcef5d9bec58e96e767a8915c299e34a6e168fa6e25', '[\"*\"]', NULL, NULL, '2023-11-01 16:30:12', '2023-11-01 16:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skor_rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `noktp` varchar(15) DEFAULT NULL,
  `book_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `skor_rating`, `created_at`, `updated_at`, `noktp`, `book_id`) VALUES
(6, 2, '2023-11-01 18:01:51', '2023-11-01 18:01:51', '150601000000003', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED DEFAULT NULL,
  `idtransaksi` int(5) NOT NULL,
  `noktp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pinjam` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idpetugas` int(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `idtransaksi`, `noktp`, `tgl_pinjam`, `idpetugas`, `created_at`, `updated_at`) VALUES
(0, 1, '1000', '2023-10-24 17:38:17', 1, NULL, NULL),
(NULL, 2, '1000', '2023-10-24 11:52:35', 1, '2023-10-24 11:52:35', '2023-10-24 11:52:35'),
(11, 11, '150601000000003', '2023-10-29 00:42:46', 1, '2023-10-29 00:39:18', NULL),
(12, 12, '150601000000003', '2023-10-29 00:43:50', 1, '2023-10-29 00:39:18', NULL),
(13, 13, '150601000000003', '2023-10-29 00:43:50', 1, '2023-10-29 00:39:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idbuku` (`idbuku`),
  ADD KEY `fk_books_categories` (`idkategori`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idkomentar`),
  ADD KEY `fk_comments_books` (`book_id`),
  ADD KEY `fk_comments_members` (`noktp`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD KEY `fk_details_transactions` (`idtransaksi`),
  ADD KEY `fk_details_libraries` (`idpetugas`),
  ADD KEY `fk_details_books` (`idbuku`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `libraries`
--
ALTER TABLE `libraries`
  ADD PRIMARY KEY (`idpetugas`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`noktp`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ratings_members` (`noktp`),
  ADD KEY `fk_ratings_books` (`book_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`idtransaksi`),
  ADD KEY `fk_transactions_libraries` (`idpetugas`),
  ADD KEY `id` (`id`),
  ADD KEY `fk_transaction_members` (`noktp`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `idkategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `idkomentar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_categories` FOREIGN KEY (`idkategori`) REFERENCES `categories` (`idkategori`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `fk_comments_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `fk_details_books` FOREIGN KEY (`idbuku`) REFERENCES `books` (`idbuku`),
  ADD CONSTRAINT `fk_details_libraries` FOREIGN KEY (`idpetugas`) REFERENCES `libraries` (`idpetugas`),
  ADD CONSTRAINT `fk_details_transactions` FOREIGN KEY (`idtransaksi`) REFERENCES `transactions` (`idtransaksi`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `fk_ratings_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `fk_ratings_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transaction_members` FOREIGN KEY (`noktp`) REFERENCES `members` (`noktp`),
  ADD CONSTRAINT `fk_transactions_libraries` FOREIGN KEY (`idpetugas`) REFERENCES `libraries` (`idpetugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
