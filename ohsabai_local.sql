-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2019 at 05:25 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_id`, `user_id`, `therapist_id`, `treatment_id`, `booking_type`, `duration_id`, `pricing_id`, `booking_date`, `booking_time`, `mobile_no`, `name`, `house_no`, `street_name`, `zipcode`, `city`, `additional_notes`, `total_amount`, `feedback_star`, `feedback_desc`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'BK100001', 3, 2, 18, NULL, '38', NULL, '2019-02-28 00:00:00', '02:00:00', 2382676386, 'Retwwetr', 'gjdsjgujdgsu', 'y68we8e7876ew', 'gujsduqtwt2t6wet6t6wet6', 'Ahmedabad, Gujarat, India', 'guyedjsgdsjdgsj', 200, 5, NULL, 1, 0, '2019-02-23 12:35:34', '2019-03-13 07:18:48'),
(2, 'BK100002', 3, 2, 18, NULL, '67', NULL, '2019-02-27 00:00:00', '01:30:00', 5656565656, 'Test', '6565656', '56', '5656', 'Ahmedabad, Gujarat, India', '5656', 100, NULL, NULL, 1, 0, '2019-02-27 00:41:18', '2019-03-06 04:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `booking_activity`
--

CREATE TABLE `booking_activity` (
  `id` int(11) NOT NULL,
  `bk_id` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'N' COMMENT 'N - new   C - confirm    M- complete  L - cancel',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_activity`
--

