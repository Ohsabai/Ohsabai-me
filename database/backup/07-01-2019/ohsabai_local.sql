-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 07, 2019 at 07:24 AM
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
-- Database: `ohsabai_local`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `treatment_id` int(11) DEFAULT NULL,
  `booking_type` int(11) DEFAULT NULL,
  `duration_id` varchar(255) DEFAULT NULL,
  `pricing_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `booking_time` time DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `house_no` varchar(255) DEFAULT NULL,
  `street_name` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `additional_notes` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `feedback_star` int(5) DEFAULT NULL,
  `feedback_desc` varchar(255) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_id`, `user_id`, `therapist_id`, `treatment_id`, `booking_type`, `duration_id`, `pricing_id`, `booking_date`, `booking_time`, `mobile_no`, `name`, `house_no`, `street_name`, `zipcode`, `city`, `additional_notes`, `total_amount`, `feedback_star`, `feedback_desc`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'BK100001', 47, 46, 18, NULL, '37', NULL, '2018-12-26 00:00:00', '06:00:00', 111111111, 'Test User', '1111111111111', '11111111111', '11111111111111', 'Amsterdam, Netherlands', '11111111111111', 100, NULL, NULL, 1, 0, '2018-12-17 15:50:07', '2019-01-02 23:56:51'),
