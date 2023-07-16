-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2023 at 01:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seat-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `coach_class` varchar(255) NOT NULL,
  `coach_number` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`id`, `name`, `coach_class`, `coach_number`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Sleeper Coach', 'SL', '1', NULL, '2023-07-16 02:50:20', '2023-07-16 02:50:20');

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
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_resets_table', 1),
(33, '2019_08_19_000000_create_failed_jobs_table', 1),
(34, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(35, '2023_07_15_082906_create_coaches_table', 1),
(36, '2023_07_15_082921_create_seat_rows_table', 1);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat_rows`
--

CREATE TABLE `seat_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coach_id` bigint(20) UNSIGNED DEFAULT NULL,
  `row_number` enum('1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `seat_1_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_2_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_3_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_4_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_5_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_6_available` tinyint(1) NOT NULL DEFAULT 1,
  `seat_7_available` tinyint(1) NOT NULL DEFAULT 1,
  `total_available` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seat_rows`
--

INSERT INTO `seat_rows` (`id`, `coach_id`, `row_number`, `seat_1_available`, `seat_2_available`, `seat_3_available`, `seat_4_available`, `seat_5_available`, `seat_6_available`, `seat_7_available`, `total_available`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 02:51:07'),
(2, 1, '2', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 02:50:36'),
(3, 1, '3', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:43:16'),
(4, 1, '4', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 02:50:55'),
(5, 1, '5', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:42:59'),
(6, 1, '6', 0, 0, 0, 0, 0, 1, 1, 2, '2023-07-16 02:50:20', '2023-07-16 05:43:31'),
(7, 1, '7', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:44:27'),
(8, 1, '8', 0, 0, 0, 0, 0, 0, 1, 1, '2023-07-16 02:50:20', '2023-07-16 05:41:59'),
(9, 1, '9', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:43:55'),
(10, 1, '10', 0, 0, 0, 0, 0, 0, 1, 1, '2023-07-16 02:50:20', '2023-07-16 05:43:59'),
(11, 1, '11', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:44:27'),
(12, 1, '12', 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-16 02:50:20', '2023-07-16 05:44:17');

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
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coaches_coach_class_unique` (`coach_class`),
  ADD UNIQUE KEY `coaches_coach_number_unique` (`coach_number`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `seat_rows`
--
ALTER TABLE `seat_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seat_rows_coach_id_index` (`coach_id`);

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
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seat_rows`
--
ALTER TABLE `seat_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seat_rows`
--
ALTER TABLE `seat_rows`
  ADD CONSTRAINT `seat_rows_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
