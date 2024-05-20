-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2024 pada 13.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts-app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'wafer', '2024-05-18 23:53:50', '2024-05-18 23:53:50'),
(2, 'ciki', '2024-05-18 23:54:55', '2024-05-18 23:54:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_14_101632_create_categories_table', 1),
(6, '2024_05_14_110536_create_products_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `expired_at` date NOT NULL,
  `modified_by` varchar(255) NOT NULL COMMENT 'email_user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `expired_at`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 1, 'Siip', 'wafer keju renyah', 1000, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-18 23:53:59', '2024-05-18 23:53:59'),
(3, 1, 'Nabati', 'wafer keju renyah', 1000, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-18 23:54:11', '2024-05-18 23:54:11'),
(4, 1, 'Chocolatos', 'wafer coklat enak', 1000, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-18 23:54:35', '2024-05-18 23:54:35'),
(5, 2, 'Taro', 'ciki enak', 2500, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-18 23:56:04', '2024-05-18 23:56:04'),
(6, 2, 'Chicato', 'ciki ketang', 3000, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-18 23:56:25', '2024-05-18 23:56:25'),
(7, 2, 'Chicato', 'ciki ketang', 3000, 'img.jpg', '2024-12-12', 'admin@mail.com', '2024-05-20 03:19:31', '2024-05-20 03:19:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `google_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', '$2y$12$8Mbi92PJz7O7OCqCCAG4ku2hqi0c/9ladzuSUXNzpXQpCEgnXPIIW', NULL, 'admin', '2024-05-18 23:49:39', '2024-05-18 23:49:39'),
(2, 'Lucius Carroll', 'istanton@example.net', '$2y$12$SxWPJHTl8vGjP.bKxsEXIOx7DOOfov3IVHynT4TlijTT2blZiegsS', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(3, 'Camryn Mohr', 'sbergnaum@example.org', '$2y$12$VfTNC4.MNpphUdFyd.pfL.EeIvN3qQGSLmem3s3a5eI/CgP7wWkwW', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(4, 'Marcellus Ratke', 'lvolkman@example.org', '$2y$12$fXsfFRbDxhuvXc04yvrQSOzI1u4OrD7yZCAP8kYud2Lep1adUTKG.', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(5, 'Maudie Shanahan', 'gulgowski.cecil@example.org', '$2y$12$INj97Oj.nme49T6gxaaeC.d9MiuMCrZS.ZsfenR/Vzp9tn41xlaai', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(6, 'Douglas Hermann', 'barney83@example.com', '$2y$12$aTypm3Rl3o5AreHXSDb68OLlZrgkXKWQGiuhdHygerYFMCK1fJUt2', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(7, 'Edison Mitchell DDS', 'nienow.leola@example.net', '$2y$12$7uCuyeexUjHewvSUY3TP4eC.uJLgDkcimMIlYTPgSaugcDoLXRlZS', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(8, 'Elyssa Tillman', 'rwunsch@example.org', '$2y$12$SbX7lRRruI1HuXYJ1WeXLOmTHDrWCyp3geCUEpK7koofs/5d9rbZm', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(9, 'Anais Rolfson', 'nikki.ruecker@example.org', '$2y$12$4mGzbi7ojHE1qTK1kA6kFu73y1UgQM09n3xLTyQqnCseFIE7E1GIG', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(10, 'Raegan Breitenberg', 'mwisoky@example.org', '$2y$12$M9XK/E4mAMJeotbzVAVTNOkCK2YzW0j6C/6IcyGC8ErMKxzl2UcCK', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(11, 'Narciso Bashirian', 'ahomenick@example.net', '$2y$12$4Agq5xaI9ISwOUDrNbFIAeFsjvfR8rcTpmGNtMm0ipSez.SfXVXfe', NULL, 'user', '2024-05-18 23:49:42', '2024-05-18 23:49:42'),
(12, 'anda', 'anda@gmail.com', '$2y$12$rnzISq5es8PCVwK3q8teKOTJTDv/IOa8YiYTgCrBMnTCe97P7k5zW', NULL, 'user', '2024-05-18 23:51:53', '2024-05-18 23:51:53');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_modified_by_foreign` (`modified_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