(2, 'BK100002', 47, 46, 8, 1, '01:00:00', NULL, '2018-12-19 00:00:00', '06:30:00', 11111, 'Test User', '111111111111', '111111111111', '111111111111111', 'Amsterdam, Netherlands', '1111111111', 50, NULL, NULL, 1, 0, '2018-12-17 15:57:14', '2018-12-17 15:57:14'),
(3, 'BK100003', 47, 46, 8, 1, '01:00:00', NULL, '2018-12-19 00:00:00', '06:30:00', 11111, 'Test User', '111111111111', '111111111111', '111111111111111', 'Amsterdam, Netherlands', '1111111111', 50, NULL, NULL, 1, 0, '2018-12-17 15:59:17', '2018-12-17 15:59:17'),
(4, 'BK100004', 47, 46, 8, 1, '01:00:00', NULL, '2018-12-19 00:00:00', '06:30:00', 11111, 'Test User', '111111111111', '111111111111', '111111111111111', 'Amsterdam, Netherlands', '1111111111', 50, NULL, NULL, 1, 0, '2018-12-17 15:59:21', '2018-12-17 15:59:21'),
(5, 'BK100005', 47, 46, 8, 1, '01:00:00', NULL, '2018-12-19 00:00:00', '06:30:00', 11111, 'Test User', '111111111111', '111111111111', '111111111111111', 'Amsterdam, Netherlands', '1111111111', 50, NULL, NULL, 1, 0, '2018-12-17 15:59:33', '2018-12-17 15:59:33'),
(6, 'BK100006', 47, 46, 4, 1, '01:00:00', NULL, '2018-12-26 00:00:00', '07:30:00', 111111111, 'Test User', '11111111111', '111111111111111', '11111111111111', 'Amsterdam, Netherlands', '1111111', 50, NULL, NULL, 1, 0, '2018-12-17 16:05:59', '2018-12-29 06:50:34'),
(7, 'BK100007', 47, 46, 13, 1, '01:00:00', NULL, '2018-12-31 00:00:00', '15:00:00', 1111111111, 'Test User', '111111111', '11111111', '11111111', 'Amsterdam, Netherlands', NULL, 50, 3, 'test cosmonautgroup@', 1, 0, '2018-12-21 23:42:31', '2018-12-31 09:30:48'),
(23, 'BK100023', 47, 52, 18, NULL, '37', NULL, '2019-01-29 00:00:00', '01:00:00', 2222222222, 'Test User', '122222222', '2222222222222', '2222222222222', 'Amsterdam, Netherlands', '222222222222222', 100, NULL, NULL, 1, 0, '2019-01-06 23:56:37', '2019-01-06 23:56:37'),
(22, 'BK100022', 47, 52, 18, 0, '38', NULL, '2019-01-16 00:00:00', '01:30:00', 7787878787, 'Test test test', '7878787', '7878787', '878787', 'Ahmedabad, Gujarat, India', '78', 200, NULL, NULL, 1, 0, '2019-01-06 23:43:08', '2019-01-06 23:43:08'),
(21, 'BK100021', 47, 52, 10, 0, '36', NULL, '2019-01-09 00:00:00', '06:00:00', 9898989898, 'Test Cosmonautgroup', 'm55', 'parasnagar', '11111', 'Ahmedabad, Gujarat, India', 'test Additional Notes', 5, NULL, NULL, 1, 0, '2019-01-04 08:41:37', '2019-01-04 08:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `booking_activity`
--

DROP TABLE IF EXISTS `booking_activity`;
CREATE TABLE IF NOT EXISTS `booking_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bk_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'N' COMMENT 'N - new   C - confirm    M- complete  L - cancel',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_activity`
--

INSERT INTO `booking_activity` (`id`, `bk_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'N', '2018-12-17 21:20:07', '2018-12-29 06:45:21'),
(2, 2, 'N', '2018-12-17 21:27:14', '2018-12-29 06:45:21'),
(3, 3, 'C', '2018-12-17 21:29:17', '2018-12-29 06:50:52'),
(4, 4, 'N', '2018-12-17 21:29:21', '2018-12-29 06:45:21'),
(5, 5, 'C', '2018-12-17 21:29:33', '2018-12-29 06:50:46'),
(6, 6, 'M', '2018-12-17 21:35:59', '2018-12-29 06:46:19'),
(7, 7, 'M', '2018-12-22 05:12:31', '2018-12-29 06:46:09'),
(8, 8, 'N', '2019-01-02 09:35:18', '2019-01-02 09:35:18'),
(9, 9, 'N', '2019-01-02 09:35:23', '2019-01-02 09:35:23'),
(10, 10, 'N', '2019-01-02 09:37:19', '2019-01-02 09:37:19'),
(11, 11, 'N', '2019-01-02 09:37:26', '2019-01-02 09:37:26'),
(12, 12, 'N', '2019-01-02 09:46:33', '2019-01-02 09:46:33'),
(13, 13, 'N', '2019-01-02 09:47:41', '2019-01-02 09:47:41'),
(14, 14, 'N', '2019-01-02 09:50:16', '2019-01-02 09:50:16'),
(15, 15, 'N', '2019-01-04 13:37:39', '2019-01-04 13:37:39'),
(16, 16, 'N', '2019-01-04 13:47:05', '2019-01-04 13:47:05'),
(17, 17, 'N', '2019-01-04 13:48:55', '2019-01-04 13:48:55'),
(18, 18, 'N', '2019-01-04 13:50:45', '2019-01-04 13:50:45'),
(19, 19, 'N', '2019-01-04 13:52:31', '2019-01-04 13:52:31'),
(20, 20, 'N', '2019-01-04 14:05:57', '2019-01-04 14:05:57'),
(21, 21, 'N', '2019-01-04 14:11:37', '2019-01-04 14:11:37'),
(22, 22, 'N', '2019-01-07 05:13:08', '2019-01-07 05:13:08'),
(23, 23, 'N', '2019-01-07 05:26:37', '2019-01-07 05:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `category_name`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 0, 'Massage', 1, 0, '2018-10-25 00:59:05', '2018-10-31 06:48:16'),
(2, 1, 'Shiatsu Massage', 1, 0, '2018-10-25 01:01:10', '2018-11-26 05:31:15'),
(3, 2, 'Hot Massage', 1, 1, '2018-10-25 01:01:25', '2018-11-15 06:14:38'),
(4, 1, 'Hot Stone Massage', 1, 0, '2018-10-25 01:11:16', '2018-11-26 05:31:08'),
(5, 0, 'Fitness', 1, 0, '2018-10-25 01:11:37', '2018-10-31 06:48:48'),
(6, 0, 'Aromatherapy Massage', 1, 1, '2018-10-25 01:11:55', '2018-10-31 06:49:15'),
(7, 0, 'Hot Stone Massag', 1, 1, '2018-10-25 01:12:10', '2018-10-31 06:49:11'),
(8, 0, 'Deep Tissue Massage', 1, 1, '2018-10-25 01:12:19', '2018-10-31 06:49:08'),
(9, 0, 'Shiatsu Massage', 1, 1, '2018-10-25 01:12:29', '2018-10-31 06:49:04'),
(10, 0, 'Pregnancy Massage', 1, 1, '2018-10-25 01:12:41', '2018-10-31 06:49:01'),
(11, 0, 'Reflexology', 1, 1, '2018-10-25 01:12:51', '2018-10-31 06:48:52'),
(12, 0, 'Sports Massage', 1, 1, '2018-10-25 01:13:10', '2018-10-31 06:48:57');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `short_description` text,
  `content` longtext,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `page_name`, `short_description`, `content`, `image`, `meta_title`, `meta_description`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'At Urban Massage we believe wellness services are not a luxury. They are as important as a wholesome diet and regular exercise in keeping a healthy body and a happy, focused mind.', '<p>We deliver this mission by using cutting edge technology to seamlessly connect users to wellness services they want &ndash; whenever and wherever they want them. Urban Massage users can be confident that they will have access to&nbsp;<a class=\"About__anchor\" href=\"https://www.urbanmassage.com/en-gb/therapists\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8);\">expert mobile therapists</a>&nbsp;in their area that can be with them within an hour. The nature of mobile therapy empowers a user to integrate treatments like massages as an essential part of their wellbeing routine. Urban Massage facilitates this through simple app and web booking platforms that are regularly optimised based on user feedback and the expertise of our world-class technology team.</p>\n\n<p>The&nbsp;<a class=\"About__anchor\" href=\"https://www.urbanmassage.com/en-gb/treatments\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8);\">quality of the treatment</a>&nbsp;is incredibly important to our users, and therefore for us. We are dedicated to ensuring our therapist partners are the best, most caring and professional experts available. They go through qualification and insurance checks to verify this.</p>', '1540558411.jpg', 'about-us', 'about-us', 1, 0, '2018-10-26 07:01:18', '2018-12-29 04:41:13'),
(2, 'Team', 'We’re a global team of diverse individuals brought together by our shared passion to revolutionise the wellbeing industry.', '<p>Urban Massage started with Jack (CEO) and Giles (CTO) in 2014. The team has grown quickly during the past three years and we are now over 50 strong with teams in the UK, France and Austria. The people behind Urban Massage are entrepreneurial thinkers from a range of backgrounds who believe in the company vision. Everyone ensures they understand the impact of their role on Urban Massage users who are always at the forefront of decision making.</p>\n\n<p>Just like our users, we have fast-paced lives and work hard, so we happily embrace the wellness lifestyle we promote. With weekly in-office exercise sessions, company retreats, massages as well as hammocks, ping-pong and puppies, the Urban Massage team experience the benefits that come from looking after your mind and body.</p>\n\n<p>Those who interact with us quickly see that we are very open as a business. We&rsquo;re a friendly bunch and happy to answer questions, so if you would like to continue learning about us feel free to get in touch for a chat.</p>', '1540557209.jpg', 'Team', 'My Team', 1, 1, '2018-10-26 07:03:29', '2018-10-26 07:05:00'),
(3, 'Service Etiquette', 'Urban Massage connects you with a professional mobile massage therapist that you can trust. All massage services found on Urban Massage is entirely therapeutic and non-sexual.', '<h3>Before your treatment is due to start</h3>\n\n<p>We recommend that you have at least two clean towels to hand. these will be laid on the massage table and over your body.</p>\n\n<h3>On Arrival</h3>\n\n<p>Your therapist will arrive on time, so please make sure you&#39;re at your home, hotel room or office for the time you booked. In the unlikely event that your therapist is running late, you will be notified by the customer service team or the therapist directly.</p>\n\n<p>Please show your therapist where you&#39;d like your treatment to take place and allow them to step outside so you can get undressed in privacy. Your therapist will re-enter the room once you are ready.</p>\n\n<p>If oils are used in your treatment, you can undress to a level you are comfortable with but you are required to wear your underwear at all times during your treatment. requests to be inappropriately uncovered will not be tolerated by your therapist.</p>\n\n<h3>During the Session</h3>\n\n<p>Your therapist will ask you a few simple questions and to complete a consultation form so they can tailor your treatment to your needs.</p>\n\n<p>Please make your therapist aware of any injuries and allergies you have and areas of your body you want to focus on. Feel free to communicate with your therapist about the pressure and if you do happen to feel any pain, please tell your therapist immediately. Please note that for&nbsp;<a class=\"service-etiquette__link\" href=\"https://www.urbanmassage.com/en-gb/treatments/deep-tissue-massage\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">deep tissue</a>&nbsp;and&nbsp;<a class=\"service-etiquette__link\" href=\"https://www.urbanmassage.com/en-gb/treatments/sports-remedial-massage\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">sports massages</a>&nbsp;you can incur moderate pain which will subside after 24-48 hours.</p>\n\n<h3>After the Session</h3>\n\n<p>Your therapist will leave the room to allow you 5 minutes to slowly get up and dressed. After, they will re-enter to obtain your feedback which will be noted against your account.</p>\n\n<p>It is advised that you have a treatment every 2 to 4 weeks to maintain a balanced mind and body. You can simply re-book via the Urban Massage website, app or customer service team.</p>\n\n<p>If you aren&#39;t completely satisfied with your treatment or would like to speak to our customer service team, please email&nbsp;<a class=\"service-etiquette__link\" href=\"mailto:info@urbanmassage.com\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">info@urbanmassage.com</a></p>\n\n<h3>Cancellation</h3>\n\n<p>In the unlikely event your plans change and you wish to cancel your booking, the appointment cancellation policy is as follows:</p>\n\n<table class=\"service-etiquette__table\" style=\"background-color:rgb(244, 245, 247); box-sizing:inherit; color:rgba(73, 72, 92, 0.8); font-family:roboto; font-size:14px; margin:3rem 0px; width:753px\">\n	<thead>\n		<tr>\n			<th style=\"text-align:left\">Notice period</th>\n			<th style=\"text-align:left\">Refund amount</th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"width:374px\">24 hours or more</td>\n			<td style=\"width:373px\">100%</td>\n		</tr>\n		<tr>\n			<td style=\"width:374px\">up to 2 hours before treatment</td>\n			<td style=\"width:373px\">70%</td>\n		</tr>\n		<tr>\n			<td style=\"width:374px\">within 2 hours</td>\n			<td style=\"width:373px\">0%</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>The appointment cancellation policy is designed to protect the relationship between you and your therapist - we understand that plans can change quickly.</p>\n\n<p>Should you make a mistake in your booking, you have a 10 minute grace period after submitting your booking where you can cancel without any charge. to qualify, you must call the customer service team on&nbsp;<a class=\"service-etiquette__link\" href=\"tel:+443301027667\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">0330 102 7667</a>&nbsp;to cancel.</p>\n\n<h3>Booking Amendments</h3>\n\n<p>Booking amendments such as time and location will be subject to the above cancellation policy. If you wish to give your therapist additional instructions these are free of charge. You can call us on&nbsp;<a class=\"service-etiquette__link\" href=\"tel:+443301027667\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">0330 102 7667</a>&nbsp;to speak with our customer service team who will handle your request.</p>\n\n<h3>Prices and Opening hours</h3>\n\n<p><a class=\"service-etiquette__link\" href=\"https://www.urbanmassage.com/en-gb/pricing\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\">All prices</a>&nbsp;quoted on the booking page are full and final, inclusive of transportation with no hidden fees.</p>\n\n<p>You can book treatments for between 8am to 11:30 pm, 7 days a week.</p>\n\n<p>For more information, please see our&nbsp;<a class=\"service-etiquette__link\" href=\"https://urban.force.com/help/s/?language=en_US\" style=\"box-sizing: inherit; background-color: transparent; color: rgba(73, 72, 92, 0.8); font-weight: 600;\" title=\"Frequently Asked Questions\">FAQ</a></p>', '1540558515.jpg', 'Service Etiquette', 'Service Etiquette', 1, 0, '2018-10-26 07:06:30', '2018-10-26 07:25:26'),
(4, 'About us', 'short desc', '<p>test content</p>', '', NULL, NULL, 1, 1, '2018-11-26 05:27:50', '2018-11-26 05:28:23'),
(5, 'Test', 'test', '<p>test</p>', '', NULL, NULL, 1, 0, '2018-12-10 05:01:36', '2018-12-29 04:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `subject`, `email`, `description`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test2.cosmonautgroup@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 1, 0, '2018-10-25 18:30:00', '2018-10-26 12:58:46'),
(2, 'Test 2', 'test3.cosmonautgroup@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 1, 0, '2018-10-25 18:30:00', '2018-10-26 12:58:46'),
(3, 'Test 4', 'test3.cosmonautgroup@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n', 1, 0, '2018-10-25 18:30:00', '2018-10-26 12:59:41'),
(4, 'Test 5', 'test5.cosmonautgroup@gmail.com', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, '2018-10-25 18:30:00', '2018-10-26 07:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `earning_management`
--

DROP TABLE IF EXISTS `earning_management`;
CREATE TABLE IF NOT EXISTS `earning_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_setting`
--

DROP TABLE IF EXISTS `general_setting`;
CREATE TABLE IF NOT EXISTS `general_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` text,
  `timezone` varchar(255) DEFAULT NULL,
  `currency` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `insta_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_setting`
--

INSERT INTO `general_setting` (`id`, `site_name`, `site_logo`, `seo_title`, `seo_description`, `timezone`, `currency`, `email`, `mobile_no`, `address`, `facebook_url`, `linkedin_url`, `twitter_url`, `insta_url`, `youtube_url`, `website`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ohsabai', '1540965838.png', 'Ohsabai', 'Ohsabai', 'Asia/Kolkata', 'TTD', 'support@Ohsabai.com', '9876543210', 'Ahmedabad', 'https://www.facebook.com', 'https://www.linkedin.com', 'https://www.twitter.com/', 'https://www.instagram.com', 'https://www.youtube.com', 'https://www.Ohsabai.com/', 1, '2018-10-27 04:50:40', '2019-01-03 09:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `massage_text`
--

DROP TABLE IF EXISTS `massage_text`;
CREATE TABLE IF NOT EXISTS `massage_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text_1` varchar(255) DEFAULT NULL,
  `text_2` varchar(255) DEFAULT NULL,
  `text_3` varchar(255) DEFAULT NULL,
  `text_4` varchar(255) DEFAULT NULL,
  `text_5` varchar(255) DEFAULT NULL,
  `text_6` varchar(255) DEFAULT NULL,
  `text_7` varchar(255) DEFAULT NULL,
  `text_8` varchar(255) DEFAULT NULL,
  `text_9` varchar(255) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `massage_text`
--

INSERT INTO `massage_text` (`id`, `text_1`, `text_2`, `text_3`, `text_4`, `text_5`, `text_6`, `text_7`, `text_8`, `text_9`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Our expert massage therapists', 'come to you...', 'delivering bliss to your home, hotel, office or wherever!', 'Quick & easy...', 'Simply book online in minutes.', 'A massage therapist can be at your door in an hour', 'Personal...', 'Choose a time & treatment that suits your needs.', '9am - 10pm 365 days a year.', 1, 0, '2018-12-13 06:15:38', '2018-12-14 03:47:13');

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
(1, 'App\\User', 1),
(2, 'App\\User', 44),
(2, 'App\\User', 46),
(2, 'App\\User', 52),
(2, 'App\\User', 53),
(3, 'App\\User', 45),
(3, 'App\\User', 47),
(3, 'App\\User', 48),
(3, 'App\\User', 49),
(3, 'App\\User', 50),
(3, 'App\\User', 51);

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

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('test1.cosmonautgroup@gmail.com', '$2y$10$0en6G7Kz.hNmV0DRenLL6e54IQlrStapaae91BXIxMRfsL5TAkuIq', '2018-10-30 05:17:33');

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
-- Table structure for table `price_time`
--

DROP TABLE IF EXISTS `price_time`;
CREATE TABLE IF NOT EXISTS `price_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `treatments_id` bigint(20) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_time`
--

INSERT INTO `price_time` (`id`, `treatments_id`, `price`, `time`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(38, 18, '200', '3', 1, 0, '2019-01-02 06:08:33', '2019-01-02 06:08:33'),
(36, 10, '5', '6', 1, 0, '2018-12-31 13:57:26', '2018-12-31 13:57:26'),
(35, 10, '3', '4', 1, 0, '2018-12-31 13:57:26', '2018-12-31 13:57:26'),
(34, 10, '1', '2', 1, 0, '2018-12-31 13:57:26', '2018-12-31 13:57:26'),
(37, 18, '100', '1', 1, 0, '2019-01-02 06:08:33', '2019-01-02 06:08:33'),
(39, 14, '100', '60', 1, 0, '2019-01-03 09:47:49', '2019-01-03 09:47:49'),
(40, 13, '150', '60', 1, 0, '2019-01-03 09:47:57', '2019-01-03 09:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
CREATE TABLE IF NOT EXISTS `pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `price` double NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `time`, `price`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '01:00:00', 75, 1, 0, '2018-10-25 06:56:19', '2018-12-07 06:24:51'),
(2, '01:50:00', 45, 1, 0, '2018-10-25 07:00:54', '2018-10-26 04:44:18'),
(3, '01:30:00', 90, 1, 0, '2018-10-25 07:08:47', '2018-10-25 07:08:47'),
(4, '02:00:00', 120, 1, 1, '2018-10-25 07:09:03', '2018-10-25 07:11:01'),
(5, '23:00:00', 11, 1, 0, '2018-11-26 00:57:48', '2018-11-26 00:57:48'),
(6, '22:55:00', 1, 1, 0, '2018-11-26 00:59:07', '2018-11-26 00:59:07'),
(7, '23:00:00', 1212, 1, 0, '2018-11-26 01:01:08', '2018-12-18 01:50:47'),
(8, '23:00:00', 1, 1, 0, '2018-11-26 01:01:25', '2018-12-29 04:41:38'),
(9, '23:55:00', 1, 1, 0, '2018-11-26 01:02:39', '2018-11-26 01:02:39'),
(10, '22:00:00', 12, 1, 0, '2018-11-26 01:03:36', '2018-11-26 01:03:36'),
(11, '23:55:00', 434343, 1, 0, '2018-12-06 06:43:16', '2018-12-31 04:55:41');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `city_name`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Ahmedabad', 1, 0, '2018-10-24 08:11:02', '2018-12-06 04:48:24'),
(2, 'Surat', 1, 0, '2018-10-24 08:11:42', '2018-12-18 01:48:13'),
(3, 'Vadodara', 1, 0, '2018-10-24 08:11:47', '2018-11-26 00:40:51'),
(7, 'Rajkot', 1, 0, '2018-10-24 08:11:53', '2018-12-29 13:17:18'),
(5, 'Mumbai', 1, 0, '2018-10-24 08:12:00', '2018-10-24 08:12:00'),
(6, 'Delhi', 1, 1, '2018-10-24 08:12:05', '2018-10-24 08:12:10'),
(8, 'Ahmedabadd', 1, 1, '2018-11-25 23:24:01', '2018-11-26 00:05:48'),
(9, 'ahmedabada', 1, 1, '2018-11-26 00:04:56', '2018-11-26 00:05:41'),
(10, 'ahmanedabad', 1, 1, '2018-11-26 00:05:10', '2018-11-26 00:05:37'),
(11, 'Ahmedabad121212', 1, 1, '2018-12-06 03:40:33', '2018-12-06 03:44:26'),
(12, 'Ahmedabad1212211', 1, 1, '2018-12-06 03:44:21', '2018-12-06 03:44:29'),
(13, 'Ahmedabadasasasa', 1, 1, '2018-12-06 03:54:04', '2018-12-06 03:55:51'),
(14, 'Ahmedabadsdsd', 1, 1, '2018-12-06 03:55:46', '2018-12-06 03:55:54');

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
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'New', 1, 0, '2018-11-02 14:05:53', '2018-11-02 14:05:53'),
(2, 'Confirmed', 1, 0, '2018-11-02 14:06:09', '2018-11-02 14:06:09'),
(3, 'Completed', 1, 0, '2018-11-02 14:06:29', '2018-11-02 14:06:29'),
(4, 'Cancelled', 1, 0, '2018-11-02 14:06:41', '2018-11-02 14:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` char(1) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'test1.cosmonautgroup@gmail.com', '1', '0', '2018-12-17 21:51:02', '2019-01-07 00:54:53'),
(2, 'mitul.cosmonautgroup@gmail.com', '1', '0', '2018-12-17 23:21:00', '2018-12-17 23:21:00'),
(3, 'test4.cosmonautgroup@gmail.com', '1', '0', '2018-12-22 09:52:55', '2018-12-22 09:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
CREATE TABLE IF NOT EXISTS `treatments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `treatment_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `overview` longtext,
  `treatment` longtext,
  `faq` longtext,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`id`, `category_id`, `treatment_name`, `image`, `overview`, `treatment`, `faq`, `created_by`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 2, 'Urban Classic', '1540534552.JPG', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What is an Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Based on traditional, popular massage techniques, this is an ideal first treatment for people who are looking for a healthy and indulgent pick-me-up. Using long strokes and deep circular movements, your therapist will help you unwind and de-stress, while boosting your immune system.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Massage has come to be associated with a broad range of health benefits, from improved pain management to enhanced circulation, and even treatment of conditions like arthritis. Even if you don&rsquo;t have specific concerns, some studies prove massage can positively influence your general health from the very first session.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Who would benefit from an Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone from athletes to office workers will feel the benefits of this treatment, which releases muscular tension and decreases inflammation.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">People who may choose to select this treatment:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">New to massage.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Primarily focused on relaxation, but prefer something more energising than a relaxing massage.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Prefer lighter pressure.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Want to feel calm and composed.\n	<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	</ul>\n	</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">People who should not choose an Urban Classic:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Looking for deep pressure. Try a deep tissue massage instead.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Pregnant women. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Urban Classic massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Warms and stretches superficial tissue.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Increases blood flow throughout the body.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Promotes a sense of wellness and relaxation.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Decreases cortisol levels in the body, reducing stress.</li>\n</ol>\n</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">During your Urban Classic treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Before your massage you will remove your clothes (except for underwear), and lie on the table covered by a towel. Your therapist will use oils to apply various massage strokes, which will gently warm your muscle tissues and gradually break down any knots.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Urban Classic techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This classic massage relieves muscle tension and increases blood circulation around the body. Your therapist will use massage oils or creams to soften the muscles through long, slow strokes and gentle-but-firm pulling and pressing. This treatment is extremely relaxing, and you shouldn&rsquo;t expect to feel uncomfortable at any time.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What is the difference between an Urban Classic and other types of massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">An Urban Classic massage is typically gentler than other types of massage therapy. It is a good general introduction to massage, as it uses lighter pressure strokes.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">After your Urban Classic massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Should you feel any aches after your treatment, take a warm bath and be sure to drink plenty&nbsp;<br style=\"box-sizing: inherit;\" />\nof water. If you&rsquo;ve been experiencing a lot of stress you may feel more emotional, so it&rsquo;s important to make time to rest.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Does an Urban Classic massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage shouldn&#39;t be painful. If you do experience discomfort at any time, talk to your therapist and let them know. They will be able to adjust their technique until you&#39;re happy.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Even though an Urban Classic massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What type of therapists specialise in Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Therapists who have experience in classic, medical and health massages. They may also offer an energising or relaxing massage.</div>\n</div>', 0, 1, 1, '2018-10-26 00:45:52', '2018-10-26 01:52:45'),
(2, 1, 'Deep Tissue', '1540534864.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage instigates a greater tension relieving response than a classic massage by concentrating on posterior (deeper) muscles. It uses a mix of classic massage strokes, with increased pressure, typically following the muscle from insertion to origin. The aim is to reduce muscle tension by releasing knots and restoring elasticity. Deep tissue massage is also designed to increase blood flow to targeted muscles, kick-starting the body&rsquo;s natural healing process.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage is one the most popular choices of massage as it can suit many individuals, helping to ease pain and stiffness in a variety of scenarios. It is not just for athletes or people with acute injuries.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People may choose to select this treatment who are:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Experiencing tension in specific areas of the body - most commonly in the back and neck.</li>\n	<li>Suffering from chronic pain.</li>\n	<li>Stressed and looking for deep relaxation.</li>\n	<li>Recovering from a soft tissue injury.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Individuals should not have a deep tissue massage if they have:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Issues lying on their front</li>\n	<li>Open wounds or cuts - these areas should be avoided</li>\n	<li>High blood pressure - check with your GP before booking a deep tissue treatment</li>\n	<li>Had recent surgery</li>\n	<li>Fever, flu or cold symptoms - these can be amplified after a massage</li>\n	<li>Pregnancy. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Reduces tissue congestion</li>\n	<li>Deeper relaxation than a classic massage by removing muscle inflexibility</li>\n	<li>Reduces stress caused by tension</li>\n	<li>Chronic pain relief</li>\n</ol>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is important to note that these benefits can sometimes only be achieved after a few sessions. If the recipient is very tense, most of the first treatment will concentrate on warming up the superficial muscles. A following session will then target the posterior (deep) muscles to encourage blood flow.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">During your deep tissue treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will focus on areas of your body where you can feel tension and pain. This will be communicated at the beginning and during the treatment, adjusting technique according to the specific benefits you wish to achieve. Your muscles will need to be relaxed and you may be asked to breathe deeply to enable your therapist to reach the deeper musculature.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Deep Tissue massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue treatment can be a full body massage or just work on individual problem areas. During a treatment, the therapist will shift their body weight to apply a range of pressure. The more pressure, the deeper the massage, promoting increased blood flow and relaxation. This is achieved using their fingers and thumbs, as with a classic massage, in addition to other extremities including knuckles and elbows.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">After your deep tissue massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is not unusual to feel some pain and stiffness after your treatment, but this should go away after a day or two, leaving you feeling less tense. Massage, especially deep tissue, has the same effects on the body as exercise in terms of increasing blood flow and stretching. Having a deep tissue massage can feel just like having a workout.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between a Swedish and Deep Tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue massage uses a combination of classic massage strokes that are slower and deeper to that of a Swedish massage.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does a deep tissue massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">You may experience some discomfort during your treatment. Let your therapist know if you feel pain and you want them to reduce the pressure. It is important to communicate to your therapist about specific areas of tension and intensities of pressure. The same pressure doesn&#39;t apply to every area and each person has different tolerance levels. Talk about positioning before and during the treatment so your therapist can work around what is most comfortable.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in deep tissue?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Sports or physiotherapists often use deep tissue massage to remove tension from muscles before working on them. Others, such as those who have come from a classic massage background, choose to train in deep tissue massage to expand their anatomy knowledge.</div>\n</div>', 0, 1, 1, '2018-10-26 00:51:04', '2018-10-26 03:37:57'),
(3, 1, 'Curates: Aveda Stress', '1543208312.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 0, '2018-10-26 00:52:27', '2018-12-06 06:33:41'),
(7, 2, 'Sports123', '1540548712.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This treatment uses deep manipulation of the soft tissue to correct problems and imbalances caused by strenuous physical activity. Sports massage is an effective way to release tension and restore balance in your musculoskeletal system.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">If you are a serious athlete, incorporating regular massages into your training plan can support training and recovery, and may even prevent some minor injuries from occurring. However, you don&rsquo;t have to be a professional athlete to benefit from this treatment; it can also help lengthen and strengthen muscles and joints in those who work out casually.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who enjoys regular physical activity, or is currently recovering from a sporting injury. This type of massage will help improve flexibility and may reduce recovery time.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who may choose to select this treatment:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Athletes in preparation for, or following a sporting events.</li>\n	<li>As part of rehabilitation following an injury.</li>\n	<li>Those with muscle cramps, bruises and aches.</li>\n	<li>Anyone with acute or chronic soft tissue injuries.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose a Sports massage:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Those with general massage contraindications, including open wounds, broken bones, bursitis, periostitis, rheumatoid arthritis, myositis ossificans, skin infections, thrombosis or bleeding disorders.</li>\n	<li>Anyone looking for a gentle experience. Try a Relaxing massage instead.\n	<ul>\n	</ul>\n	</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Be sure to advise your therapist of any pre-existing medical conditions or areas to avoid before they begin your treatment.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Sports massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Can speed healing and reduce discomfort during the rehabilitation process.</li>\n	<li>Increases range of motion and flexibility.</li>\n	<li>Increases blood flow, which re-oxygenates soft tissue to reduce recovery time.</li>\n	<li>Helps improve muscle endurance and power.</li>\n</ol>\n</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>During your Sports massage treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist may begin with a postural and gait analysis, and will discuss your medical history and any current injuries. This treatment takes place on a table, so you will need to undress and will be covered with a towel. Sports massage uses oil, cream or wax to work into deep pressure points, so the experience can be very intense at times.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Sports massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will use a combination of trigger point techniques, cross-fibre friction and myofascial release, alongside joint mobilisations and stretches. Sports massages combine elements of Swedish massage and Deep Tissue massage to improve blood flow to your muscles and increase oxygen levels in the body.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>After your Sports massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Following your massage, your muscles may feel sore for a day or two, though it may also help to alleviate existing soreness. Take a warm bath, ensure you get adequate rest and drink plenty of water. Never put strain on muscles that are already feeling tender.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between Sports therapy and a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A Sports Therapist is often qualified to administer massage, but may also use ultrasound or cryotherapy, and can provide guidance on visualisation and motivation techniques. For those wanting a hands-on treatment, a Sports massage may be more than enough to release and strengthen muscles, assist in the removal of metabolic waste and promote relaxation before a big event.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does Sports massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A Sports massage is likely to be more intense than a Deep Tissue massage, but should never be painful. Let your therapist know if you are experiencing discomfort and they can ease off the pressure or avoid certain areas if needed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Therapists that have a high level of knowledge about anatomy and physiology, and may come from a physiotherapy or osteopathy background. They will typically have a good knowledge of sporting injury, rehabilitation methods and training practices.</div>\n</div>', 0, 1, 0, '2018-10-26 04:41:32', '2018-12-06 06:33:55'),
(4, 1, 'Deep Tissue', '1540545415.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage instigates a greater tension relieving response than a classic massage by concentrating on posterior (deeper) muscles. It uses a mix of classic massage strokes, with increased pressure, typically following the muscle from insertion to origin. The aim is to reduce muscle tension by releasing knots and restoring elasticity. Deep tissue massage is also designed to increase blood flow to targeted muscles, kick-starting the body&rsquo;s natural healing process.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage is one the most popular choices of massage as it can suit many individuals, helping to ease pain and stiffness in a variety of scenarios. It is not just for athletes or people with acute injuries.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People may choose to select this treatment who are:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Experiencing tension in specific areas of the body - most commonly in the back and neck.</li>\n	<li>Suffering from chronic pain.</li>\n	<li>Stressed and looking for deep relaxation.</li>\n	<li>Recovering from a soft tissue injury.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Individuals should not have a deep tissue massage if they have:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Issues lying on their front</li>\n	<li>Open wounds or cuts - these areas should be avoided</li>\n	<li>High blood pressure - check with your GP before booking a deep tissue treatment</li>\n	<li>Had recent surgery</li>\n	<li>Fever, flu or cold symptoms - these can be amplified after a massage</li>\n	<li>Pregnancy. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Reduces tissue congestion</li>\n	<li>Deeper relaxation than a classic massage by removing muscle inflexibility</li>\n	<li>Reduces stress caused by tension</li>\n	<li>Chronic pain relief</li>\n</ol>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is important to note that these benefits can sometimes only be achieved after a few sessions. If the recipient is very tense, most of the first treatment will concentrate on warming up the superficial muscles. A following session will then target the posterior (deep) muscles to encourage blood flow.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>During your deep tissue treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will focus on areas of your body where you can feel tension and pain. This will be communicated at the beginning and during the treatment, adjusting technique according to the specific benefits you wish to achieve. Your muscles will need to be relaxed and you may be asked to breathe deeply to enable your therapist to reach the deeper musculature.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue treatment can be a full body massage or just work on individual problem areas. During a treatment, the therapist will shift their body weight to apply a range of pressure. The more pressure, the deeper the massage, promoting increased blood flow and relaxation. This is achieved using their fingers and thumbs, as with a classic massage, in addition to other extremities including knuckles and elbows.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>After your deep tissue massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is not unusual to feel some pain and stiffness after your treatment, but this should go away after a day or two, leaving you feeling less tense. Massage, especially deep tissue, has the same effects on the body as exercise in terms of increasing blood flow and stretching. Having a deep tissue massage can feel just like having a workout.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between a Swedish and Deep Tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue massage uses a combination of classic massage strokes that are slower and deeper to that of a Swedish massage.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does a deep tissue massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">You may experience some discomfort during your treatment. Let your therapist know if you feel pain and you want them to reduce the pressure. It is important to communicate to your therapist about specific areas of tension and intensities of pressure. The same pressure doesn&#39;t apply to every area and each person has different tolerance levels. Talk about positioning before and during the treatment so your therapist can work around what is most comfortable.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in deep tissue?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Sports or physiotherapists often use deep tissue massage to remove tension from muscles before working on them. Others, such as those who have come from a classic massage background, choose to train in deep tissue massage to expand their anatomy knowledge.</div>\n</div>', 0, 1, 0, '2018-10-26 03:34:32', '2018-10-26 03:46:55');
INSERT INTO `treatments` (`id`, `category_id`, `treatment_name`, `image`, `overview`, `treatment`, `faq`, `created_by`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(5, 9, 'Curates: Aveda Stress-Fix™', '1540544684.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 1, '2018-10-26 03:34:44', '2018-10-26 03:38:23'),
(6, 9, 'Curates: Aveda Stress-Fix™', '1540544748.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 1, '2018-10-26 03:35:48', '2018-10-26 03:37:51'),
(8, 2, 'Curates: Neom De-Stress', '1540555798.jpg', '<p>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</p>', '<p>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</p>', '<p><strong>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</strong></p>', 1, 1, 0, '2018-10-26 06:39:58', '2018-10-26 06:40:05'),
(9, 5, 'Yoga', '1540989356.jpg', '<p>Yoga</p>', '<p>Yoga</p>', '<p>Yoga</p>', 1, 1, 0, '2018-10-31 07:05:56', '2018-10-31 07:05:56'),
(10, 4, 'Physiotherapy', '1540989402.jpg', '<p>Physiotherapy</p>', '<p>Physiotherapy</p>', '<p>Physiotherapy</p>', 1, 1, 0, '2018-10-31 07:06:42', '2018-12-31 08:27:26'),
(11, 1, 'Sports1212', '1543230498.png', '<p>xcxczcz</p>', '<p>xc</p>', '<p>xczxczczczczc</p>', 1, 1, 0, '2018-11-26 05:38:18', '2018-12-06 06:34:04'),
(12, 0, 'Sports', '1544091487.png', '<p>as</p>', '<p>as</p>', '<p>asa</p>', 1, 1, 0, '2018-12-06 04:48:07', '2018-12-06 06:34:09'),
(13, 0, 'test123', '1544097953.png', '<p>sdsd</p>', '<p>sdsd</p>', '<p>sdsd</p>', 1, 1, 0, '2018-12-06 06:35:53', '2019-01-03 04:17:57'),
(14, 0, 'test cosmonautgroup', '1544097992.png', '<p>dsdsdsd</p>', '<p>sdd</p>', '<p>dssd</p>', 1, 1, 0, '2018-12-06 06:36:32', '2019-01-03 04:17:49'),
(18, 0, 'sssssssssss', '1546261734.jpg', '<p>1212121212121212121212</p>', '<p>121212121212121212121212</p>', '<p>1212121212121212</p>', 1, 1, 0, '2018-12-31 07:38:54', '2019-01-02 00:38:33');

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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `working_area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualified` int(11) DEFAULT NULL COMMENT '1 = Yes, I am qualified in at least one of the above,2=I am still training to qualify in one of the above,3=No I am not, but interested to train in one of those',
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treatment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '0= Male, 1 = Female',
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provide_treatment` int(11) DEFAULT NULL COMMENT '1 = Yes, 0 = No',
  `transport_mode` int(11) DEFAULT NULL COMMENT '1 = Public Transport ,2 = Driving',
  `term_condition` int(11) NOT NULL DEFAULT '0' COMMENT '0 => No , 1 => Yes',
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `document`, `country_code`, `mobile_no`, `address`, `lat`, `lng`, `distance`, `region_id`, `working_area`, `qualified`, `category_id`, `treatment_id`, `gender`, `year`, `provide_treatment`, `transport_mode`, `term_condition`, `reset_password_token`, `is_active`, `is_delete`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'test.cosmonautgroup@gmail.com', '2018-10-28 19:36:13', '$2y$10$0M534kvBQnUE5qaJ3j.0befzCfYQa25oeYK396z45doff.ZT0lTPi', '1542105749.jpg', NULL, 91, 8866609535, 'Ahmedabad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 1, 0, NULL, 'SzLf52o7vYuNlqzo84Ylgea0JgOcPsa92xtsfwlTOOrforVzQmWw5G2P6B56', '2018-10-29 18:30:00', '2018-12-26 08:02:09'),
(53, 'Test cosmonauut thera', 'test10.cosmonautgroup@gmail.com', NULL, '$2y$10$lgt6vW6IlYIM8wJE.2zwF.blWeeenUK5jy06NUmdII.ut8mjDcGHW', '', NULL, NULL, 1234568477, 'AZ, USA', '34.0489281', '-111.09373110000001', 12222, 1, '[\"3\",\"7\",\"5\"]', NULL, NULL, NULL, 0, '1', NULL, NULL, 1, NULL, 1, 0, NULL, '43e530c8a5728d7738fbf989900cd2bc', '2018-12-31 04:20:59', '2019-01-07 01:02:46'),
(51, 'Test user second', 'test3.cosmonautgroup@gmail.com', '2018-12-17 16:37:31', '$2y$10$3iNqCmpbifK/tAwiAkFZOu.cRY/3SjzkkY8pgWVAxhzRwZEjyMvaq', NULL, NULL, NULL, 1212121212, 'AZ, USA', '34.0489281', '-111.09373110000001', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, 'gCxtxsUW75EpGDQJupn8bp6PjWXxthr0MDXwkMrcz0wzbEv6ZDxZvu3jm3NQ', '2018-12-17 16:37:16', '2019-01-07 01:15:25'),
(52, 'Test six the', 'test6.cosmonautgroup@gmail.com', NULL, '$2y$10$amMSZ5Vn059qLY13GDZN1urzUr14qIaFSFon74W8e/jWK2zY8YP..', '1546089255.jpg', NULL, NULL, 1234567899, 'AZ, USA', '34.0489281', '-111.09373110000001', 444, 2, '[\"1\",\"7\"]', NULL, NULL, NULL, 0, '3', 1, 1, 1, NULL, 1, 0, NULL, '1642f2568484cb628f82f65ae7c18e12', '2018-12-29 07:44:15', '2019-01-07 00:55:13'),
(46, 'Test Therapist', 'test1.cosmonautgroup@gmail.com', NULL, '$2y$10$xS4HIgK6nY5qJm0adNsOB.wK5El/JdrKLvBBddgUxELBWYdS46aRy', '1545918530.png', NULL, NULL, 7896541236, 'AZ, USA', '34.0489281', '-111.09373110000001', 122, 1, '[\"2\",\"4\",\"5\",\"7\"]', NULL, NULL, NULL, 0, '2', 1, 1, 1, '785b5b6c95808c0b89f6a1d1a4b20990', 1, 0, NULL, '2aIy9gZ8ZsYv64xqwppHP8HPUy846sShst22QfMiBgmFe3yUdlLoLdLMPYsF', '2018-12-20 09:40:37', '2019-01-07 01:51:12'),
(47, 'Test User', 'test2.cosmonautgroup@gmail.com', NULL, '$2y$10$xS4HIgK6nY5qJm0adNsOB.wK5El/JdrKLvBBddgUxELBWYdS46aRy', '1545318783.png', NULL, NULL, 2222222222, 'AZ, USA', '34.0489281', '-111.09373110000001', NULL, 3, '[\"2\",\"4\",\"5\",\"7\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, 'fTnJjXfB1wu3JxvBYW2Y90b7mr63QskxhZMrB6gHLAkreIvNsvFOSLDjp8US', '2018-12-20 09:41:14', '2018-12-27 06:58:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
