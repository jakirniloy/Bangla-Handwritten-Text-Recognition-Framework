-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 09:00 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learningpoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add newusers', 7, 'add_newusers'),
(26, 'Can change newusers', 7, 'change_newusers'),
(27, 'Can delete newusers', 7, 'delete_newusers'),
(28, 'Can view newusers', 7, 'view_newusers'),
(29, 'Can add newusers1', 8, 'add_newusers1'),
(30, 'Can change newusers1', 8, 'change_newusers1'),
(31, 'Can delete newusers1', 8, 'delete_newusers1'),
(32, 'Can view newusers1', 8, 'view_newusers1'),
(33, 'Can add userpost', 9, 'add_userpost'),
(34, 'Can change userpost', 9, 'change_userpost'),
(35, 'Can delete userpost', 9, 'delete_userpost'),
(36, 'Can view userpost', 9, 'view_userpost');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$ttc4CDUqVwMx$g+sFjnYth0NAc2ESnc5BmO0cYzVXdERfOA6XlkyOf7s=', '2021-09-07 06:49:05.613615', 1, 'jakir', '', '', 'jakir@gmail.com', 1, 1, '2021-08-28 16:24:04.639501');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-08-28 16:24:52.063233', '1', 'Newusers object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-08-28 17:28:16.375299', '2', 'Newusers object (2)', 3, '', 7, 1),
(3, '2021-08-28 17:41:38.017394', '5', 'Newusers object (5)', 3, '', 7, 1),
(4, '2021-08-28 17:41:42.085702', '4', 'Newusers object (4)', 3, '', 7, 1),
(5, '2021-08-28 17:51:10.295170', '7', 'Newusers object (7)', 3, '', 7, 1),
(6, '2021-08-29 07:14:02.350176', '10', 'Newusers object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(7, '2021-08-29 07:26:30.363162', '10', 'Newusers object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(8, '2021-08-29 07:28:17.337681', '10', 'Newusers object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(9, '2021-08-29 07:31:04.270547', '10', 'Newusers object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(10, '2021-08-29 07:48:29.140671', '10', 'Newusers object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(11, '2021-08-29 18:07:41.875482', '12', 'Newusers object (12)', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'learningpoint', 'newusers'),
(8, 'learningpoint', 'newusers1'),
(9, 'learningpoint', 'userpost'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-07-25 19:02:22.178007'),
(2, 'auth', '0001_initial', '2021-07-25 19:02:22.680656'),
(3, 'admin', '0001_initial', '2021-07-25 19:02:22.809690'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-07-25 19:02:22.824679'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-25 19:02:22.836618'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-07-25 19:02:22.916053'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-07-25 19:02:22.969899'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-07-25 19:02:22.991080'),
(9, 'auth', '0004_alter_user_username_opts', '2021-07-25 19:02:23.001052'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-07-25 19:02:23.061522'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-07-25 19:02:23.065440'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-07-25 19:02:23.076412'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-07-25 19:02:23.101344'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-07-25 19:02:23.125502'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-07-25 19:02:23.148437'),
(16, 'auth', '0011_update_proxy_permissions', '2021-07-25 19:02:23.160479'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-07-25 19:02:23.183414'),
(18, 'sessions', '0001_initial', '2021-07-25 19:02:23.219273'),
(19, 'learningpoint', '0001_initial', '2021-08-28 08:44:50.853565'),
(20, 'learningpoint', '0002_auto_20210828_1457', '2021-08-28 08:58:01.625363'),
(21, 'learningpoint', '0003_auto_20210907_0038', '2021-09-06 18:38:40.721973');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3od4uam0ywi6rubvhot858gh6olu4w54', 'eyJFbWFpbCI6Impha2lyQGdtYWlsLmNvbSJ9:1mIFFa:Znp0jB6tPyMS9vlvFb6l3SKRu7klu0158K-snIpFQIo', '2021-09-06 19:04:50.914680'),
('6ykfr1hofce3dslx82sz2rzd9nl37wec', '.eJxVjMsOgjAURP-la2na0ge4MiYu_QbS3nsrKEJCaVwY_92SsNDNLGbOnDfrfF77LidaugHZkUl2-O2ChwdN24B3P91mDvO0LkPgG8L3NfHrjDSed_ZP0PvUl3frlTCmIatARBFRWKVbU9cgsIkKa0M6Uoy-bcEaIzUBOuuNjuDAOReK9PL0w1hUSihZqcqKSjbylFbk9MqhJGb2-QLkCEKm:1mNVct:SSh8zHxpPKGWXc8nrE702td0BIiBv5xREsgxyCGutIs', '2021-09-21 07:34:39.204968'),
('jon6bfaepp5qednxd8ghhd311xzr6xhu', 'eyJFbWFpbCI6IjIwMjEtMi02MC0xODFAc3RkLmV3dWJkLmVkdSJ9:1mLGY3:U5wYpkzA4Q_wMSEvZFsYOTzMHs553JY5QR0PYSYGKuY', '2021-09-15 03:04:23.257005'),
('myv22yxy2vi4f1yz0fwd9cxi7ibywkne', 'eyJFbWFpbCI6InR1cmpveUBnbWFpbC5jb20ifQ:1mG23Y:eIT-zcAiFZ1vqvNGU8hA5byoHUR9suEHK2VvgogIg-0', '2021-08-31 16:35:16.006772'),
('p9r8j4qdi6eoalka9cg07kxhue1yais4', '.eJxVjDsOwjAQBe_iGlmO47VjSnrOYG32gwMokfKpEHeHSCmgfTPzXqbgttayLTKXgc3ZNOb0u_VIDxl3wHccb5OlaVznobe7Yg-62OvE8rwc7t9BxaV-64zeAXQSPTl1yi76kKFtyXGnnluQoKKKOVMEaIIQp4gQlBKllHrz_gDarjgW:1mKPEP:XjB2LKC-XDKFqRqCPiE8ShrPuUPWHPsmdpHoZLLy680', '2021-09-12 18:08:33.597637'),
('snr8zend579084335472brzk8y7o4bb7', 'eyJFbWFpbCI6Impha2lyQHN0ZC5ld3ViZC5lZHUifQ:1mLI0C:QP_3z7OV6FZbdJqcCuG-Jhn8vPWqRFMmi2ajw1uVyiE', '2021-09-15 04:37:32.087294'),
('vqef7r50cabfh0ky3phtltxww19kr711', 'e30:1mNIW9:ldakWQRiDR8vhsN8H2RsckspRA5rQNN9B_bOua9dURE', '2021-09-20 17:34:49.176945'),
('wwwljq8bg169sye12fe5ldfpri17702k', 'eyJFbWFpbCI6InNhcmFoMTJAZ21haWwuY29tIn0:1pdbQ6:mvfsSKlE3QxPVP4PABdlFY0aSTJGLhLR2821PrM5fhw', '2023-04-01 18:36:46.544603');

-- --------------------------------------------------------

--
-- Table structure for table `learningpoint_newusers`
--

CREATE TABLE `learningpoint_newusers` (
  `id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `expert` varchar(15) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `lastName` varchar(20) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `point` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `learningpoint_newusers`
--

INSERT INTO `learningpoint_newusers` (`id`, `Username`, `Email`, `password`, `created_at`, `expert`, `firstName`, `image`, `lastName`, `phoneNumber`, `point`) VALUES
(1, 'jakir', '2021-2-60-180@std.ewubd.edu', '214364', '2021-08-28 22:24:08.000000', 'c++', 'Jakir', 'uploads/20210828222452-error.png', 'Niloy', '0174250366', '80'),
(8, '2021-2-60-181', '2021-2-60-181@std.ewubd.edu', 'pbkdf2_sha256$216000$KkgYDDJ9YD3N$bt1czJumo2zTOHSZEiDobUNR79/W7jLMFiE7XKiXatw=', '2023-03-15 03:18:07.408019', 'C Programming', 'Jakir', 'uploads/20230315032111-333053853_1273118976884612_491324689640549196_n.jpg', 'Niloy', '0174250366', '50'),
(9, '2021-2-60-256', '2021-2-60-256@std.ewubd.edu', 'pbkdf2_sha256$216000$21YqdQooicUQ$//MJQ3WibNHT5QMXbENKMdzJDCqyLxyZmxDA/J0R3UA=', '2021-08-29 00:22:20.042819', 'C Programming', 'Turjoy', '', 'Jakir', '01742750366', '100'),
(10, 'jakir', 'jakir@std.ewubd.edu', 'pbkdf2_sha256$216000$5hXFJkABacWZ$2n/hsLN/1MGESnX4xyBVLN+06chekTAz/mV4sBGbmes=', '2021-09-01 09:03:50.442789', 'C Programming', 'Jakir', 'uploads/20210901103749-148990721_623911635087500_2565889344625208816_n.jpg', 'Niloy', '0174250366', '100'),
(11, '', '2021-2-60-111@std.ewubd.edu', 'pbkdf2_sha256$216000$hLcUL6n25Rvn$09ybaNMIxDbyevogAjiuEP9auT168QVzwEXJj4k3NJY=', '2021-08-29 13:59:42.365383', 'C Programming', 'Jakir', '', 'Niloy', '0174250366', '100'),
(12, 'jakir', 'fardin13@gmail.com', 'pbkdf2_sha256$216000$EFxgkYyiIAFq$JRoyiWj9pPHwcBjJit21BjQwr4MJVHE3Q56SbF5hm+c=', '2021-08-29 13:59:42.000000', 'C Programming', 'Fardin', '', 'Rahman akash', '0144555522165', '100'),
(13, '2021-2-60-122', '2021-2-60-122@std.ewubd.edu', 'pbkdf2_sha256$216000$4wWH7x5l89Ub$iq0vT7BdxiJjk+8t5lTQrEWz7CLdgJTUopMrSN5He4A=', '2021-09-07 09:09:07.230686', 'C Programming', 'Jakir', 'uploads/20210907091216-zx.jpg', 'Niloy', '0174250366', '90'),
(14, '2021-2-60-236', '2021-2-60-236@std.ewubd.edu', 'pbkdf2_sha256$216000$6j7Ezv5HbbDO$F+9Ikp/KETtOKM5SHi5Al27JlUDS+CFS1IJqwcykXoo=', '2021-09-07 09:09:07.230686', 'C Programming', 'Jakir', 'uploads/20210907133202-173037860_3564942140397862_8838739723155445791_n.jpg', 'Niloy', '0174250366', '100'),
(15, '2021-2-60-560', '2021-2-60-560@std.ewubd.edu', 'pbkdf2_sha256$216000$pbIWt3Iay5my$MPCc4edAHSRUMQaw/0pPYCXDKJJOoWcYP4ECkAVjZZk=', '2023-03-16 12:36:17.570115', 'Bangladesh', 'Jakir', 'uploads/20230316132255-333053853_1273118976884612_491324689640549196_n.jpg', 'Niloy', '0174250366', '100'),
(16, 'sarah', 'sarah@gmail.com', 'pbkdf2_sha256$216000$4g9bV5dKkTdJ$j8y9A9Ci2MmOd12uFuFB84dE9kC/f89CF8r/MxKuJxc=', '2023-03-15 20:59:14.324493', 'Bangladesh', 'sarah', '', 'zaman', '0171234578', '100'),
(17, 'sarah1', 'sarah1@gmail.com', 'pbkdf2_sha256$216000$0ls4YlXZ99rR$3L/tecTObWlLelxA262NSPzENPQHrQiZDxoYtB1/aYo=', '2023-03-15 20:59:14.324493', 'Bangladesh', 'sarah', '', 'zaman', '0171234578', '100'),
(18, 'sarah12', 'sarah12@gmail.com', 'pbkdf2_sha256$216000$JEg1Z0vuauzh$H6jLZg0VlmF/P3aoboLZdGXnuZMtKFgDYml6h2b4LkU=', '2023-03-15 20:59:14.324493', 'Bangladesh', 'sarah', '', 'zaman', '0171234578', '100'),
(19, 'sarah1sd', 'sarah1sd@gmail.com', 'pbkdf2_sha256$216000$TZE5fZaPa6mg$VfOaVpA4xykksWlTibPgl6vX6FBhzf1SilEbvMkilUo=', '2023-03-18 23:46:15.254136', 'Bangladesh', 'sarah', '', 'zaman', '0171234578', '100');

-- --------------------------------------------------------

--
-- Table structure for table `users_post`
--

CREATE TABLE `users_post` (
  `id` int(11) NOT NULL,
  `publisherId` varchar(20) NOT NULL,
  `publisherName` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(3072) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `learningpoint_newusers`
--
ALTER TABLE `learningpoint_newusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_post`
--
ALTER TABLE `users_post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `learningpoint_newusers`
--
ALTER TABLE `learningpoint_newusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users_post`
--
ALTER TABLE `users_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
