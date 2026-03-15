-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 14, 2026 at 06:01 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopify_extensions`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_13_160417_create_products_table', 1),
(5, '2026_03_13_161032_create_product_views_table', 1),
(6, '2026_03_13_161135_create_product_purchases_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `product_name`, `price`, `description`, `image_url`, `status`, `created_at`, `updated_at`) VALUES
(1, '519e693d-bc72-4fa4-ae57-92c81514f8a9', 'Three piece suit', 199.99, 'Elegant three-piece suit for formal occasions.', '1639378035XJWgisPU.jpg', 'active', '2026-03-13 10:44:50', '2026-03-13 10:44:50'),
(2, 'c7372cdc-5971-4e75-a985-3f393ceb893d', 'Mosh Keyboard', 74.50, 'RGB mechanical gaming keyboard.', '1639378418BxWim5Uq.jpg', 'active', '2026-03-13 10:44:50', '2026-03-13 10:44:50'),
(3, '0bec7e92-3859-4bcf-8250-c49c6e954d20', 'Car Seat', 29.99, 'Fast charging USB-C adapter.', '1639392364Li5C3bEO.jpg', 'active', '2026-03-13 10:44:50', '2026-03-13 10:44:50'),
(4, '2b8f4917-257c-4c4b-8597-c57f11a8ef77', 'Books', 89.99, 'Elegant three-piece suit for formal occasions.', '1639392531mZxqr9sa.jpg', 'active', '2026-03-13 10:44:50', '2026-03-13 10:44:50'),
(5, '7b17e885-25c7-40aa-b8b5-9a406fc52b44', 'Tree Shirt', 129.00, 'Fitness tracking smart watch with heart rate monitor.', '1639392738TGJsX6up.jpg', 'active', '2026-03-13 10:44:50', '2026-03-13 10:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('cash_on_delivery','card') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `status` enum('pending','completed','inProgress') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `uuid`, `product_id`, `product_name`, `price`, `description`, `image_url`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(1, 'a8053aa8-8387-416f-8f1c-c527a23fc1ee', 1, 'Three piece suit', 199.99, 'Elegant three-piece suit for formal occasions.', '1639378035XJWgisPU.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(2, '20070afa-4202-491b-856e-5edb86dfa994', 2, 'Mosh Keyboard', 74.50, 'RGB mechanical gaming keyboard.', '1639378418BxWim5Uq.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(3, '97901d07-cb0f-4fb6-aaf1-6af0d43e218c', 3, 'Car Seat', 29.99, 'Fast charging USB-C adapter.', '1639392364Li5C3bEO.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(4, '7dda0fbd-47ab-4e4b-893c-edd2f51e820d', 4, 'Books', 89.99, 'Elegant three-piece suit for formal occasions.', '1639392531mZxqr9sa.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(5, '5c4ec767-95ff-4f99-b1b4-2daad92ad82e', 5, 'Tree Shirt', 129.00, 'Fitness tracking smart watch with heart rate monitor.', '1639392738TGJsX6up.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(11, '478f97d8-800d-4369-84af-658dd88f9df7', 1, 'Three piece suit', 199.99, 'Elegant three-piece suit for formal occasions.', '1639378035XJWgisPU.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(12, 'fafaf5f3-147d-49f0-b375-a03b84deb8a4', 2, 'Mosh Keyboard', 74.50, 'RGB mechanical gaming keyboard.', '1639378418BxWim5Uq.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(13, 'e61c830b-e629-4ff3-891c-e95afb9b70a7', 3, 'Car Seat', 29.99, 'Fast charging USB-C adapter.', '1639392364Li5C3bEO.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(14, '43564fed-d6ce-4405-84c9-d58d330f5ddf', 4, 'Books', 89.99, 'Elegant three-piece suit for formal occasions.', '1639392531mZxqr9sa.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10'),
(15, '0668699c-8823-43ba-828b-066c0837e204', 5, 'Tree Shirt', 129.00, 'Fitness tracking smart watch with heart rate monitor.', '1639392738TGJsX6up.jpg', 'cash_on_delivery', 'pending', '2026-03-13 23:07:10', '2026-03-13 23:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_views`
--

