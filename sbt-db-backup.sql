-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2014 at 10:42 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sbt`
--
CREATE DATABASE IF NOT EXISTS `sbt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sbt`;

-- --------------------------------------------------------

--
-- Table structure for table `allowed_file_types`
--

CREATE TABLE IF NOT EXISTS `allowed_file_types` (
  `file_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_ext` varchar(10) CHARACTER SET latin1 NOT NULL,
  `file_short_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `file_description` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`file_type_id`),
  KEY `file_id` (`file_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `allowed_file_types`
--

INSERT INTO `allowed_file_types` (`file_type_id`, `file_ext`, `file_short_name`, `file_description`) VALUES
(1, 'doc', 'Word Doc (.doc)', 'Microsoft Word document'),
(2, 'docx', 'Word Doc (.docx)', 'Microsoft Word document (post 2007)'),
(3, 'dot', 'Word Template (.dot)', 'Microsoft Word template'),
(4, 'dotx', 'Word Template (.dotx)', 'Microsoft Word template (post 2007)'),
(5, 'xls', 'Excel File (.xls)', 'Microsoft Excel workbook'),
(6, 'xlt', 'Excel Template (.xlt)', 'Microsoft Excel template'),
(7, 'xlsx', 'Excel File (.xlsx)', 'Microsoft Excel workbook (post 2007)'),
(8, 'xltx', 'Excel Template (.xltx)', 'Microsoft Excel template (post 2007)'),
(9, 'ppt', 'PowerPoint (.ppt)', 'Microsoft PowerPoint presentation'),
(10, 'pps', 'PowerPoint Slideshow (.pps)', 'Microsoft PowerPoint slideshow'),
(11, 'pot', 'PowerPoint Template (.pot)', 'Microsoft PowerPoint template'),
(12, 'pptx', 'PowerPoint (.pptx)', 'Microsoft PowerPoint presentation (post 2007)'),
(13, 'ppsx', 'PowerPoint Slideshow (.ppsx)', 'Microsoft PowerPoint slideshow (post 2007)'),
(14, 'potx', 'PowerPoint Template (.potx)', 'Microsoft PowerPoint template (post 2007)'),
(15, 'mdb', 'Access Database (.mdb)', 'Microsoft Access database file'),
(16, 'accdb', 'Access Database (.accdb)', 'Microsoft Access database file (post 2007)'),
(17, 'pub', 'Publisher File', 'Microsoft Publisher document file'),
(18, 'gif', 'GIF Picture', 'Graphics Interchange Format'),
(19, 'pdf', 'PDF File', 'Portable Document Format'),
(20, 'csv', 'Comma Seperated File', 'Comma Seperated File');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `class_code` varchar(15) NOT NULL,
  `register_code` varchar(100) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `class_code`, `register_code`) VALUES
(1, 'IBI Test Class', 'IBI', 'a2331f024b63e5f1f9a06ec62ade80509f6ed476'),
(8, 'NCI 4th Year Computing', 'BSHBISE4', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `file_sharing_id` int(11) NOT NULL,
  `file_type_id` int(10) NOT NULL,
  `file_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `file_path` varchar(255) CHARACTER SET latin1 NOT NULL,
  `file_size` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1,
  `subject` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `file_sharing_id` (`file_sharing_id`),
  KEY `user_id` (`owner_id`),
  KEY `file_type_id` (`file_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `owner_id`, `file_sharing_id`, `file_type_id`, `file_name`, `file_path`, `file_size`, `description`, `subject`, `upload_date`) VALUES
(1, 2, 1, 2, 'Personal Study Helper', '../../../studybettertogether/files/amonaghan/Personal_Study_Helper.docx', '17 kb', 'studyhelper', 'study', '2013-12-07 12:52:18'),
(2, 2, 2, 2, 'ProjectProposal2- Studytogether.com', '../../../studybettertogether/files/amonaghan/ProjectProposal2-_Studytogether.com.docx', '674 kb', 'test', 'test', '2013-12-07 12:53:42'),
(5, 2, 5, 19, 'Group1_SKO_RequirementsSpecification', '../../../studybettertogether/files/public/Group1_SKO_RequirementsSpecification.pdf', '828 kb', 'desc', 'sub', '2013-12-07 13:10:47'),
(6, 15, 6, 2, 'usecases - Study Smart Mobile Website', '../../../studybettertogether/files/stuartSmith/usecases_-_Study_Smart_Mobile_Website.docx', '48 kb', '', '', '2013-12-07 16:41:59'),
(7, 2, 7, 19, 'Lab Master Sem1', '../../../studybettertogether/files/amonaghan/Lab_Master_Sem1.pdf', '48 kb', '', '', '2013-12-17 12:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `file_sharing`
--

CREATE TABLE IF NOT EXISTS `file_sharing` (
  `sharing_id` int(11) NOT NULL AUTO_INCREMENT,
  `sharing_status` enum('public','private','specific') CHARACTER SET latin1 NOT NULL,
  `shared_with` mediumtext CHARACTER SET latin1,
  PRIMARY KEY (`sharing_id`),
  FULLTEXT KEY `shared_with` (`shared_with`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `file_sharing`
--

INSERT INTO `file_sharing` (`sharing_id`, `sharing_status`, `shared_with`) VALUES
(1, 'private', ''),
(2, 'specific', 'jonoB,rachael14,Ssmith'),
(5, 'public', ''),
(6, 'specific', 'amonaghan,MimiSBT'),
(7, 'specific', 'MimiSBT');

-- --------------------------------------------------------

--
-- Table structure for table `forum_banlists`
--

CREATE TABLE IF NOT EXISTS `forum_banlists` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forum_banlists`
--

INSERT INTO `forum_banlists` (`name`, `list`) VALUES
('user_agents', ''),
('ips', ''),
('words', '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_categories`
--

CREATE TABLE IF NOT EXISTS `forum_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `category` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `accession` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `forum_categories`
--

INSERT INTO `forum_categories` (`id`, `order_id`, `category`, `description`, `accession`) VALUES
(1, 1, 'General', '', 0),
(2, 2, 'Social', '', 0),
(6, 0, 'IBI Test Class', '', 0),
(7, 0, 'NCI 4th Year Computing', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_entries`
--

CREATE TABLE IF NOT EXISTS `forum_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `uniqid` varchar(255) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_reply` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edited_by` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `hp` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(128) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `show_signature` tinyint(4) DEFAULT '0',
  `email_notification` tinyint(4) DEFAULT '0',
  `marked` tinyint(4) DEFAULT '0',
  `locked` tinyint(4) DEFAULT '0',
  `sticky` tinyint(4) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `spam` tinyint(4) DEFAULT '0',
  `spam_check_status` tinyint(4) DEFAULT '0',
  `edit_key` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `tid` (`tid`),
  KEY `category` (`category`),
  KEY `pid` (`pid`),
  KEY `sticky` (`sticky`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `forum_entries`
--

INSERT INTO `forum_entries` (`id`, `pid`, `tid`, `uniqid`, `time`, `last_reply`, `edited`, `edited_by`, `user_id`, `name`, `subject`, `category`, `email`, `hp`, `location`, `ip`, `text`, `tags`, `show_signature`, `email_notification`, `marked`, `locked`, `sticky`, `views`, `spam`, `spam_check_status`, `edit_key`) VALUES
(19, 0, 19, '52b2e68319d7d', '2013-12-19 12:29:25', '2014-01-25 16:10:26', '0000-00-00 00:00:00', NULL, 1, '', 'Welcome', 1, '', '', '', '::1', '[b]Hi all[/b]\r\n\r\nWelcome to our new collaborative learning website! \r\n\r\nHope you have fun :-)', '', 0, 0, 0, 0, 0, 11, 0, 0, ''),
(20, 19, 19, '52e3e1e9a0b9b', '2014-01-25 16:10:26', '2014-01-25 16:10:26', '0000-00-00 00:00:00', NULL, 2, '', 'Welcome', 1, '', '', '', '::1', 'Thanks Mimi', '', 0, 0, 0, 0, 0, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_entries_cache`
--

CREATE TABLE IF NOT EXISTS `forum_entries_cache` (
  `cache_id` int(11) NOT NULL,
  `cache_text` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forum_entries_cache`
--

INSERT INTO `forum_entries_cache` (`cache_id`, `cache_text`) VALUES
(19, '<p><strong>Hi all</strong></p>\n<p>Welcome to our new collaborative learning website! </p>\n<p>Hope you have fun <img src="images/smilies/smile.png" alt=":-)" /></p>\n'),
(20, '<p>Thanks Mimi</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `forum_logincontrol`
--

CREATE TABLE IF NOT EXISTS `forum_logincontrol` (
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `logins` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_pages`
--

CREATE TABLE IF NOT EXISTS `forum_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `menu_linkname` varchar(255) NOT NULL DEFAULT '',
  `access` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_settings`
--

CREATE TABLE IF NOT EXISTS `forum_settings` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `forum_settings`
--

INSERT INTO `forum_settings` (`name`, `value`) VALUES
('forum_name', 'Study Forum'),
('forum_description', 'A collaborative learning forum'),
('forum_email', 'admin@studybettertogether.com'),
('forum_address', 'http://localhost/studybettertogether/studyforum.php'),
('home_linkaddress', '../'),
('home_linkname', ''),
('language_file', 'english.lang'),
('theme', 'default'),
('access_for_users_only', '1'),
('entries_by_users_only', '1'),
('register_mode', '2'),
('default_email_contact', '0'),
('user_area_public', '0'),
('rss_feed', '0'),
('rss_feed_max_items', '0'),
('session_prefix', 'forum_'),
('default_view', '1'),
('remember_userdata', '0'),
('remember_last_visit', '0'),
('empty_postings_possible', '2'),
('email_notification_unregistered', '2'),
('user_edit', '2'),
('user_edit_if_no_replies', '0'),
('show_if_edited', '0'),
('dont_reg_edit_by_admin', '0'),
('dont_reg_edit_by_mod', '0'),
('edit_min_time_period', '0'),
('edit_max_time_period', '0'),
('edit_delay', '0'),
('bbcode', '1'),
('bbcode_img', '1'),
('bbcode_color', '0'),
('bbcode_size', '0'),
('bbcode_code', '0'),
('bbcode_tex', '0'),
('bbcode_flash', '0'),
('flash_default_width', '425'),
('flash_default_height', '344'),
('upload_images', '3'),
('smilies', '1'),
('autolink', '1'),
('count_views', '1'),
('autologin', '1'),
('threads_per_page', '30'),
('search_results_per_page', '20'),
('name_maxlength', '100'),
('name_word_maxlength', '30'),
('email_maxlength', '100'),
('hp_maxlength', '70'),
('location_maxlength', '40'),
('location_word_maxlength', '30'),
('subject_maxlength', '60'),
('subject_word_maxlength', '30'),
('text_maxlength', '5000'),
('profile_maxlength', '5000'),
('signature_maxlength', '255'),
('text_word_maxlength', '90'),
('email_subject_maxlength', '0'),
('email_text_maxlength', '0'),
('quote_symbol', '>'),
('count_users_online', '0'),
('last_reply_link', '0'),
('time_difference', '0'),
('time_zone', ''),
('auto_lock_old_threads', '0'),
('upload_max_img_size', '200'),
('upload_max_img_width', '600'),
('upload_max_img_height', '600'),
('mail_parameter', ''),
('forum_enabled', '1'),
('forum_readonly', '0'),
('forum_disabled_message', ''),
('page_browse_range', '10'),
('page_browse_show_last', '0'),
('deep_reply', '15'),
('very_deep_reply', '30'),
('users_per_page', '20'),
('username_maxlength', '40'),
('bad_behavior', '0'),
('akismet_entry_check', '0'),
('akismet_mail_check', '0'),
('akismet_key', ''),
('akismet_check_registered', '0'),
('stop_forum_spam', '0'),
('tags', '0'),
('tag_cloud', '0'),
('tag_cloud_day_period', '30'),
('tag_cloud_scale_min', '0'),
('tag_cloud_scale_max', '6'),
('latest_postings', '10'),
('terms_of_use_agreement', '1'),
('terms_of_use_url', 'http://localhost/studybettertogether/studyforum_terms.php'),
('syntax_highlighter', '0'),
('save_spam', '0'),
('auto_delete_spam', '168'),
('auto_lock', '0'),
('temp_block_ip_after_repeated_failed_logins', '0'),
('flood_prevention_minutes', '2'),
('fold_threads', '1'),
('avatars', '0'),
('avatar_max_filesize', '20'),
('avatar_max_width', '80'),
('avatar_max_height', '80'),
('captcha_posting', '0'),
('captcha_email', '0'),
('captcha_register', '0'),
('min_pw_length', '1'),
('cookie_validity_days', '30'),
('access_permission_checks', '0'),
('daily_actions_time', '3:30'),
('next_daily_actions', '1390793400'),
('auto_lock_old_threads', '0'),
('max_read_items', '0'),
('delete_ips', '0'),
('last_changes', '1387453797'),
('ajax_preview', '1'),
('version', '2.3.2');

-- --------------------------------------------------------

--
-- Table structure for table `forum_smilies`
--

CREATE TABLE IF NOT EXISTS `forum_smilies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(100) NOT NULL DEFAULT '',
  `code_1` varchar(50) NOT NULL DEFAULT '',
  `code_2` varchar(50) NOT NULL DEFAULT '',
  `code_3` varchar(50) NOT NULL DEFAULT '',
  `code_4` varchar(50) NOT NULL DEFAULT '',
  `code_5` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forum_smilies`
--

INSERT INTO `forum_smilies` (`id`, `order_id`, `file`, `code_1`, `code_2`, `code_3`, `code_4`, `code_5`, `title`) VALUES
(1, 1, 'smile.png', ':-)', '', '', '', '', ''),
(2, 2, 'wink.png', ';-)', '', '', '', '', ''),
(3, 3, 'tongue.png', ':-P', '', '', '', '', ''),
(4, 4, 'biggrin.png', ':-D', '', '', '', '', ''),
(5, 5, 'neutral.png', ':-|', '', '', '', '', ''),
(6, 6, 'frown.png', ':-(', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_userdata`
--

CREATE TABLE IF NOT EXISTS `forum_userdata` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_real_name` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_pw` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `email_contact` tinyint(4) DEFAULT '0',
  `user_hp` varchar(255) NOT NULL DEFAULT '',
  `user_location` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `profile` text NOT NULL,
  `logins` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_ip` varchar(128) NOT NULL DEFAULT '',
  `registered` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category_selection` varchar(255) DEFAULT NULL,
  `thread_order` tinyint(4) NOT NULL DEFAULT '0',
  `user_view` tinyint(4) NOT NULL DEFAULT '0',
  `sidebar` tinyint(4) NOT NULL DEFAULT '1',
  `fold_threads` tinyint(4) NOT NULL DEFAULT '0',
  `thread_display` tinyint(4) NOT NULL DEFAULT '0',
  `new_posting_notification` tinyint(4) DEFAULT '0',
  `new_user_notification` tinyint(4) DEFAULT '0',
  `user_lock` tinyint(4) DEFAULT '0',
  `auto_login_code` varchar(50) NOT NULL DEFAULT '',
  `pwf_code` varchar(50) NOT NULL,
  `activate_code` varchar(50) NOT NULL DEFAULT '',
  `language` varchar(255) NOT NULL DEFAULT '',
  `time_zone` varchar(255) NOT NULL DEFAULT '',
  `time_difference` smallint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `entries_read` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forum_userdata`
--

INSERT INTO `forum_userdata` (`user_id`, `user_type`, `user_name`, `user_real_name`, `gender`, `birthday`, `user_pw`, `user_email`, `email_contact`, `user_hp`, `user_location`, `signature`, `profile`, `logins`, `last_login`, `last_logout`, `user_ip`, `registered`, `category_selection`, `thread_order`, `user_view`, `sidebar`, `fold_threads`, `thread_display`, `new_posting_notification`, `new_user_notification`, `user_lock`, `auto_login_code`, `pwf_code`, `activate_code`, `language`, `time_zone`, `time_difference`, `theme`, `entries_read`) VALUES
(1, 2, 'MimiSBT', 'Mimi', 0, '0000-00-00', 'b04fbf77b7d07f2a5c4fb13e070a9558f09576e9', '@', 0, '', '', '', '', 14, '2013-12-19 10:50:16', '2013-12-19 11:04:59', '::1', '2013-12-18 18:23:12', NULL, 1, 0, 1, 1, 0, 0, 0, 0, '', '', '', '', '', 0, '', ''),
(2, 0, 'amonaghan', 'Andrew', 0, '0000-00-00', 'e79947c608a8ff67a064e3847a70f70f0b8f011a', 'andrewmgh@gmail.com', 0, '', '', '', '', 4, '2013-12-19 10:51:36', '2013-12-19 10:53:53', '::1', '0000-00-00 00:00:00', NULL, 0, 0, 1, 0, 0, 0, 0, 0, '', '', '', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `forum_userdata_cache`
--

CREATE TABLE IF NOT EXISTS `forum_userdata_cache` (
  `cache_id` int(11) NOT NULL,
  `cache_signature` text NOT NULL,
  `cache_profile` text NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_useronline`
--

CREATE TABLE IF NOT EXISTS `forum_useronline` (
  `ip` char(15) NOT NULL DEFAULT '',
  `time` int(14) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `account_type` varchar(8) CHARACTER SET latin1 NOT NULL DEFAULT 'Student',
  `password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `class_id`, `first_name`, `last_name`, `username`, `email`, `account_type`, `password`, `register_date`) VALUES
(1, 0, 'Mimi', 'Kelly', 'MimiSBT', 'Mimi.Kelly@sbt.com', 'Admin', 'b04fbf77b7d07f2a5c4fb13e070a9558f09576e9', '2013-10-18 17:36:41'),
(2, 1, 'Andrew', 'Monaghan', 'amonaghan', 'Andrew.Monaghan@student.ie', 'Student', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70', '2013-10-18 17:36:41'),
(8, 1, 'Sarah', 'Smith', 'Ssmith', 'sarahsmith@college.ie', 'Student', '574e8ecda5d4f43b7cbcb1b92eb92c8bfdfe9ba0', '2013-10-31 13:31:26'),
(13, 1, 'Brian', 'Jones', 'Brian2013', 'brianjones@test.com', 'Student', 'e9f2cc0c8ed013031c5c7b054347e5facfcbbe20', '2013-11-06 23:02:20'),
(14, 1, 'Jonathan', 'Brady', 'jonoB', 'jonob@test.com', 'Student', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70', '2013-12-05 15:08:47'),
(15, 1, 'Stuart', 'Smith', 'stuartSmith', 'stuartSmith@test.com', 'Student', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70', '2013-12-05 15:09:23'),
(16, 1, 'Rachael', 'Jones', 'rachael14', 'rachael@test.com', 'Student', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70', '2013-12-05 15:10:16'),
(17, 1, 'Stefan', 'O'' Connor', 'stefan', 'stefan@test.com', 'Student', '0c8e67d4df37e989aefb2cb92a6b8961e5c32e70', '2013-12-05 15:11:03');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`file_type_id`) REFERENCES `allowed_file_types` (`file_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`file_sharing_id`) REFERENCES `file_sharing` (`sharing_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
