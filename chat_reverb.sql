-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Eyl 2024, 21:14:58
-- Sunucu sürümü: 8.0.33
-- PHP Sürümü: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `chat_reverb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
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
-- Tablo için tablo yapısı `jobs`
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
-- Tablo için tablo yapısı `job_batches`
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
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `room_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'asdasdasd', '2024-09-06 14:04:50', '2024-09-06 14:04:50'),
(2, 1, 1, 'asdasd', '2024-09-06 14:06:12', '2024-09-06 14:06:12'),
(3, 1, 1, 'asdasd', '2024-09-06 14:08:56', '2024-09-06 14:08:56'),
(4, 1, 1, 'asdasd', '2024-09-06 14:11:22', '2024-09-06 14:11:22'),
(5, 1, 1, 'aaaa', '2024-09-06 14:11:25', '2024-09-06 14:11:25'),
(6, 1, 1, 'asdasd', '2024-09-06 14:13:08', '2024-09-06 14:13:08'),
(7, 1, 1, 'xxxx', '2024-09-06 14:13:15', '2024-09-06 14:13:15'),
(8, 1, 1, 'eeeee', '2024-09-06 14:13:23', '2024-09-06 14:13:23'),
(9, 2, 1, 'vvvvv', '2024-09-06 14:13:32', '2024-09-06 14:13:32'),
(10, 2, 2, 'asdasasd', '2024-09-06 14:14:32', '2024-09-06 14:14:32'),
(11, 2, 2, 'sdfsdf', '2024-09-06 14:14:40', '2024-09-06 14:14:40'),
(12, 1, 2, 'asdasdasd', '2024-09-06 14:16:27', '2024-09-06 14:16:27'),
(13, 2, 2, 'asdasd', '2024-09-06 14:17:28', '2024-09-06 14:17:28'),
(14, 2, 2, 'wwww', '2024-09-06 14:17:38', '2024-09-06 14:17:38'),
(15, 1, 2, 'asdasd', '2024-09-06 14:20:36', '2024-09-06 14:20:36'),
(16, 1, 2, 'ccccc', '2024-09-06 14:20:44', '2024-09-06 14:20:44'),
(17, 2, 2, 'ccccc', '2024-09-06 14:20:59', '2024-09-06 14:20:59'),
(18, 2, 2, 'sssss', '2024-09-06 14:21:05', '2024-09-06 14:21:05'),
(19, 4, 2, 'asdasdasd', '2024-09-06 14:41:32', '2024-09-06 14:41:32'),
(20, 4, 2, 'asdasd', '2024-09-06 14:41:47', '2024-09-06 14:41:47'),
(21, 3, 1, 'asdasdasd', '2024-09-06 14:42:19', '2024-09-06 14:42:19');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_04_220001_create_rooms_table', 1),
(5, '2024_09_04_220024_create_room_user_table', 1),
(6, '2024_09_04_220415_create_messages_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'oda 1', 2, '2024-09-05 07:28:34', '2024-09-05 07:28:34'),
(2, 'oda 2', 1, '2024-09-05 08:13:58', '2024-09-05 08:13:58'),
(3, 'oda 3', 1, '2024-09-05 10:04:39', '2024-09-05 10:04:39'),
(4, 'oda 4', 2, '2024-09-06 08:21:18', '2024-09-06 08:21:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_user`
--

CREATE TABLE `room_user` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
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
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dFBwyV09eurCuM1upA6YbP54ytAlkSWOcDFUQtxD', 3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicWZJQk9vRVcwVkxDSFY4aENOQXZPWXlxdnRlRXRFbWk0SmttY0JuVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1725700854),
('ewDIjN6KBG5kqJ8AgDgmOsCyWtyaKHD8LL7g8aFS', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNmVZNDlKbVhZaUFJOTdSMXdlTlJKSW9IaE1DUDZTaFpLODBzSXJRaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1725703158),
('MTnHVPKmzWlOk3b1joqiFQ7eVsQALQFpHwBvOhmc', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldCUFhPOXZENXdITjZoZldyWlJMREk1ZlpTaUVnR2E0d0U4d1RuaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1725830090);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint NOT NULL DEFAULT '0' COMMENT '1:admin,0:kullanıcı',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `last_activity`, `created_at`, `updated_at`) VALUES
(1, 'Admin 1', 'testadminone@test.com', NULL, '$2y$12$NkE3pVGioxZp8MWeXDYYH.xSSJvDtVxeD3ogJGwzh0PXC5aY8hUpK', NULL, 1, NULL, '2024-09-05 06:19:49', '2024-09-09 03:55:50'),
(2, 'Test Kullanıcı 1', 'test@one.com', NULL, '$2y$12$79kpEkgGTIwc9jzs2fM/3eH0j.yzjuA29xekWU8mpOs5VmCWoX8OG', 'A3ejSCgEkCmaoqUwh2QP2ndhCvxPq93bL7gSzbiL64ZaPG4PE555AvF6MWOk', 0, NULL, '2024-09-05 11:35:35', '2024-09-09 03:54:17'),
(3, 'Test Kullanıcı 2', 'test@two.com', NULL, '$2y$12$FxobkrkTS9StDleCZXYf0.4lEHV4.80Z51eDjgbiv5LYRTNQyKUky', 'BUAKcYPkU2UM5ay8sQifDfCtnnasih3SeeDulBIHb8Ew4zYlHF5WTnIpxSnX', 0, NULL, '2024-09-06 14:44:56', '2024-09-07 16:14:03'),
(4, 'Test Kullanıcı 3', 'test@three.com', NULL, '$2y$12$bnHcetwDa18.sw.7/1KNQ.UiEmTootsZfTLW1x0LqXtB/1GxBGAHi', NULL, 0, NULL, '2024-09-09 03:57:15', '2024-09-09 04:00:35'),
(5, 'Test Kullanıcı 4', 'test@four.com', NULL, '$2y$12$cQlabkbhZhEvq87uT6EW9.abojhmNv41Qximen0nMVBS0pcLuqwZC', NULL, 0, NULL, '2024-09-09 04:01:20', '2024-09-09 04:01:26'),
(6, 'Test Kullanıcı 5', 'test@five.com', NULL, '$2y$12$drgyR1XA/j8OVvQyrvLpxegq4e6cA62iP0ENJq4YGogNapWq26LcG', NULL, 0, NULL, '2024-09-09 04:01:56', '2024-09-09 04:02:05'),
(7, 'Test Kullanıcı 6', 'test@six.com', NULL, '$2y$12$1ptN6BI64prl8JK.zE9kv.MTm1uNkAIICUUXectekN5JDH9HJPpYK', NULL, 0, NULL, '2024-09-09 04:03:03', '2024-09-09 04:03:12'),
(8, 'Test Kullanıcı 7', 'test@seven.com', NULL, '$2y$12$iCqeujHWjBNHc34G1x85o.fBj4Yopr54LRm5seF2SNDvopi00NW1e', NULL, 0, NULL, '2024-09-09 04:03:42', '2024-09-09 04:03:47'),
(9, 'Test Kullanıcı 8', 'test@eight.com', NULL, '$2y$12$TxucLdIrvCyPYsddexvdV.fhAWIfYfZ0cMQuCbaYiMfBi.QzsMU/y', NULL, 0, NULL, '2024-09-09 04:04:40', '2024-09-09 04:04:47'),
(10, 'Admin 2', 'testadmintwo@test.com', NULL, '$2y$12$CmBUZjXvwFAvq8vNof9ZdeiMtDMFu3X41AJc3Fm4DKGc7.7cGNF0a', NULL, 1, NULL, '2024-09-09 04:05:28', '2024-09-09 04:05:50');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_room_id_foreign` (`room_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_created_by_foreign` (`created_by`);

--
-- Tablo için indeksler `room_user`
--
ALTER TABLE `room_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_user_room_id_foreign` (`room_id`),
  ADD KEY `room_user_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `room_user`
--
ALTER TABLE `room_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `room_user`
--
ALTER TABLE `room_user`
  ADD CONSTRAINT `room_user_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