CREATE TABLE `product_views` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `view_count` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_views`
--

INSERT INTO `product_views` (`id`, `uuid`, `product_id`, `view_count`, `created_at`, `updated_at`) VALUES
(1, 'dac8898c-8ce5-482f-8a56-1c3766106e9c', 1, 1, '2026-03-13 23:00:09', '2026-03-13 23:00:09'),
(2, '9800e267-8f56-4fe2-8391-1048830f0c4e', 1, 1, '2026-03-13 23:00:44', '2026-03-13 23:00:44'),
(3, '215108de-5d9d-4c0c-ace8-de593d2c2730', 1, 1, '2026-03-13 23:00:49', '2026-03-13 23:00:49'),
(4, '1ca50d57-8644-4515-9f91-b3fd58b96ab1', 2, 1, '2026-03-13 23:40:24', '2026-03-13 23:40:24'),
(5, '515b9eb8-e7ad-4791-b226-330cc1c02201', 3, 1, '2026-03-13 23:41:59', '2026-03-13 23:41:59'),
(6, '5adbc49b-b99b-4c2d-bbbf-d068bfa1f188', 3, 1, '2026-03-13 23:42:02', '2026-03-13 23:42:02'),
(7, '9ff4a9b5-4f69-4f4c-b3ae-77f9efbe2886', 3, 1, '2026-03-13 23:42:04', '2026-03-13 23:42:04'),
(8, '66c9f734-d084-4bc1-9c80-bd5747f5b4f6', 2, 1, '2026-03-13 23:42:25', '2026-03-13 23:42:25'),
(9, '55341ee7-88b2-455d-b977-20cafcbeeeb6', 2, 1, '2026-03-13 23:45:30', '2026-03-13 23:45:30'),
(10, 'cbefb38c-f747-496b-94ae-7eabf0d42c04', 2, 1, '2026-03-13 23:47:15', '2026-03-13 23:47:15'),
(11, 'a5012e55-1bad-4a74-a292-43c61f093559', 1, 1, '2026-03-13 23:51:23', '2026-03-13 23:51:23'),
(12, '7f059f95-2c79-4001-9f7f-35deb42d7a6c', 1, 1, '2026-03-13 23:51:26', '2026-03-13 23:51:26'),
(13, '364c8185-7d62-46a0-935b-0aeb50dbbabe', 1, 1, '2026-03-13 23:51:31', '2026-03-13 23:51:31'),
(14, '51df4652-e503-49b2-a310-67dcaa462f0c', 1, 1, '2026-03-13 23:52:06', '2026-03-13 23:52:06'),
(15, 'aa39854f-de09-4ab4-b0c0-a60cdfa56635', 1, 1, '2026-03-13 23:52:52', '2026-03-13 23:52:52'),
(16, '1c988305-e155-4380-838a-8946b80c925a', 1, 1, '2026-03-13 23:52:56', '2026-03-13 23:52:56'),
(17, 'ae9247ba-a3b0-4d06-b784-05c7575d9ce0', 1, 1, '2026-03-13 23:53:00', '2026-03-13 23:53:00'),
(18, '553450be-a8a3-44f1-9629-5507d342205a', 1, 1, '2026-03-13 23:53:04', '2026-03-13 23:53:04'),
(19, '327f4a72-b13e-4f6f-b308-f1400cb6b2a9', 1, 1, '2026-03-13 23:53:18', '2026-03-13 23:53:18'),
(20, '7fbdb237-7d52-4808-b452-e60fdb9ba17e', 1, 1, '2026-03-13 23:53:18', '2026-03-13 23:53:18'),
(21, 'ad2846aa-0e88-43b5-be16-3d9862bd1df3', 1, 1, '2026-03-13 23:53:19', '2026-03-13 23:53:19'),
(22, '67a3ff18-cc91-4092-99e8-de955d324850', 1, 1, '2026-03-13 23:53:19', '2026-03-13 23:53:19'),
(23, '872fcd82-c368-4a12-b947-d100ccecea5b', 1, 1, '2026-03-13 23:53:19', '2026-03-13 23:53:19'),
(24, '8307d42b-efd1-4201-bf94-748a7289f544', 2, 1, '2026-03-13 23:54:55', '2026-03-13 23:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7JJkgtYIdpcr4dNY69bnLmtQhjeOrMjowzomdM9M', NULL, '127.0.0.1', 'PostmanRuntime/7.46.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWlXeFV3SzNTbjRmSXNYMWtlcWIzc2dkR2pBVXM1c01RTnp6RUxaNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1773463985),
('oDuPKbTJhAbNOMXaOf5RG199u4ZtDfkiC9cwT2Bc', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWFFnZVhCZ1E1c0dEMUlwaXRWOEo5bFV2dG1CMGNyZ3RGclBXR0pENyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1773462004);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md Rasel Mia', 'rasel2379@gmail.com', NULL, '$2y$12$iArv/MaC9JgHh6QWM1Lr7eMSPXhNiw1rgKUcEbQ0rfMTkt71YJZbq', NULL, '2026-03-13 10:50:26', '2026-03-13 10:50:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_available_at_index` (`queue`,`reserved_at`,`available_at`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_uuid_unique` (`uuid`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_purchases_uuid_unique` (`uuid`),
  ADD KEY `product_purchases_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_views_uuid_unique` (`uuid`),
  ADD KEY `product_views_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD CONSTRAINT `product_purchases_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_views`
--
ALTER TABLE `product_views`
  ADD CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