INSERT INTO `booking_activity` (`id`, `bk_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'N', '2019-02-23 18:05:34', '2019-02-23 18:05:34'),
(2, 2, 'N', '2019-02-27 06:11:18', '2019-02-27 06:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `page_slug` varchar(255) DEFAULT NULL,
  `short_description` text,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `page_name`, `page_slug`, `short_description`, `content`, `image`, `meta_title`, `meta_description`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'about-us', NULL, '<h2>About Us</h2>\n\n<p>At Ohsabai we&rsquo;re all about bringing the ease and convenience of online booking for home delivery of massage therapy services. This connects the best massage therapists with customers who want to enjoy the happy and relaxing experience of a massage in the comfort of their own space.</p>\n\n<p>Making it simple and easy is our goal. Ohsabai brings the bliss to you!<br />\n&nbsp;</p>', '', 'weww', 'www', 1, 0, '2019-01-28 00:12:32', '2019-01-28 04:18:32'),
(2, 'FAQ', 'faq', NULL, '<h2><strong>Massage &amp; Service</strong></h2>\n\n<h3>what is Ohsabai?</h3>\n\n<p>Ohsabai is a network on which you can connect to licensed massage therapists in your area who will come to your home, hotel, workplace or event. Massage therapists on the Osabai network are typically available in as little as an hour after you book, or up to 30 days in advance.</p>\n\n<h3><strong>Why us , Why Ohsabai?</strong></h3>\n\n<p>Ohsabai is the service provider for massage. If you are looking for the best therapist that are trustable. Here is what we provide. &nbsp;You can cancel anytime or manage your booking until two hour before the treatment begin. After two hour, you will be fully charged.</p>\n\n<p>Feedback system and review are available for you after the service is finished. Give them a good review will mean a lot to Ohsabai therapist.</p>\n\n<h3><strong>Is it better to go to Spa or Wellness center?</strong></h3>\n\n<p>Ohsabai is same but different. You have control over your service location and environment. You save traveling time and of course, it is cheaper in itself. It is better that you have ability to manage, feedback, rebook, and even block provider. So you get more control over your service experience at your own place.</p>\n\n<h3><strong>Is this service safe and trustable?</strong></h3>\n\n<p>All Therapist are certified in their available treatment, are licensed to do the job and have a background check, criminal record check as well as reference check.</p>\n\n<h3><strong>What can I expect from my </strong><strong>massage</strong><strong>?</strong></h3>\n\n<p>Ohsabai connects you with a massage therapist for a first-class, top-quality massage at the time and place you want. You&rsquo;ll enjoy your massage in the comfort, convenience, safety and privacy of your own home, hotel, workplace, or event. And you&rsquo;ll be able to choose a time that works for you; massage therapists on the network are available for start times as early as 9 am and as late as 9 pm, 7 days a week, 365 days a year.</p>\n\n<p>You&rsquo;ll always experience super-easy booking, scheduling and payment on <a href=\"http://ohsabai.cosmonautgroup.com/\" target=\"_blank\">https://www.ohsabai .com</a></p>\n\n<p>Your massage therapist will come to you and bring the table &ndash; you just need to be there to open the door &ndash; and relax. At Ohsabai we bring the bliss to you</p>\n\n<h3><strong>What you have to prepare for our service?</strong></h3>\n\n<p>Ohsabai will prepare all equipment for you (massage table, towel and oil are provided) You just relax and tell us where you would like to get the service; pool area, outdoor or indoor area.</p>\n\n<h3><strong>Do we need to pay extra cost?</strong></h3>\n\n<p>No need. Our system assign therapist according to area of operate and their travel cost is already include in the cost of the treatment. For the tips, it is up to you. But we encourage provider not to receive the tips due to safety reason. It is ok not to give tips.</p>\n\n<h3><strong>Is ohsabi available in My area</strong></h3>\n\n<p>Visit <a href=\"http://ohsabai.cosmonautgroup.com/\" target=\"_blank\">https://www.ohsabai</a> links and enter your area or beach name near you. If we can not find available Ohsabai Therapist near you, we will be soon there soon.</p>\n\n<h3><strong>Why does Ohsabai verify my contact details?</strong></h3>\n\n<p>We&#39;ll text you a confirmation of your massage appointment once you&#39;ve booked. And the therapist may need to communicate with you before your massage (to let you know that they&#39;re running early or to clarify directions, for example.)</p>\n\n<h3><strong>What is the difference between the types of massage?</strong></h3>\n\n<p>Simply choose the desired option when booking a massage on the ohsabai website. For a couples massage, Ohsabai will send two therapists to perform your massage at the same time.</p>\n\n<p>For a back-to-back massage, a single therapist will perform two or more massages, one after the other.</p>\n\n<p>You don&#39;t need to select the same kind of massage - for example, one person may want a Thai massage, and another might opt for an Oil massage.</p>\n\n<h3><strong>What size is the treatment table?</strong></h3>\n\n<p>Your therapist will always bring the table to your treatment. The massage tables vary in size, however, to give you an idea, a standard table has the below measurements:</p>\n\n<p><strong>Dimensions: 184cm x 63.5cm &nbsp;</strong></p>\n\n<p><strong>Max working capacity: 200 kg</strong></p>\n\n<p>Your treatment will always need to take place on the practitioner&#39;s treatment table for health and safety reasons. Requests to have a treatment on a bed or surface other than the table will not be tolerated by your practitioner and they have the right to leave without providing a treatment should the situation arise. You will be charged the full amount for your treatment in this instance, as per our <a href=\"http://ohsabai.cosmonautgroup.com/page/cms/cancellation-policy\" target=\"_blank\">cancellation policy</a><a href=\"http://ohsabai.cosmonautgroup.com/\" target=\"_blank\">.</a></p>\n\n<h3><strong>I have a medical condition, do I need to let the Therapist know?</strong></h3>\n\n<p>We advise that you seek advice from a Medical Practitioner regarding whether massage therapy is appropriate for certain medical conditions.</p>\n\n<p>You can put any special conditions when you book tol et us any special conditions.. . This will allow &nbsp;&nbsp;your Therapist to be aware of any injuries and allergies you have and the areas of your body you want to focus on. Feel free to communicate with your Therapist about the pressure and if you do happen to feel any pain, please tell your Therapist immediately.</p>\n\n<h3><strong>Booking &amp; Payment</strong></h3>\n\n<h3><strong>How to book a treatment</strong></h3>\n\n<p>&nbsp;</p>\n\n<p><strong>Booking a treatment within minutes is easy through our website or facebook page.</strong></p>\n\n<p>Our cutting-edge technology seamlessly connects you to wellness services whenever and wherever you want them. An expert therapist can be at your door in an hour!</p>\n\n<p>You&rsquo;ll just need to enter your area address and then follow the on-screen instructions to choose a time and treatment that suits your needs, along with your preferred practitioner. &nbsp;&nbsp;Add your payment information - then it&rsquo;s time to relax!</p>\n\n<h3><strong>How quickly can I can get massage?</strong></h3>\n\n<p>In as little as an hour - book for start times as early as 9 am and as late as 9 pm, 7 days a week, 365 days a year. Or book up to 30 days in advance.</p>\n\n<h3><strong>Can I request more than one therapist?</strong></h3>\n\n<p>Absolutely! Our booking process allows you to select two therapists,Simply select &lsquo;2 therapists&rsquo; on the buttons at the top of the screen. You&rsquo;ll then be asked to select your first therapist and treatment, followed by the second.</p>\n\n<p>You can view the user ratings of each therapist on their individual profiles, along with a short bio to help you find the therapists to best match what you are looking for.</p>\n\n<h3><strong>How is my booking confirmed?</strong></h3>\n\n<p>You will be sent an email with your booking reference number and details of your treatment, therapist bio, picture and contact details.</p>\n\n<p><strong>If you have an account you can also:</strong></p>\n\n<p><strong>access your appointment detail at any point by:</strong></p>\n\n<ol>\n	<li>Logging into your account</li>\n	<li>Selecting &lsquo;booking&rsquo; from the left-hand menu</li>\n</ol>\n\n<p>In our website you are also able to leave any relevant appointment notes for your therapist under the &lsquo;Notes&rsquo; section on your upcoming appointment. (Special condition of your body, etc.)</p>\n\n<h3><strong>Can I cancel, amend or reschedule my booking?</strong></h3>\n\n<p>We understand that plans can change quickly, we have Cancellation, Rescheduling and Amendment policies designed to protect the relationship between you and our Therapists. &nbsp;Please refer to these for details if you need to change or cancel a booking.</p>\n\n<h3><strong>How do I cancel my booking?</strong></h3>\n\n<ol>\n	<li>Select Appointments from your menu</li>\n	<li>Select the booking you wish to cancel or reschedule under &lsquo;Upcoming&rsquo; Appointments</li>\n</ol>\n\n<p><strong>To cancel an appointment:</strong></p>\n\n<p><strong>Select &lsquo;Cancel Appointment&rsquo;</strong></p>\n\n<ol>\n	<li>You will be advised the amount to be refunded to you, as per our cancellation policy</li>\n	<li>You can choose to have the refund held in credit for future bookings or have the nominated payment form credited, which can take up to 45 working days</li>\n	<li>You will receive an email confirming the cancellation and amount refunded to you</li>\n</ol>\n\n<p><strong>To reschedule a booking:</strong></p>\n\n<ul>\n	<li>Select &lsquo;Reschedule an Appointment</li>\n	<li>Please update appointment date/time and appointment as required</li>\n	<li>Click &lsquo;Save&rsquo;</li>\n	<li>You will be advised the surcharge amount to be paid, as per our booking amendment policy</li>\n	<li>Your nominated payment method will be charged</li>\n</ul>\n\n<p><strong>You will receive an email confirming the amendment and surcharge amount paid by you</strong></p>\n\n<p>We understand that plans can change quickly, but our appointment cancellation policy is designed to protect the relationship between you and our Therapists. &nbsp;You can cancel your booking for free up to 24 hours ahead of your agreed appointment time.</p>\n\n<p>In the unlikely event your plans change and you wish to cancel your booking closer to your appointment time, our cancellation policy is as follows:</p>\n\n<ol>\n	<li>Select Appointments from your account or Booking reference number.</li>\n	<li>Select the booking you wish to cancel under &lsquo;Upcoming&rsquo; Appointments</li>\n	<li>Select &lsquo;Cancel Appointment&rsquo;</li>\n	<li>You will be advised the amount to be refunded to you, as per our cancellation policy</li>\n	<li>You will be prompted to add credit to your account so that you can rebook your next treatment easily</li>\n	<li>You can also select to have the refund returned to your card, which can take up to 45 working days</li>\n	<li>You will receive an email confirming the cancellation and amount refunded to you</li>\n</ol>\n\n<h3><strong>What if I am running late for my booking?</strong></h3>\n\n<p>We understand that sometimes events occur that impact on being on time for a booking, don&rsquo;t worry. Please contact your Therapist via with contact details sent you when you booked.</p>\n\n<p>The Therapist will stay and give you as much of the treatment remaining in the booking. Please note if you wish to extend the time please refer to our (??? Watinee is writing).</p>\n\n<p>If you are running extremely late and cannot attend the booking your booking will be subject to our cancellation policy and you will be charged the full amount.</p>\n\n<h3><strong>What forms of payment do you accept?</strong></h3>\n\n<p><strong>We accept several forms of payment:</strong></p>\n\n<ul>\n	<li>Visa</li>\n	<li>Mastercard</li>\n	<li>Debit cards</li>\n	<li>Alipay</li>\n	<li>PayPal</li>\n	<li>Android Pay</li>\n	<li>Bank Transfer (Thailand bank accounts only)</li>\n</ul>\n\n<p>When you confirm your booking, your selected payment method is charged.</p>\n\n<p>When prompted during the booking process, simply add or select your preferred method of payment. &nbsp;You will always be asked to confirm the total amount before completing your booking.</p>\n\n<h3><strong>Can I pay cash?</strong></h3>\n\n<p>Our preferred payments are by credit card or bank transfer from a Thailand bank account only - you never need to have cash on hand. We do not accept check payments. Payments are seamless and secure through the Ohsabai.com secure online payment platform (need to addin name of platform). Gratuity is auto-added, so you do not need to give a cash tip.</p>\n\n<p>If you only have cash then you can pay the Therapist before treatment. Please note our Therapist do not have change therefore will only accept correct cost of treatment.</p>\n\n<h3><strong>Why was my payment declined?</strong></h3>\n\n<p>There are a number of reasons why your payment may have been declined:</p>\n\n<ul>\n	<li>If you have entered your credit or debit card number incorrectly, you&rsquo;ll need to update your details under the payment section of your <a href=\"http://ohsabai.cosmonautgroup.com/login\" target=\"_blank\">account</a> or the &lsquo;Wallet&rsquo; section on the App menu</li>\n	<li>If your credit or debit card has expired, you&rsquo;ll need to add a new payment method to your account</li>\n	<li>The bank of your selected payment method may have declined the transaction request. There could be a number of different reasons for this so the best option is to speak with your bank and ensure that the payment to Urban Massage is authorised</li>\n	<li>Your bank may have rejected the charge based on fraud logic. You will need to update your payment method or contact your bank for more information</li>\n</ul>\n\n<p>If you are still unable to process your payment, please<a href=\"#\"> </a><a href=\"http://ohsabai.cosmonautgroup.com/login\" target=\"_blank\">contact</a> our dedicated Customer Service team who will be happy to look into this for you</p>\n\n<h3><strong>Therapist</strong></h3>\n\n<h3><strong>Who are the therapist in Ohsabai?</strong></h3>\n\n<p>We&#39;re very careful about the massage therapists we select to join Ohsabai. Ohsabai ensures that all massage therapists using its network are licensed. All of the massage therapists are experienced professionals with businesses and roots in the communities being served</p>\n\n<h3><strong>Who is the Therapist?</strong></h3>\n\n<p>Once you paid for the service, the assigned therapist will be revealed. You will be able to see their name, profile, and pictures. Currently, we have only female therapist. But in the near future, you will have the option &nbsp;to choose the one you prefer.</p>\n\n<h3><strong>What will happen if the therapist is not on Time?</strong></h3>\n\n<p>In case of Therapist arriving late, we will either compensate the time or refund proportionally. In case of wellness provider arrives and you are not ready, the time will still count and you will get less time for the treatment accordingly, please refer to above to <ins>What if I&rsquo;m running late</ins></p>', '', 'FAQ', 'FAQ', 1, 0, '2019-01-28 01:06:09', '2019-02-19 16:57:56'),
(3, 'Privacy Policy', 'privacy-policy', NULL, '<h2>Privacy Policy</h2>\n\n<p>ohSabai Limited (&quot;company&quot;) gives importance to the trust of our customers.&nbsp;The company recognises the importance of security of personal information and will keep the information received from customers confidential.&nbsp;The company therefore wishes to inform customers or any person who has visited the company&rsquo;s website of the following.</p>\n\n<h3>Visiting the company&rsquo;s website</h3>\n\n<p>Any customer or person can visit the company&rsquo;s website.&nbsp;To search for various products and services&nbsp;and book and pay for goods and services.</p>\n\n<p>The company may occasionally update the company&rsquo;s website and may collect information about visiting the website, such as the number of visitors to the website, date, time and duration of visiting the website.&nbsp;The company uses this information;&nbsp;to develop and improve the services of the company to better meet your needs.</p>\n\n<h3>Respecting the privacy rights of customers</h3>\n\n<p>The company understands that customers need security in booking goods and services and payment&nbsp;transaction information. Therefore, your information received by the company will be used only for legitimate business purposes.&nbsp;The company will take strict measures to secure&nbsp;this as well as to prevent the use of your information without your permission first.</p>\n\n<h3>Collection and maintenance of personal information</h3>\n\n<p>The company will collect&nbsp;and maintain information about you that is necessary&nbsp;and use information about you as necessary and appropriate&nbsp;or as it may be useful to you&nbsp;about promotional offers and other service information. The company may send this information&nbsp;if you choose to receive such information. The company will collect and use your information to take care of your account and your service history&nbsp;or to comply with the law&nbsp;and rules&nbsp;associated.</p>\n\n<p>The company will collect your personal information as much as the company receives information directly from you.&nbsp;By booking a service and or creating an account on the company&rsquo;s website&nbsp;you provide personal information such as first name, last name, phone number, email and address (for service delivery).&nbsp;As well as service delivery history and feedback. This information is confidential.</p>\n\n<h3>Disclosure to third parties</h3>\n\n<p>The company will not disclose information about you or other information&nbsp;that can be identified as being yours to disclose to any other person(s)&nbsp;and will prevent the use of your information unless: We have received your consent.</p>\n\n<ul>\n	<li>Such information is provided to help you make transactions that you desire.</li>\n	<li>Disclosure of that information&nbsp;is legitimate&nbsp;or according to the order of the relevant<br />\n	government agency.</li>\n</ul>\n\n<h3>Data confidentiality measures</h3>\n\n<p>The company uses high security systems in both technology and processes.&nbsp;To prevent theft of confidential information&nbsp;the company only uses secure website systems and online payment system that meet&hellip;. to ensure that the company&rsquo;s website has high security standards.&nbsp;Your information will remain safe.</p>\n\n<h3>Maintaining data accuracy</h3>\n\n<p>The company always tries to take care of the accuracy and currency of your account, if you have created an account.&nbsp;You can update your personal information and payment information via the website to ensure is currency and accuracy. We recommend a review of this information when booking a service to ensure delivery of service will be as requested.</p>', '', 'Privacy Policy', 'Privacy Policy', 1, 0, '2019-01-28 01:16:09', '2019-02-03 23:58:40'),
(4, 'Cancellation Policy', 'cancellation-policy', NULL, '<h3>Cancellation Policy</h3>\n\n<p>The appointment cancellation policy is designed to protect the relationship between you and your therapist - we understand that plans can change.</p>\n\n<p>In the unlikely event that you do need to cancel your booking, the appointment cancellation&nbsp;policy is as follows: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table class=\"table table-bordered\">\n	<thead>\n		<tr>\n			<th>Notice period</th>\n			<th>Refund</th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td>24 hours or more before appointment</td>\n			<td>100%</td>\n		</tr>\n		<tr>\n			<td>2 hours or more before appointment</td>\n			<td>70%</td>\n		</tr>\n		<tr>\n			<td>Less than 2 hours before appointment</td>\n			<td>0%</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>You can choose to have the refund held in credit for a future booking or paid back to your nominated payment method, which can take up to 45 working days to process.</p>\n\n<h3>Rescheduling Policy</h3>\n\n<p>The booking reschedule policy is designed to protect the relationship between you and<br />\nyour therapist - we understand that plans can change.</p>\n\n<p>Should you wish to reschedule a booking, the rescheduling policy is as follows:</p>\n\n<p>&nbsp;</p>\n\n<table class=\"table table-bordered\">\n	<thead>\n		<tr>\n			<th>Notice period</th>\n			<th>Surcharge</th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td>2 hours or more before appointment</td>\n			<td>0%</td>\n		</tr>\n		<tr>\n			<td>Less than 2 hours before appointment</td>\n			<td>20%</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Any surcharge will be charged to your nominated payment method.</p>\n\n<h3>Amendment Policy</h3>\n\n<p>Booking amendments are defined as any changes to an existing booking other than appointment time. i.e. changes to a massage type or changes to the duration of a service.</p>\n\n<p>Should you wish to amend a booking, the amendment policy is as follows:</p>\n\n<p>If the amendment results in a higher price, the difference will be charged to your nominated payment method.</p>\n\n<p>If the amendment results in a lower price, the difference will be refunded based on the same terms as the cancellation policy as follows:</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<table class=\"table table-bordered\">\n	<thead>\n		<tr>\n			<th>Notice period</th>\n			<th>Refund</th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td>24 hours or more before appointment</td>\n			<td>100%</td>\n		</tr>\n		<tr>\n			<td>2 hours or more before appointment</td>\n			<td>70%</td>\n		</tr>\n		<tr>\n			<td>Less than 2 hours before appointment</td>\n			<td>0%</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>You can choose to have any refund due held in credit for a future booking or paid back to your nominated payment method, which can take up to 45 working days to process.</p>', '', 'Cancellation Policy', 'Cancellation Policy', 1, 0, '2019-01-28 01:22:01', '2019-01-28 06:49:20'),
(5, 'Term and Condition', 'term-and-condition', NULL, '<h2>Terms and Conditions</h2>\n\n<h3>Introduction</h3>\n\n<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Ohsabai accessible at <a href=\"#\">https//ohsabai.com</a> &ldquo;Website&rdquo;.</p>\n\n<p>These Terms will be applied fully and affect your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.</p>\n\n<p>OhSabai is a service that connects customers to professional massage therapists located in local communities. The service is a booking system for customers to book a massage service that will come to their chosen location.</p>\n\n<p>This Website is intended for users who are at least 18 years old. If you are under the age of 18, you are not permitted to register to use the Services without parental permission.</p>\n\n<h3>Intellectual Property Rights</h3>\n\n<p>Other than the content you own, under these Terms, OhSabai and/or its licensors own all the intellectual property rights and materials contained in this Website.</p>\n\n<p>You are granted a limited license only for the purposes of viewing the material contained on this<br />\nWebsite.</p>\n\n<h3>Additional policies</h3>\n\n<p>Additional policies which also apply to your use of the Website include:</p>\n\n<ul>\n	<li>&nbsp;Our Privacy Policy which sets out the terms on which we process any personal data we collect from you, or that you provide to us. By using this Website, you consent to such processing and you warrant that all the data provided by you is accurate;</li>\n	<li>&nbsp;Our Cancellation Policy, Rescheduling Policy and Amendment Policy sets out the terms on which we manage changes to services booked on our Website. By using this Website, you consent to application of these policies when booking our services.</li>\n</ul>\n\n<h3><br />\nRestrictions</h3>\n\n<p><br />\nYou are specifically restricted from all of the following:</p>\n\n<ul>\n	<li>publishing any Website material in any other media;</li>\n	<li>selling, sublicensing and/or otherwise commercializing any Website material;</li>\n	<li>publicly performing and/or showing any Website material;</li>\n	<li>using this Website in any way that is or may be damaging to this Website;</li>\n	<li>using this Website in any way that impacts user access to this Website;</li>\n	<li>using this Website contrary to applicable laws and regulations, or in any way may cause<br />\n	harm to the Website, or to any person or business entity;</li>\n	<li>engaging in any data mining, data harvesting, data extracting or any other similar activity in<br />\n	relation to this Website;</li>\n	<li>using this Website to engage in any advertising or marketing.</li>\n</ul>\n\n<p>Certain areas of this Website are restricted from being accessed by you and Ohsabai may further<br />\nrestrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID<br />\nand password you may have for this Website are confidential and you must maintain confidentiality<br />\nas well.</p>\n\n<h3>Registration, Accounts, Passwords and Security</h3>\n\n<ol>\n	<li><ins>Ohsabai Account.</ins> In order to become an Ohsabai member, you must complete the registration process by providing Ohsabai with current, complete and accurate information,as prompted by the New User form. As part of service booking you can choose to create an&nbsp;account and information that you provided as part of booking the service will prepopulate certain fields; First Name, Last Name, contact information as examples. You must review prior to creating an account.</li>\n	<li><ins>Massage Therapists</ins>. In order to become a Massage Therapist, you must enter into the Agreement Between Ohsabai and Massage Therapists (the &quot;<ins>Massage</ins><ins> Therapist Agreement&quot;</ins>) and provide any information required by Ohsabai in order to verify your identity and credentials or as otherwise set forth in the Massage Therapist Agreement.</li>\n	<li><ins>Accuracy</ins><ins> of Information</ins>. You acknowledge that in the event you provide any information to<br />\n	Ohsabai which is untrue, inaccurate, not current or incomplete, Ohsabai may terminate<br />\n	these Terms and your continued access and use of the Service.</li>\n</ol>\n\n<h3>Your Content</h3>\n\n<p>In these Website Standard Terms and Conditions, &ldquo;Your Content&rdquo; shall mean any feedback you provide for use of our services. By displaying Your Content, you grant Ohsabai a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.</p>\n\n<p>Your Content must be your own and must not be invading any third-party&#39;s rights. Ohsabai reserves the right to remove any of Your Content from this Website at any time without notice.</p>\n\n<h3>Communication</h3>\n\n<p>Visiting the Website, sending us emails, and completing online forms constitute electronic communications. You consent to receiving electronic communications and you agree that all agreements, notices, disclosures, and other communications we provide to you electronically, via email on the Website, satisfy any legal requirements that such communication be in writing.</p>\n\n<h3>Inappropriate or unsafe service requests</h3>\n\n<p>When you book a service you will be agreeing the following service appropriateness and safety requirements. OhSabai will not refund you for any reason if you engage in conduct deemed inappropriate or unsafe by the Massage Therapist. The therapist has the sole discretion to discontinue the service immediately prior to the allotted time, Ohsabai will not refund you. Inappropriate of unsafe requests include, but are not limited to; making inappropriate requests, touching, requests to have treatment on a bed or surface other that the Therapist&rsquo;s table, or the Massage Therapist perceives a threat to his/her safety or wellbeing.</p>\n\n<p>Further, Ohsabai may cancel your Ohsabai account if a. the inappropriate or unsafe request is deemed that such action is required or b. there is repeated inappropriate or unsafe requests.</p>\n\n<h3>No warranties</h3>\n\n<p>This Website is provided &ldquo;as is,&rdquo; with all faults, and Ohsabai express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.</p>\n\n<h3>Limitation of liability</h3>\n\n<p>In no event shall Ohsabai, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. &nbsp;Ohsabai, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.</p>\n\n<h3>Indemnification</h3>\n\n<p>You hereby indemnify to the fullest extent Ohsabai from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.</p>\n\n<h3>Severability</h3>\n\n<p>If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.</p>\n\n<h3>Variation of Terms</h3>\n\n<p>Ohsabai is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.</p>\n\n<h3>Assignment</h3>\n\n<p>Ohsabai is allowed to assign, transfer, and subcontract its rights and/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and/or obligations under these Terms.</p>\n\n<h3>Entire Agreement</h3>\n\n<p>These Terms constitute the entire agreement between Ohsabai and you in relation to your use of this Website, and supersede all prior agreements and understandings.</p>\n\n<h3>Governing Law &amp; Jurisdiction</h3>\n\n<p>These Terms will be governed by and interpreted in accordance with the laws of the Thailand, and you submit to the non-exclusive jurisdiction of courts located in Thailand for the resolution of any disputes.</p>\n\n<p>Our Website is directed by people who reside in Thailand. The information provided on the Website in not intended for distribution or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would be subject us to any registration requirement within such jurisdiction or country.</p>', '', 'Term and Condition', 'Term and Condition', 1, 0, '2019-01-28 01:34:12', '2019-02-04 00:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `earning_management` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_setting`
--

CREATE TABLE `general_setting` (
  `id` int(11) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_setting`
--

INSERT INTO `general_setting` (`id`, `site_name`, `site_logo`, `seo_title`, `seo_description`, `timezone`, `currency`, `email`, `mobile_no`, `address`, `facebook_url`, `linkedin_url`, `twitter_url`, `insta_url`, `youtube_url`, `website`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ohsabai', '1540965838.png', 'Ohsabai', 'Ohsabai', 'Asia/Kolkata', 'TTD', 'support@Ohsabai.com', '9876543210', 'Ahmedabad', 'https://www.facebook.com', 'https://www.linkedin.com', 'https://www.twitter.com/', 'https://www.instagram.com', 'https://www.youtube.com', 'https://www.Ohsabai.com/', 1, '2018-10-27 04:50:40', '2019-01-03 09:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `massage_text`
--

CREATE TABLE `massage_text` (
  `id` bigint(20) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `massage_text`
--

INSERT INTO `massage_text` (`id`, `text_1`, `text_2`, `text_3`, `text_4`, `text_5`, `text_6`, `text_7`, `text_8`, `text_9`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Our expert massage therapists', 'come to you...', 'delivering bliss to your home, hotel, office or wherever!', 'Quick & easy...', 'Simply book online in minutes.', 'A massage therapist can be at your door in an hour', 'Personal...', 'Choose a time & treatment that suits your needs.', '9am - 10pm 365 days a year.', 1, 0, '2018-12-13 06:15:38', '2018-12-14 03:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 5),
(2, 'App\\User', 7),
(2, 'App\\User', 13),
(2, 'App\\User', 14),
(2, 'App\\User', 15),
(2, 'App\\User', 16),
(2, 'App\\User', 44),
(2, 'App\\User', 46),
(2, 'App\\User', 52),
(2, 'App\\User', 53),
(3, 'App\\User', 3),
(3, 'App\\User', 4),
(3, 'App\\User', 6),
(3, 'App\\User', 46),
(3, 'App\\User', 47),
(3, 'App\\User', 48),
(3, 'App\\User', 49),
(3, 'App\\User', 50),
(3, 'App\\User', 51);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_time`
--

CREATE TABLE `price_time` (
  `id` int(11) NOT NULL,
  `treatments_id` bigint(20) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_time`
--

INSERT INTO `price_time` (`id`, `treatments_id`, `price`, `time`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(67, 18, '100', '1', 1, 0, '2019-02-23 18:18:53', '2019-02-23 18:18:53'),
(44, 10, '1', '2', 1, 0, '2019-01-08 09:26:02', '2019-01-08 09:26:02'),
(43, 10, '3', '4', 1, 0, '2019-01-08 09:26:02', '2019-01-08 09:26:02'),
(42, 10, '5', '6', 1, 0, '2019-01-08 09:26:02', '2019-01-08 09:26:02'),
(66, 18, '200', '3', 1, 0, '2019-02-23 18:18:53', '2019-02-23 18:18:53'),
(39, 14, '100', '60', 1, 0, '2019-01-03 09:47:49', '2019-01-03 09:47:49'),
(40, 13, '150', '60', 1, 0, '2019-01-03 09:47:57', '2019-01-03 09:47:57'),
(41, 11, '12', '22', 1, 0, '2019-01-08 09:25:54', '2019-01-08 09:25:54'),
(45, 9, '12', '22', 1, 0, '2019-01-08 09:26:11', '2019-01-08 09:26:11'),
(46, 7, '1212', '1212', 1, 0, '2019-01-08 09:26:21', '2019-01-08 09:26:21'),
(47, 8, '12', '12', 1, 0, '2019-01-08 09:26:29', '2019-01-08 09:26:29'),
(48, 4, '1212', '1222', 1, 0, '2019-01-08 09:26:45', '2019-01-08 09:26:45'),
(49, 3, '1212', '12', 1, 0, '2019-01-08 09:27:14', '2019-01-08 09:27:14'),
(68, 12, '100', '60', 1, 0, '2019-02-23 18:20:42', '2019-02-23 18:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  `price` double NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `city_name`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Ahmedabad', 1, 0, '2018-10-24 08:11:02', '2018-12-06 04:48:24'),
(2, 'Surat', 1, 0, '2018-10-24 08:11:42', '2018-12-18 01:48:13'),
(3, 'Vadodara', 1, 0, '2018-10-24 08:11:47', '2018-11-26 00:40:51'),
(7, 'Phuket', 1, 0, '2018-10-24 08:11:53', '2019-01-07 08:18:57'),
(5, 'Mumbai', 1, 0, '2018-10-24 08:12:00', '2018-10-24 08:12:00'),
(6, 'Delhi', 1, 1, '2018-10-24 08:12:05', '2018-10-24 08:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `subscribe` (
  `id` bigint(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT '1' COMMENT '1=Active , 0 = Inactive',
  `is_delete` char(1) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'test1.cosmonautgroup@gmail.com', '1', '0', '2018-12-17 21:51:02', '2019-01-07 00:54:53'),
(2, 'mitul.cosmonautgroup@gmail.com', '1', '0', '2018-12-17 23:21:00', '2018-12-17 23:21:00'),
(3, 'test4.cosmonautgroup@gmail.com', '1', '0', '2018-12-22 09:52:55', '2018-12-22 09:52:55'),
(4, 'admin@gmail.comasasa', '1', '0', '2019-01-12 13:19:32', '2019-01-12 13:19:32'),
(5, 'test.cosmonautgroup@gmail.com', '1', '0', '2019-02-23 17:00:34', '2019-02-23 17:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_bank_detail`
--

CREATE TABLE `therapist_bank_detail` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `bank_service` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `account_no` bigint(20) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `therapist_bank_detail`
--

INSERT INTO `therapist_bank_detail` (`id`, `therapist_id`, `bank_service`, `branch`, `account_no`, `account_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'xcvxcv', NULL, NULL, NULL, '2019-03-18 13:37:06', '2019-03-18 13:37:06'),
(2, NULL, 'xcvxcv', NULL, NULL, NULL, '2019-03-18 13:38:08', '2019-03-18 13:38:08'),
(3, NULL, 'ssssssssss', 'first', 11111, 'ffff', '2019-03-18 13:42:41', '2019-03-18 13:42:41'),
(4, NULL, 'ssssssssss', 'first', 11111, 'ytrtytryrtyryrtyryrty', '2019-03-18 13:48:21', '2019-03-18 13:48:21'),
(5, 16, 'ssssssssss', 'first', 11111, 'ytrtytryrtyryrtyryrty', '2019-03-18 13:50:40', '2019-03-18 13:50:40'),
(6, 16, 'ssssssssss', 'second', 11111, 'dddd', '2019-03-18 13:51:18', '2019-03-18 13:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_services`
--

CREATE TABLE `therapist_services` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `therapist_services`
--

INSERT INTO `therapist_services` (`id`, `therapist_id`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 9, 3, '2019-03-15 13:34:35', '2019-03-15 13:34:35'),
(2, 10, 7, '2019-03-15 13:37:19', '2019-03-15 13:37:19'),
(3, 11, 1, '2019-03-15 13:37:40', '2019-03-15 13:37:40'),
(4, 11, 7, '2019-03-15 13:37:40', '2019-03-15 13:37:40'),
(5, 12, 1, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(6, 12, 2, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(7, 12, 7, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(8, 12, 5, '2019-03-15 13:38:24', '2019-03-15 13:38:24'),
(9, 13, 2, '2019-03-15 13:40:26', '2019-03-15 13:40:26'),
(10, 13, 3, '2019-03-15 13:40:26', '2019-03-15 13:40:26'),
(11, 14, 1, '2019-03-18 08:58:26', '2019-03-18 08:58:26'),
(12, 14, 2, '2019-03-18 08:58:27', '2019-03-18 08:58:27'),
(13, 14, 3, '2019-03-18 08:58:27', '2019-03-18 08:58:27'),
(14, 15, 3, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(15, 15, 7, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(16, 15, 5, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(17, 16, 3, '2019-03-18 10:43:54', '2019-03-18 10:43:54'),
(18, 16, 7, '2019-03-18 10:43:54', '2019-03-18 10:43:54'),
(19, 16, 8, '2019-03-18 10:43:54', '2019-03-18 10:43:54'),
(20, 16, 10, '2019-03-18 10:43:54', '2019-03-18 10:43:54'),
(21, 16, 11, '2019-03-18 10:43:55', '2019-03-18 10:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_working_area`
--

CREATE TABLE `therapist_working_area` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `therapist_working_area`
--

INSERT INTO `therapist_working_area` (`id`, `therapist_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 9, 11, '2019-03-15 13:34:35', '2019-03-15 13:34:35'),
(2, 10, 9, '2019-03-15 13:37:18', '2019-03-15 13:37:18'),
(3, 11, 8, '2019-03-15 13:37:40', '2019-03-15 13:37:40'),
(4, 11, 9, '2019-03-15 13:37:40', '2019-03-15 13:37:40'),
(5, 12, 7, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(6, 12, 8, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(7, 12, 11, '2019-03-15 13:38:23', '2019-03-15 13:38:23'),
(8, 13, 7, '2019-03-15 13:40:25', '2019-03-15 13:40:25'),
(9, 13, 9, '2019-03-15 13:40:25', '2019-03-15 13:40:25'),
(10, 13, 10, '2019-03-15 13:40:25', '2019-03-15 13:40:25'),
(11, 14, 7, '2019-03-18 08:58:26', '2019-03-18 08:58:26'),
(12, 14, 8, '2019-03-18 08:58:26', '2019-03-18 08:58:26'),
(13, 14, 11, '2019-03-18 08:58:26', '2019-03-18 08:58:26'),
(14, 15, 9, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(15, 15, 10, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(16, 15, 11, '2019-03-18 10:28:54', '2019-03-18 10:28:54'),
(17, 16, 2, '2019-03-18 10:43:54', '2019-03-18 10:43:54'),
(18, 16, 5, '2019-03-18 10:43:54', '2019-03-18 10:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `id` int(11) NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `treatments`
--

INSERT INTO `treatments` (`id`, `category_id`, `treatment_name`, `image`, `overview`, `treatment`, `faq`, `created_by`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 2, 'Urban Classic', '1540534552.JPG', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What is an Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Based on traditional, popular massage techniques, this is an ideal first treatment for people who are looking for a healthy and indulgent pick-me-up. Using long strokes and deep circular movements, your therapist will help you unwind and de-stress, while boosting your immune system.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Massage has come to be associated with a broad range of health benefits, from improved pain management to enhanced circulation, and even treatment of conditions like arthritis. Even if you don&rsquo;t have specific concerns, some studies prove massage can positively influence your general health from the very first session.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Who would benefit from an Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone from athletes to office workers will feel the benefits of this treatment, which releases muscular tension and decreases inflammation.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">People who may choose to select this treatment:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">New to massage.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Primarily focused on relaxation, but prefer something more energising than a relaxing massage.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Prefer lighter pressure.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Want to feel calm and composed.\n	<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	</ul>\n	</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">People who should not choose an Urban Classic:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Looking for deep pressure. Try a deep tissue massage instead.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.</li>\n	<li style=\"box-sizing: inherit; list-style: none; position: relative; margin-bottom: 2.5rem; max-width: 328px;\">Pregnant women. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Urban Classic massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol style=\"box-sizing: inherit; margin: 2.5rem 0px 3rem;\">\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Warms and stretches superficial tissue.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Increases blood flow throughout the body.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Promotes a sense of wellness and relaxation.</li>\n	<li style=\"box-sizing: inherit; margin-bottom: 2.5rem;\">Decreases cortisol levels in the body, reducing stress.</li>\n</ol>\n</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">During your Urban Classic treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Before your massage you will remove your clothes (except for underwear), and lie on the table covered by a towel. Your therapist will use oils to apply various massage strokes, which will gently warm your muscle tissues and gradually break down any knots.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Urban Classic techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This classic massage relieves muscle tension and increases blood circulation around the body. Your therapist will use massage oils or creams to soften the muscles through long, slow strokes and gentle-but-firm pulling and pressing. This treatment is extremely relaxing, and you shouldn&rsquo;t expect to feel uncomfortable at any time.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What is the difference between an Urban Classic and other types of massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">An Urban Classic massage is typically gentler than other types of massage therapy. It is a good general introduction to massage, as it uses lighter pressure strokes.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">After your Urban Classic massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Should you feel any aches after your treatment, take a warm bath and be sure to drink plenty&nbsp;<br style=\"box-sizing: inherit;\" />\nof water. If you&rsquo;ve been experiencing a lot of stress you may feel more emotional, so it&rsquo;s important to make time to rest.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Does an Urban Classic massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage shouldn&#39;t be painful. If you do experience discomfort at any time, talk to your therapist and let them know. They will be able to adjust their technique until you&#39;re happy.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Even though an Urban Classic massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">What type of therapists specialise in Urban Classic massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Therapists who have experience in classic, medical and health massages. They may also offer an energising or relaxing massage.</div>\n</div>', 0, 1, 1, '2018-10-26 00:45:52', '2018-10-26 01:52:45'),
(2, 1, 'Deep Tissue', '1540534864.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage instigates a greater tension relieving response than a classic massage by concentrating on posterior (deeper) muscles. It uses a mix of classic massage strokes, with increased pressure, typically following the muscle from insertion to origin. The aim is to reduce muscle tension by releasing knots and restoring elasticity. Deep tissue massage is also designed to increase blood flow to targeted muscles, kick-starting the body&rsquo;s natural healing process.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage is one the most popular choices of massage as it can suit many individuals, helping to ease pain and stiffness in a variety of scenarios. It is not just for athletes or people with acute injuries.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People may choose to select this treatment who are:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Experiencing tension in specific areas of the body - most commonly in the back and neck.</li>\n	<li>Suffering from chronic pain.</li>\n	<li>Stressed and looking for deep relaxation.</li>\n	<li>Recovering from a soft tissue injury.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Individuals should not have a deep tissue massage if they have:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Issues lying on their front</li>\n	<li>Open wounds or cuts - these areas should be avoided</li>\n	<li>High blood pressure - check with your GP before booking a deep tissue treatment</li>\n	<li>Had recent surgery</li>\n	<li>Fever, flu or cold symptoms - these can be amplified after a massage</li>\n	<li>Pregnancy. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Reduces tissue congestion</li>\n	<li>Deeper relaxation than a classic massage by removing muscle inflexibility</li>\n	<li>Reduces stress caused by tension</li>\n	<li>Chronic pain relief</li>\n</ol>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is important to note that these benefits can sometimes only be achieved after a few sessions. If the recipient is very tense, most of the first treatment will concentrate on warming up the superficial muscles. A following session will then target the posterior (deep) muscles to encourage blood flow.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">During your deep tissue treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will focus on areas of your body where you can feel tension and pain. This will be communicated at the beginning and during the treatment, adjusting technique according to the specific benefits you wish to achieve. Your muscles will need to be relaxed and you may be asked to breathe deeply to enable your therapist to reach the deeper musculature.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">Deep Tissue massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue treatment can be a full body massage or just work on individual problem areas. During a treatment, the therapist will shift their body weight to apply a range of pressure. The more pressure, the deeper the massage, promoting increased blood flow and relaxation. This is achieved using their fingers and thumbs, as with a classic massage, in addition to other extremities including knuckles and elbows.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3 class=\"treatment-single__content-subtitle\" style=\"box-sizing: inherit; font-family: &quot;Gotham SSm A&quot;, &quot;Gotham SSm B&quot;; line-height: 2.2rem; font-size: 1.6rem; margin: 0.8rem 0px 1.5rem;\">After your deep tissue massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is not unusual to feel some pain and stiffness after your treatment, but this should go away after a day or two, leaving you feeling less tense. Massage, especially deep tissue, has the same effects on the body as exercise in terms of increasing blood flow and stretching. Having a deep tissue massage can feel just like having a workout.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between a Swedish and Deep Tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue massage uses a combination of classic massage strokes that are slower and deeper to that of a Swedish massage.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does a deep tissue massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">You may experience some discomfort during your treatment. Let your therapist know if you feel pain and you want them to reduce the pressure. It is important to communicate to your therapist about specific areas of tension and intensities of pressure. The same pressure doesn&#39;t apply to every area and each person has different tolerance levels. Talk about positioning before and during the treatment so your therapist can work around what is most comfortable.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in deep tissue?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Sports or physiotherapists often use deep tissue massage to remove tension from muscles before working on them. Others, such as those who have come from a classic massage background, choose to train in deep tissue massage to expand their anatomy knowledge.</div>\n</div>', 0, 1, 1, '2018-10-26 00:51:04', '2018-10-26 03:37:57'),
(3, 1, 'Curates: Aveda Stress', '1546939634.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 0, '2018-10-26 00:52:27', '2019-01-08 03:57:14'),
(7, 2, 'Sports123', '1546939581.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This treatment uses deep manipulation of the soft tissue to correct problems and imbalances caused by strenuous physical activity. Sports massage is an effective way to release tension and restore balance in your musculoskeletal system.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">If you are a serious athlete, incorporating regular massages into your training plan can support training and recovery, and may even prevent some minor injuries from occurring. However, you don&rsquo;t have to be a professional athlete to benefit from this treatment; it can also help lengthen and strengthen muscles and joints in those who work out casually.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who enjoys regular physical activity, or is currently recovering from a sporting injury. This type of massage will help improve flexibility and may reduce recovery time.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who may choose to select this treatment:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Athletes in preparation for, or following a sporting events.</li>\n	<li>As part of rehabilitation following an injury.</li>\n	<li>Those with muscle cramps, bruises and aches.</li>\n	<li>Anyone with acute or chronic soft tissue injuries.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose a Sports massage:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Those with general massage contraindications, including open wounds, broken bones, bursitis, periostitis, rheumatoid arthritis, myositis ossificans, skin infections, thrombosis or bleeding disorders.</li>\n	<li>Anyone looking for a gentle experience. Try a Relaxing massage instead.\n	<ul>\n	</ul>\n	</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Be sure to advise your therapist of any pre-existing medical conditions or areas to avoid before they begin your treatment.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Sports massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Can speed healing and reduce discomfort during the rehabilitation process.</li>\n	<li>Increases range of motion and flexibility.</li>\n	<li>Increases blood flow, which re-oxygenates soft tissue to reduce recovery time.</li>\n	<li>Helps improve muscle endurance and power.</li>\n</ol>\n</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>During your Sports massage treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist may begin with a postural and gait analysis, and will discuss your medical history and any current injuries. This treatment takes place on a table, so you will need to undress and will be covered with a towel. Sports massage uses oil, cream or wax to work into deep pressure points, so the experience can be very intense at times.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Sports massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will use a combination of trigger point techniques, cross-fibre friction and myofascial release, alongside joint mobilisations and stretches. Sports massages combine elements of Swedish massage and Deep Tissue massage to improve blood flow to your muscles and increase oxygen levels in the body.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>After your Sports massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Following your massage, your muscles may feel sore for a day or two, though it may also help to alleviate existing soreness. Take a warm bath, ensure you get adequate rest and drink plenty of water. Never put strain on muscles that are already feeling tender.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between Sports therapy and a Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A Sports Therapist is often qualified to administer massage, but may also use ultrasound or cryotherapy, and can provide guidance on visualisation and motivation techniques. For those wanting a hands-on treatment, a Sports massage may be more than enough to release and strengthen muscles, assist in the removal of metabolic waste and promote relaxation before a big event.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does Sports massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A Sports massage is likely to be more intense than a Deep Tissue massage, but should never be painful. Let your therapist know if you are experiencing discomfort and they can ease off the pressure or avoid certain areas if needed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in Sports massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Therapists that have a high level of knowledge about anatomy and physiology, and may come from a physiotherapy or osteopathy background. They will typically have a good knowledge of sporting injury, rehabilitation methods and training practices.</div>\n</div>', 0, 1, 0, '2018-10-26 04:41:32', '2019-01-08 03:56:21'),
(4, 1, 'Deep Tissue1221', '1546939605.jpg', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage instigates a greater tension relieving response than a classic massage by concentrating on posterior (deeper) muscles. It uses a mix of classic massage strokes, with increased pressure, typically following the muscle from insertion to origin. The aim is to reduce muscle tension by releasing knots and restoring elasticity. Deep tissue massage is also designed to increase blood flow to targeted muscles, kick-starting the body&rsquo;s natural healing process.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a deep tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Deep tissue massage is one the most popular choices of massage as it can suit many individuals, helping to ease pain and stiffness in a variety of scenarios. It is not just for athletes or people with acute injuries.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People may choose to select this treatment who are:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Experiencing tension in specific areas of the body - most commonly in the back and neck.</li>\n	<li>Suffering from chronic pain.</li>\n	<li>Stressed and looking for deep relaxation.</li>\n	<li>Recovering from a soft tissue injury.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Individuals should not have a deep tissue massage if they have:</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ul>\n	<li>Issues lying on their front</li>\n	<li>Open wounds or cuts - these areas should be avoided</li>\n	<li>High blood pressure - check with your GP before booking a deep tissue treatment</li>\n	<li>Had recent surgery</li>\n	<li>Fever, flu or cold symptoms - these can be amplified after a massage</li>\n	<li>Pregnancy. Try a pregnancy massage instead.</li>\n</ul>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">\n<ol>\n	<li>Reduces tissue congestion</li>\n	<li>Deeper relaxation than a classic massage by removing muscle inflexibility</li>\n	<li>Reduces stress caused by tension</li>\n	<li>Chronic pain relief</li>\n</ol>\n</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>&nbsp;</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is important to note that these benefits can sometimes only be achieved after a few sessions. If the recipient is very tense, most of the first treatment will concentrate on warming up the superficial muscles. A following session will then target the posterior (deep) muscles to encourage blood flow.</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>During your deep tissue treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Your therapist will focus on areas of your body where you can feel tension and pain. This will be communicated at the beginning and during the treatment, adjusting technique according to the specific benefits you wish to achieve. Your muscles will need to be relaxed and you may be asked to breathe deeply to enable your therapist to reach the deeper musculature.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Deep Tissue massage techniques</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue treatment can be a full body massage or just work on individual problem areas. During a treatment, the therapist will shift their body weight to apply a range of pressure. The more pressure, the deeper the massage, promoting increased blood flow and relaxation. This is achieved using their fingers and thumbs, as with a classic massage, in addition to other extremities including knuckles and elbows.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>After your deep tissue massage</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">It is not unusual to feel some pain and stiffness after your treatment, but this should go away after a day or two, leaving you feeling less tense. Massage, especially deep tissue, has the same effects on the body as exercise in terms of increasing blood flow and stretching. Having a deep tissue massage can feel just like having a workout.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the difference between a Swedish and Deep Tissue massage?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A deep tissue massage uses a combination of classic massage strokes that are slower and deeper to that of a Swedish massage.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does a deep tissue massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">You may experience some discomfort during your treatment. Let your therapist know if you feel pain and you want them to reduce the pressure. It is important to communicate to your therapist about specific areas of tension and intensities of pressure. The same pressure doesn&#39;t apply to every area and each person has different tolerance levels. Talk about positioning before and during the treatment so your therapist can work around what is most comfortable.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What type of therapists specialise in deep tissue?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Sports or physiotherapists often use deep tissue massage to remove tension from muscles before working on them. Others, such as those who have come from a classic massage background, choose to train in deep tissue massage to expand their anatomy knowledge.</div>\n</div>', 0, 1, 0, '2018-10-26 03:34:32', '2019-01-08 03:56:45');
INSERT INTO `treatments` (`id`, `category_id`, `treatment_name`, `image`, `overview`, `treatment`, `faq`, `created_by`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(5, 9, 'Curates: Aveda Stress-Fix™', '1540544684.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 1, '2018-10-26 03:34:44', '2018-10-26 03:38:23'),
(6, 9, 'Curates: Aveda Stress-Fix™', '1540544748.jpg', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is the Urban Curates: Aveda Stress Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates: Aveda is a one-of-a-kind treatment designed to de-stress, relax and recover. It blends the best of Aveda&rsquo;s Stress-FixTM products and the skills of your specially-trained therapist, creating a deeply calming massage.<br />\nThis treatment tackles stress using the trinity of touch, aroma and guided breathing. Aveda&rsquo;s Stress-FixTM products star organic lavender and clary sage - expertly blended to create a slow, soothing effect on your mind and body. Your therapist will perform Swedish massage, deep tissue, foot reflexology and apply skilled acupressure techniques, as well as guiding you through meditative thoughts to leave you feeling calmer and more balanced.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Who would benefit from a Urban Curates: Aveda Stress-Fix tm Treatment?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Anyone who is suffering from the negative physical, mental or emotional effects of stress. This treatment is also perfect if you&rsquo;re feeling the need to slow down, switch off your mind and relax your body. It&rsquo;s also ideal if you&rsquo;re currently carrying muscular pain and tension, especially in your upper back, neck and shoulders.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who might choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">New to massage.<br />\nPrimarily focused on relaxation, but prefer something more energising than a relaxing massage.<br />\nPrefer lighter pressure.<br />\nWant to feel calm and composed.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>People who should not choose this treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Those with general massage contraindications, including active cancer, acute infection, cellulitis, thrombosis and acute allergies.<br />\nPregnant women. Try a pregnancy massage instead.</div>\n</div>', '<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Treatment potential benefits</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">A drop in physical and mental tension.<br />\nReduced levels of stress and a calmer central nervous system.<br />\nWhole body relaxation<br />\nA release of muscular stiffness and tightness<br />\nAn improvement in subtle energy flow in the body</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Before and during your Treatment</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Take time to adjust the lighting and room temperature to make sure you&rsquo;re completely comfortable. Feel free to play music and light a candle if you&rsquo;ve got one. Once your therapist has set up, you should remove your clothes (except for your underwear), and lie on the table covered by a towel. Your therapist will use the specially selected array of Aveda products to deliver a relaxing, stress-relieving treatment</div>\n</div>', '<p>&nbsp;</p>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>What is Urban Curates?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">Urban Curates is a collection of unique at-home experiences designed to tackle the symptoms of busy urban life. These experiences are created in collaboration with cult names and rising stars alike. Each exclusive treatment is delivered by specially trained therapists using the brand&rsquo;s favourite products.</div>\n</div>\n\n<div style=\"box-sizing: inherit; color: rgba(73, 72, 92, 0.8); font-family: Roboto; font-size: 14px; background-color: rgb(244, 245, 247);\">\n<h3>Does an Urban Curates: Aveda Stress Fix massage hurt?</h3>\n\n<div class=\"treatment-single__content-paragraph\" style=\"box-sizing: inherit; line-height: 2.3rem; margin-bottom: 3rem;\">This type of massage is designed to be relaxing and soothing - it shouldn&rsquo;t be painful. If you do experience discomfort at any time, just let your therapist know. They&rsquo;re professionals and will be able to adjust their technique until you&#39;re happy. Even though an Urban Curates: Aveda massage typically uses a gentle touch, if your therapist decides to apply a few deeper techniques or work on any particularly tense spots you may feel a bit sore the next day.</div>\n</div>', 0, 1, 1, '2018-10-26 03:35:48', '2018-10-26 03:37:51'),
(8, 2, 'Curates: Neom De-Stress', '1546939589.jpg', '<p>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</p>', '<p>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</p>', '<p><strong>Using 24 hand-picked essential oils, this treatment is designed to help you de-stress and find a calm, centered you.</strong></p>', 1, 1, 0, '2018-10-26 06:39:58', '2019-01-08 03:56:29'),
(9, 5, 'Yoga', '1546939571.jpg', '<p>Yoga</p>', '<p>Yoga</p>', '<p>Yoga</p>', 1, 1, 0, '2018-10-31 07:05:56', '2019-01-08 03:56:11'),
(10, 4, 'Physiotherapy', '1546939562.jpg', '<p>Physiotherapy</p>', '<p>Physiotherapy</p>', '<p>Physiotherapy</p>', 1, 1, 0, '2018-10-31 07:06:42', '2019-01-08 03:56:02'),
(11, 1, 'Sports1212', '1546939554.jpg', '<p>xcxczcz</p>', '<p>xc</p>', '<p>xczxczczczczc</p>', 1, 1, 0, '2018-11-26 05:38:18', '2019-01-08 03:55:54'),
(12, 0, 'Sports', '1544091487.png', '<p>as</p>', '<p>as</p>', '<p>asa</p>', 1, 1, 0, '2018-12-06 04:48:07', '2019-02-23 12:50:42'),
(13, 0, 'test123', '1544097953.png', '<p>sdsd</p>', '<p>sdsd</p>', '<p>sdsd</p>', 1, 1, 0, '2018-12-06 06:35:53', '2019-01-03 04:17:57'),
(14, 0, 'test cosmonautgroup', '1544097992.png', '<p>dsdsdsd</p>', '<p>sdd</p>', '<p>dssd</p>', 1, 1, 0, '2018-12-06 06:36:32', '2019-01-03 04:17:49'),
(18, 0, 'sssssssssss', '1550945854.jpg', '<p>1212121212121212121212</p>', '<p>121212121212121212121212</p>', '<p>1212121212121212</p>', 1, 1, 0, '2018-12-31 07:38:54', '2019-02-23 12:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `dob_day` int(20) NOT NULL,
  `dob_month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob_year` int(20) NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL COMMENT '0= Male, 1 = Female',
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_reg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recent_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_service` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `term_condition` int(11) NOT NULL DEFAULT '0' COMMENT '0 => No , 1 => Yes',
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0' COMMENT '1=Active , 0 = Inactive',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1=Delete , 0 = Non Delete',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `nick_name`, `email`, `email_verified_at`, `dob_day`, `dob_month`, `dob_year`, `password`, `profile_image`, `country_code`, `mobile_no`, `city_id`, `address`, `gender`, `experience`, `id_card`, `certification`, `book_bank`, `house_reg`, `recent_photo`, `book_detail`, `bank_service`, `branch`, `account_no`, `account_name`, `term_condition`, `reset_password_token`, `is_active`, `is_delete`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL, NULL, 'test.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$EEFI3k4teT5nvHT2LDzVveQANVQZQ8o5PtJFfVzav4DBlpQarMK8m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, '414rxnQNqagAAQXmvhxBoBBVo0niR0n0EpIUGsfrdFtKKNdSlFO7QVepJStg', NULL, NULL),
(2, 'Therapist one', NULL, NULL, NULL, 'test1.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$m.7VdqCmL.6ZI/OW4r1FF./rwsLbAD1HprLjpdT/JeFR18XGgC8Pm', '1550946747.jpg', NULL, 7788778778, NULL, 'Avenida Rivadavia 1133, Buenos Aires, Argentina', 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, 'YmduzcTxkkQC7Q6NHkv78pUjmLLNautpMVNfbn0kLNQ5OzZram3RKuLrncmt', '2019-01-12 07:42:45', '2019-03-13 00:33:59'),
(3, 'Test user', NULL, NULL, NULL, 'test2.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$OdoFNWSuM3dAHvAXlAW7dulrO7HkDGVwlx7hijM1g0YkaYdb7AQdS', NULL, NULL, 7878787878, NULL, 'AZ, USA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, 'M4osPnjh1IUq7dKEsLfakF7JYpf175D71muaErzqBUvLQJCHBa7e44xgYurt', '2019-01-12 07:43:27', '2019-01-12 07:43:33'),
(4, 'Testdshkjd', NULL, NULL, NULL, 'test12122@sdhjskdhj.com', NULL, 0, '', 0, '$2y$10$ufvXHuT/97WF.TV07PU4L.Jwt96QY3msgaVb5vu0fcY3z1mkLrCRy', NULL, NULL, 7777777777, NULL, 'Ahmedabad, Gujarat, India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, '8f9f2e0abeda68b5d8d864b53f26c638', '2019-01-21 04:52:21', '2019-03-14 03:32:38'),
(5, 'Therapist Two', NULL, NULL, NULL, 'dajsh@kshdjk.com', NULL, 0, '', 0, '$2y$10$VS9XVhBwoigAfgc.i2JgWOR6CBnLhzHVJhhXMY7p3AZpSPKuDo8Qi', '1550946688.jpg', NULL, 7877987987, NULL, 'USA Youth Fitness Center, South Gilbert Road, Gilbert, AZ, USA', 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, '73830f56b2ebbf56b0379b087f31ea8e', '2019-01-21 04:57:21', '2019-02-23 13:26:56'),
(6, 'tetetet', NULL, NULL, NULL, 'bdjwjgh@jdsjdh.com', NULL, 0, '', 0, '$2y$10$DUmFnq1TC/ZIaywTjbyRL.i3WUy8CqAm7ogtPsV5EMjxZDrLxSFDK', NULL, NULL, 78787878787878787, NULL, 'AZ, USA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, '7d35335f47d5d82b093aeee47a5b0a64', '2019-01-21 05:44:28', '2019-01-21 05:44:28'),
(7, 'Therapist Three', NULL, NULL, NULL, 'test22.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$ertPjCddqFLes.lmYIXjSOx2twGw2QvHikucez2oktgek67IBxgBu', NULL, NULL, 9999999999, NULL, 'Ahmedabad, Gujarat, India', 0, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, 'f80c9d5e03297faa581db6f9d7be542a', '2019-02-23 13:21:25', '2019-02-23 13:27:31'),
(8, 'govind patel', 'govind', 'patel', 'dfgh', 'asd@gmail.com', NULL, 0, '', 0, '$2y$10$z4Bk4nUUY98EwWHbIaqnhewJOxc4sVGmGh7qa2Pwgdr93.2B1xxNC', NULL, NULL, 5434354354, NULL, 'asdf', NULL, '5+', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, '2872ff9b142a5511d445ed927cd24332', '2019-03-15 07:59:28', '2019-03-15 07:59:28'),
(9, 'govind patel', 'govind', 'patel', 'dfgh', 'asd@gmail.com', NULL, 0, '', 0, '$2y$10$VJj/u610FPqe5ngGcKanQu1TYE5Bp.EmDLc/PhoB3V.TN1UI7Wdz.', NULL, NULL, 5434354354, NULL, 'asdf', NULL, '5+', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, '3af7a3caf8d2fe05aaf020bdb06f833c', '2019-03-15 08:04:35', '2019-03-15 08:04:35'),
(10, 'rrr rrr', 'rrr', 'rrr', 'rrrrrr', 'kjain8255@gmail.com', NULL, 0, '', 0, '$2y$10$YqTUNwSX6zSUZ2oUHpvq6OyD61kRzqK6R8sBoPUVGBFwH4Pzla7q6', NULL, NULL, 1234567890, NULL, 'werty', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, '724f8e7a7417bca359aff85b66ebe89a', '2019-03-15 08:07:18', '2019-03-15 08:07:18'),
(11, 'rrr rrr', 'rrr', 'rrr', 'rrrrrr', 'kjain8255@gmail.com', NULL, 0, '', 0, '$2y$10$uktPqMP5zex72HypK2xM6.xdGFEWfQkS0GijXN5hzqe3jKO9dRB1q', NULL, NULL, 1234567890, NULL, 'werty', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, '69f71f2da7481441ee728ac78fe137cf', '2019-03-15 08:07:40', '2019-03-15 08:07:40'),
(12, 'rrr rrr', 'rrr', 'rrr', 'rrrrrr', 'kjain8255@gmail.com', NULL, 0, '', 0, '$2y$10$Lelh04A7LpNQzPXM7DEfkOly/SlurtblUrUfTcco29/Me8L/qX2w2', NULL, NULL, 1234567890, NULL, 'werty', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, 'dc1c6a7dbb7fbe7aa4b4a79a63d9c1cf', '2019-03-15 08:08:23', '2019-03-15 08:08:23'),
(13, 'xyz patel', 'xyz', 'patel', 'hgfghghgh', 'govindpatel@ymail.com', NULL, 0, '', 0, '$2y$10$jkMOpAyqa1aUk967fWxBweCsHyZGOZVSjDiz9c/nRqJbjdoy5kXkO', NULL, NULL, 1234567890, NULL, 'ahmedabad', NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, 'dd03de08bfdff4d8ab01117276564cc7', '2019-03-15 08:10:25', '2019-03-15 08:10:25'),
(14, 'Theapist Two', 'Theapist', 'Two', 'Thera', 'test5.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$GrV3YDoEPLURvkxaAaGqJ.Tpwfuivw7JZj3O0kcVFlodejU0on1Yi', NULL, NULL, 1234567890, NULL, '123,asdfghjkl', NULL, '3', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, 'iced3gZ8axR7M0HI1aptcg5zd58lWk0bAxBrZnJCP3DrBEn2mVl6QAxsPMog', '2019-03-18 03:28:26', '2019-03-18 03:28:26'),
(15, 'xyz jain', 'xyz', 'jain', 'Thera', 'test6.cosmonautgroup@gmail.com', NULL, 0, '', 0, '$2y$10$Rlb7CZVu/5DOoKPk4lROyOwMZw27IDFh/YyaF72EgE1DtpHhB0YQi', NULL, NULL, 1234567890, NULL, 'ahmedabad', NULL, '1', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, '6179d46a5ecfbe4241cf1edcaa2b24d0', '2019-03-18 04:58:54', '2019-03-18 04:58:54'),
(16, 'xyzqwe ddd', 'xyzqwe', 'ddd', 'dddd', 'govindpatel@ymail.comn', NULL, 2, '03', 2017, '$2y$10$XW7yTC4NrwzSCTZPWEPF/emcPQ2Ou.VNlf8DXpHwL5kBGzD0XwuNG', NULL, NULL, 2222222222, NULL, 'ahmedabaddddddd', 1, '3', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, '7193ce9211a6b574531724f5154d9fec', '2019-03-18 05:13:54', '2019-03-18 08:21:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_activity`
--
ALTER TABLE `booking_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page`
--
ALTER TABLE `cms_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earning_management`
--
ALTER TABLE `earning_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_setting`
--
ALTER TABLE `general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `massage_text`
--
ALTER TABLE `massage_text`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_time`
--
ALTER TABLE `price_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapist_bank_detail`
--
ALTER TABLE `therapist_bank_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapist_services`
--
ALTER TABLE `therapist_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapist_working_area`
--
ALTER TABLE `therapist_working_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `booking_activity`
--
ALTER TABLE `booking_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `cms_page`
--
ALTER TABLE `cms_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `earning_management`
--
ALTER TABLE `earning_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `general_setting`
--
ALTER TABLE `general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `massage_text`
--
ALTER TABLE `massage_text`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `price_time`
--
ALTER TABLE `price_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `therapist_bank_detail`
--
ALTER TABLE `therapist_bank_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `therapist_services`
--
ALTER TABLE `therapist_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `therapist_working_area`
--
ALTER TABLE `therapist_working_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
