-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2022 pada 10.26
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_models`
--

CREATE TABLE `kategori_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori_models`
--

INSERT INTO `kategori_models` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Produk Terbaru', NULL, NULL),
(2, 'Produk Terlaris', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_11_08_214740_add_paid_to_users', 1),
(4, '2021_11_09_152613_create_produks_table', 1),
(5, '2021_11_10_113516_create_transaksis_table', 1),
(6, '2021_11_10_113637_create_transaksi_details_table', 1),
(8, '2021_11_13_205710_add_paid_to_transaksis', 2),
(9, '2021_11_15_152942_add_pain_to_users_table', 3),
(10, '2021_11_21_213318_add_pain_to_transaksis_table', 4),
(11, '2021_11_22_143717_add_paid_to_produks_table', 5),
(13, '2021_11_25_230532_add_paid_to_produks_table', 6),
(14, '2021_11_25_230841_add_paid_to_users_table', 7),
(15, '2021_11_27_104856_add_paid_to_users_table', 8),
(16, '2021_11_28_015756_add_paid_to_produks_table', 9),
(17, '2021_11_30_035456_create_kategori_models_table', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stok` int(20) NOT NULL,
  `berat` int(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `nama_toko` varchar(123) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produks`
--

INSERT INTO `produks` (`id`, `name`, `harga`, `deskripsi`, `kategori_id`, `image`, `created_at`, `updated_at`, `stok`, `berat`, `user_id`, `views`, `nama_toko`) VALUES
(1, 'Baju rajut', '65000', 'Rajut', 1, '122021121422513-bajurajut.jpg', '2021-12-12 06:47:23', '2021-12-12 08:44:50', 1, 0, 17, NULL, 'Lady Fashion'),
(2, 'Wiska oneset', '135000', 'Katun', 1, '122021121457631-wiskaoneset.jpg', '2021-12-12 06:47:57', '2021-12-12 08:44:50', 1, 0, 17, NULL, 'Lady Fashion'),
(3, 'Pokita dress', '95000', 'Wolfis', 1, '122021121427972-pokitadress.jpg', '2021-12-12 06:48:27', '2021-12-12 08:44:50', 1, 0, 17, NULL, 'Lady Fashion'),
(4, 'Baggy pants', '75000', 'American drill', 1, '122021121457369-baggypants.jpg', '2021-12-12 06:48:57', '2021-12-12 08:44:50', 1, 0, 17, NULL, 'Lady Fashion'),
(5, 'Lulu shirt', '120000', 'Knit mix katun', 1, '122021121401404-lulushirt.jpg', '2021-12-12 06:52:01', '2021-12-12 08:44:50', 1, 0, 16, NULL, 'Hijacu Hijab'),
(6, 'Nala tunik', '130', 'Rayon printing', 1, '122021121432555-nalatunik.jpg', '2021-12-12 06:52:32', '2021-12-12 08:44:50', 1, 0, 16, NULL, 'Hijacu Hijab'),
(7, 'Kemaja flannel', '125000', 'Flannel impor', 1, '122021121458518-kemejaflannel.jpg', '2021-12-12 06:52:58', '2021-12-12 08:44:50', 2, 0, 16, NULL, 'Hijacu Hijab'),
(8, 'Belle shirt', '120000', 'Crepe', 1, '122021121426330-belleshirt.jpg', '2021-12-12 06:53:26', '2021-12-12 08:44:50', 4, 0, 16, NULL, 'Hijacu Hijab'),
(9, 'Kemeja oversize', '140000', 'Banboo', 1, '122021121430762-kemejaoversize.jpg', '2021-12-12 06:56:30', '2021-12-12 08:44:50', 10, 0, 15, NULL, 'Irliana Shop'),
(10, 'Pocket jaket', '120000', 'Crinckle', 1, '122021121404236-jaketpocket.jpg', '2021-12-12 06:57:04', '2021-12-12 08:44:50', 3, 0, 15, NULL, 'Irliana Shop'),
(11, 'Kemeja burberry', '14000', 'Katun', 1, '122021121442110-kemejaburberry.jpg', '2021-12-12 06:57:42', '2021-12-12 08:44:50', 12, 0, 15, NULL, 'Irliana Shop'),
(12, 'Outer serut', '120000', 'Crinckle', 1, '122021121414380-outerserut.jpg', '2021-12-12 06:58:14', '2021-12-12 08:44:50', 2, 0, 15, NULL, 'Irliana Shop'),
(13, 'Jaket jeans', '110000', 'Jeans premium', 1, '122021121517831-jaketjeans.jpg', '2021-12-12 07:00:17', '2021-12-12 08:44:50', 3, 0, 14, NULL, 'Yuki Hijab'),
(14, 'Kemeja kotak', '129000', 'Katun', 1, '122021121510968-kemejakotak.jpg', '2021-12-12 07:01:10', '2021-12-12 08:44:50', 4, 0, 14, NULL, 'Yuki Hijab'),
(15, 'Kemeja kotak', '99000', 'Jeans premium', 1, '122021121544115-kulotjeans.jpg', '2021-12-12 07:01:44', '2021-12-12 08:44:50', 2, 0, 14, NULL, 'Yuki Hijab'),
(16, 'Blouse', '129000', 'Katun', 1, '122021121508879-blouse.jpg', '2021-12-12 07:02:08', '2021-12-12 08:44:50', 5, 0, 14, NULL, 'Yuki Hijab'),
(17, 'Jilbab plisket', '40000', 'Ceruty babydoll', 1, '122021121545346-pasminaplisket.jpg', '2021-12-12 07:03:45', '2021-12-12 08:57:35', 1, 0, 13, NULL, 'Nurul Hijab'),
(18, 'Annisa hijab', '45000', 'Jersey premium', 1, '122021121537324-Annisainstan.jpg', '2021-12-12 07:04:37', '2021-12-12 08:57:35', 2, 0, 13, NULL, 'Nurul Hijab'),
(19, 'Pasmina inner', '40000', 'Ceruty babydoll', 1, '122021121513665-pasminaceruty.jpg', '2021-12-12 07:05:13', '2021-12-12 08:57:35', 3, 0, 13, NULL, 'Nurul Hijab'),
(20, 'Hijab voal watersplash', '45000', 'Voal', 1, '12202112154297-hijabvoal.jpg', '2021-12-12 07:05:42', '2021-12-12 08:57:35', 4, 0, 13, NULL, 'Nurul Hijab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kode_payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `total_harga` bigint(20) UNSIGNED NOT NULL,
  `kode_unik` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_lokasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jasa_pengiriman` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ongkir` int(10) UNSIGNED NOT NULL,
  `total_transfer` bigint(20) UNSIGNED NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bukti_transfer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toko_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_id` int(10) UNSIGNED NOT NULL,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_toko` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `fcm`, `alamat`, `nama_toko`, `user_id`, `image`, `views`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$/YyOst8hRSq2BcL8bu47QubfFyDbe9MUTKL2zlJPkVB.sBfWXmPZ6', NULL, '2021-11-25 16:35:48', '2021-12-29 01:47:50', '09187231', NULL, 'Palopo', 'Bibit Singapura', 'admin', NULL, NULL),
(12, 'Adi M', 'adi@gmail.com', NULL, '$2y$10$/H9ReNZ6gmSPpYKPxmRVjOhDUhBPhLZeQ5AZwN7ha1.e5oHqY4AXK', NULL, '2021-12-01 22:25:48', '2021-12-01 22:25:48', '081236715273', 'fKKomZmjRsu1m_dfQuxJe4:APA91bHnzTcWjVMQfOcGyZks1QerpfbWglvNZUIOrT9-stFiypdnltXFcbQb6UlGThOmH076048fewgQcX9Q44KjXFbPrPd13ISbXx0OMwAqEuDO2_FavAZddpoDZDnkwSZSHrxAEUpe', 'jl. Pongsimpin', NULL, 'user', NULL, NULL),
(13, 'Nurul Hijab', 'nurulhijab@gmail.com', NULL, '$2y$10$UIx1DHblr2bWhr8Dd2WppeDJgtE9vNBtQqNumGh3aH9Sarh7aavK6', NULL, '2021-12-12 06:17:40', '2021-12-29 05:19:00', '08172351223', NULL, 'jl. Pongsimpin', 'Nurul Hijab', 'seller', '122021291042438-nurulhijablogo.jpg', NULL),
(14, 'Yuki Hijab', 'yukihijab@gmail.com', NULL, '$2y$10$Ol786rxzFZx7KGZa2yxRa.JMg.1rP27Tw/6hsZ5FfB0roFEkSi00C', NULL, '2021-12-12 06:22:14', '2021-12-29 05:44:56', '081263712', NULL, 'jl. Ahmad dahlan no.73', 'Yuki Hijab', 'seller', '122021291356373-yukihijablogo.png', NULL),
(15, 'Irliana Shop', 'irlianashop@gmail.com', NULL, '$2y$10$tRluV0JyAG3VvhdARaEDQe6GPV3agPmJ4bqf.W7idxaU5kZHURHCq', NULL, '2021-12-12 06:23:34', '2021-12-29 06:01:09', '08126312', NULL, 'jl. Kelapa', 'Irliana Shop', 'seller', '12202129140970-irlianalogo.jpg', NULL),
(16, 'Hijacu Hijab', 'hijacuhijab@gmail.com', NULL, '$2y$10$rDhEA4aMUUk/qwFChgA3Mu5pXoVknE40sqWWe75KzRif5WB7zyuTi', NULL, '2021-12-12 06:24:37', '2021-12-29 06:30:50', '0812361827', NULL, 'jl. Merdeka', 'Hijacu Hijab', 'seller', '122021291450285-hijacuhijablogo.jpg', NULL),
(17, 'Lady Fashion', 'ladyfashion@gmail.com', NULL, '$2y$10$RFD/xhxp5p2DjLhxXEdJv./9IOBpsCCOC9ODCrwpEID8QH.YYhLqq', NULL, '2021-12-12 06:25:36', '2021-12-29 06:32:17', '0812376182', NULL, 'jl. Kartini', 'Lady Fashion', 'seller', '122021291417550-ladyfashionlogo.jpg', NULL),
(18, 'Agus', 'agus@gmail.com', NULL, '$2y$10$WZQZDDvEvOxnrQCvCpc9IuP0yjjMeRQIyva4PwnQLH2Cn5nzusHee', NULL, '2021-12-12 07:52:40', '2021-12-12 07:52:40', '08126371223', 'fVXt6vkARdaA1zh7otHrde:APA91bFVV-WrVcxn-aTz_unh8d_ZgFb1ql8T39OTWbSRuesbBJmylCXjh1fAMVBYhS34M9tU_MUe_W5CF69PAsJiOdF1VDgD3KWMGwE0EbQ3sLyIfEewvmsU4voRrxVbhkfEa9cW1iqK', NULL, NULL, 'user', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori_models`
--
ALTER TABLE `kategori_models`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori_models`
--
ALTER TABLE `kategori_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
