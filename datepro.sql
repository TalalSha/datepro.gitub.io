-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2022 at 03:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_witfit`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookings`
--

CREATE TABLE `tbl_bookings` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `town_city` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `co_host_phone` varchar(20) NOT NULL,
  `booking_type` enum('Tour','Event') NOT NULL,
  `tour_date` date DEFAULT NULL,
  `tour_time` time DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `event_package` varchar(255) NOT NULL,
  `is_age_21` enum('1','0') DEFAULT '0',
  `no_of_guests` int(11) NOT NULL,
  `rental_date` date NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `event_privacy` varchar(50) NOT NULL,
  `find_us` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `msg` text CHARACTER SET latin1 NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL,
  `purpose` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE `tbl_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `order_no` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_multi_text`
--

CREATE TABLE `tbl_multi_text` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `txt1` mediumtext NOT NULL,
  `txt2` mediumtext NOT NULL,
  `txt3` mediumtext NOT NULL,
  `txt4` mediumtext NOT NULL,
  `txt5` mediumtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `section` varchar(255) NOT NULL,
  `order_no` varchar(11) DEFAULT '0',
  `site_lang` enum('eng','gr') NOT NULL DEFAULT 'eng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_newsletter`
--

CREATE TABLE `tbl_newsletter` (
  `id` int(11) NOT NULL,
  `mem_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permissions`
--

CREATE TABLE `tbl_permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permissions_admin`
--

CREATE TABLE `tbl_permissions_admin` (
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plans`
--

CREATE TABLE `tbl_plans` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT 0,
  `type` enum('day','evening') NOT NULL DEFAULT 'day'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_preferences`
--

CREATE TABLE `tbl_preferences` (
  `pref_id` int(11) NOT NULL,
  `pref_key` varchar(50) NOT NULL,
  `pref_title` varchar(500) NOT NULL,
  `pref_short_desc` varchar(1000) NOT NULL,
  `pref_detail` text NOT NULL,
  `pref_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siteadmin`
--

CREATE TABLE `tbl_siteadmin` (
  `site_id` int(11) NOT NULL,
  `site_username` varchar(255) DEFAULT NULL,
  `site_password` varchar(255) DEFAULT NULL,
  `site_admin_name` varchar(255) DEFAULT NULL,
  `site_admin_type` enum('admin','subadmin') NOT NULL DEFAULT 'admin',
  `site_domain` varchar(100) DEFAULT NULL,
  `site_name` varchar(500) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_noreply_email` varchar(255) DEFAULT NULL,
  `site_email_cc` text DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `site_fax` varchar(255) DEFAULT NULL,
  `site_paypal_sandox` tinyint(1) DEFAULT 0,
  `site_sandbox_paypal` varchar(255) DEFAULT NULL,
  `site_live_paypal` varchar(255) DEFAULT NULL,
  `site_ip` varchar(255) DEFAULT NULL,
  `admin_site_logo` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_logo_2` varchar(255) NOT NULL,
  `site_footer_logo` varchar(255) DEFAULT NULL,
  `site_icon` varchar(255) DEFAULT NULL,
  `site_thumb` varchar(255) DEFAULT NULL,
  `site_address` varchar(255) DEFAULT NULL,
  `site_about` text DEFAULT NULL,
  `site_city` varchar(100) DEFAULT NULL,
  `site_state` varchar(100) DEFAULT NULL,
  `site_zip` varchar(25) DEFAULT NULL,
  `site_country` varchar(100) DEFAULT NULL,
  `site_lastlogindate` timestamp NOT NULL DEFAULT current_timestamp(),
  `site_copyright` varchar(1000) DEFAULT NULL,
  `site_facebook` varchar(255) DEFAULT NULL,
  `site_twitter` varchar(255) DEFAULT NULL,
  `site_google` varchar(255) DEFAULT NULL,
  `site_instagram` varchar(255) DEFAULT NULL,
  `site_linkedin` varchar(255) DEFAULT NULL,
  `site_youtube` varchar(255) DEFAULT NULL,
  `site_pinterest` varchar(255) DEFAULT NULL,
  `site_contact_map` text DEFAULT NULL,
  `site_google_ad` text DEFAULT NULL,
  `site_meta_desc` text DEFAULT NULL,
  `site_meta_keyword` varchar(1000) DEFAULT NULL,
  `site_meta_copyright` varchar(500) DEFAULT NULL,
  `site_meta_author` varchar(255) DEFAULT NULL,
  `site_how_to_pay` text DEFAULT NULL,
  `site_status` int(11) NOT NULL DEFAULT 1,
  `sub_location` int(20) DEFAULT NULL,
  `site_chat` text DEFAULT NULL,
  `sub_featured` int(30) DEFAULT NULL,
  `site_version` int(11) NOT NULL DEFAULT 0,
  `site_shipping_fee` float DEFAULT NULL,
  `site_tax_percentage` float NOT NULL DEFAULT 0,
  `site_product_msg` varchar(255) DEFAULT NULL,
  `site_product_calltext` varchar(255) DEFAULT NULL,
  `site_accept_order` tinyint(1) DEFAULT 1,
  `interview_cost` double NOT NULL,
  `resume_cost` double NOT NULL,
  `coaching_cost` double NOT NULL,
  `site_stripe_type` tinyint(4) DEFAULT NULL,
  `site_stripe_testing_api_key` varchar(255) DEFAULT NULL,
  `site_stripe_testing_secret_key` varchar(255) DEFAULT NULL,
  `site_stripe_live_api_key` varchar(255) DEFAULT NULL,
  `site_stripe_live_secret_key` varchar(255) DEFAULT NULL,
  `site_commission` double NOT NULL,
  `site_payment_clear_days` int(11) NOT NULL,
  `site_proof_acceptance_days` int(11) DEFAULT NULL,
  `site_email_send` varchar(255) DEFAULT NULL,
  `site_address_gr` text DEFAULT NULL,
  `site_about_gr` text DEFAULT NULL,
  `site_copyright_gr` text DEFAULT NULL,
  `site_footer_button_text` text DEFAULT NULL,
  `site_footer_button_url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sitecontent`
--

CREATE TABLE `tbl_sitecontent` (
  `id` int(11) NOT NULL,
  `ckey` varchar(80) NOT NULL,
  `code` mediumtext DEFAULT NULL,
  `full_code` mediumtext DEFAULT NULL,
  `site_lang` enum('eng','gr') NOT NULL DEFAULT 'eng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_site_texts`
--

CREATE TABLE `tbl_site_texts` (
  `txt_id` int(11) NOT NULL,
  `txt_type` varchar(50) DEFAULT NULL,
  `txt_label` varchar(100) DEFAULT NULL,
  `txt_key` text DEFAULT NULL,
  `txt_value` text DEFAULT NULL,
  `txt_subject` text DEFAULT NULL,
  `txt_msg` varchar(160) DEFAULT NULL,
  `txt_is_sms` tinyint(1) DEFAULT NULL,
  `txt_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team`
--

CREATE TABLE `tbl_team` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `designation` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `order_no` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonials`
--

CREATE TABLE `tbl_testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_multi_text`
--
ALTER TABLE `tbl_multi_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_preferences`
--
ALTER TABLE `tbl_preferences`
  ADD PRIMARY KEY (`pref_id`);

--
-- Indexes for table `tbl_siteadmin`
--
ALTER TABLE `tbl_siteadmin`
  ADD PRIMARY KEY (`site_id`);

--
-- Indexes for table `tbl_sitecontent`
--
ALTER TABLE `tbl_sitecontent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_site_texts`
--
ALTER TABLE `tbl_site_texts`
  ADD PRIMARY KEY (`txt_id`);

--
-- Indexes for table `tbl_team`
--
ALTER TABLE `tbl_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bookings`
--
ALTER TABLE `tbl_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_multi_text`
--
ALTER TABLE `tbl_multi_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_newsletter`
--
ALTER TABLE `tbl_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_permissions`
--
ALTER TABLE `tbl_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_plans`
--
ALTER TABLE `tbl_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_preferences`
--
ALTER TABLE `tbl_preferences`
  MODIFY `pref_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_siteadmin`
--
ALTER TABLE `tbl_siteadmin`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sitecontent`
--
ALTER TABLE `tbl_sitecontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_site_texts`
--
ALTER TABLE `tbl_site_texts`
  MODIFY `txt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_team`
--
ALTER TABLE `tbl_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_testimonials`
--
ALTER TABLE `tbl_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
