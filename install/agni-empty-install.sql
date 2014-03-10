# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: employment
# Generation Time: 2557-03-10 13:44:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table em_account_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_fields`;

CREATE TABLE `an_account_fields` (
  `account_id` int(11) NOT NULL COMMENT 'refer to accounts.account_id',
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_account_level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level`;

CREATE TABLE `an_account_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `level_group_id` (`level_group_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_level` WRITE;
/*!40000 ALTER TABLE `an_account_level` DISABLE KEYS */;

INSERT INTO `an_account_level` (`level_id`, `level_group_id`, `account_id`)
VALUES
  (1,4,0),
  (2,1,1),
  (3,3,2),
  (4,3,3),
  (5,3,4),
  (6,3,5),
  (7,3,6),
  (8,3,7),
  (9,3,8),
  (10,3,9);

/*!40000 ALTER TABLE `an_account_level` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_account_level_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level_group`;

CREATE TABLE `an_account_level_group` (
  `level_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `level_description` text,
  `level_priority` int(5) NOT NULL DEFAULT '1' COMMENT 'lower is more higher priority',
  PRIMARY KEY (`level_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_level_group` WRITE;
/*!40000 ALTER TABLE `an_account_level_group` DISABLE KEYS */;

INSERT INTO `an_account_level_group` (`level_group_id`, `level_name`, `level_description`, `level_priority`)
VALUES
  (1,'Super administrator','Site owner.',1),
  (2,'Administrator',NULL,2),
  (3,'Member','For registered user.',999),
  (4,'Guest','For non register user.',1000);

/*!40000 ALTER TABLE `an_account_level_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_account_level_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_level_permission`;

CREATE TABLE `an_account_level_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `permission_page` varchar(255) NOT NULL,
  `permission_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `level_group_id` (`level_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_account_logins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_logins`;

CREATE TABLE `an_account_logins` (
  `account_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `login_ua` varchar(255) DEFAULT NULL,
  `login_os` varchar(255) DEFAULT NULL,
  `login_browser` varchar(255) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_time_gmt` datetime DEFAULT NULL,
  `login_attempt` int(1) NOT NULL DEFAULT '0' COMMENT '0=fail, 1=success',
  `login_attempt_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_login_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_logins` WRITE;
/*!40000 ALTER TABLE `an_account_logins` DISABLE KEYS */;

INSERT INTO `an_account_logins` (`account_login_id`, `account_id`, `site_id`, `login_ua`, `login_os`, `login_browser`, `login_ip`, `login_time`, `login_time_gmt`, `login_attempt`, `login_attempt_text`)
VALUES
  (1,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-05 11:56:11','2014-03-05 16:56:11',1,'Success'),
  (2,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-05 11:56:22','2014-03-05 16:56:22',0,'Wrong username or password'),
  (3,9,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-05 11:56:48','2014-03-05 16:56:48',1,'Success'),
  (4,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-05 11:57:16','2014-03-05 16:57:16',1,'Success'),
  (5,9,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-05 11:57:54','2014-03-05 16:57:54',1,'Success'),
  (6,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-06 12:01:59','2014-03-05 17:01:59',1,'Success'),
  (7,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-08 02:28:19','2014-03-08 07:28:19',0,'Wrong username or password'),
  (8,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36','Apple','Chrome 33.0.1750.146','127.0.0.1','2014-03-08 02:51:11','2014-03-08 07:51:11',1,'Success'),
  (9,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-10 07:34:35','2014-03-10 12:34:35',1,'Success'),
  (10,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-10 07:40:14','2014-03-10 12:40:14',1,'Success'),
  (11,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0','Apple','Firefox 27.0','127.0.0.1','2014-03-10 07:46:44','2014-03-10 12:46:44',1,'Success');

/*!40000 ALTER TABLE `an_account_logins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_account_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_account_sites`;

CREATE TABLE `an_account_sites` (
  `account_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT 'refer to accounts.account_id',
  `site_id` int(11) DEFAULT NULL COMMENT 'refer to sites.site_id',
  `account_last_login` bigint(20) DEFAULT NULL,
  `account_last_login_gmt` bigint(20) DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled.',
  PRIMARY KEY (`account_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_account_sites` WRITE;
/*!40000 ALTER TABLE `an_account_sites` DISABLE KEYS */;

INSERT INTO `an_account_sites` (`account_site_id`, `account_id`, `site_id`, `account_last_login`, `account_last_login_gmt`, `account_online_code`)
VALUES
  (1,1,1,1394455214,1394430014,'3ac80a19713fdb4225fb97e8dbb495c9'),
  (2,2,1,1392827380,1392802180,'1e9020e348d73faf9762977b520b3357'),
  (3,4,1,1394455604,1394430404,'ec45e7836ba49799f111a8827b01a774'),
  (4,3,1,1390673491,1390648291,'d16dcd0da8f70fb4083cd4ad89f52d23'),
  (5,5,1,1392915269,1392890069,'2ad9fd37ea308d45f7ac7a46d7bead51'),
  (6,9,1,1394038674,1394013474,'9f28548fbb9cd242a29698ff8823885e');

/*!40000 ALTER TABLE `an_account_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_accounts`;

CREATE TABLE `an_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL,
  `account_username` varchar(255) DEFAULT NULL,
  `account_email` varchar(255) DEFAULT NULL,
  `account_salt` varchar(255) DEFAULT NULL COMMENT 'store salt for use when hashing password',
  `account_password` tinytext,
  `account_fullname` varchar(255) DEFAULT NULL,
  `account_birthdate` date DEFAULT NULL,
  `account_avatar` varchar(255) DEFAULT NULL,
  `account_signature` text,
  `account_timezone` varchar(10) NOT NULL DEFAULT 'UP7',
  `account_language` varchar(10) DEFAULT NULL,
  `account_create` datetime DEFAULT NULL COMMENT 'local time',
  `account_create_gmt` datetime DEFAULT NULL COMMENT 'gmt0, utc0',
  `account_last_login` datetime DEFAULT NULL,
  `account_last_login_gmt` datetime DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled. deprecated',
  `account_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `account_status_text` varchar(255) DEFAULT NULL,
  `account_new_email` varchar(255) DEFAULT NULL,
  `account_new_password` varchar(255) DEFAULT NULL,
  `account_confirm_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` text,
  `province` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `other_skill` text,
  `experience` text,
  `id_card` int(13) DEFAULT NULL,
  `google_code` text,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_accounts` WRITE;
/*!40000 ALTER TABLE `an_accounts` DISABLE KEYS */;

INSERT INTO `an_accounts` (`account_id`, `type`, `account_username`, `account_email`, `account_salt`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_timezone`, `account_language`, `account_create`, `account_create_gmt`, `account_last_login`, `account_last_login_gmt`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`, `name`, `last_name`, `address`, `province`, `phone`, `other_skill`, `experience`, `id_card`, `google_code`)
VALUES
  (0,NULL,'Guest','none@localhost',NULL,NULL,'Guest',NULL,NULL,NULL,'UP7',NULL,'2012-04-03 19:25:44','2012-04-03 12:25:44',NULL,NULL,NULL,0,'You can\'t login with this account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1,NULL,'admin','i@me.com',NULL,'$2a$12$T3rcBsUcj/ZDApC3.Jsy8u/KLzEAvxbqEDLYs.KJSwamz7j49OtIu',NULL,NULL,NULL,NULL,'UP7',NULL,'2011-04-20 19:20:04','2011-04-20 12:20:04','2014-03-10 19:40:14','2014-03-10 12:40:14','e2135bb4faf4fb999e3bbebe86ed1cdf',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2,1,'root','o@me.com',NULL,'$2a$12$oNgNrpmbXPCOXtMUKGhoSuQQmJi62m1AEZgKGdzZJkcpTHtAW0Dzm',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 02:35:43','2014-01-24 19:35:43','2014-02-19 23:29:40','2014-02-19 16:29:40',NULL,1,NULL,NULL,NULL,'YEtYJS','name1','last_name1','21/1',102,'0888888888','no','no',2147483647,NULL),
  (3,1,'root2','iar@me.com',NULL,'$2a$12$oGjGwsgGFHIhEIjSA/WtruJ2NVK4GUe7I4F2po0yVeRiH2dFw9Bd.',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 02:39:51','2014-01-24 19:39:51','2014-01-26 01:11:31','2014-01-25 18:11:31',NULL,1,NULL,NULL,NULL,'v7hkHA','name2','last_name2','21/1',102,'0888888888','no','no',NULL,NULL),
  (4,2,'root_project','io@ma.com',NULL,'$2a$12$Z6jPW4ulZBCV.AUum4/24O023vqBsWS/DGrSFQRCgGygowb0R0GNq',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 18:06:39','2014-01-25 11:06:39','2014-03-10 19:46:44','2014-03-10 12:46:44',NULL,1,NULL,NULL,NULL,'5FA6Kc','name3','last_name3','21/1',102,'0888888888',NULL,NULL,2147483647,'<iframe width=\"425\" height=\"350\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.co.th/?ie=UTF8&ll=13.038936,101.490104&spn=28.528235,45.878906&t=h&z=5&output=embed\"></iframe><br /><small><a href=\"https://maps.google.co.th/?ie=UTF8&ll=13.038936,101.490104&spn=28.528235,45.878906&t=h&z=5&source=embed\" style=\"color:#0000FF;text-align:left\">ดูแผนที่ขนาดใหญ่ขึ้น</a></small>'),
  (5,2,'username','iu@me.com',NULL,'$2a$12$60AyQqT8uv7qEoOlchAC3elXwOuQP1OKcBfDhRfTFSHAzFIfqWVfa',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-02-08 14:27:29','2014-02-08 07:27:29','2014-02-20 23:54:29','2014-02-20 16:54:29',NULL,1,NULL,NULL,NULL,'KNwqfr','name','last_name','21/1',102,'0888888888',NULL,NULL,2147483647,NULL),
  (8,2,'root12','iooo@me.com',NULL,'$2a$12$BTLSMnzRjH0hQo1sOhbnh.yPGGjgwnO43QThMXjc7cN/K3YmxFFTK',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-02-20 00:20:29','2014-02-19 17:20:29',NULL,NULL,NULL,1,NULL,NULL,NULL,'LSA59q','jira','kand','21',101,'0886011666',NULL,NULL,2147483647,'code google'),
  (9,1,'root6','n.object12@gmail.com',NULL,'$2a$12$/QCxsMj8LH1Y0GolaRWHBuhOwt4233CAMnMTI3UPM054hwfJPWiia',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-02-22 15:12:56','2014-02-22 08:12:56','2014-03-05 23:57:54','2014-03-05 16:57:54',NULL,1,NULL,NULL,NULL,'UDewfu','jirayu','last_name','21/',102,'0888888888','','',2147483647,NULL);

/*!40000 ALTER TABLE `an_accounts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_blocks`;

CREATE TABLE `an_blocks` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `block_name` varchar(255) DEFAULT NULL,
  `block_file` varchar(255) DEFAULT NULL,
  `block_values` text,
  `block_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `block_except_uri` text,
  `block_only_uri` text,
  PRIMARY KEY (`block_id`),
  KEY `theme_system_name` (`theme_system_name`),
  KEY `area_name` (`area_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_ci_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_ci_sessions`;

CREATE TABLE `an_ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(50) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_ci_sessions` WRITE;
/*!40000 ALTER TABLE `an_ci_sessions` DISABLE KEYS */;

INSERT INTO `an_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`)
VALUES
  ('90fc4abda74d0ccad93d770173e255a9','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0',1394458963,'a:1:{s:9:\"user_data\";s:0:\"\";}'),
  ('ec45e7836ba49799f111a8827b01a774','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0',1394455603,'a:1:{s:9:\"user_data\";s:0:\"\";}');

/*!40000 ALTER TABLE `an_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_comment_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_comment_fields`;

CREATE TABLE `an_comment_fields` (
  `comment_id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_comments`;

CREATE TABLE `an_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'comment author''s name',
  `subject` varchar(255) DEFAULT NULL,
  `comment_body_value` longtext,
  `email` varchar(255) DEFAULT NULL COMMENT 'comment author''s email',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'comment author''s homepage',
  `comment_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=not publish, 1=published',
  `comment_spam_status` varchar(100) NOT NULL DEFAULT 'normal' COMMENT 'comment spam status (normal, spam, ham, what ever)',
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `comment_add` bigint(20) DEFAULT NULL,
  `comment_add_gmt` bigint(20) DEFAULT NULL,
  `comment_update` bigint(20) DEFAULT NULL,
  `comment_update_gmt` bigint(20) DEFAULT NULL,
  `thread` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `account_id` (`account_id`),
  KEY `post_id` (`post_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_config`;

CREATE TABLE `an_config` (
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `config_core` int(1) DEFAULT '0' COMMENT '0=no, 1=yes. if config core then please do not delete from db.',
  `config_description` text,
  KEY `config_name` (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_config` WRITE;
/*!40000 ALTER TABLE `an_config` DISABLE KEYS */;

INSERT INTO `an_config` (`config_name`, `config_value`, `config_core`, `config_description`)
VALUES
  ('site_name','Employment',1,'website name'),
  ('page_title_separator',' &rsaquo; ',1,'page title separator. eg. site name | page'),
  ('site_timezone','UP7',1,'website default timezone'),
  ('duplicate_login','1',1,'allow log in more than 1 place, session? set to 1/0 to allow/disallow.'),
  ('allow_avatar','1',1,'set to 1 if use avatar or set to 0 if not use it.'),
  ('avatar_size','200',1,'set file size in Kilobyte.'),
  ('avatar_allowed_types','gif|jpg|png',1,'avatar allowe file types (see reference from codeigniter)\r\neg. gif|jpg|png'),
  ('avatar_path','public/upload/avatar/',1,'path to directory for upload avatar'),
  ('member_allow_register','1',1,'allow users to register'),
  ('member_register_notify_admin','0',1,'send email to notify admin when new member register?'),
  ('member_verification','1',1,'member verification method.\r\n1 = verify by email\r\n2 = wait for admin verify'),
  ('member_admin_verify_emails','i@me.com',1,'emails of administrators to notice them when new member registration'),
  ('mail_protocol','mail',1,'The mail sending protocol.\r\nmail, sendmail, smtp'),
  ('mail_mailpath','/usr/sbin/sendmail',1,'The server path to Sendmail.'),
  ('mail_smtp_host','localhost',1,'SMTP Server Address.'),
  ('mail_smtp_user','i@me.com',1,'SMTP Username.'),
  ('mail_smtp_pass','',1,'SMTP Password.'),
  ('mail_smtp_port','25',1,'SMTP Port.'),
  ('mail_sender_email','i@me.com',1,'Email for \'sender\''),
  ('content_show_title','1',1,'show h1 content title'),
  ('content_show_time','1',1,'show content time. (publish, update, ...)'),
  ('content_show_author','1',1,'show content author.'),
  ('content_items_perpage','10',1,'number of posts per page.'),
  ('comment_allow',NULL,1,'allow site-wide new comment?\r\n0=no, 1=yes, null=up to each post\'s setting'),
  ('comment_show_notallow','0',1,'list old comments even if comment setting change to not allow new comment?\r\n0=not show, 1=show\r\nif 0 the system will not show comments when setting to not allow new comment.'),
  ('comment_perpage','40',1,'number of comments per page'),
  ('comment_new_notify_admin','1',1,'notify admin when new comment?\r\n0=no, 1=yes(require moderation only), 2=yes(all)'),
  ('comment_admin_notify_emails','i@me.com',1,'emails of administrators to notify when new comment or moderation required ?'),
  ('media_allowed_types','7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip',1,'media upload allowed file types.\r\nthese types must specified mime-type in config/mimes.php'),
  ('agni_version','1.4',1,'current Agni CMS version. use for compare with auto update.'),
  ('angi_auto_update','1',1,'enable auto update. recommended setting to \'true\' (1 = true, 0 = false) for use auto update, but if you want manual update (core hacking or custom modification through core files) set to false.'),
  ('agni_auto_update_url','http://agnicms.org/modules/updateservice/update.xml',1,'url of auto update.'),
  ('agni_system_cron','1',1,'agni system cron. set to true (1) if you want to run cron from system or set to false (0) if you already have real cron job call to http://yourdomain.tld/path-installed/cron .'),
  ('ftp_host','',1,'FTP host name. ftp is very useful in update/download files from remote host to current host.'),
  ('ftp_username','',1,'FTP username'),
  ('ftp_password','',1,'FTP password'),
  ('ftp_port','21',1,'FTP port. usually is 21'),
  ('ftp_passive','true',1,'FTP passive mode'),
  ('ftp_basepath','/public_html/',1,'FTP base path. store path to public html (web root)');

/*!40000 ALTER TABLE `an_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_files`;

CREATE TABLE `an_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `folder` text COMMENT 'contain path to folder that store this file.',
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_client_name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_ext` varchar(50) DEFAULT NULL,
  `file_size` int(11) NOT NULL DEFAULT '0',
  `media_name` varchar(255) DEFAULT NULL COMMENT 'name this file for use in frontend.',
  `media_description` text,
  `media_keywords` varchar(255) DEFAULT NULL,
  `file_add` bigint(20) DEFAULT NULL,
  `file_add_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_frontpage_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_frontpage_category`;

CREATE TABLE `an_frontpage_category` (
  `tid` int(11) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_job`;

CREATE TABLE `an_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_job` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `an_job` WRITE;
/*!40000 ALTER TABLE `an_job` DISABLE KEYS */;

INSERT INTO `an_job` (`id`, `name_job`)
VALUES
  (1,'job1'),
  (2,'job2'),
  (3,'job3'),
  (4,'job4'),
  (5,'job5'),
  (6,'job6');

/*!40000 ALTER TABLE `an_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_job_ref_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_job_ref_account`;

CREATE TABLE `an_job_ref_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_account` int(11) DEFAULT NULL,
  `id_job` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_job_ref_account` WRITE;
/*!40000 ALTER TABLE `an_job_ref_account` DISABLE KEYS */;

INSERT INTO `an_job_ref_account` (`id`, `id_account`, `id_job`)
VALUES
  (22,2,4),
  (23,2,5),
  (24,2,6),
  (31,2,3),
  (32,3,1),
  (33,3,2),
  (34,3,3),
  (36,9,4),
  (37,9,1),
  (38,9,2);

/*!40000 ALTER TABLE `an_job_ref_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_menu_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_menu_groups`;

CREATE TABLE `an_menu_groups` (
  `mg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(255) DEFAULT NULL,
  `mg_description` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_menu_items`;

CREATE TABLE `an_menu_items` (
  `mi_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `mg_id` int(11) DEFAULT NULL COMMENT 'menu group id',
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `mi_type` varchar(255) DEFAULT NULL COMMENT 'refer to post_type, tax_type, link, custom_link',
  `type_id` int(11) DEFAULT NULL,
  `link_url` text,
  `link_text` varchar(255) DEFAULT NULL,
  `custom_link` text COMMENT 'when normal link field doesn''t fullfill your need',
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mi_id`),
  KEY `mg_id` (`mg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_module_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_module_sites`;

CREATE TABLE `an_module_sites` (
  `module_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `module_enable` int(1) NOT NULL DEFAULT '0',
  `module_install` int(1) NOT NULL DEFAULT '0' COMMENT 'use when the module want to install db, script or anything.',
  PRIMARY KEY (`module_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_module_sites` WRITE;
/*!40000 ALTER TABLE `an_module_sites` DISABLE KEYS */;

INSERT INTO `an_module_sites` (`module_site_id`, `module_id`, `site_id`, `module_enable`, `module_install`)
VALUES
  (1,1,1,1,0);

/*!40000 ALTER TABLE `an_module_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_modules`;

CREATE TABLE `an_modules` (
  `module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_system_name` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `module_version` varchar(30) DEFAULT NULL,
  `module_description` text,
  `module_author` varchar(255) DEFAULT NULL,
  `module_author_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_system_name` (`module_system_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_modules` WRITE;
/*!40000 ALTER TABLE `an_modules` DISABLE KEYS */;

INSERT INTO `an_modules` (`module_id`, `module_system_name`, `module_name`, `module_url`, `module_version`, `module_description`, `module_author`, `module_author_url`)
VALUES
  (1,'core','Agni core module.','http://www.agnicms.org',NULL,'Agni cms core module.','vee w.','http://okvee.net');

/*!40000 ALTER TABLE `an_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_post_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_post_fields`;

CREATE TABLE `an_post_fields` (
  `post_id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store each field of posts';



# Dump of table em_post_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_post_revision`;

CREATE TABLE `an_post_revision` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `header_value` text,
  `body_value` longtext,
  `body_summary` text,
  `log` text COMMENT 'explain that what was changed',
  `revision_date` bigint(20) DEFAULT NULL,
  `revision_date_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_posts`;

CREATE TABLE `an_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `post_type` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `post_uri` tinytext,
  `post_uri_encoded` text,
  `post_feature_image` int(11) DEFAULT NULL COMMENT 'refer to file id',
  `post_comment` int(1) NOT NULL DEFAULT '0' COMMENT 'allow comment? 0=no, 1=yes',
  `post_status` int(1) NOT NULL DEFAULT '1' COMMENT 'published? 0=no, 1=yes',
  `post_add` bigint(20) DEFAULT NULL,
  `post_add_gmt` bigint(20) DEFAULT NULL,
  `post_update` bigint(20) DEFAULT NULL,
  `post_update_gmt` bigint(20) DEFAULT NULL,
  `post_publish_date` bigint(20) DEFAULT NULL,
  `post_publish_date_gmt` bigint(20) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content_settings` text COMMENT 'store serialize array of settings',
  `comment_count` int(9) NOT NULL DEFAULT '0',
  `view_count` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='for content-type article, pages, static content.';



# Dump of table em_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_project`;

CREATE TABLE `an_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `project_code` text NOT NULL,
  `project_name` text NOT NULL,
  `project_detail` text NOT NULL,
  `long_term` varchar(30) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `count_countact` int(11) NOT NULL,
  `create_date` varchar(30) NOT NULL,
  `end_date` int(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_project` WRITE;
/*!40000 ALTER TABLE `an_project` DISABLE KEYS */;

INSERT INTO `an_project` (`id`, `account_id`, `project_code`, `project_name`, `project_detail`, `long_term`, `price`, `count_countact`, `create_date`, `end_date`, `status`)
VALUES
  (1,4,'2390504','ทดสอบการทำงาน 1','เนื้อหา','30',10000,1,'1394038302',1395248400,1),
  (2,4,'99911426','ทดสอบการทำงาน111111','เนื้อหา','30',5000,0,'1393058616',1393520400,1),
  (3,4,'51527490','ทดสอบการทำงาน 2','2ff','30',3000,0,'1392915642',13,1),
  (4,4,'33213983','ทดสอบการทำงาน','tset','30',2222,0,'1393058694',0,1),
  (5,4,'87096529','ทดสอบการทำงาน 3','test','30',10000,0,'1394038307',-25200,1),
  (6,4,'49571937','ทดสอบการทำงาน 4','test','30',10000,0,'1394038314',-25200,1),
  (7,4,'94199027','ทดสอบการทำงาน 5','เนื้อหา','30',3000,0,'1394038320',-25200,1),
  (8,4,'61691518','projecr','detail','90',900,0,'1394265337',1394298000,1);

/*!40000 ALTER TABLE `an_project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_project_log_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_project_log_price`;

CREATE TABLE `an_project_log_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref_project_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `price` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_project_log_price` WRITE;
/*!40000 ALTER TABLE `an_project_log_price` DISABLE KEYS */;

INSERT INTO `an_project_log_price` (`id`, `ref_project_id`, `account_id`, `detail`, `price`)
VALUES
  (7,1,2,'ทดสอบรายละเอียด',300),
  (8,1,9,'เอาด้วย',90),
  (9,1,9,'1',90);

/*!40000 ALTER TABLE `an_project_log_price` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_project_ref_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_project_ref_job`;

CREATE TABLE `an_project_ref_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `id_job` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_project_ref_job` WRITE;
/*!40000 ALTER TABLE `an_project_ref_job` DISABLE KEYS */;

INSERT INTO `an_project_ref_job` (`id`, `project_id`, `id_job`)
VALUES
  (31,3,1),
  (32,3,2),
  (33,3,3),
  (34,3,4),
  (56,2,4),
  (57,2,5),
  (58,2,6),
  (59,4,1),
  (60,4,5),
  (63,1,1),
  (64,5,1),
  (65,5,2),
  (66,6,1),
  (67,6,2),
  (68,7,1),
  (71,8,1),
  (72,8,2);

/*!40000 ALTER TABLE `an_project_ref_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_province`;

CREATE TABLE `an_province` (
  `id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name_province` text COLLATE utf8_unicode_ci,
  `name_province_en` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `an_province` WRITE;
/*!40000 ALTER TABLE `an_province` DISABLE KEYS */;

INSERT INTO `an_province` (`id`, `name_province`, `name_province_en`)
VALUES
  ('101','กระบี่','Krabi'),
  ('102','กรุงเทพมหานคร','Bangkok'),
  ('103','กาญจนบุรี','Kanchanaburi'),
  ('104','กาฬสินธุ์','Kalasin'),
  ('105','กำแพงเพชร','Kamphaeng Phet'),
  ('106','ขอนแก่น','Khon Kaen'),
  ('107','จันทบุรี','Chanthaburi'),
  ('108','ฉะเชิงเทรา','Chachoengsao'),
  ('109','ชลบุรี','Chon Buri'),
  ('110','ชัยนาท','Chai Nat'),
  ('111','ชัยภูมิ','Chaiyaphum'),
  ('112','ชุมพร','Chumphon'),
  ('113','ตรัง','Trang'),
  ('114','ตราด','Trat'),
  ('115','ตาก','Tak'),
  ('116','นครนายก','Nakhon Nayok'),
  ('117','นครปฐม','Nakhon Pathom'),
  ('118','นครพนม','Nakhon Phanom'),
  ('119','นครราชสีมา','Nakhon Ratchasima'),
  ('120','นครศรีธรรมราช','Nakhon Si Thammarat'),
  ('121','นครสวรรค์','Nakhon Sawan'),
  ('122','นนทบุรี','Nonthaburi'),
  ('123','นราธิวาส','Narathiwat'),
  ('124','น่าน','Nan'),
  ('125','บุรีรัมย์','Buri Ram'),
  ('126','ปทุมธานี','Pathum Thani'),
  ('127','ประจวบคีรีขันธ์','Prachuap Khiri Khan'),
  ('128','ปราจีนบุรี','Prachin Buri'),
  ('129','ปัตตานี','Pattani'),
  ('130','พระนครศรีอยุธยา','Phra Nakhon Si Ayutthaya'),
  ('131','พะเยา','Phayao'),
  ('132','พังงา','Phangnga'),
  ('133','พัทลุง','Phatthalung'),
  ('134','พิจิตร','Phichit'),
  ('135','พิษณุโลก','Phitsanulok'),
  ('136','ภูเก็ต','Phuket'),
  ('137','มหาสารคาม','Maha Sarakham'),
  ('138','มุกดาหาร','Mukdaharn'),
  ('139','ยะลา','Yala'),
  ('140','ยโสธร','Yasothon'),
  ('141','ระนอง','Ranong'),
  ('142','ระยอง','Rayong'),
  ('143','ราชบุรี','Ratchaburi'),
  ('144','ร้อยเอ็ด','Roi-ed'),
  ('145','ลพบุรี','Lop Buri'),
  ('146','ลำปาง','Lampang'),
  ('147','ลำพูน','Lampoon'),
  ('148','ศรีสะเกษ','Srisaket\n'),
  ('149','สกลนคร','Sakhon Nakhon'),
  ('150','สงขลา','Songkhla'),
  ('151','สตูล','Sathon'),
  ('152','สมุทรปราการ','Samut Prakan'),
  ('153','สมุทรสงคราม','Samut Songkhram'),
  ('154','สมุทรสาคร','Samut Sakhon'),
  ('155','สระบุรี','Sara Buri'),
  ('156','สระแก้ว','Sa Kaeo'),
  ('157','สิงห์บุรี','Sing Buri'),
  ('158','สุพรรณบุรี','Suphan Buri'),
  ('159','สุราษฎร์ธานี','Surat Thani'),
  ('160','สุรินทร์','Surin'),
  ('161','สุโขทัย','Sukhothai'),
  ('162','หนองคาย','Nong Khai'),
  ('163','หนองบัวลำภู','Nong Bua Lamphu'),
  ('164','อำนาจเจริญ','Amnat Charoen'),
  ('165','อุดรธานี','Udon Thani'),
  ('166','อุตรดิตถ์','Uttaradit'),
  ('167','อุทัยธานี','Uthai Thani'),
  ('168','อุบลราชธานี','Ubon Ratchathani'),
  ('169','อ่างทอง','Ang Thong'),
  ('170','เชียงราย','Chiang Rai'),
  ('171','เชียงใหม่','Chiang Mai'),
  ('172','เพชรบุรี','Phetchaburi'),
  ('173','เพชรบูรณ์','Phetchabun'),
  ('174','เลย','Loei'),
  ('175','แพร่','Prae'),
  ('176','แม่ฮ่องสอน','Mae Hong Son');

/*!40000 ALTER TABLE `an_province` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_queue`;

CREATE TABLE `an_queue` (
  `queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(255) DEFAULT NULL,
  `queue_data` longtext,
  `queue_create` bigint(20) DEFAULT NULL,
  `queue_update` bigint(20) DEFAULT NULL,
  `queue_expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store ''to do'' job queue.';



# Dump of table em_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_sites`;

CREATE TABLE `an_sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_domain` varchar(255) DEFAULT NULL COMMENT 'ex. domain.com, sub.domain.com with out http://',
  `site_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `site_create` bigint(20) DEFAULT NULL,
  `site_create_gmt` bigint(20) DEFAULT NULL,
  `site_update` bigint(20) DEFAULT NULL,
  `site_update_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_sites` WRITE;
/*!40000 ALTER TABLE `an_sites` DISABLE KEYS */;

INSERT INTO `an_sites` (`site_id`, `site_name`, `site_domain`, `site_status`, `site_create`, `site_create_gmt`, `site_update`, `site_update_gmt`)
VALUES
  (1,'Employment','employment.dev',1,1385573954,1385548754,1385990039,1385964839);

/*!40000 ALTER TABLE `an_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_syslog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_syslog`;

CREATE TABLE `an_syslog` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'system log id',
  `account_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `sl_type` varchar(100) DEFAULT NULL COMMENT 'log type. example system, user action',
  `sl_message` text,
  `sl_variables` longtext,
  `sl_url` tinytext COMMENT 'url of event.',
  `sl_referer` tinytext COMMENT 'url referer of event',
  `sl_ipaddress` varchar(50) DEFAULT NULL,
  `sl_datetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contain system log.';

LOCK TABLES `an_syslog` WRITE;
/*!40000 ALTER TABLE `an_syslog` DISABLE KEYS */;

INSERT INTO `an_syslog` (`sl_id`, `account_id`, `site_id`, `sl_type`, `sl_message`, `sl_variables`, `sl_url`, `sl_referer`, `sl_ipaddress`, `sl_datetime`)
VALUES
  (11,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1259:\"OXL_yjuXw_cookie=ab1985ee7b8c4e3190375429ee16434c; OXL_user_lang=th; PHPSESSID=6f463723aed36492fb8e82ba11b8bbf1; OXL_ci_session=LHSmQo%2BMn31%2BQqS84uRaIe8r95ZJwNzF2XOSvkO5yVDZ3CMafdXeC9o5GVW5DBneUP49Ib09Jc2yZsl5soeXGpt4kkOTeKcLexmcJxkil4nwHTPfwHrUzBhhduWwF6rUj42DPp20Jfn2ssj5wDKBYoXSbVUUnht4kXNHwExK04Ivrk7J67EuUOy9X6NXb7FD6CFR%2BoT1Y%2BxiDuaFpDYVSR7%2FyV1OWC%2BCdmeb4LsQj%2FlHLaBIvkA5uSaMYZ8v%2FKzY2idPUnzrKxwUiFJiAljc0kS%2FSIS5Rxpz1%2F%2Fk%2BoTo4QgS153zuIDdm8nDYwYRxhsjubNGAcmPEnBi4xOmpUNX%2BGEpYaRxxSTuxf4egwVGSfWM6YdtDowof2Ulds7QSApC; OXL_member_account=9J4lbz1Dsu9wBOPgVTcCd6gxfMbIx6eRP4zjHRz4suxqptmJvAHQZ957LFYOmjhzxMlZX8hHPIPognKyswrqKjcaOa08PWGlETvQF%2BUR%2FhM5G709K%2FVqX45fae2WdJgCKAbIBinht7vU88SIv5Z1CHkZScCt2UIe9XAJ%2FANAD0rSgGfMQFu0nV6Mh6OHwIgpK3RUbypDWPDim%2BYhUOcwxVLbF6DMg7SqxvPtuz95%2Fi8LUmI33f5BE4kA7Km8VGHyH9fXCh6D7rBx7QgoAQzhDPH%2FaJ2YWC5x57rf2DCkEOFeFJW9F49ishKlY4Apvwkv1bWb44qdUEGHZKxccZu4Pw%3D%3D; OXL_admin_account=PEK6KYNQY25OiCBcS4Oynl6xAB803wTXQW08EWbYZ3ms6B6jijSNyu9ao8kanWE0XrP5mq%2B9xpnVPn9FyYN3FNILBlw9Av2lNPp9nra0fO11bIv83tcewBUzO8G7A3Atzx%2BOk58OES31QYMrYj3mEBJzmkhm0KjDZiwvRzbAw1bDVEsdo%2FzwivQowHrInYpV4OtixiWCv14Q3vBzWMN3bs7d0%2Ff7%2Fs5seBgd7dfCW%2BzLSkplxpyCv171%2FeNgrUxyy9c8GOTfDNe%2BStHAioa75v6LCIGAxgYbduqxA0DBIJM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49544\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1390586854.032000064849853515625;s:12:\"REQUEST_TIME\";i:1390586854;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1390586854),
  (12,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1259:\"OXL_yjuXw_cookie=ab1985ee7b8c4e3190375429ee16434c; OXL_user_lang=th; PHPSESSID=6f463723aed36492fb8e82ba11b8bbf1; OXL_ci_session=LHSmQo%2BMn31%2BQqS84uRaIe8r95ZJwNzF2XOSvkO5yVDZ3CMafdXeC9o5GVW5DBneUP49Ib09Jc2yZsl5soeXGpt4kkOTeKcLexmcJxkil4nwHTPfwHrUzBhhduWwF6rUj42DPp20Jfn2ssj5wDKBYoXSbVUUnht4kXNHwExK04Ivrk7J67EuUOy9X6NXb7FD6CFR%2BoT1Y%2BxiDuaFpDYVSR7%2FyV1OWC%2BCdmeb4LsQj%2FlHLaBIvkA5uSaMYZ8v%2FKzY2idPUnzrKxwUiFJiAljc0kS%2FSIS5Rxpz1%2F%2Fk%2BoTo4QgS153zuIDdm8nDYwYRxhsjubNGAcmPEnBi4xOmpUNX%2BGEpYaRxxSTuxf4egwVGSfWM6YdtDowof2Ulds7QSApC; OXL_member_account=9J4lbz1Dsu9wBOPgVTcCd6gxfMbIx6eRP4zjHRz4suxqptmJvAHQZ957LFYOmjhzxMlZX8hHPIPognKyswrqKjcaOa08PWGlETvQF%2BUR%2FhM5G709K%2FVqX45fae2WdJgCKAbIBinht7vU88SIv5Z1CHkZScCt2UIe9XAJ%2FANAD0rSgGfMQFu0nV6Mh6OHwIgpK3RUbypDWPDim%2BYhUOcwxVLbF6DMg7SqxvPtuz95%2Fi8LUmI33f5BE4kA7Km8VGHyH9fXCh6D7rBx7QgoAQzhDPH%2FaJ2YWC5x57rf2DCkEOFeFJW9F49ishKlY4Apvwkv1bWb44qdUEGHZKxccZu4Pw%3D%3D; OXL_admin_account=PEK6KYNQY25OiCBcS4Oynl6xAB803wTXQW08EWbYZ3ms6B6jijSNyu9ao8kanWE0XrP5mq%2B9xpnVPn9FyYN3FNILBlw9Av2lNPp9nra0fO11bIv83tcewBUzO8G7A3Atzx%2BOk58OES31QYMrYj3mEBJzmkhm0KjDZiwvRzbAw1bDVEsdo%2FzwivQowHrInYpV4OtixiWCv14Q3vBzWMN3bs7d0%2Ff7%2Fs5seBgd7dfCW%2BzLSkplxpyCv171%2FeNgrUxyy9c8GOTfDNe%2BStHAioa75v6LCIGAxgYbduqxA0DBIJM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49544\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1390586854.032000064849853515625;s:12:\"REQUEST_TIME\";i:1390586854;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1390586854),
  (13,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1308:\"ui-tabs-1=1; OXL_yjuXw_cookie=f700590cd01142adacf6a7bf51a77526; OXL_user_lang=th; PHPSESSID=292abd13df1a2c2ed57b50010a42641b; OXL_ci_session=aqPE%2FZAXpTq%2F4plXsqH4goFSbzwqecpDXx7KzhIerdKHtHQfTdfFG6K7PgAf%2BcDacB6h%2FyBYhFWpqYZPjN2gUHztVVxHJEe5qs5uYyHHHxAEGqxEPIK%2BxaATA4pX1wrwJMm3GrpqqE0DVaidzuDlxNQq%2BtDeZjWnlQfzCq3IP1qZ%2BNMiM8Pz9TyW%2F3%2B%2Fqy69ePk%2FsE4o8l5gaMCBptTIhiPPJTIwThwy3nS4Q3HlApmAWCPsa7cMxnFkaDoloYhxAbSvDyligKAgUGFFH0ZeGURVDo%2FmrYjKJlgH6vbA%2BtBqqkyf6cNL5tqPWcOc7G03mQ%2F38OJwHqmhIBrBqZ05%2FoSSOGX9bTdwtr55%2BrFsW4u8ahY1tG%2F0ZYhast2oPMsz; OXL_member_account=ZG1%2BHRrFe%2BMqTHqwBUxgrn0yRlFp0hD7fPOfXyjT3a3STjgeq%2FaaQlzOb8776Ntc5eKn6vgahVY%2BcRMOE1rp5XW7ckNraxE0JBX3uOCi1RPboJCCxZCWGVyHBme5pQS7Z6EsQhf%2Fmp%2FwjZFqawCHxL6lRbuAd6wzGVQUUbe5BvkXBvViBUF5gZKNCL377mZJ%2FM6UxBQKJ%2FNSkDc%2FKV9mqzXmfR7Z4%2F2tzg%2Fm7SSiTg%2FAMRZR5lvS1Q%2FMSXEwuL1g8PMoFT0rd5BPZAv2OTW3JP9ks%2FsB4zjQpJZaZYOjVL62G2%2Bxpuw%2FlqHig%2FMMoS6XA8rNZggU9VggMiks%2BvMZAQ%3D%3D; OXL_admin_account=9DCzXgN7Pz%2Ba4imz6kRzbW1dc%2FgLUBIjEXAeeCtVEfxXsqdRbMksgJnIF%2BuGRQRzl%2FtfgGymipJiQh8TobyCh9zcbXfdzPh5FeTOLn7oXL6aXuaWyJ0czgXJpHjOxRQDZj8HitmOwr5b5pZN7ArtmCjuHOjdGLO3lIM7gH%2B89jqmihQHs%2FBAo%2FCTJQxYIVKokKDx9TeiKFVflWrgORYxR5mZLuUdvkcbrY4l16Stz7mvIwv8EYI2J4TVzceenrR%2FhZ4enKvam86BZde8%2Bh2exx%2FjJL4CnUsE5TDp%2BtQfFBo%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49211\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1391845296.665999889373779296875;s:12:\"REQUEST_TIME\";i:1391845296;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1391845296),
  (14,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1308:\"ui-tabs-1=1; OXL_yjuXw_cookie=f700590cd01142adacf6a7bf51a77526; OXL_user_lang=th; PHPSESSID=292abd13df1a2c2ed57b50010a42641b; OXL_ci_session=aqPE%2FZAXpTq%2F4plXsqH4goFSbzwqecpDXx7KzhIerdKHtHQfTdfFG6K7PgAf%2BcDacB6h%2FyBYhFWpqYZPjN2gUHztVVxHJEe5qs5uYyHHHxAEGqxEPIK%2BxaATA4pX1wrwJMm3GrpqqE0DVaidzuDlxNQq%2BtDeZjWnlQfzCq3IP1qZ%2BNMiM8Pz9TyW%2F3%2B%2Fqy69ePk%2FsE4o8l5gaMCBptTIhiPPJTIwThwy3nS4Q3HlApmAWCPsa7cMxnFkaDoloYhxAbSvDyligKAgUGFFH0ZeGURVDo%2FmrYjKJlgH6vbA%2BtBqqkyf6cNL5tqPWcOc7G03mQ%2F38OJwHqmhIBrBqZ05%2FoSSOGX9bTdwtr55%2BrFsW4u8ahY1tG%2F0ZYhast2oPMsz; OXL_member_account=ZG1%2BHRrFe%2BMqTHqwBUxgrn0yRlFp0hD7fPOfXyjT3a3STjgeq%2FaaQlzOb8776Ntc5eKn6vgahVY%2BcRMOE1rp5XW7ckNraxE0JBX3uOCi1RPboJCCxZCWGVyHBme5pQS7Z6EsQhf%2Fmp%2FwjZFqawCHxL6lRbuAd6wzGVQUUbe5BvkXBvViBUF5gZKNCL377mZJ%2FM6UxBQKJ%2FNSkDc%2FKV9mqzXmfR7Z4%2F2tzg%2Fm7SSiTg%2FAMRZR5lvS1Q%2FMSXEwuL1g8PMoFT0rd5BPZAv2OTW3JP9ks%2FsB4zjQpJZaZYOjVL62G2%2Bxpuw%2FlqHig%2FMMoS6XA8rNZggU9VggMiks%2BvMZAQ%3D%3D; OXL_admin_account=9DCzXgN7Pz%2Ba4imz6kRzbW1dc%2FgLUBIjEXAeeCtVEfxXsqdRbMksgJnIF%2BuGRQRzl%2FtfgGymipJiQh8TobyCh9zcbXfdzPh5FeTOLn7oXL6aXuaWyJ0czgXJpHjOxRQDZj8HitmOwr5b5pZN7ArtmCjuHOjdGLO3lIM7gH%2B89jqmihQHs%2FBAo%2FCTJQxYIVKokKDx9TeiKFVflWrgORYxR5mZLuUdvkcbrY4l16Stz7mvIwv8EYI2J4TVzceenrR%2FhZ4enKvam86BZde8%2Bh2exx%2FjJL4CnUsE5TDp%2BtQfFBo%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49211\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1391845296.665999889373779296875;s:12:\"REQUEST_TIME\";i:1391845296;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1391845296),
  (15,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1294:\"ui-tabs-1=1; OXL_yjuXw_cookie=643c4d09a5556fed75b8cf1b9eb6b97f; OXL_user_lang=th; PHPSESSID=8653158c54ca31e3ff69c558434b5fd3; OXL_ci_session=%2F8Uv63OmV6%2FxOF14wBv856m%2BPNT%2BtQ18QgrmTF306nv728D2PoYKq65b4Zkc%2FSBezyQISQf2NTby0ICGhp1Vw4IAg%2FyC9z4hoXAvz4lOSpqn8MuYfSH%2FCO8%2BDBvUFP3G%2FRkmJMj4fD3TfM4njiQB%2BVeRvWAIS4vlFl0pp%2FOjSI%2BWTaK9flksaltFrVl6gesi01wEdl5qcLQB9ptFff5MoGxYi8obPbBmFAJm38bmq25IX9hZ206mDYpf%2Fus86ND8pAXqTLgARTGwedHDHDhU92DupegM%2F0mVKnQE61zpABM95cA9xvgRT3ZR8oM7eEmTEOas6UCQJbo7NPhgk9orW2vA9D5g%2BoBLQ0ZzQNF%2FdmfJrJnU%2Bfbsp0TLIgIFTONd; OXL_member_account=RlVoWwBEJWxrm%2Fs7%2BCDSQgG%2FMYuq8kpXZ%2BRixgjPTFDdpVKG4yQIF1tsyVaoIuvyVEZSLre1lJ0E6mPuzCNh%2BsBFLaPybQ8AFU5KOvADXPylRwWwSvVXIiLCOqCmYB2SAocGzdsD0QVpc03uGIqxFOcFvmEqvcSG1Gdid14%2FwlMOawJWItB%2Flc%2BZsyqkKdpZ%2F1rZAXBVjI0PJN46Eb4%2Ba6f9Muo%2FfkzwERGKCyLye3zbPbsbmSFvBYODjBL%2FFOy7lgyia%2FPqo27Zz2zIppgyXilf2%2BQZnFTtY6JabR39TFvOmlUnXn23ykkSOjZ00PcncrFiBQi42xTwuVFAlzIPDA%3D%3D; OXL_admin_account=woQI03Xoy3Mi77Ozt3%2FxsLYGQq4wlNwOExnQHeoV9FXftQr%2BunJktuoFvwpyiMuk%2BVtx4DfCvusOueVfL6RRPvvO7Z0xZujv4MNshMOYC8Zb5I89iBz9Kz32kIEoBRhCd6Fhd34L415MF7YMluPDpbF6Ob02Y8ZAv0Bbhv387ndxYdHRXVdTjmTplBry%2Bhy5uV3A1FB1%2FbvRJbxFVEi8ZzLjDC3FFmGztdrHE%2F7PYqG%2F7llQILSkXyUuzB1lA8eA%2BmpYbuZyPxjlotEkk3MoB8UJoxrSeER21ixAtvgWdd0%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49373\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1392524443.5880000591278076171875;s:12:\"REQUEST_TIME\";i:1392524443;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1392524443),
  (16,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1294:\"ui-tabs-1=1; OXL_yjuXw_cookie=643c4d09a5556fed75b8cf1b9eb6b97f; OXL_user_lang=th; PHPSESSID=8653158c54ca31e3ff69c558434b5fd3; OXL_ci_session=%2F8Uv63OmV6%2FxOF14wBv856m%2BPNT%2BtQ18QgrmTF306nv728D2PoYKq65b4Zkc%2FSBezyQISQf2NTby0ICGhp1Vw4IAg%2FyC9z4hoXAvz4lOSpqn8MuYfSH%2FCO8%2BDBvUFP3G%2FRkmJMj4fD3TfM4njiQB%2BVeRvWAIS4vlFl0pp%2FOjSI%2BWTaK9flksaltFrVl6gesi01wEdl5qcLQB9ptFff5MoGxYi8obPbBmFAJm38bmq25IX9hZ206mDYpf%2Fus86ND8pAXqTLgARTGwedHDHDhU92DupegM%2F0mVKnQE61zpABM95cA9xvgRT3ZR8oM7eEmTEOas6UCQJbo7NPhgk9orW2vA9D5g%2BoBLQ0ZzQNF%2FdmfJrJnU%2Bfbsp0TLIgIFTONd; OXL_member_account=RlVoWwBEJWxrm%2Fs7%2BCDSQgG%2FMYuq8kpXZ%2BRixgjPTFDdpVKG4yQIF1tsyVaoIuvyVEZSLre1lJ0E6mPuzCNh%2BsBFLaPybQ8AFU5KOvADXPylRwWwSvVXIiLCOqCmYB2SAocGzdsD0QVpc03uGIqxFOcFvmEqvcSG1Gdid14%2FwlMOawJWItB%2Flc%2BZsyqkKdpZ%2F1rZAXBVjI0PJN46Eb4%2Ba6f9Muo%2FfkzwERGKCyLye3zbPbsbmSFvBYODjBL%2FFOy7lgyia%2FPqo27Zz2zIppgyXilf2%2BQZnFTtY6JabR39TFvOmlUnXn23ykkSOjZ00PcncrFiBQi42xTwuVFAlzIPDA%3D%3D; OXL_admin_account=woQI03Xoy3Mi77Ozt3%2FxsLYGQq4wlNwOExnQHeoV9FXftQr%2BunJktuoFvwpyiMuk%2BVtx4DfCvusOueVfL6RRPvvO7Z0xZujv4MNshMOYC8Zb5I89iBz9Kz32kIEoBRhCd6Fhd34L415MF7YMluPDpbF6Ob02Y8ZAv0Bbhv387ndxYdHRXVdTjmTplBry%2Bhy5uV3A1FB1%2FbvRJbxFVEi8ZzLjDC3FFmGztdrHE%2F7PYqG%2F7llQILSkXyUuzB1lA8eA%2BmpYbuZyPxjlotEkk3MoB8UJoxrSeER21ixAtvgWdd0%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49373\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1392524443.5880000591278076171875;s:12:\"REQUEST_TIME\";i:1392524443;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1392524443),
  (17,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1262:\"ui-tabs-1=1; OXL_yjuXw_cookie=4ad8cb7f36f9e16edf0970c37eef9d8e; OXL_user_lang=th; PHPSESSID=79252a4aaf4f0cc1c5a7c8e6154b2380; OXL_ci_session=x8U%2Fxi4NML4mVlmZh%2Bu3FrxeGfNH%2BXb0ilGpqtYLfWhL6m54S5mQrfTv8kDo0VmlgQkMCD7AlDsXPQNeC6vbGIKbuLqas31BoEA4FtUi8Pc%2BDceiOvKgCBxYlw4umO8Y9DQMxLC5DqZ%2FaAzkmmnY0y6ZUIZVy4p%2FxjI4yasGE5i1PpTr3QHduODPaA3YRviuGAHPtAFctf5aw7lpI3K4egY6wlVn3e94057araS%2BX7UP2gWFIVp7CfrSK0FioUCq0Yvge5KdBQPuAz%2FjmRfJrEZeIxcyKFwJA8hmD8bXL81F86IEJQ5UTjC0QIrAGDdv61rvD33HdxnEK9x751Aua888sCiRVIjm%2B0HWDbhvVkyPlDyVkKoB%2FngHGjl6vZtt; OXL_member_account=fWiUMdkwO7ncf8fLZIJqa9t2pyR9laagotSlSh6bXrLMZdTrpXyCojP4blAEwyVe9MwK5yNHQQfkFxfyIw8Ca0sMlb4pY%2Bovf2EW0NhfQBUdrA6h7eHo41NvZK5cLAtovxy5HYKE3iZg2QDfBL4moEsremPWGuTUe3Zy%2FosQagXCrjdRAwIMtBQfXIZ2uDOvxOy2tPB8Gy3oCvKl%2FooIWUnDOKNoW18xu8CFMb6QG8hKYmUP41piStLUcEwmR0I03Mfi5CP6aa6y0dfyIESC3n206r5A4XOiWxJngUr5ccJzVQ%2B%2FUlJYJOOY56w5Qpjr7wJKCGngnbXW6O0qLtEpbQ%3D%3D; OXL_admin_account=pDZ8ee5JRBaqfEDu0yhhPPQUNsJk0XypfxYOQatj05K4EoDNX9d0y%2FjsShZGf0AfDdTvm%2B7JCOSSMt2%2BJY0wBwwi72FnBimIUPVsN%2BABPqmkMXfPAEQk7r5%2FBvJ1KauiOxQj3eQGlygLzCx7F5cdBSrMHpDNSsAnab3Eo9OtYz%2F2GPBDlrMJpEES0KG4EpEbhaH42ERRkfbXawISY%2FMMhou97oy7tWP8xQNSAAiwGbwackwWy002evQU5biXpeJQ0N8CaeIcJfiSDP8HBM%2BouSDzHdlq4akssWuDCOYlShw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49828\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1392915946.657000064849853515625;s:12:\"REQUEST_TIME\";i:1392915946;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1392915946),
  (18,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1262:\"ui-tabs-1=1; OXL_yjuXw_cookie=4ad8cb7f36f9e16edf0970c37eef9d8e; OXL_user_lang=th; PHPSESSID=79252a4aaf4f0cc1c5a7c8e6154b2380; OXL_ci_session=x8U%2Fxi4NML4mVlmZh%2Bu3FrxeGfNH%2BXb0ilGpqtYLfWhL6m54S5mQrfTv8kDo0VmlgQkMCD7AlDsXPQNeC6vbGIKbuLqas31BoEA4FtUi8Pc%2BDceiOvKgCBxYlw4umO8Y9DQMxLC5DqZ%2FaAzkmmnY0y6ZUIZVy4p%2FxjI4yasGE5i1PpTr3QHduODPaA3YRviuGAHPtAFctf5aw7lpI3K4egY6wlVn3e94057araS%2BX7UP2gWFIVp7CfrSK0FioUCq0Yvge5KdBQPuAz%2FjmRfJrEZeIxcyKFwJA8hmD8bXL81F86IEJQ5UTjC0QIrAGDdv61rvD33HdxnEK9x751Aua888sCiRVIjm%2B0HWDbhvVkyPlDyVkKoB%2FngHGjl6vZtt; OXL_member_account=fWiUMdkwO7ncf8fLZIJqa9t2pyR9laagotSlSh6bXrLMZdTrpXyCojP4blAEwyVe9MwK5yNHQQfkFxfyIw8Ca0sMlb4pY%2Bovf2EW0NhfQBUdrA6h7eHo41NvZK5cLAtovxy5HYKE3iZg2QDfBL4moEsremPWGuTUe3Zy%2FosQagXCrjdRAwIMtBQfXIZ2uDOvxOy2tPB8Gy3oCvKl%2FooIWUnDOKNoW18xu8CFMb6QG8hKYmUP41piStLUcEwmR0I03Mfi5CP6aa6y0dfyIESC3n206r5A4XOiWxJngUr5ccJzVQ%2B%2FUlJYJOOY56w5Qpjr7wJKCGngnbXW6O0qLtEpbQ%3D%3D; OXL_admin_account=pDZ8ee5JRBaqfEDu0yhhPPQUNsJk0XypfxYOQatj05K4EoDNX9d0y%2FjsShZGf0AfDdTvm%2B7JCOSSMt2%2BJY0wBwwi72FnBimIUPVsN%2BABPqmkMXfPAEQk7r5%2FBvJ1KauiOxQj3eQGlygLzCx7F5cdBSrMHpDNSsAnab3Eo9OtYz%2F2GPBDlrMJpEES0KG4EpEbhaH42ERRkfbXawISY%2FMMhou97oy7tWP8xQNSAAiwGbwackwWy002evQU5biXpeJQ0N8CaeIcJfiSDP8HBM%2BouSDzHdlq4akssWuDCOYlShw%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49828\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1392915946.657000064849853515625;s:12:\"REQUEST_TIME\";i:1392915946;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1392915946),
  (19,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:32:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1257:\"OXL_yjuXw_cookie=80254459c8b67a5d541d98630a378ca9; OXL_user_lang=th; PHPSESSID=3151acb44c19afe3f30c07fc56eefaaf; OXL_ci_session=hgcv5UTuNBqu4w%2BPZ4ORe%2Bz4BZYKV9H8c6CeY0FC%2BAfRB3DIcYF59E1EeK9zeTm8TKs62YO9DEDnjKwtezLNhcep2ZKSbK1QiJ%2FCKZ8pNX4X980IJMYCoc9GuU30TqkWVbkVkznlve%2BQQpsXn8TXUpPhuGtAEOCjP7VguuYQE8TC%2FYIMdLbjZTejx6SWMuLdu%2B%2BqdLnwsUXZg1SkoCiSxpJumj6NxibtmbXGZpGFG2zi3Cgu4tG7qRwfIdCcBkfAYiq1e0bVsiTk5gzFv1ToggdyuiOhOq6CJMDzsTp7kNLVOP6pKybjiBD2L8xVbgRxTIVjGvSIwGOTzXD3IbKR9gW8P%2BQ4YlEOwFxLli2eElzKKONPKN0ankobNR9MmfSm; OXL_member_account=OSD4If5NiN4bCaPMVJ%2Fqd5Oo35yEAqDvAybTCz1%2BPX5gLZ08ibW4gVVAV71lN5yq2qjAemOBKz5UhyvHTdZN2GkZK%2FU5xRvhMVlQYmvDr75LBWSI91JBy6O4qSbfSswG2W%2BhawRI4tMZRSRBN6uGjiIwgyEGgLNm%2F9SiwrWsm9I6IZuBgKLnPf0ftlCMj%2Blds3THmrunSWCsKci8nQCSYlyXGl4kiqDUdK6POX8%2FhKQOvxfh3rhe3MFfH1WVMhMZ2G4%2B%2BeOfzOvgMjrHxKXTTrCFXrgyelzrcbz%2BfS6HJ9d08NKhj9UJyemkhETy1Xh%2FlPE9hl6AqqHXKG3nrZ7JNQ%3D%3D; OXL_admin_account=f8DOD77idvUdkNM9qDDSDgtqis4B8lDPmH07CrE9b9amN2tn%2B9bIxfX8vLdlBNZSUqsl3bsAII7lMaEmj0i5Wd8c8bFu5kh1g28qxV6ydrbYxVld71AXJ6ajXqn0HOijPss7eNAwZ%2BPvRMMEJbm5wIUL4C2vA4YAfxKDZ8FK7Q2vH1RryNCrme%2BGgBhzfG5XG2WCDmk8sREUi7jaEq%2FUNQPWduZNEjTkyv1A8izVEKTDOi6v3ykHkzlfL8XRFVrUf%2BZqShu6MFPBQtDkDU5e9%2Bf5eaNzf9VWQvBccz%2BlXcg%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49427\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1394454875;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1394454875),
  (20,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:32:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1257:\"OXL_yjuXw_cookie=80254459c8b67a5d541d98630a378ca9; OXL_user_lang=th; PHPSESSID=3151acb44c19afe3f30c07fc56eefaaf; OXL_ci_session=hgcv5UTuNBqu4w%2BPZ4ORe%2Bz4BZYKV9H8c6CeY0FC%2BAfRB3DIcYF59E1EeK9zeTm8TKs62YO9DEDnjKwtezLNhcep2ZKSbK1QiJ%2FCKZ8pNX4X980IJMYCoc9GuU30TqkWVbkVkznlve%2BQQpsXn8TXUpPhuGtAEOCjP7VguuYQE8TC%2FYIMdLbjZTejx6SWMuLdu%2B%2BqdLnwsUXZg1SkoCiSxpJumj6NxibtmbXGZpGFG2zi3Cgu4tG7qRwfIdCcBkfAYiq1e0bVsiTk5gzFv1ToggdyuiOhOq6CJMDzsTp7kNLVOP6pKybjiBD2L8xVbgRxTIVjGvSIwGOTzXD3IbKR9gW8P%2BQ4YlEOwFxLli2eElzKKONPKN0ankobNR9MmfSm; OXL_member_account=OSD4If5NiN4bCaPMVJ%2Fqd5Oo35yEAqDvAybTCz1%2BPX5gLZ08ibW4gVVAV71lN5yq2qjAemOBKz5UhyvHTdZN2GkZK%2FU5xRvhMVlQYmvDr75LBWSI91JBy6O4qSbfSswG2W%2BhawRI4tMZRSRBN6uGjiIwgyEGgLNm%2F9SiwrWsm9I6IZuBgKLnPf0ftlCMj%2Blds3THmrunSWCsKci8nQCSYlyXGl4kiqDUdK6POX8%2FhKQOvxfh3rhe3MFfH1WVMhMZ2G4%2B%2BeOfzOvgMjrHxKXTTrCFXrgyelzrcbz%2BfS6HJ9d08NKhj9UJyemkhETy1Xh%2FlPE9hl6AqqHXKG3nrZ7JNQ%3D%3D; OXL_admin_account=f8DOD77idvUdkNM9qDDSDgtqis4B8lDPmH07CrE9b9amN2tn%2B9bIxfX8vLdlBNZSUqsl3bsAII7lMaEmj0i5Wd8c8bFu5kh1g28qxV6ydrbYxVld71AXJ6ajXqn0HOijPss7eNAwZ%2BPvRMMEJbm5wIUL4C2vA4YAfxKDZ8FK7Q2vH1RryNCrme%2BGgBhzfG5XG2WCDmk8sREUi7jaEq%2FUNQPWduZNEjTkyv1A8izVEKTDOi6v3ykHkzlfL8XRFVrUf%2BZqShu6MFPBQtDkDU5e9%2Bf5eaNzf9VWQvBccz%2BlXcg%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49427\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1394454875;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1394454875);

/*!40000 ALTER TABLE `an_syslog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_taxonomy_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_fields`;

CREATE TABLE `an_taxonomy_fields` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_taxonomy_index
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_index`;

CREATE TABLE `an_taxonomy_index` (
  `index_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'post id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'term id',
  `position` int(9) NOT NULL DEFAULT '1',
  `create` bigint(20) DEFAULT NULL COMMENT 'local date time',
  PRIMARY KEY (`index_id`),
  KEY `post_id` (`post_id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store id between taxonomy/posts';



# Dump of table em_taxonomy_term_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_taxonomy_term_data`;

CREATE TABLE `an_taxonomy_term_data` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) DEFAULT NULL,
  `t_type` varchar(255) DEFAULT NULL COMMENT 'type of taxonomy. eg. tag, category',
  `t_total` int(11) NOT NULL DEFAULT '0' COMMENT 'total posts relate to this.',
  `t_name` varchar(255) DEFAULT NULL,
  `t_description` longtext,
  `t_uri` tinytext,
  `t_uri_encoded` text,
  `t_uris` longtext COMMENT 'full path of uri, eg. animal/4legs/cat (no end slash and must uri encoded)',
  `t_position` int(9) NOT NULL DEFAULT '0' COMMENT 'for use as position order when some module need it.',
  `t_status` int(1) NOT NULL DEFAULT '1' COMMENT '0=not publish, 1=publish',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table em_theme_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_theme_sites`;

CREATE TABLE `an_theme_sites` (
  `theme_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `theme_enable` int(1) NOT NULL DEFAULT '0',
  `theme_default` int(1) NOT NULL DEFAULT '0',
  `theme_default_admin` int(11) NOT NULL DEFAULT '0',
  `theme_settings` text,
  PRIMARY KEY (`theme_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_theme_sites` WRITE;
/*!40000 ALTER TABLE `an_theme_sites` DISABLE KEYS */;

INSERT INTO `an_theme_sites` (`theme_site_id`, `theme_id`, `site_id`, `theme_enable`, `theme_default`, `theme_default_admin`, `theme_settings`)
VALUES
  (1,1,1,1,1,1,NULL);

/*!40000 ALTER TABLE `an_theme_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_themes`;

CREATE TABLE `an_themes` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_url` varchar(255) DEFAULT NULL,
  `theme_version` varchar(30) DEFAULT NULL,
  `theme_description` text,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_system_name` (`theme_system_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_themes` WRITE;
/*!40000 ALTER TABLE `an_themes` DISABLE KEYS */;

INSERT INTO `an_themes` (`theme_id`, `theme_system_name`, `theme_name`, `theme_url`, `theme_version`, `theme_description`)
VALUES
  (1,'system','System','http://www.agnicms.org','1.0','Agni system theme.');

/*!40000 ALTER TABLE `an_themes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_url_alias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_url_alias`;

CREATE TABLE `an_url_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_type` varchar(255) DEFAULT NULL COMMENT 'content type eg. article, page, category, tag, ...etc...',
  `c_id` int(11) DEFAULT NULL COMMENT 'those content id',
  `uri` tinytext,
  `uri_encoded` text,
  `redirect_to` tinytext COMMENT 'for use in url redirect',
  `redirect_to_encoded` text,
  `redirect_code` int(5) DEFAULT NULL COMMENT '301 permanent, 302 temporarily',
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`alias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
