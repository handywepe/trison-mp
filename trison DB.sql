-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2021 at 04:54 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trison`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'pulpen', '2020-11-04 21:44:24', '2020-11-04 21:44:24'),
(5, 'Tape Dispenser', NULL, NULL),
(6, 'Solasi', NULL, NULL),
(7, 'Lakban', NULL, NULL),
(8, 'Double Tape', NULL, NULL),
(9, 'Tape Cutter', NULL, NULL),
(10, 'Double Foam', NULL, NULL),
(11, 'Stapler', NULL, NULL),
(13, 'Colour Clips', NULL, NULL),
(14, 'Push Pin', NULL, NULL),
(15, 'Penjepit Kertas (Binder Clips)', NULL, NULL),
(16, 'Isi Staples', NULL, NULL),
(17, 'Trigonal Clips', NULL, NULL),
(18, 'Cutter', NULL, NULL),
(19, 'Isi Cutter', NULL, NULL),
(20, 'Gunting', NULL, NULL),
(21, 'Gunting Kuku', NULL, NULL),
(22, 'Gunting Lipat', NULL, NULL),
(23, 'Jarum Pentul', NULL, NULL),
(24, 'Paku Payung', NULL, NULL),
(25, 'Lem', NULL, NULL),
(26, 'Stam Pad (BAK)', NULL, NULL),
(27, 'Tinta Stampel', NULL, NULL),
(28, 'Date Stamp', NULL, NULL),
(29, 'Number Stamp', NULL, NULL),
(30, 'Kawat Spiral', NULL, NULL),
(31, 'Acco Putih', NULL, NULL),
(32, 'Mika', NULL, NULL),
(33, 'Kertas', NULL, NULL),
(34, 'Sampul', NULL, NULL),
(35, 'Map', NULL, NULL),
(36, 'Amplop', NULL, NULL),
(37, 'File Case', NULL, NULL),
(38, 'Buku', NULL, NULL),
(41, 'Pensil', NULL, NULL),
(42, 'Spidol', NULL, NULL),
(43, 'Highlighter', NULL, '2020-11-24 06:22:16'),
(44, 'Brush', NULL, NULL),
(45, 'Penghapus', NULL, NULL),
(46, 'Serutan', NULL, NULL),
(47, 'Penggaris', NULL, NULL),
(48, 'Busur', NULL, NULL),
(49, 'Crayon', NULL, NULL),
(50, 'Gantungan Kunci', NULL, NULL),
(51, 'Sticky Note', NULL, NULL),
(52, 'Jangka', NULL, NULL),
(53, 'Corretion Tape', NULL, NULL),
(55, 'Yoyo ID Card', NULL, NULL),
(56, 'Label', NULL, NULL),
(57, 'Tisu', NULL, NULL),
(58, 'DVDR', NULL, NULL),
(59, 'CDR', NULL, NULL),
(60, 'CD RW', NULL, NULL),
(61, 'DVD RW', NULL, NULL),
(62, 'Amplop CD', NULL, NULL),
(63, 'Tali Kur', NULL, NULL),
(64, 'Baterai', NULL, NULL),
(65, 'Tali ID Card', NULL, NULL),
(66, 'Balon', NULL, NULL),
(67, 'Tas', NULL, NULL),
(68, 'Tempat ID Card', NULL, NULL),
(69, 'Styrofoam', NULL, NULL),
(70, 'Clipboard', NULL, NULL),
(71, 'Pisau Cukur', NULL, NULL),
(72, 'Tippex', NULL, NULL),
(73, 'Isi Pensil', NULL, NULL),
(74, 'Shuttlecock', NULL, NULL),
(75, 'Pita Tarik', NULL, NULL),
(76, 'Pita Kain', NULL, NULL),
(77, 'Tinta Stample', NULL, NULL),
(78, 'Binder', NULL, NULL),
(79, 'Payung', NULL, NULL),
(81, 'Plastik', NULL, NULL),
(82, 'Automatic Numbering Machine', NULL, NULL),
(83, 'Lever Arch File', NULL, NULL),
(84, 'Magazine File', NULL, NULL),
(85, 'Water Color', NULL, NULL),
(86, 'Isi Pulpen', '2020-11-22 17:52:03', '2020-11-22 17:52:04'),
(87, 'Pembolong Kertas', NULL, NULL),
(88, 'Flashdisk', NULL, NULL),
(90, 'Mouse', NULL, NULL),
(91, 'Senar Gitar', NULL, NULL),
(92, 'Figura', NULL, NULL),
(93, 'Anti Gores KTP', NULL, NULL),
(94, 'Sticknote', NULL, NULL),
(95, 'Minyak Wangi', NULL, NULL),
(96, 'Lilin Mainan', NULL, NULL),
(97, 'Masker', NULL, NULL),
(98, 'Laser', NULL, NULL),
(99, 'Bola', NULL, NULL),
(100, 'Sisir', NULL, NULL),
(101, 'Jas Hujan', NULL, NULL),
(102, 'Jepitan Besi', NULL, NULL),
(132, 'Kalkulator', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cat_projects`
--

CREATE TABLE `cat_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cat_projects`
--

