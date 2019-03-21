-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 24, 2018 at 01:59 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urban_massage`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_22_062636_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(3, 'App\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `city_name`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Ahmedabad', 1, 0, '2018-10-24 08:11:02', '2018-10-24 08:27:33'),
(2, 'Surat', 1, 0, '2018-10-24 08:11:42', '2018-10-24 08:13:26'),
(3, 'Baroda', 1, 0, '2018-10-24 08:11:47', '2018-10-24 08:11:47'),
(4, 'Rajkot', 1, 1, '2018-10-24 08:11:53', '2018-10-24 08:27:36'),
(5, 'Mumbai', 1, 0, '2018-10-24 08:12:00', '2018-10-24 08:12:00'),
(6, 'Delhi', 1, 1, '2018-10-24 08:12:05', '2018-10-24 08:12:10'),
(7, 'Rajkot', 1, 0, '2018-10-24 08:29:21', '2018-10-24 08:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2018-10-22 18:30:00', '2018-10-22 18:30:00'),
(2, 'therapist', 'web', '2018-10-22 18:30:00', '2018-10-22 18:30:00'),
(3, 'user', 'web', '2018-10-22 18:30:00', '2018-10-22 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` int(11) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `country_code`, `mobile_no`, `address`, `lat`, `lng`, `distance`, `is_active`, `is_delete`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'test.cosmonautgroup@gmail.com', NULL, '$2y$10$Lo/c0ym5pzxcDFE.jy9Z4exiv.2.GTIweNo2/x8gFFS5hVUh1bSre', NULL, NULL, 9876543210, NULL, NULL, NULL, NULL, 1, 0, NULL, 'Hk9FJxMVWuhuAYMgzjAj7C3oFjhY3TodQ7vJAEAD4DmLsg7JNXD4T6azUAlG', '2018-10-23 08:01:57', '2018-10-23 08:48:54'),
(2, 'Test', 'test1.cosmonautgroup@gmail.com', NULL, '$2y$10$R/WSeZxpvam3HEDR98pW..NNOUwhxTRaazrCD7sQf9Cu.etbhT7Sy', NULL, NULL, 9876543211, 'Ahmedabad, Kalupur Railway Station Road, Sakar Bazzar, Kalupur, Ahmedabad, Gujarat, India', '23.0266941', '72.60087309999994', 10, 1, 0, NULL, NULL, '2018-10-23 08:03:29', '2018-10-24 05:33:05'),
(3, 'Test 2', 'test2.cosmonautgroup@gmail.com', NULL, '$2y$10$k93E2gABtVxeNwArAjLPme6A.yLUd4QptTqlH6P5v0VSeiOdTHdcG', NULL, NULL, 9876543210, 'Ahmedabad, Gujarat, India', '23.022505', '72.57136209999999', 10, 1, 0, NULL, NULL, '2018-10-23 08:04:32', '2018-10-24 05:24:34'),
(4, 'Test 3', 'test3.cosmonautgroup@gmail.com', NULL, '$2y$10$FFlSPUQo9CPaGGEv1GPTReNiQRupUSNEwXNIsTuZm7uXR59J1878O', NULL, NULL, NULL, 'Ahmedabad, Gujarat, India', '23.022505', '72.57136209999999', 10, 1, 1, NULL, NULL, '2018-10-23 08:05:33', '2018-10-24 03:35:21'),
(5, 'Test User', 'test5.cosmonautgroup@gmail.com', NULL, '$2y$10$1NIZGDYzE5dgbhgluAgxM.D.cOQQ4KhQJDycEhV9/1N41nM01LZt6', NULL, NULL, 9876543210, 'Ahmedabad, Gujarat, India', '23.022505', '72.57136209999999', 6, 1, 1, NULL, NULL, '2018-10-24 05:37:53', '2018-10-24 05:41:46'),
(6, 'Test User 1', 'test1@gmail.com', NULL, '$2y$10$wogV.pEhRv9tY/yEunDC9..9MODO1x3RzGjvnSy///Zrtv8dhbkLq', NULL, NULL, 123456878, 'Ahmedabad, Gujarat, India', '23.022505', '72.57136209999999', NULL, 1, 1, NULL, NULL, '2018-10-24 05:44:18', '2018-10-24 06:11:14'),
(7, 'Test 05', 'test512@gmail.com', NULL, '$2y$10$KYi5UGhYnpQfDr95BsVV5e8OQOPytsRzBGjI2zmHpXd7FQ5nm8y6u', NULL, NULL, 9876543210, 'Ahmedabad, Gujarat, India', '23.022505', '72.57136209999999', NULL, 1, 0, NULL, NULL, '2018-10-24 07:16:32', '2018-10-24 07:16:52');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
