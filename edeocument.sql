-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- โฮสต์: localhost
-- เวลาในการสร้าง: 24 ก.ค. 2017  09:17น.
-- เวอร์ชั่นของเซิร์ฟเวอร์: 5.1.73-log
-- รุ่นของ PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- ฐานข้อมูล: `swcm_smss`
--

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `rp_edocument`
--

CREATE TABLE IF NOT EXISTS `rp_edocument` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) unsigned NOT NULL,
  `reciever` text COLLATE utf8_unicode_ci NOT NULL,
  `last_update` int(11) unsigned NOT NULL,
  `document_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `topic` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ext` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `size` double unsigned NOT NULL,
  `file` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `rp_edocument`
--

INSERT INTO `rp_edocument` (`id`, `sender_id`, `reciever`, `last_update`, `document_no`, `detail`, `topic`, `ext`, `size`, `file`, `ip`) VALUES
(1, 1, ',0,1,2,', 1500739418, '0001', 'ไฟล์ทดสอบการส่งเอกสาร', 'ERP07-08-How-It-Work-Sample', 'pdf', 1112035, '1500562268.pdf', '110.171.14.193'),
(2, 1, ',0,1,2,', 1500793117, '0002', 'ทดสอบการส่งโดยสมาชิก', 'ตำแหน่งในภาษาอังกฤษ', 'pdf', 445657, '1500563400.pdf', '27.145.96.29'),
(3, 2, ',0,', 1500807147, 'ที่ ศธ1234/0004', 'ทดสอบอัปโหลดรูปภาพ', 'sea2', 'jpg', 426987, '1500563930.jpg', '171.6.192.253');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `rp_edocument_download`
--

CREATE TABLE IF NOT EXISTS `rp_edocument_download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `downloads` int(10) unsigned NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- โครงสร้างตาราง `rp_user`
--

CREATE TABLE IF NOT EXISTS `rp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited` int(11) NOT NULL,
  `lastvisited` int(11) NOT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `student_id` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_class` tinyint(4) NOT NULL,
  `student_room` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- dump ตาราง `rp_user`
--

INSERT INTO `rp_user` (`id`, `username`, `password`, `status`, `permission`, `name`, `sex`, `id_card`, `address`, `phone`, `provinceID`, `zipcode`, `visited`, `lastvisited`, `session_id`, `ip`, `create_date`, `student_id`, `student_class`, `student_room`) VALUES
(1, 'admin@localhost', 'b620e8b83d7fcf7278148d21b088511917762014', 1, 'can_config,can_login,can_config_person,can_handle_all_edocument,can_upload_edocument,can_manage_student', 'แอดมิน', 'm', '', '1 หมู่ 1 ตำบล ลาดหญ้า อำเภอ เมือง', '08080808', '102', '71190', 129, 1500859625, '5c3m75kuhqul4it0csphdsjt57', '110.171.14.233', '0000-00-00 00:00:00', NULL, 0, 0),
(2, 'demo@localhost', 'db75cdf3d5e77181ec3ed6072b56a8870eb6822d', 2, 'can_login,can_upload_edocument', 'ช่างซ่อม 1', 'f', '', '', '0123456788', '101', '', 64, 1500861025, '6cia51jagqk8l1fco4otro5uh2', '203.150.21.77', '2017-07-02 08:10:30', NULL, 0, 0),