INSERT INTO `cat_projects` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Buku', '2020-11-04 22:12:32', '2020-11-04 22:12:32'),
(2, 'Kartu Nama', '2020-12-17 09:20:03', '2020-12-17 09:20:03'),
(3, 'Spanduk', '2020-12-17 09:20:17', '2020-12-17 09:20:17'),
(4, 'Brosur', '2020-12-17 09:20:37', '2020-12-17 09:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `nama`, `perusahaan`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'Bpk. Syamsul', 'Perorangan', NULL, NULL, NULL, '2020-11-04 22:14:05', '2020-12-17 08:19:44'),
(2, 'Hikmatullah', 'CV. Creativision', NULL, NULL, NULL, '2020-12-17 08:20:40', '2020-12-17 08:20:40'),
(3, 'Hendra', 'Perorangan', NULL, NULL, NULL, '2020-12-17 08:21:30', '2020-12-17 08:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `doc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `project_id`, `doc`, `created_at`, `updated_at`) VALUES
(1, 6, 'contoh-16112020.jpg', '2020-11-16 04:10:41', '2020-11-16 04:10:41'),
(2, 6, 'file siap cetak-16112020.jpg', '2020-11-16 04:11:00', '2020-11-16 04:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_10_07_160219_create_categories_table', 1),
(10, '2020_10_07_160416_create_products_table', 1),
(11, '2020_10_07_160653_create_suppliers_table', 1),
(12, '2020_10_07_160822_create_customers_table', 1),
(13, '2020_10_07_162222_create_product_outs_table', 1),
(14, '2020_10_07_162327_create_product_ins_table', 1),
(15, '2020_10_07_163703_create_foreignkey_products', 1),
(16, '2020_10_07_164428_create_foreignkey_product_outs', 1),
(17, '2020_10_07_164536_create_foreignkey_product_ins', 1),
(18, '2020_10_22_144210_add_column_products', 1),
(19, '2020_10_28_143554_add_column_products_harga', 1),
(20, '2020_10_30_154848_create_cat_projects_table', 1),
(21, '2020_10_30_155024_create_projects_table', 1),
(22, '2020_11_05_021659_create_documents_table', 1),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(26, '2016_06_01_000004_create_oauth_clients_table', 2),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(28, '2020_11_14_082622_create_payments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'SoJY7LU2RbVqPV0z64GGhQTmSCsLxfaSsPeHDIey', NULL, 'http://localhost', 1, 0, 0, '2020-11-06 10:09:29', '2020-11-06 10:09:29'),
(2, NULL, 'Laravel Password Grant Client', 'OJs6gsdRWlVvVbVYsm4WqxkIOkNS2Xs2bV5aeO7H', 'users', 'http://localhost', 0, 1, 0, '2020-11-06 10:09:29', '2020-11-06 10:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-06 10:09:29', '2020-11-06 10:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `project_id`, `pembayaran`, `tanggal`, `created_at`, `updated_at`) VALUES
(14, 4, 1000, '2020-11-14', '2020-11-14 07:51:02', '2020-11-14 07:51:02'),
(16, 2, 100, '2020-11-16', '2020-11-15 10:09:05', '2020-11-15 10:09:05'),
(17, 6, 5000, '2020-11-16', '2020-11-16 04:14:17', '2020-11-16 04:14:17'),
(18, 6, 5000, '2020-11-16', '2020-11-16 04:14:50', '2020-11-16 04:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `merek` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_modal` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `merek`, `tipe`, `keterangan`, `harga_modal`, `harga`, `image`, `qty`, `created_at`, `updated_at`, `spec`) VALUES
(387, 132, 'Montana', 'MTC 512', NULL, 30000, 40000, 'product.jpg', 6, '2020-11-22 21:18:21', '2020-11-24 10:31:31', NULL),
(388, 132, 'Citizen', 'CDC SDC 868L', NULL, 88000, 115000, 'product.jpg', 502, '2020-11-22 21:18:21', '2020-11-24 10:30:32', NULL),
(389, 132, 'Montana', 'MTC 868L', '', 42500, 60000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(390, 132, 'Cigi', 'CL 110N', '', 10000, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(391, 132, 'Citizen', 'SDC 8128N', '', 52000, 70000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(392, 132, 'Cigi', 'CL 812 C', '', 24000, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(393, 5, '', 'No. 50', '', 17500, 23000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(394, 6, '', 'Putih Besar (2 inc)', '', 8000, 12000, 'product.jpg', 499, '2020-11-22 21:18:21', '2020-12-17 08:18:12', NULL),
(395, 6, '', 'Putih Sedang (1 inc)', NULL, 4000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(396, 6, '', 'Putih Kecil (1/2 inc)', NULL, 2000, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(397, 6, '', 'Gold Mini (Isi. 12)', '', 400, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(398, 7, '', 'Coklat Besar', '', 7900, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(399, 7, '', 'Hitam Jumbo (3 inch) / 7,5cm', '', 18500, 24000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(400, 7, '', 'Hitam Besar (2 inc) / 5cm', '', 13500, 17000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(401, 7, '', 'Hitam Sedang (1,5 inc) / 3,5cm', '', 10000, 13000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(402, 7, '', 'Hitam Kecil (1 inc) / 2,5cm', '', 6500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(403, 7, '', 'Hitam mini (listrik)', 'isi 10', 650, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(404, 7, '', 'Lakban Kertas/Masking Tape ( 2 inc ) / 5 cm', NULL, 11500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(405, 7, '', 'Lakban Kertas/Masking Tape ( 1 inc ) / 2,5 cm', NULL, 5750, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(406, 8, '', 'Besar ( 1 inc ) / 2,5 cm', '', 4500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(407, 8, '', 'Sedang ( 1/2 inc )/1 cm', '', 2500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(408, 8, '', 'Kecil ( 1/4 inc ) / 1/2 cm', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(409, 6, 'Unibel', 'Elektric Tape', '', 4500, 8500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(410, 9, '', 'TC 992', '', 11500, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(411, 10, '3M', '1 inch / 2,5cm', '', 50000, 60000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(412, 10, '3M', '1/2 inch / 1cm', '', 28000, 35000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(413, 11, 'Joyco', 'HD 10CL', '', 6000, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(414, 11, 'Joyco', 'HD 10D', '', 10000, 14000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(415, 11, 'Kenko', 'HD 10D', '', 10000, 14000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(416, 11, 'Etona', 'HD 10', '', 6000, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(417, 11, '', 'HD 50', '', 14000, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(418, 11, 'Maxx', 'HD 10', '', 12000, 17500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(419, 11, 'Maxx', 'HD 10D', '', 31500, 40000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(420, 11, 'Trifelo', 'mini', '', 4500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(421, 87, 'Bantek', 'Mini Punch', '', 15000, 21000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(422, 13, 'Kenko', 'No 3100', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(423, 14, 'Joyco', '', '', 2000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(424, 15, '', 'No. 155', '', 1000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(425, 15, '', 'No. 111', '', 650, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(426, 15, '', 'No. 105', ' ', 250, 500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(427, 15, '', 'No. 107', '', 350, 750, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(428, 15, '', 'No. 200', '', 1200, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(429, 15, '', 'No. 260', '', 1500, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(430, 15, '', 'No. 280', 'isi 6', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(431, 16, 'Etona', 'No 10', '', 1150, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(432, 16, 'Kangaro', 'No 10', '', 1700, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(433, 16, 'Etona', 'No 3 (24/6)', '', 3500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(434, 16, 'Maxx', 'No.10', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(435, 16, 'Etona', '23/8', '', 7000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(436, 16, 'Etona', '23/17', '', 17000, 21000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(437, 16, 'Kangaro', '24/6', '', 3500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(438, 17, 'Joyco', 'No. 1', '', 1500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(439, 17, 'Joyco', 'No. 3 Kecil', '', 1300, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(440, 17, '', 'No. 5', '', 3250, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(441, 8, '', 'Jumbo (2 inc)', '', 8000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(442, 18, '', 'Besar', '', 3250, 5000, 'product.jpg', 495, '2020-11-22 21:18:21', '2020-12-17 08:18:46', NULL),
(443, 18, '', 'Kecil', '', 2250, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(444, 18, '', 'L500', '', 11000, 17500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(445, 18, '', 'A300 (Kuning)', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(446, 19, '', 'Besar', '', 5000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(447, 19, '', 'Kecil', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(448, 20, 'Gunindo', 'OSS', '', 3500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(449, 20, 'Gunindo', 'Sedang (OLL)', '', 3500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(450, 20, 'Kenko', 'Besar', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(451, 20, 'Gunindo', 'Besar RB 838', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(452, 20, '', 'Jumbo RB 888', '', 9000, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(453, 21, '', 'Kecil / Polos', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(454, 21, '', 'Besar / Polos', '', 3500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(455, 21, 'Bai Chang', 'Besar', '', 6500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(456, 21, '', 'Batik', '', 6500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(457, 22, '', 'Kecil', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(458, 22, '', 'Besar', '', 3500, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(459, 23, '', '', 'Isi 3 lusin', 9000, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(460, 24, '', '', '', 1800, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(461, 23, '', '', '', 2000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(462, 25, 'Aibon', '', '', 7500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(463, 25, 'Fox', 'Besar', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(464, 25, 'Fox', 'kaleng', '', 7500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(465, 25, 'Fox', 'Sedang', '', 2000, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(466, 25, '', 'Korea', '', 4000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(467, 25, 'Power Glue', 'Satuan', '', 3500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(468, 25, 'Power Glue', 'Renceng', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(469, 25, 'UHU', '', 'isi 20', 5000, 6500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(470, 25, '', '', '', 600, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(471, 25, '', '', '', 4500, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(472, 25, '', '', '', 6000, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(473, 25, '', '', '', 1500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(474, 25, 'Oke', 'Tanggung/sedang', '', 1500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(475, 25, '', 'Glue Stick 8 gr', 'isi 30', 2250, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(476, 25, '', 'Glue Stick 15 gr', 'isi 20', 3500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(477, 26, '', 'Besar No. 1', '', 5250, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(478, 26, '', 'Kecil No. 0', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(479, 27, 'Joyco', 'Biru', '', 4000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(480, 27, 'Joyco', 'Hitam', '', 4000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(481, 27, '', 'Hitam', '', 0, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(482, 28, 'Joyco', '', '', 5500, 13000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(483, 29, 'Joyco', '', '', 6500, 14000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(484, 28, 'Joyco', 'Lunas', '', 7000, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(485, 30, '', '1/4 A4', '', 1000, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(486, 30, '', '1/4 F4', '', 1000, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(487, 30, '', '3/8 A4', '', 1500, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(488, 30, '', '3/8 F4', '', 1500, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(489, 31, 'Joyco', '', '', 7000, 13500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(490, 32, '', 'Warna Biru', 'Untuk Jilid', 0, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(491, 33, '', 'HVS A4 70gr', '', 36000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(492, 33, '', 'HVS F4 70gr', '', 40000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(493, 33, '', 'Minyak / Kuning', '', 750, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(494, 33, '', 'Kertas Kado', '', 1500, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(495, 33, '', 'Struk / Termal', '', 2000, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(496, 33, '', 'Kertas Karton', '', 1500, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(497, 33, '', 'Folio Garis', 'Isi 200', 200, 500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(498, 33, '', 'Folio Garis', 'Isi 100', 200, 500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(499, 33, '', 'Foil Emas', '', 1000, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(500, 34, '', 'Kopi', 'Isi 5', 750, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(501, 34, '', 'Coklat (boxy)', '', 1250, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(502, 34, '', 'Plastik', '', 2500, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(503, 33, '', 'Riwayat Hidup (CV)', '', 250, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(504, 35, '', 'Kertas (Biasa)', '', 650, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(505, 35, 'Biola', 'Kertas', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(506, 35, 'Elvins', 'Kertas', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(507, 35, 'Diamond', 'Kertas', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(508, 35, 'Inter X', 'Clip File', '', 6500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(509, 35, 'Inter X', 'Spring File', '', 6000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(510, 35, 'Airmal', 'Tali', '', 800, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(511, 36, '', 'Coklat Besar', 'Isi 100', 1000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(512, 35, 'Felix', 'Bussines File Ungu Folio', '', 2750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(513, 35, 'Inter X', 'Bussines File A4 Acco', '', 1750, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(514, 35, '', 'Tali Plastik ', '', 1850, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(515, 35, 'AKA Shiro', 'Bussines File Folio Acco', '', 2000, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(516, 35, 'Inter X', 'Bussines File Folio Acco', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(517, 35, 'Bantex', 'Trendy', '', 27000, 40000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(518, 35, 'AKA Shiro', 'Pocket F4', '', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(519, 35, 'AKA Shiro', 'Pocket A4', '', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(520, 37, '', 'Plastik', '', 23000, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(521, 36, '', 'Putih Besar', '@3pcs', 0, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(522, 36, '', 'Putih Kecil', '@5pcs', 0, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(523, 36, '', 'Coklat Kecil', '', 0, 500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(524, 35, '', 'Slopan Buka Atas', '', 0, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(525, 35, '', 'L Plastik Buka Samping', '', 1200, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(526, 38, '', 'Tabungan', '', 500, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(527, 38, '', 'Note 8819', '', 6000, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(528, 38, '', 'Keuangan Besar', '', 13000, 17500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(529, 38, '', 'Keuangan Kecil / Ekpsedisi', '', 8500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(530, 38, '', 'Gambar A4', '', 3000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(531, 38, '', 'Gambar A3', '', 5000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(532, 38, '', 'Iqro', '', 8500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(533, 38, '', 'Tulis Campus', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(534, 38, '', 'Tulis SIDU isi 38', '', 2250, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(535, 38, '', 'Tulis SDU isi 58', '', 3250, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(536, 38, '', 'Ring Book A6 (Agenda Spiral)', '', 8000, 11000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(537, 38, '', 'Juz Amma', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(538, 38, 'Paperline', 'Nota Kontan', 'Isi 10', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(539, 38, '', 'Nota Batik', '', 2000, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(540, 38, '', 'Kwitansi Kecil', '', 2000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(541, 38, '', 'Kwitansi Sedang', '', 3500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(542, 38, '', 'Kwitansi Besar', '', 5000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(543, 38, '', 'Pocket Note', '', 2000, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(544, 38, 'ABD', 'Note Kecil', '', 550, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(545, 38, 'Paperline', 'A5', 'Isi 50', 3750, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(546, 38, 'Erica', 'Pocket Diary 137', '', 7500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(547, 38, 'Erica', 'Agenda 156 Kecil', '', 3000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(548, 38, '', 'Ring Book A5 (1 warna)', '', 12000, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(549, 38, '', 'Ring Book A5 (4 warna)', '', 18000, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(550, 38, '', 'Ring Book B5 (4 warna) / 16K', '', 28000, 37000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(551, 38, '', 'Ring Book B5 (1 warna) / 16K', '', 18000, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(552, 38, '', 'Senmu', '', 0, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(553, 1, '', 'Pen Stand', '', 7500, 11000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(554, 1, '', 'HY 468', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(555, 1, 'Standart', 'C88', '', 1150, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(556, 1, 'Kenko', 'K1 Mini Hitam', '', 3250, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(557, 1, 'Joyco', 'Gel GP 265Q', '', 1750, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(558, 1, 'Kenko', 'Sign KS 97', '', 3250, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(559, 1, 'Joyco', 'Batik', '', 2250, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(560, 1, 'Kenko', 'Gel K1 Besar', '', 4000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(561, 1, 'Greebel', 'Hitam', '', 1000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(562, 1, 'Greebel', 'Biru', '', 1000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(563, 1, 'Pilot', 'Hitam', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(564, 1, 'Pilot', 'Biru', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(565, 1, 'Faster', 'C600', '', 1750, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(566, 1, 'Faster', 'C6', '', 2500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(567, 1, '', 'Gel KX 701', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(568, 1, 'Yamano', 'Gel Fancy', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(569, 1, 'Diamond', 'GP 212', '', 1750, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(570, 1, 'Joyco', 'JK100', '', 1750, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(571, 1, 'Joyco', 'Savana 3', '', 2200, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(572, 1, 'Trifelo', 'Bisa Dihapus', '', 5000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(573, 1, 'Liner', 'Gel TG 340 Loreng', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(574, 41, 'Faber Castel', '2B', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(575, 42, '', 'Kecil', '', 750, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(576, 42, 'Snowman', 'Kecil isi 24', '', 0, 38000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(577, 42, 'Snowman', 'Permanent Hitam', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(578, 42, 'Snowman', 'Tidak Permanent Hitam', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(579, 42, 'Snowman', 'Permanent Biru', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(580, 42, 'Snowman', 'Tidak Permanent Biru', '', 5500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(581, 42, 'Faster', ' Hitam', '', 4500, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(582, 42, 'Artline', 'Tidak Permanent  Merah', '', 6000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(583, 42, 'Snowman', 'Permanent Merah', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(584, 42, 'Snowman', 'Tidak Permanent Merah', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(585, 43, 'Stabilo', 'Boss', NULL, 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-24 06:49:03', NULL),
(586, 44, '', '', '', 27500, 38000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(587, 42, 'Joyko', '2 mata ', '', 30000, 40000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(588, 45, 'Kenko', 'Putih / Hitam', '', 1750, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(589, 45, 'Faber Castel', '', '', 1650, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(590, 45, '', 'white board', '', 5000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(591, 46, '', '', '', 1200, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(592, 46, '', 'Kado Baby', '', 0, 43000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(593, 46, '', 'Kado Bee', '', 0, 43000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(594, 47, '', 'Penggaris 20 cm', '', 1350, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(595, 47, '', 'Penggaris 30 cm', '', 1600, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(596, 48, '', '', '', 1400, 3500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(597, 41, '', '', '', 9000, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(598, 49, 'Greebel', 'Crayon', '', 13000, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(599, 47, '', 'Penggaris Segitiga', '', 4000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(600, 50, '', 'Key Ring', '', 4000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(601, 51, '', 'TJ 656/653', '', 5500, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(602, 51, '', 'TF SN 0234', '', 15000, 18500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(603, 51, '', 'TF 654 8C', '', 8500, 10500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(605, 38, '', 'Batik 1/2 Folio', '', 7000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(606, 38, '', 'Iqro + Juz Amma Besar', '', 8000, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(607, 38, '', 'Iqro + Juz Amma Kecil', '', 5000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(608, 38, 'Kiky', 'A6 (Be Smart)', '', 11000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(609, 38, '', 'Note Spiral (Binder Note) 404', '', 3000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(610, 38, '', 'Note Spiral (Binder Note) 501', '', 7500, 12500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(611, 38, '', 'Note Spiral (Binder Note) 403', '', 4500, 8500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(612, 52, '', '', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(613, 51, 'Tom & Jerry', 'TJ 654', '100 sheet', 5000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(614, 51, '', 'Mini Cube', '', 12500, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(615, 51, '', 'TF 658-1', '', 0, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(616, 51, '', 'TF 654-4C', '100 sheet', 4000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(617, 51, '', 'TF 654-1', '', 4000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(618, 42, 'Snowman', '', 'isi 24', 0, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(619, 53, 'Tom & Jerry', 'Panah TJ 644A Flag', '', 7000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(620, 53, 'Kenko', 'CT 634N 8m', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(621, 53, 'Joyko', 'JK 510 8m', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(622, 53, 'Kenko', 'CT 634N 12m', '', 6000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(623, 53, 'Joyko', 'JK 522 12m', '', 6000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(624, 53, 'Skyco', 'Nano 5m', '', 4000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(625, 52, '', 'Rainbow', '', 7500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(626, 1, '', 'Gel Bunga', '', 1550, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(627, 1, '', 'Gel Lampu Bunga', '', 3750, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(628, 1, '', 'Gel Lampu Boneka', '', 3750, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(629, 33, '', 'Binder Loose Leaf B5', '', 7500, 11000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(630, 33, '', 'Binder Loose Leaf A5', '', 5500, 8500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(631, 55, '', 'Warna', '', 1800, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(632, 55, '', 'Silver', '', 2500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(633, 56, '', '', '', 4500, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(634, 57, '', 'Saku', '', 500, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(635, 58, '', '', '', 2300, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(636, 59, 'GT Pro', '', '', 2500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(637, 60, '', '', '', 5500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(638, 61, '', '', '', 5500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(639, 62, '', '', '', 17000, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(640, 63, '', '', '', 3500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(641, 64, 'Alkaline', 'AA', '', 10000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(642, 64, 'Alkaline', 'AAA', '', 9500, 14000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(643, 64, 'ABC', 'AA', 'Isi 4', 8000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(644, 64, 'ABC', 'AAA', 'Isi 2', 3500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(645, 65, '', 'Biasa Merah', '', 1750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(646, 65, '', 'Biasa Hitam', '', 1750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(647, 65, '', 'Biasa Kuning', '', 1750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(648, 65, '', 'Biasa Biru', '', 1750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(649, 65, '', 'Biasa Hijau', '', 1750, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(650, 65, '', 'Lebar 2cm', '', 3000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(651, 66, '', '', '', 10000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(652, 67, '', 'Tali Kecil', '', 3500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(653, 67, '', 'Tali Sedang', '', 4000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(654, 67, '', 'Tali Besar', '', 6000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(655, 68, '', 'Double Putih', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(656, 68, '', 'Double Merah', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(657, 68, '', 'Double Hitam', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(658, 68, '', 'Double Biru', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(659, 69, '', '', '', 5000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(660, 70, 'Butterfly', 'Kayu', '', 7500, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(661, 70, 'Rapico', 'Kayu', '', 3000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(662, 70, 'CMB', '', '', 12000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(663, 70, 'Yamata', '', '', 11000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(664, 68, 'Agrow', 'Hitam', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(665, 68, 'Agrow', 'Kuning', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(666, 68, 'Agrow', 'Biru', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(667, 68, 'Agrow', 'Merah', '', 1250, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(668, 33, '', 'Concorde 220', 'isi 10', 9000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(669, 33, '', 'Concorde 160', 'isi 10', 6000, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(670, 35, '', 'Kancing Tenteng', '', 9000, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(671, 35, '', 'Kancing Tenteng Ungu', '', 11000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(672, 35, '', 'Kancing Biasa Tutup Atas', '', 1750, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(673, 1, 'Apple', 'Gel Pen Ipen 8 G 8003', '', 1750, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(674, 1, 'Apple', 'Ipen 8 Maxx', '', 0, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(675, 1, 'Apple', 'Koxi KX 911', '', 0, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(676, 71, 'Gillette', 'Maxx', '', 2500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(677, 1, 'Tizo', '', '', 0, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(678, 1, 'Greeble', 'Merah', '', 1000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(679, 72, 'Greeble', '', '', 5000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(680, 72, 'Kenko', 'KE 01', '', 4000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(681, 72, 'Joyko', 'Savana CF S 224', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(682, 41, '', 'Mekanik', '', 3500, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(683, 73, '', 'Mekanik', '', 1200, 2500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(684, 74, 'Grand Pro', '', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(686, 33, '', 'Origami Kecil 12x12', 'Isi 25', 2000, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(687, 33, '', 'Origami Sedang 14x14', 'Isi 25', 3000, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(688, 33, 'Sidu', 'Origami TG 14x14', 'Isi 100', 5250, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(689, 33, 'Sidu', 'Origami Besar 16x16', 'Isi 100', 6750, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(690, 75, '', 'Glitter LF 046/047', '', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(691, 75, '', 'Glitter 18x350mm', '', 5000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(692, 75, '', 'Glitter LF 028', '', 7000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(693, 75, '', 'Glitter LF 051', '', 3500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(694, 75, '', 'Glitter Lf 041/032/035', '', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(695, 75, '', 'Glitter LF 033', '', 5500, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(696, 75, '', 'Glitter 036/040', '', 5000, 7000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(697, 75, '', 'Glitter LF 029/045', '', 7000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(698, 76, '', '1/2cm', '', 3750, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(699, 77, 'Pyramid', 'Ungu', '', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(700, 33, '', 'Photo Glosy Paper', '20 sheet', 18000, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(701, 33, '', 'Print ID Card 200x300', '', 0, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(702, 78, 'Inter X', 'A5 Folder', '', 12500, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(703, 33, '', 'Buffalo', 'Untuk Jilid', 0, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(704, 79, '', 'Pelangi', '', 16000, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(705, 79, '', 'Kumbang', '', 25000, 32000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(706, 38, 'Kiky', 'Agenda Spiral A6', NULL, 11000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(707, 32, '', 'Warna bening', 'Untuk Jilid', 0, 1000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(708, 42, 'Snowman', '', 'Isi 12', 9500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(709, 38, '', 'Surat Jalan', '', 8000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(710, 70, 'Trifelo', 'A5', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(711, 70, 'Yushinca', 'B6', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(712, 51, 'Post It', '653 Neon', '', 4800, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(713, 51, 'Post It', '654 Neon 2 warna', '', 5800, 9000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(714, 51, 'Tom & Jerry', '5 warna', '40 sheet', 5000, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(715, 38, '', 'Faktur', '', 7000, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(716, 35, '', 'Kancing Biasa Tutup Samping', '', 1750, 4500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(717, 35, '', 'Kancing Biasa Tebal Ungu', '', 3000, 5500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(718, 66, 'Montana', 'Corak', '', 6250, 7500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(719, 38, 'Oktavo', 'Block Note B5 Batik', '', 5000, 8500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(720, 35, 'Jenia', 'Clear Holder 20 pocket', '', 12500, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(721, 35, 'Jenia', 'Clear Holder 40 pocket', '', 15000, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(722, 35, 'Inter X', 'Clear Holder 20 pocket', '', 20500, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(723, 35, 'Inter X', 'Clear Holder 40 pocket', '', 18500, 28000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(724, 35, 'Inter X', 'Clear Holder 60 pocket', '', 25000, 35000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(725, 1, 'Joyko', 'BP 213 4 warna', '', 4500, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(726, 81, '', 'ID Card Besar', 'Haji', 500, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(727, 1, 'Pilot', 'Frixion Hitam', 'Bisa Dihapus', 18500, 23500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(728, 1, 'Pilot', 'Frixion Biru', 'Bisa Dihapus', 18500, 23500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(729, 82, '', '', '', 0, 22000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(730, 83, 'Bantex', 'Folio 7cm', '', 36000, 50000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(731, 83, 'Bantex', 'Folio Trendy 7cm', '', 26180, 40000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(732, 83, '', 'A5 7cm', 'untuk Kwitansi', 31350, 45000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(733, 70, 'Bantex', '', '', 14850, 17000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(734, 84, '', '10cm', '', 35500, 50000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(735, 85, 'Giotto', 'Mini 12 Colour 23mm', '', 30000, 40000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(736, 1, 'Pilot', 'Frixion', '', 13000, 16000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(737, 11, 'Max', 'HD 10', '', 10500, 17500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(738, 33, 'Maxi Brite', 'HVS A4 70gr', '', 34000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(739, 33, 'Maxi Brite', 'HVS F4 70gr', '', 38000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(740, 33, 'SIDU', 'HVS A4 70gr', '', 39000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(741, 33, 'SIDU', 'HVS F4 70gr', '', 42000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(742, 33, 'Paperline', 'HVS A4 70gr', '', 40000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(743, 33, 'Copy Paper', 'HVS A4 70gr', '', 36500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(744, 33, 'Copy Paper', 'HVS F4 70gr', '', 40000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(745, 33, 'Copy Laser', 'HVS A4 70gr', '', 37000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(746, 33, 'Copy Laser', 'HVS F4 70gr', '', 40000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(747, 33, 'SIDU', 'HVS A4 80gr', '', 0, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(748, 33, 'SIDU', 'HVS F4 80gr', '', 49000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(749, 33, 'SIDU', 'A3', '', 84000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(751, 33, 'Natural', 'HVS A4 70gr', '', 33000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(752, 33, 'Natural', 'HVS F4 70gr', '', 38000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(753, 87, 'Joyco', '85 B', '', 38000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(754, 87, 'Combo', 'Kecil 30 XL', '', 7500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(755, 87, 'Kangaro', 'Kecil DP 480 N', '', 15000, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(756, 87, 'KENKO', '40 XL', '', 24000, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(757, 87, 'Bantex', 'Mini', '', 16000, 21000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(758, 87, 'Joyco', '40 XL', '', 0, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(759, 87, 'Joyco', '30 XL', '', 12000, 18000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(760, 88, 'Sandisk', '8 GB', '', 50000, 65000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(761, 88, 'Toshiba', '16 GB', '', 65000, 75000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(762, 88, 'Toshiba', '32 GB', '', 72500, 85000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(763, 33, '', 'HVS Warna A4 Merah', '', 44500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(764, 33, '', 'HVS Warna A4 Kuning', '', 44500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(765, 33, '', 'HVS Warna A4 Hijau', '', 44500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(766, 33, '', 'HVS Warna A4 Biru', '', 44500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(767, 33, 'E Paper', 'HVS A4 70gr', '', 33000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(768, 33, 'E Paper', 'HVS F4 70gr', '', 36000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(769, 38, 'Bamboo', 'Tulis Kwarto isi 38', '', 18900, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(770, 38, 'Bamboo', 'Tulis Kwarto isi 58', '', 30750, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(771, 38, 'Bamboo', 'Tulis Kampus Boxy isi 36', '', 28750, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(772, 38, 'Bamboo', 'Tulis Kampus Boxy isi 42', '', 33000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(773, 38, 'Bamboo', 'Tulis Kampus Boxy isi 50', '', 38500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(774, 33, '', 'HVS Warna F4 Merah', '', 50500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(775, 33, '', 'HVS Warna F4 Kuning', '', 50500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(776, 33, '', 'HVS Warna F4 Hijau', '', 50500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(777, 33, '', 'HVS Warna F4 Biru', '', 50500, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(778, 33, '', 'Krep', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(779, 90, 'Votre', '', '', 15000, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(780, 90, 'Logitec', '', '', 160000, 190000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(781, 91, '', 'No 1', '', 700, 1500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(782, 91, '', 'No 2', '', 800, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(783, 91, '', 'No 3', '', 850, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(784, 91, '', 'No 4', '', 1000, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(785, 91, '', 'No 5', '', 1250, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(786, 91, '', 'No 6', '', 1350, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(787, 92, '', 'KT30 Putih 30x40 Linen Polos', '', 34750, 60000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(788, 92, '', 'FS01 Coklat 30x40 Linen Polos', '', 31000, 55000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(789, 92, '', 'M13 WS 40x50 Linen Polos', '', 52000, 85000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(790, 92, '', 'FS01/KT25 6R', '', 10000, 22000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(791, 92, '', 'FS01 KT25 20x25 Full Polos', '', 11250, 25000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(792, 92, '', 'FS01 Silver 20x30 Tepi Polos', '', 17250, 35000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(793, 92, '', 'FS01/KT25 5R', '', 8500, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(794, 92, '', 'FS01 4R', '', 7000, 17500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(795, 92, '', 'KT25 21x30 Full Polos', '', 12500, 27500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(796, 92, '', 'M29 Pp Panjang', '', 14500, 30000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(797, 92, '', 'FS01 Pp Panjang', '', 14750, 32500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(798, 92, '', 'Standing Frame Mini', '', 15000, 27500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(799, 92, '', 'KT25 30x42 Full Polos', '', 22250, 45000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(800, 92, '', 'KT50 30x40 Linen Polos', '', 46250, 75000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(801, 92, '', 'KT25 Family Besar', '', 31000, 55000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(802, 57, 'Paseo', '250 lbr', '', 8200, 12000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(803, 57, 'Nice', '180 lbr', '', 5500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(804, 57, '', 'sedang', '', 0, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(805, 57, 'M polis', '', 'Bisa dicuci', 0, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(806, 93, '', '', '', 2000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(807, 33, '', 'marmer warna', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL);
INSERT INTO `products` (`id`, `category_id`, `merek`, `tipe`, `keterangan`, `harga_modal`, `harga`, `image`, `qty`, `created_at`, `updated_at`, `spec`) VALUES
(808, 51, 'Trifelo', 'Sign Here', '', 5000, 8500, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(809, 71, 'Gillette', 'Blue', '', 5000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(810, 71, 'Gillette', 'Goal', '', 8500, 13000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(811, 50, '', '', 'untuk Boneka, Gunting Kuku, dll', 6000, 8000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(812, 95, '', '', '', 0, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(813, 81, '', 'Jilid / Mika Putih Tebal', '', 35000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(814, 81, '', 'Mika ID Card', '', 0, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(815, 96, '', 'Plastisin Kecil', '', 1500, 4000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(816, 96, '', 'Plastisin Besar', '', 2200, 6000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(817, 96, '', 'Plastisin Satuan', '', 2500, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(818, 97, '', '', '', 7500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(819, 33, '', 'Kokoru Ichiro Panjang', '', 9500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(820, 33, '', 'Kokoru Ichiro A4', '', 9500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(821, 98, '', '', '', 10000, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(822, 79, '', 'Silver', '', 36000, 55000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(823, 79, '', 'Satin', '', 27000, 45000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(824, 33, 'Printech', 'Silky 260 warna hijau', '', 55000, 75000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(825, 35, '', 'Sleting Jaring Besar', '', 7500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(826, 35, '', 'Sleting Jaring Kecil', '', 6500, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(827, 99, '', 'Ping Pong', '', 1500, 3000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(828, 81, '', 'Laminating KTP', '', 17000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(829, 81, '', 'Laminating F4', '', 78000, 0, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(830, 100, '', '', '', 3000, 5000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(831, 101, '', 'Winpu (Terusan)', '', 5000, 10000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(832, 101, '', 'Raider (Baju Celana)', '', 6500, 15000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(833, 32, '', 'Putih Tebal', '', 35000, 50000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(834, 81, '', 'ID Card Melintang 7x10', 'Isi 100', 250, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(835, 81, '', 'ID Card Melintang 6x9', 'Isi 100', 250, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(836, 81, '', 'ID Card Panitia 8x12', 'Isi 100', 500, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(837, 102, '', 'ID Card', 'Isi 100', 0, 2000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL),
(898, 132, 'Citizen', 'LC 210', NULL, 14000, 20000, 'product.jpg', 500, '2020-11-22 21:18:21', '2020-11-22 21:22:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_ins`
--

CREATE TABLE `product_ins` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ins`
--

INSERT INTO `product_ins` (`id`, `product_id`, `supplier_id`, `qty`, `tanggal`, `created_at`, `updated_at`) VALUES
(5, 387, 1, 1, '2020-11-23', '2020-11-22 21:18:21', '2020-11-22 21:18:21'),
(7, 388, 1, 2, '2020-12-03', '2020-11-23 23:15:50', '2020-12-17 08:15:55'),
(8, 387, 1, 2, '2020-11-24', '2020-11-24 08:06:33', '2020-11-24 08:06:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_outs`
--

CREATE TABLE `product_outs` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_outs`
--

INSERT INTO `product_outs` (`id`, `product_id`, `customer_id`, `qty`, `tanggal`, `created_at`, `updated_at`) VALUES
(10, 387, 1, 2, '2020-12-02', '2020-11-22 21:11:20', '2020-12-17 08:16:44'),
(11, 387, 3, 1, '2020-11-11', '2020-11-23 22:41:53', '2020-12-17 08:22:17'),
(12, 394, 3, 1, '2020-12-09', '2020-12-17 08:18:12', '2020-12-17 08:22:01'),
(13, 442, 2, 5, '2020-12-04', '2020-12-17 08:18:46', '2020-12-17 08:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_project` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `cat_project_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finishing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `harga_modal` int(11) DEFAULT NULL,
  `pembayaran` int(11) DEFAULT NULL,
  `sisa_pembayaran` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `nama_project`, `customer_id`, `cat_project_id`, `qty`, `satuan`, `size`, `spec`, `spec_cover`, `finishing`, `file`, `tanggal_masuk`, `deadline`, `tanggal_selesai`, `tanggal_kirim`, `harga`, `harga_modal`, `pembayaran`, `sisa_pembayaran`, `status`, `created_at`, `updated_at`) VALUES
(2, 'project 2', 1, 1, 3, 'pcs', 'a4', NULL, NULL, NULL, NULL, '2020-11-05', NULL, NULL, NULL, 3000, NULL, 100, 2900, 'Pending', '2020-11-04 23:40:54', '2020-11-15 10:09:05'),
(4, 'Buku', 1, 1, 5, 'pcs', 'A4', NULL, NULL, NULL, NULL, '2020-11-14', NULL, NULL, NULL, 10000, 8000, 1000, 9000, 'Pending', '2020-11-14 06:36:35', '2020-11-15 09:52:53'),
(5, 'Buku Bala Bala', 1, 1, 1, 'pcs', 'A4', NULL, NULL, NULL, NULL, '2020-11-15', NULL, NULL, NULL, 15000, NULL, 0, 15000, 'On-Process', '2020-11-15 09:54:52', '2020-11-15 09:54:52'),
(6, 'Majalah Rsud Cibinong', 2, 1, 10, 'pcs', '23x15', 'Mattpaper 120gr', 'Art cartoon laminasi glossy', 'jilid spiral', NULL, '2020-11-16', '2020-11-21', NULL, NULL, 10000, 8000, 10000, 0, 'On-Process', '2020-11-16 04:09:24', '2020-12-17 08:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `nama`, `perusahaan`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`) VALUES
(1, 'contoh supplier', 'perusahaan contoh', NULL, NULL, NULL, '2020-11-05 21:17:34', '2020-11-05 21:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('super-admin','admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Handy WP', 'handy@trison.com', NULL, '$2y$10$mFCc2mvCfIlE0GB95ICZIODPQFnxKxOecyWvvJiP3pGfPcFJiSPjK', 'super-admin', 'avatar.png', '8v4RVfplKAZMO6obadNShPhXEDQhMfToKr7E6n88CAQDJBXEYl4d4x2oyofR', '2020-11-04 21:22:07', '2020-11-24 09:21:42'),
(2, 'Anto', 'anto@trison.com', NULL, '$2y$10$Zz.Qr32SwPG6BplqMqkV2.Qm2cZ0xecTTYB6UrH5YhUW8TF37ZnJm', 'super-admin', 'avatar.png', NULL, '2020-11-04 21:23:12', '2020-11-04 21:29:30'),
(3, 'Muji', 'muji@trison.com', NULL, '$2y$10$h5p74iJg13OklqvJ4GWMd.c52lthEVKpDrrylXVvaTnMoN.1fc.Ny', 'user', 'avatar.png', NULL, '2020-11-04 21:38:18', '2020-11-04 21:38:18'),
(4, 'Annie', 'annie@trison.com', NULL, '$2y$10$1/Dcxojb1/VQt3kOElTeqeEC7aT4uHens8yJ0fqR9b8q5rxKis1xW', 'admin', 'avatar.png', NULL, '2020-11-04 21:40:54', '2020-11-04 21:41:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_projects`
--
ALTER TABLE `cat_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_project_id_foreign` (`project_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_project_id_foreign` (`project_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_ins`
--
ALTER TABLE `product_ins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ins_product_id_foreign` (`product_id`),
  ADD KEY `product_ins_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `product_outs`
--
ALTER TABLE `product_outs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_outs_product_id_foreign` (`product_id`),
  ADD KEY `product_outs_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_customer_id_foreign` (`customer_id`),
  ADD KEY `projects_cat_project_id_foreign` (`cat_project_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `cat_projects`
--
ALTER TABLE `cat_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=899;

--
-- AUTO_INCREMENT for table `product_ins`
--
ALTER TABLE `product_ins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_outs`
--
ALTER TABLE `product_outs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_ins`
--
ALTER TABLE `product_ins`
  ADD CONSTRAINT `product_ins_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ins_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_outs`
--
ALTER TABLE `product_outs`
  ADD CONSTRAINT `product_outs_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_outs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_cat_project_id_foreign` FOREIGN KEY (`cat_project_id`) REFERENCES `cat_projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
