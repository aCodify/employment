# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: employment
# Generation Time: 2557-01-28 14:18:43 +0000
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
  (5,3,4);

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
  (1,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0','Apple','Firefox 25.0','127.0.0.1','2013-11-28 12:40:02','2013-11-27 17:40:02',1,'Success'),
  (2,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0','Apple','Firefox 25.0','127.0.0.1','2013-12-01 01:54:32','2013-11-30 18:54:32',1,'Success'),
  (3,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0','Apple','Firefox 25.0','127.0.0.1','2013-12-02 08:13:29','2013-12-02 13:13:29',1,'Success'),
  (4,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0','Apple','Firefox 25.0','127.0.0.1','2013-12-08 03:41:05','2013-12-08 08:41:05',1,'Success'),
  (5,1,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 01:07:33','2014-01-24 18:07:33',1,'Success'),
  (6,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 03:00:41','2014-01-24 20:00:41',1,'Success'),
  (7,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 12:55:21','2014-01-25 05:55:21',1,'Success'),
  (8,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 12:56:26','2014-01-25 05:56:26',1,'Success'),
  (9,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 12:57:19','2014-01-25 05:57:19',1,'Success'),
  (10,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 01:03:02','2014-01-25 06:03:02',1,'Success'),
  (11,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 05:27:09','2014-01-25 10:27:09',1,'Success'),
  (12,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 05:27:37','2014-01-25 10:27:37',0,'Wrong username or password'),
  (13,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 05:30:44','2014-01-25 10:30:44',1,'Success'),
  (14,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-25 06:07:01','2014-01-25 11:07:01',1,'Success'),
  (15,3,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 01:11:31','2014-01-25 18:11:31',1,'Success'),
  (16,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 01:12:21','2014-01-25 18:12:21',1,'Success'),
  (17,4,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 01:20:36','2014-01-25 18:20:36',1,'Success'),
  (18,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 12:45:06','2014-01-26 05:45:06',1,'Success'),
  (19,2,1,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0','Apple','Firefox 26.0','127.0.0.1','2014-01-26 10:19:49','2014-01-26 15:19:49',1,'Success');

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
  (1,1,1,1390586853,1390561653,'f3a16462540505f5bd2ab5806acfe6ca'),
  (2,2,1,1390749589,1390724389,'25f2e03c38788fa48b77aa3a2d21d135'),
  (3,4,1,1390674036,1390648836,'0683ab33c9c9406b9769da09e3ea9706'),
  (4,3,1,1390673491,1390648291,'d16dcd0da8f70fb4083cd4ad89f52d23');

/*!40000 ALTER TABLE `an_account_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table em_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `an_accounts`;

CREATE TABLE `an_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `type` int(1) DEFAULT NULL,
  `id_card` int(13) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_accounts` WRITE;
/*!40000 ALTER TABLE `an_accounts` DISABLE KEYS */;

INSERT INTO `an_accounts` (`account_id`, `account_username`, `account_email`, `account_salt`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_timezone`, `account_language`, `account_create`, `account_create_gmt`, `account_last_login`, `account_last_login_gmt`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`, `name`, `last_name`, `address`, `province`, `phone`, `other_skill`, `experience`, `type`, `id_card`)
VALUES
  (0,'Guest','none@localhost',NULL,NULL,'Guest',NULL,NULL,NULL,'UP7',NULL,'2012-04-03 19:25:44','2012-04-03 12:25:44',NULL,NULL,NULL,0,'You can\'t login with this account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (1,'admin','i@me.com',NULL,'$2a$12$T3rcBsUcj/ZDApC3.Jsy8u/KLzEAvxbqEDLYs.KJSwamz7j49OtIu',NULL,NULL,NULL,NULL,'UP7',NULL,'2011-04-20 19:20:04','2011-04-20 12:20:04','2014-01-25 01:07:33','2014-01-24 18:07:33','e2135bb4faf4fb999e3bbebe86ed1cdf',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
  (2,'root','ia@me.com',NULL,'$2a$12$WoAoMC9EEZxq48HgRp59h.OP6sk0Ez75AA/HVnPaAQUp/QljNf2lO',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 02:35:43','2014-01-24 19:35:43','2014-01-26 22:19:49','2014-01-26 15:19:49',NULL,1,NULL,NULL,NULL,'YEtYJS','name1','last_name1','21/1',102,'0888888888','no','no',1,2147483647),
  (3,'root2','iar@me.com',NULL,'$2a$12$oGjGwsgGFHIhEIjSA/WtruJ2NVK4GUe7I4F2po0yVeRiH2dFw9Bd.',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 02:39:51','2014-01-24 19:39:51','2014-01-26 01:11:31','2014-01-25 18:11:31',NULL,1,NULL,NULL,NULL,'v7hkHA','name2','last_name2','21/1',102,'0888888888','no','no',1,NULL),
  (4,'root_project','io@ma.com',NULL,'$2a$12$Z6jPW4ulZBCV.AUum4/24O023vqBsWS/DGrSFQRCgGygowb0R0GNq',NULL,NULL,'mid-244518c3bd81eb23d956a01ec2eb360c.png',NULL,'UP7',NULL,'2014-01-25 18:06:39','2014-01-25 11:06:39','2014-01-26 01:20:36','2014-01-25 18:20:36',NULL,1,NULL,NULL,NULL,'5FA6Kc','name3','last_name3','21/1',102,'0888888888',NULL,NULL,2,NULL);

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
  ('0683ab33c9c9406b9769da09e3ea9706','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0',1390674035,'a:1:{s:9:\"user_data\";s:0:\"\";}'),
  ('39bba540efdd48b5432384b4697aac0c','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0',1390648019,'a:1:{s:9:\"user_data\";s:0:\"\";}'),
  ('86b790da3b834710ebb1cfb3cc99071d','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0',1390715105,'a:1:{s:9:\"user_data\";s:0:\"\";}'),
  ('c3749ee6b344c28f6ace87f0fd784dc6','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0',1390750172,'a:1:{s:9:\"user_data\";s:0:\"\";}');

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
  (22,3,4),
  (23,3,5),
  (24,3,6),
  (28,2,4),
  (29,2,5),
  (30,2,6);

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
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `an_project` WRITE;
/*!40000 ALTER TABLE `an_project` DISABLE KEYS */;

INSERT INTO `an_project` (`id`, `account_id`, `project_code`, `project_name`, `project_detail`, `long_term`, `price`, `count_countact`, `create_date`, `status`)
VALUES
  (1,4,'2390504','ทดสอบการทำงาน 2','เนื้อหา','30',10000,0,'1390676591',1),
  (2,4,'99911426','ทดสอบการทำงาน','เนื้อหา','30',10000,0,'1390654444',1);

/*!40000 ALTER TABLE `an_project` ENABLE KEYS */;
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
  (4,2,1),
  (5,2,2),
  (6,2,3),
  (13,1,1),
  (14,1,2),
  (15,1,3);

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
  (1,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1457:\"an_csrf_cookie=5a8d8cb1d50786f40282d29d8db20f3a; an_user_lang=th; csrf_cookie=f0e468096ff549e16ab9c4f33ecef428; agni_install_verify=pass; agni_install_step2=pass; agni_install_step3=pass; OXL_yjuXw_cookie=6578d2e72f2922025f70ea2d5d214d2a; OXL_user_lang=th; PHPSESSID=aa745db88276c7bf7e3889b4adca0811; OXL_ci_session=9o1UK4W2rQFmjjAKIhJ8U7MZgvrhDXUeGtse0fq%2FAjDEK%2F1yEMMnwSPSmzIDWwRek56L1iuKlns%2BoeKSBZtatPDT3JzgJExA65H8LMpk%2ByXbXAAI5u1KoFeYs9fV9wMoxuQ%2FIt99tjtOQfq6gYbfGkJp%2B4ejPEDyey%2BL%2BRx9mhDYL%2FWytCm%2BGQUGwHb8uf11NJdqQJURmEbzacJKi329SAuSLm1aXYIA00Y9RXcO9XgMaB2euLg3qURvSlcfL%2BsjIZ2X1MBohxz6mnJSQ2J4W8lURZ6AkKdeJdEqfCovww5alqiZZHw75FzKypB5pPb%2BdhiM4SB5NjI2DW%2F%2BSoEzGIR6DPy6XbIcMgv0ErICslMzoaCQVG1xb%2Fzm%2B0nXXmYv; OXL_member_account=KWVHL5zfITgvhRDLLqrH7zWPGvNF6SRomSdk%2FkOMOmAI2HD6xSSDnSKssXVzYdtgoljXUrhsCZ5iZawvFx2u2KGiXxv15R3SBvcOl%2FblT3K8qi36CP67NdXIBPEoiOL945r2a8a3Zp2bjIISpVIlqRd2OubQmO0VBqL%2Fz8LHh5Zg3KjXUIIOO8mqWFrBwFCN9Simau2ZFmw7AyxaLhNgbP63uSG8GMuwQKiC68IqPBFdkOngZhzjW2jDlUYyu1tOHCSAHoupePy%2FVDRBIsgShWwfBnH0U%2FGlMMMKx6un3EK%2BK7%2Bqmj7erqO%2B2dgHBsaAE6%2FbazQlEy0yEEu8o3aQNw%3D%3D; OXL_admin_account=nh724ivG%2BlVkg5kph3tT7nzejcbVDQtK81My7fA1wiLirvNHLwGcucUuMWZSf5YrvOZOrNMnQOOqLE9ydRhreEHMQ1I2nX%2FTxPF3Ddc19VO1glqe3zHe5QaaFqUDZXmz7oXrZSrnqTVfyW%2BJJiOLmJScCSuIMLmNqZFiCMvKZXccDUcyvmIWd%2FM9evGSD2vRVYPJU%2BNEX7iK4hsKIkI9XGa8lz7i0WMx6y5A5aEOTZB7%2Bkg5aEKuoAZFJpEP0jyA5t22vbnl4DqI6jJBPKPkhzqL9yZ4YnHxJ%2FtEx%2FgYlKY%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49407\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385574002.5759999752044677734375;s:12:\"REQUEST_TIME\";i:1385574002;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385574002),
  (2,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1457:\"an_csrf_cookie=5a8d8cb1d50786f40282d29d8db20f3a; an_user_lang=th; csrf_cookie=f0e468096ff549e16ab9c4f33ecef428; agni_install_verify=pass; agni_install_step2=pass; agni_install_step3=pass; OXL_yjuXw_cookie=6578d2e72f2922025f70ea2d5d214d2a; OXL_user_lang=th; PHPSESSID=aa745db88276c7bf7e3889b4adca0811; OXL_ci_session=9o1UK4W2rQFmjjAKIhJ8U7MZgvrhDXUeGtse0fq%2FAjDEK%2F1yEMMnwSPSmzIDWwRek56L1iuKlns%2BoeKSBZtatPDT3JzgJExA65H8LMpk%2ByXbXAAI5u1KoFeYs9fV9wMoxuQ%2FIt99tjtOQfq6gYbfGkJp%2B4ejPEDyey%2BL%2BRx9mhDYL%2FWytCm%2BGQUGwHb8uf11NJdqQJURmEbzacJKi329SAuSLm1aXYIA00Y9RXcO9XgMaB2euLg3qURvSlcfL%2BsjIZ2X1MBohxz6mnJSQ2J4W8lURZ6AkKdeJdEqfCovww5alqiZZHw75FzKypB5pPb%2BdhiM4SB5NjI2DW%2F%2BSoEzGIR6DPy6XbIcMgv0ErICslMzoaCQVG1xb%2Fzm%2B0nXXmYv; OXL_member_account=KWVHL5zfITgvhRDLLqrH7zWPGvNF6SRomSdk%2FkOMOmAI2HD6xSSDnSKssXVzYdtgoljXUrhsCZ5iZawvFx2u2KGiXxv15R3SBvcOl%2FblT3K8qi36CP67NdXIBPEoiOL945r2a8a3Zp2bjIISpVIlqRd2OubQmO0VBqL%2Fz8LHh5Zg3KjXUIIOO8mqWFrBwFCN9Simau2ZFmw7AyxaLhNgbP63uSG8GMuwQKiC68IqPBFdkOngZhzjW2jDlUYyu1tOHCSAHoupePy%2FVDRBIsgShWwfBnH0U%2FGlMMMKx6un3EK%2BK7%2Bqmj7erqO%2B2dgHBsaAE6%2FbazQlEy0yEEu8o3aQNw%3D%3D; OXL_admin_account=nh724ivG%2BlVkg5kph3tT7nzejcbVDQtK81My7fA1wiLirvNHLwGcucUuMWZSf5YrvOZOrNMnQOOqLE9ydRhreEHMQ1I2nX%2FTxPF3Ddc19VO1glqe3zHe5QaaFqUDZXmz7oXrZSrnqTVfyW%2BJJiOLmJScCSuIMLmNqZFiCMvKZXccDUcyvmIWd%2FM9evGSD2vRVYPJU%2BNEX7iK4hsKIkI9XGa8lz7i0WMx6y5A5aEOTZB7%2Bkg5aEKuoAZFJpEP0jyA5t22vbnl4DqI6jJBPKPkhzqL9yZ4YnHxJ%2FtEx%2FgYlKY%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49407\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385574002.5759999752044677734375;s:12:\"REQUEST_TIME\";i:1385574002;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385574002),
  (3,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1251:\"OXL_yjuXw_cookie=3418c8c9af4fcfe9698b1a30ecdaf941; OXL_user_lang=th; PHPSESSID=4514000afaf609105fe89b1e4ae2e8cf; OXL_ci_session=fNt6wa2GELejqCps2q%2B7yBru3IXc5fzCAZAHQ0N3wyFLfbj7%2B3pLjekSa%2BOkA9V4Z2MvYLl7EOTBMQqdH9XRMJRKtAEtVG6JnubQyqPCGR5W%2BKj8wU34a3N5nNjCy4qOCnE6oSJcWDACmENyenLokeSb%2B3F2ivwMiQA5hk4l0TtwJ63YZa4Orl0lwEMt2JhsgsUMMPYkmvyELFcM0BOlRoRpzqLkQOCCAo6PWcXnoShLDSxwHIG3jhNo6yf5GCnN3wZO%2Fqv2xCrjvZca%2F5juaZsU7lahTQru%2Fc%2BQcQagwdGXOSUf7APNHbiwD4Ail1faJBEh8i89kTZEGTrlupg4CHD8DWwPLpee91PW5jVWI0azXIvs17OLqmA1S9VABvl0; OXL_member_account=Ul4clHZBc1a%2FWTK0DYEsbVvF6CAjp%2FpuhXPqnbelmyPajBaXdZDLyQD%2B1YOFV7rxXTXcBaWph9oH%2FgS8pvFoaaFeArk3As5UA78eZYK91TUruwHCNzHcvazAwX34eHH3w3HfgAF7nWwoQ27iR50inqod7zWxKuqJAufK1MSG7al2dkkuY6nlox4dTkfZinTzGx16pjMJBvlutJmsLntz8lPu6qLF299SO%2FRLBSXelUKP2K1089zQQnrtChzKMZ3niir9wIdWcGLFoUMbYDLWV40ADgiZ5lhe%2FZn4CXmNeeoM3eK5skhhuDOjAECjbvdcPZUvCaArOsN0oR1%2F3%2Bc8FQ%3D%3D; OXL_admin_account=n3zyrGDJ7ySOFRc1iiQ7CEfwQBPBjIsJkhMah8bQ1FkWTIITudQjXEJyJsb3y5rKbjzn09BFz5m535Ics6sQaPHJBkOIPM3AUzw1ALlu7ZrdUIfrZ%2B0sMCVifL9F1Vn4dGacsjiQb7GWO5BvYx1qs%2B3s6iJjQSmKN3AmY95rk3lL5TAOfW7yHx42ZkDt38ELvJk%2F6szCDiOx4pcqbNyPoQso%2F1lhmOauWLey4O78jXHJnJrhVfoYG%2B3VMcyBsNi%2B5cDdqVShtojy7k4oMh9q2J%2FNU3TQohJWiUmuD690YJo%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49354\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385837672.3059999942779541015625;s:12:\"REQUEST_TIME\";i:1385837672;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385837672),
  (4,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1251:\"OXL_yjuXw_cookie=3418c8c9af4fcfe9698b1a30ecdaf941; OXL_user_lang=th; PHPSESSID=4514000afaf609105fe89b1e4ae2e8cf; OXL_ci_session=fNt6wa2GELejqCps2q%2B7yBru3IXc5fzCAZAHQ0N3wyFLfbj7%2B3pLjekSa%2BOkA9V4Z2MvYLl7EOTBMQqdH9XRMJRKtAEtVG6JnubQyqPCGR5W%2BKj8wU34a3N5nNjCy4qOCnE6oSJcWDACmENyenLokeSb%2B3F2ivwMiQA5hk4l0TtwJ63YZa4Orl0lwEMt2JhsgsUMMPYkmvyELFcM0BOlRoRpzqLkQOCCAo6PWcXnoShLDSxwHIG3jhNo6yf5GCnN3wZO%2Fqv2xCrjvZca%2F5juaZsU7lahTQru%2Fc%2BQcQagwdGXOSUf7APNHbiwD4Ail1faJBEh8i89kTZEGTrlupg4CHD8DWwPLpee91PW5jVWI0azXIvs17OLqmA1S9VABvl0; OXL_member_account=Ul4clHZBc1a%2FWTK0DYEsbVvF6CAjp%2FpuhXPqnbelmyPajBaXdZDLyQD%2B1YOFV7rxXTXcBaWph9oH%2FgS8pvFoaaFeArk3As5UA78eZYK91TUruwHCNzHcvazAwX34eHH3w3HfgAF7nWwoQ27iR50inqod7zWxKuqJAufK1MSG7al2dkkuY6nlox4dTkfZinTzGx16pjMJBvlutJmsLntz8lPu6qLF299SO%2FRLBSXelUKP2K1089zQQnrtChzKMZ3niir9wIdWcGLFoUMbYDLWV40ADgiZ5lhe%2FZn4CXmNeeoM3eK5skhhuDOjAECjbvdcPZUvCaArOsN0oR1%2F3%2Bc8FQ%3D%3D; OXL_admin_account=n3zyrGDJ7ySOFRc1iiQ7CEfwQBPBjIsJkhMah8bQ1FkWTIITudQjXEJyJsb3y5rKbjzn09BFz5m535Ics6sQaPHJBkOIPM3AUzw1ALlu7ZrdUIfrZ%2B0sMCVifL9F1Vn4dGacsjiQb7GWO5BvYx1qs%2B3s6iJjQSmKN3AmY95rk3lL5TAOfW7yHx42ZkDt38ELvJk%2F6szCDiOx4pcqbNyPoQso%2F1lhmOauWLey4O78jXHJnJrhVfoYG%2B3VMcyBsNi%2B5cDdqVShtojy7k4oMh9q2J%2FNU3TQohJWiUmuD690YJo%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49354\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385837672.3059999942779541015625;s:12:\"REQUEST_TIME\";i:1385837672;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385837672),
  (5,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1257:\"OXL_yjuXw_cookie=63bbfdfec15d2bf7150fc9b5ab343ec2; OXL_user_lang=th; PHPSESSID=dae1fb7923f87ce6e484cd00f39d474b; OXL_ci_session=DSt4pRq9R3Ra0lQNxpAQDOFCpdE5QXBkmdf2FpzWns885zNdEonhgiaYTnf%2BmfwZJZC1ahbZ9D7Dfx7Kjttm7HNZ1LhLzRKJuzlmE5%2FWrr%2FabKmwnrcS2wNDb2ImepGJ397yUo70F6jJ5QMdl9Ll81y8eYZpQjWeHR%2B0%2FyIev0uZvUaWm5uhH1%2BXtfm6%2F%2BNTAOqgQTDSxOfBIS6fddlObyNY5JgYZM9XQEXf6xuOoFaiuKstbRZOCWYUqTbY296oZgUhwmdojNvy22GgGWZtSDdEHic8rktaNpfYdmrG%2BktJsfTRURt8G5BZ%2BbOFBjN4hFJxIZDUGhphHWi2XKh22FxbaTyPpkiSCS2Y1OybM5XBrE5PyUKm9vP5SiaRQt4J; OXL_member_account=A3vrJLmPBMZ1YMt2l9Kc2y0STmr59o6POmGemk3HZEZtPf%2BuJeqB4bl%2BdZjLdvoTEhArQ8p7txQOIH9LA5qNjj1isrXOKHNFUdgOveHS4H9LAir0so8CztMVDlgvH%2BKS6jwx2pjzQaSssc7iSVTfhgzuFzlJCqa%2FV2G7kB7Jx80O4LZWtWkXQ9pBhIQ7cPtrs6xBYzDUvHWabvuj3MsyadHpjTxzx1Rsr0K2A4YucffBhfB79gMdwxs60ptCorgoVEvJXf3GRDNFNUODm4G5vmwTuczv9wJxDFcVPD8RT7ZAjDK1g%2Bd3WRgcjCaXkg8WJDlU2SzXOaCjQN6fjtNh5A%3D%3D; OXL_admin_account=bkuQ5X5KWbPMMhQC8RtxrrPUeBDRdSLRpVxPeVoXE%2B%2BCvDYcABlcOJURt7HkteYiw1j2m6jkkPM%2BkSV4XbdYZNuMByRwLRAfx1Dh8RLie5fx9aLsT87dKp9ZecKAxJ9ocP%2BIo3iZxrP8vx6DxKl7QV%2FAmyRYZEhXaP%2BJGX%2BcHnSb8iVdtC1xCGwemTqLhctE2u%2F8Xsf6cb0BDpX6StlIjS14E6qp3pALMJPPhgLLHTutwBg5cd3RPlM7%2B0H%2Fg0b2BAl6Fdq20%2FRZRClsfGLZweboUU6heLsUeKslx8jTA%2Bk%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49597\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385990009.5280001163482666015625;s:12:\"REQUEST_TIME\";i:1385990009;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385990009),
  (6,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1257:\"OXL_yjuXw_cookie=63bbfdfec15d2bf7150fc9b5ab343ec2; OXL_user_lang=th; PHPSESSID=dae1fb7923f87ce6e484cd00f39d474b; OXL_ci_session=DSt4pRq9R3Ra0lQNxpAQDOFCpdE5QXBkmdf2FpzWns885zNdEonhgiaYTnf%2BmfwZJZC1ahbZ9D7Dfx7Kjttm7HNZ1LhLzRKJuzlmE5%2FWrr%2FabKmwnrcS2wNDb2ImepGJ397yUo70F6jJ5QMdl9Ll81y8eYZpQjWeHR%2B0%2FyIev0uZvUaWm5uhH1%2BXtfm6%2F%2BNTAOqgQTDSxOfBIS6fddlObyNY5JgYZM9XQEXf6xuOoFaiuKstbRZOCWYUqTbY296oZgUhwmdojNvy22GgGWZtSDdEHic8rktaNpfYdmrG%2BktJsfTRURt8G5BZ%2BbOFBjN4hFJxIZDUGhphHWi2XKh22FxbaTyPpkiSCS2Y1OybM5XBrE5PyUKm9vP5SiaRQt4J; OXL_member_account=A3vrJLmPBMZ1YMt2l9Kc2y0STmr59o6POmGemk3HZEZtPf%2BuJeqB4bl%2BdZjLdvoTEhArQ8p7txQOIH9LA5qNjj1isrXOKHNFUdgOveHS4H9LAir0so8CztMVDlgvH%2BKS6jwx2pjzQaSssc7iSVTfhgzuFzlJCqa%2FV2G7kB7Jx80O4LZWtWkXQ9pBhIQ7cPtrs6xBYzDUvHWabvuj3MsyadHpjTxzx1Rsr0K2A4YucffBhfB79gMdwxs60ptCorgoVEvJXf3GRDNFNUODm4G5vmwTuczv9wJxDFcVPD8RT7ZAjDK1g%2Bd3WRgcjCaXkg8WJDlU2SzXOaCjQN6fjtNh5A%3D%3D; OXL_admin_account=bkuQ5X5KWbPMMhQC8RtxrrPUeBDRdSLRpVxPeVoXE%2B%2BCvDYcABlcOJURt7HkteYiw1j2m6jkkPM%2BkSV4XbdYZNuMByRwLRAfx1Dh8RLie5fx9aLsT87dKp9ZecKAxJ9ocP%2BIo3iZxrP8vx6DxKl7QV%2FAmyRYZEhXaP%2BJGX%2BcHnSb8iVdtC1xCGwemTqLhctE2u%2F8Xsf6cb0BDpX6StlIjS14E6qp3pALMJPPhgLLHTutwBg5cd3RPlM7%2B0H%2Fg0b2BAl6Fdq20%2FRZRClsfGLZweboUU6heLsUeKslx8jTA%2Bk%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49597\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1385990009.5280001163482666015625;s:12:\"REQUEST_TIME\";i:1385990009;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1385990009),
  (7,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:35:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:49:\"http://employment.dev/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1270:\"ui-tabs-1=1; OXL_yjuXw_cookie=63bbfdfec15d2bf7150fc9b5ab343ec2; OXL_user_lang=th; PHPSESSID=dae1fb7923f87ce6e484cd00f39d474b; OXL_ci_session=DSt4pRq9R3Ra0lQNxpAQDOFCpdE5QXBkmdf2FpzWns885zNdEonhgiaYTnf%2BmfwZJZC1ahbZ9D7Dfx7Kjttm7HNZ1LhLzRKJuzlmE5%2FWrr%2FabKmwnrcS2wNDb2ImepGJ397yUo70F6jJ5QMdl9Ll81y8eYZpQjWeHR%2B0%2FyIev0uZvUaWm5uhH1%2BXtfm6%2F%2BNTAOqgQTDSxOfBIS6fddlObyNY5JgYZM9XQEXf6xuOoFaiuKstbRZOCWYUqTbY296oZgUhwmdojNvy22GgGWZtSDdEHic8rktaNpfYdmrG%2BktJsfTRURt8G5BZ%2BbOFBjN4hFJxIZDUGhphHWi2XKh22FxbaTyPpkiSCS2Y1OybM5XBrE5PyUKm9vP5SiaRQt4J; OXL_member_account=A3vrJLmPBMZ1YMt2l9Kc2y0STmr59o6POmGemk3HZEZtPf%2BuJeqB4bl%2BdZjLdvoTEhArQ8p7txQOIH9LA5qNjj1isrXOKHNFUdgOveHS4H9LAir0so8CztMVDlgvH%2BKS6jwx2pjzQaSssc7iSVTfhgzuFzlJCqa%2FV2G7kB7Jx80O4LZWtWkXQ9pBhIQ7cPtrs6xBYzDUvHWabvuj3MsyadHpjTxzx1Rsr0K2A4YucffBhfB79gMdwxs60ptCorgoVEvJXf3GRDNFNUODm4G5vmwTuczv9wJxDFcVPD8RT7ZAjDK1g%2Bd3WRgcjCaXkg8WJDlU2SzXOaCjQN6fjtNh5A%3D%3D; OXL_admin_account=bkuQ5X5KWbPMMhQC8RtxrrPUeBDRdSLRpVxPeVoXE%2B%2BCvDYcABlcOJURt7HkteYiw1j2m6jkkPM%2BkSV4XbdYZNuMByRwLRAfx1Dh8RLie5fx9aLsT87dKp9ZecKAxJ9ocP%2BIo3iZxrP8vx6DxKl7QV%2FAmyRYZEhXaP%2BJGX%2BcHnSb8iVdtC1xCGwemTqLhctE2u%2F8Xsf6cb0BDpX6StlIjS14E6qp3pALMJPPhgLLHTutwBg5cd3RPlM7%2B0H%2Fg0b2BAl6Fdq20%2FRZRClsfGLZweboUU6heLsUeKslx8jTA%2Bk%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1254\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49608\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:18:\"REQUEST_TIME_FLOAT\";d:1385990039.2790000438690185546875;s:12:\"REQUEST_TIME\";i:1385990039;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:37:{s:9:\"site_name\";s:10:\"Employment\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:15:\"duplicate_login\";s:1:\"1\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:3:\"200\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin/config','http://employment.dev/index.php/site-admin/config','127.0.0.1',1385990039),
  (8,1,1,'multisite','Update site','a:5:{s:16:\"server_variables\";a:35:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:49:\"http://employment.dev/index.php/site-admin/config\";s:11:\"HTTP_COOKIE\";s:1270:\"ui-tabs-1=1; OXL_yjuXw_cookie=63bbfdfec15d2bf7150fc9b5ab343ec2; OXL_user_lang=th; PHPSESSID=dae1fb7923f87ce6e484cd00f39d474b; OXL_ci_session=DSt4pRq9R3Ra0lQNxpAQDOFCpdE5QXBkmdf2FpzWns885zNdEonhgiaYTnf%2BmfwZJZC1ahbZ9D7Dfx7Kjttm7HNZ1LhLzRKJuzlmE5%2FWrr%2FabKmwnrcS2wNDb2ImepGJ397yUo70F6jJ5QMdl9Ll81y8eYZpQjWeHR%2B0%2FyIev0uZvUaWm5uhH1%2BXtfm6%2F%2BNTAOqgQTDSxOfBIS6fddlObyNY5JgYZM9XQEXf6xuOoFaiuKstbRZOCWYUqTbY296oZgUhwmdojNvy22GgGWZtSDdEHic8rktaNpfYdmrG%2BktJsfTRURt8G5BZ%2BbOFBjN4hFJxIZDUGhphHWi2XKh22FxbaTyPpkiSCS2Y1OybM5XBrE5PyUKm9vP5SiaRQt4J; OXL_member_account=A3vrJLmPBMZ1YMt2l9Kc2y0STmr59o6POmGemk3HZEZtPf%2BuJeqB4bl%2BdZjLdvoTEhArQ8p7txQOIH9LA5qNjj1isrXOKHNFUdgOveHS4H9LAir0so8CztMVDlgvH%2BKS6jwx2pjzQaSssc7iSVTfhgzuFzlJCqa%2FV2G7kB7Jx80O4LZWtWkXQ9pBhIQ7cPtrs6xBYzDUvHWabvuj3MsyadHpjTxzx1Rsr0K2A4YucffBhfB79gMdwxs60ptCorgoVEvJXf3GRDNFNUODm4G5vmwTuczv9wJxDFcVPD8RT7ZAjDK1g%2Bd3WRgcjCaXkg8WJDlU2SzXOaCjQN6fjtNh5A%3D%3D; OXL_admin_account=bkuQ5X5KWbPMMhQC8RtxrrPUeBDRdSLRpVxPeVoXE%2B%2BCvDYcABlcOJURt7HkteYiw1j2m6jkkPM%2BkSV4XbdYZNuMByRwLRAfx1Dh8RLie5fx9aLsT87dKp9ZecKAxJ9ocP%2BIo3iZxrP8vx6DxKl7QV%2FAmyRYZEhXaP%2BJGX%2BcHnSb8iVdtC1xCGwemTqLhctE2u%2F8Xsf6cb0BDpX6StlIjS14E6qp3pALMJPPhgLLHTutwBg5cd3RPlM7%2B0H%2Fg0b2BAl6Fdq20%2FRZRClsfGLZweboUU6heLsUeKslx8jTA%2Bk%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:12:\"CONTENT_TYPE\";s:33:\"application/x-www-form-urlencoded\";s:14:\"CONTENT_LENGTH\";s:4:\"1254\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49608\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:4:\"POST\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:28:\"/index.php/site-admin/config\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:18:\"/site-admin/config\";s:15:\"PATH_TRANSLATED\";s:26:\"redirect:/index.php/config\";s:8:\"PHP_SELF\";s:28:\"/index.php/site-admin/config\";s:18:\"REQUEST_TIME_FLOAT\";d:1385990039.2790000438690185546875;s:12:\"REQUEST_TIME\";i:1385990039;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:37:{s:9:\"site_name\";s:10:\"Employment\";s:20:\"page_title_separator\";s:10:\" &rsaquo; \";s:9:\"timezones\";s:3:\"UP7\";s:16:\"angi_auto_update\";s:1:\"1\";s:20:\"agni_auto_update_url\";s:51:\"http://agnicms.org/modules/updateservice/update.xml\";s:16:\"agni_system_cron\";s:1:\"1\";s:21:\"member_allow_register\";s:1:\"1\";s:19:\"member_verification\";s:1:\"1\";s:26:\"member_admin_verify_emails\";s:8:\"i@me.com\";s:15:\"duplicate_login\";s:1:\"1\";s:12:\"allow_avatar\";s:1:\"1\";s:11:\"avatar_size\";s:3:\"200\";s:20:\"avatar_allowed_types\";s:11:\"gif|jpg|png\";s:13:\"mail_protocol\";s:4:\"mail\";s:13:\"mail_mailpath\";s:18:\"/usr/sbin/sendmail\";s:14:\"mail_smtp_host\";s:9:\"localhost\";s:14:\"mail_smtp_user\";s:8:\"i@me.com\";s:14:\"mail_smtp_pass\";s:0:\"\";s:14:\"mail_smtp_port\";s:2:\"25\";s:17:\"mail_sender_email\";s:8:\"i@me.com\";s:18:\"content_show_title\";s:1:\"1\";s:17:\"content_show_time\";s:1:\"1\";s:19:\"content_show_author\";s:1:\"1\";s:21:\"content_items_perpage\";s:2:\"10\";s:26:\"content_frontpage_category\";s:0:\"\";s:19:\"media_allowed_types\";s:215:\"7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip\";s:13:\"comment_allow\";s:0:\"\";s:21:\"comment_show_notallow\";s:1:\"0\";s:15:\"comment_perpage\";s:2:\"40\";s:24:\"comment_new_notify_admin\";s:1:\"1\";s:27:\"comment_admin_notify_emails\";s:8:\"i@me.com\";s:8:\"ftp_host\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";s:8:\"ftp_port\";s:2:\"21\";s:11:\"ftp_passive\";s:4:\"true\";s:12:\"ftp_basepath\";s:13:\"/public_html/\";}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin/config','http://employment.dev/index.php/site-admin/config','127.0.0.1',1385990039),
  (9,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:32:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1286:\"ui-tabs-1=0; OXL_yjuXw_cookie=4d27f32bdaf6ccbee15871e706c750b3; OXL_user_lang=th; PHPSESSID=1f8be1823d376a4713d2187b341a139e; OXL_ci_session=lWRA1fLdl5EiFn95hZF%2FYAv0f3okIf8tF7JqTw%2FVViauVQPof9yihJQwxcJd6tRn5cOyAURuFUf12L3rPPN1d12Bu2NI2MD%2BjyhBzmgw5zBNEkz9N3LJ0Wji4NMFLaSq%2BFD2T52An7nwhwXiEs0Vdm3byV7TtBZTlObfSXDl85OeQSwq4o74N%2FvbFj7RjKUFbCTBW7qKofLqojG%2FbUXEUYhoePuycnTk6yq9Jnf9Oh7gzkdU7OlY%2FOPddAtqbcss6HTarGT0ixYQNVcYJaaoApL7rtMMHYEdL%2BwJc31g7q0e6bZGQVuFJz6Yo823Iwbr%2FZ83ad8gv1cBmTJNPDUl2ZWtgAmiTb1l%2FNiLfvZTTaTaLRzgESFMQCnQBxIIOV4Z; OXL_member_account=lvomk4pKGcH7SkTggMLG8ggTrpyZj03Y%2FaVT8ZL9F2nDku9kg60ReSR2IC0ijSR5ir5714CkRhEY3lo6jSnfbCRAOornV2kY86L2mdcAbkccBx2QgkEz6PB%2FOgOjT5Phx0ds6tH0Ik%2Foy%2BklBYmAQ3NRQ7sisHo41HwkrKnQfQoXcZSQp1vWS994N6O2%2BVnjaMIv261N42wx7GnU%2BOLRjol5kuiVDPKMgR71GPZioghkkeIRQ7oVrGl9ATEPSaZMHl672LeQv%2Fer1Mrbt%2ByvG%2Bk1oF5ubRPoEArkCCuJjIri83ZrfmoDzSgadzhWURyp%2FpkZijOnI%2FIvx6JnuaZQmw%3D%3D; OXL_admin_account=xE8tS%2B5ohbUXogBU2h1JLMy9yxPfyMWtWmdt5KDwyd7Ehd%2F0NPLxmKDUswY7%2BNz%2BlA4Py5oags3sw1C4j4dMt%2Bjx2XfRjGwGE7ANCYq2jTyuHokMrOnWC9lJUpYHXJwjhRmJeNrJ5zyAlA0tC7tKFG79St%2F6Ou7iVtClP26xur%2FyKuEXWap0EbmX6jnKAjmOjfFr46%2FKtj1M%2BAs2E%2FB4DazYW%2BC9CU6qjmNhVe0y4SfQ%2FVzJirkVnAkF3N%2B7r76swQe7xVleygwt713h5PCGdJ3l%2B1BUwRWU1DVE9QShZE0%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49881\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1386492065;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1386492065),
  (10,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:32:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1286:\"ui-tabs-1=0; OXL_yjuXw_cookie=4d27f32bdaf6ccbee15871e706c750b3; OXL_user_lang=th; PHPSESSID=1f8be1823d376a4713d2187b341a139e; OXL_ci_session=lWRA1fLdl5EiFn95hZF%2FYAv0f3okIf8tF7JqTw%2FVViauVQPof9yihJQwxcJd6tRn5cOyAURuFUf12L3rPPN1d12Bu2NI2MD%2BjyhBzmgw5zBNEkz9N3LJ0Wji4NMFLaSq%2BFD2T52An7nwhwXiEs0Vdm3byV7TtBZTlObfSXDl85OeQSwq4o74N%2FvbFj7RjKUFbCTBW7qKofLqojG%2FbUXEUYhoePuycnTk6yq9Jnf9Oh7gzkdU7OlY%2FOPddAtqbcss6HTarGT0ixYQNVcYJaaoApL7rtMMHYEdL%2BwJc31g7q0e6bZGQVuFJz6Yo823Iwbr%2FZ83ad8gv1cBmTJNPDUl2ZWtgAmiTb1l%2FNiLfvZTTaTaLRzgESFMQCnQBxIIOV4Z; OXL_member_account=lvomk4pKGcH7SkTggMLG8ggTrpyZj03Y%2FaVT8ZL9F2nDku9kg60ReSR2IC0ijSR5ir5714CkRhEY3lo6jSnfbCRAOornV2kY86L2mdcAbkccBx2QgkEz6PB%2FOgOjT5Phx0ds6tH0Ik%2Foy%2BklBYmAQ3NRQ7sisHo41HwkrKnQfQoXcZSQp1vWS994N6O2%2BVnjaMIv261N42wx7GnU%2BOLRjol5kuiVDPKMgR71GPZioghkkeIRQ7oVrGl9ATEPSaZMHl672LeQv%2Fer1Mrbt%2ByvG%2Bk1oF5ubRPoEArkCCuJjIri83ZrfmoDzSgadzhWURyp%2FpkZijOnI%2FIvx6JnuaZQmw%3D%3D; OXL_admin_account=xE8tS%2B5ohbUXogBU2h1JLMy9yxPfyMWtWmdt5KDwyd7Ehd%2F0NPLxmKDUswY7%2BNz%2BlA4Py5oags3sw1C4j4dMt%2Bjx2XfRjGwGE7ANCYq2jTyuHokMrOnWC9lJUpYHXJwjhRmJeNrJ5zyAlA0tC7tKFG79St%2F6Ou7iVtClP26xur%2FyKuEXWap0EbmX6jnKAjmOjfFr46%2FKtj1M%2BAs2E%2FB4DazYW%2BC9CU6qjmNhVe0y4SfQ%2FVzJirkVnAkF3N%2B7r76swQe7xVleygwt713h5PCGdJ3l%2B1BUwRWU1DVE9QShZE0%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49881\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:12:\"REQUEST_TIME\";i:1386492065;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:25.0) Gecko/20100101 Firefox/25.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1386492065),
  (11,1,1,'syslog','Purge old log','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1259:\"OXL_yjuXw_cookie=ab1985ee7b8c4e3190375429ee16434c; OXL_user_lang=th; PHPSESSID=6f463723aed36492fb8e82ba11b8bbf1; OXL_ci_session=LHSmQo%2BMn31%2BQqS84uRaIe8r95ZJwNzF2XOSvkO5yVDZ3CMafdXeC9o5GVW5DBneUP49Ib09Jc2yZsl5soeXGpt4kkOTeKcLexmcJxkil4nwHTPfwHrUzBhhduWwF6rUj42DPp20Jfn2ssj5wDKBYoXSbVUUnht4kXNHwExK04Ivrk7J67EuUOy9X6NXb7FD6CFR%2BoT1Y%2BxiDuaFpDYVSR7%2FyV1OWC%2BCdmeb4LsQj%2FlHLaBIvkA5uSaMYZ8v%2FKzY2idPUnzrKxwUiFJiAljc0kS%2FSIS5Rxpz1%2F%2Fk%2BoTo4QgS153zuIDdm8nDYwYRxhsjubNGAcmPEnBi4xOmpUNX%2BGEpYaRxxSTuxf4egwVGSfWM6YdtDowof2Ulds7QSApC; OXL_member_account=9J4lbz1Dsu9wBOPgVTcCd6gxfMbIx6eRP4zjHRz4suxqptmJvAHQZ957LFYOmjhzxMlZX8hHPIPognKyswrqKjcaOa08PWGlETvQF%2BUR%2FhM5G709K%2FVqX45fae2WdJgCKAbIBinht7vU88SIv5Z1CHkZScCt2UIe9XAJ%2FANAD0rSgGfMQFu0nV6Mh6OHwIgpK3RUbypDWPDim%2BYhUOcwxVLbF6DMg7SqxvPtuz95%2Fi8LUmI33f5BE4kA7Km8VGHyH9fXCh6D7rBx7QgoAQzhDPH%2FaJ2YWC5x57rf2DCkEOFeFJW9F49ishKlY4Apvwkv1bWb44qdUEGHZKxccZu4Pw%3D%3D; OXL_admin_account=PEK6KYNQY25OiCBcS4Oynl6xAB803wTXQW08EWbYZ3ms6B6jijSNyu9ao8kanWE0XrP5mq%2B9xpnVPn9FyYN3FNILBlw9Av2lNPp9nra0fO11bIv83tcewBUzO8G7A3Atzx%2BOk58OES31QYMrYj3mEBJzmkhm0KjDZiwvRzbAw1bDVEsdo%2FzwivQowHrInYpV4OtixiWCv14Q3vBzWMN3bs7d0%2Ff7%2Fs5seBgd7dfCW%2BzLSkplxpyCv171%2FeNgrUxyy9c8GOTfDNe%2BStHAioa75v6LCIGAxgYbduqxA0DBIJM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49544\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1390586854.032000064849853515625;s:12:\"REQUEST_TIME\";i:1390586854;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1390586854),
  (12,1,1,'cron','Run cron','a:5:{s:16:\"server_variables\";a:33:{s:9:\"HTTP_HOST\";s:14:\"employment.dev\";s:15:\"HTTP_USER_AGENT\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";s:11:\"HTTP_ACCEPT\";s:63:\"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\";s:20:\"HTTP_ACCEPT_LANGUAGE\";s:47:\"th-th,th;q=0.8,en;q=0.6,en-us;q=0.4,en-gb;q=0.2\";s:20:\"HTTP_ACCEPT_ENCODING\";s:13:\"gzip, deflate\";s:8:\"HTTP_DNT\";s:1:\"1\";s:12:\"HTTP_REFERER\";s:105:\"http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin\";s:11:\"HTTP_COOKIE\";s:1259:\"OXL_yjuXw_cookie=ab1985ee7b8c4e3190375429ee16434c; OXL_user_lang=th; PHPSESSID=6f463723aed36492fb8e82ba11b8bbf1; OXL_ci_session=LHSmQo%2BMn31%2BQqS84uRaIe8r95ZJwNzF2XOSvkO5yVDZ3CMafdXeC9o5GVW5DBneUP49Ib09Jc2yZsl5soeXGpt4kkOTeKcLexmcJxkil4nwHTPfwHrUzBhhduWwF6rUj42DPp20Jfn2ssj5wDKBYoXSbVUUnht4kXNHwExK04Ivrk7J67EuUOy9X6NXb7FD6CFR%2BoT1Y%2BxiDuaFpDYVSR7%2FyV1OWC%2BCdmeb4LsQj%2FlHLaBIvkA5uSaMYZ8v%2FKzY2idPUnzrKxwUiFJiAljc0kS%2FSIS5Rxpz1%2F%2Fk%2BoTo4QgS153zuIDdm8nDYwYRxhsjubNGAcmPEnBi4xOmpUNX%2BGEpYaRxxSTuxf4egwVGSfWM6YdtDowof2Ulds7QSApC; OXL_member_account=9J4lbz1Dsu9wBOPgVTcCd6gxfMbIx6eRP4zjHRz4suxqptmJvAHQZ957LFYOmjhzxMlZX8hHPIPognKyswrqKjcaOa08PWGlETvQF%2BUR%2FhM5G709K%2FVqX45fae2WdJgCKAbIBinht7vU88SIv5Z1CHkZScCt2UIe9XAJ%2FANAD0rSgGfMQFu0nV6Mh6OHwIgpK3RUbypDWPDim%2BYhUOcwxVLbF6DMg7SqxvPtuz95%2Fi8LUmI33f5BE4kA7Km8VGHyH9fXCh6D7rBx7QgoAQzhDPH%2FaJ2YWC5x57rf2DCkEOFeFJW9F49ishKlY4Apvwkv1bWb44qdUEGHZKxccZu4Pw%3D%3D; OXL_admin_account=PEK6KYNQY25OiCBcS4Oynl6xAB803wTXQW08EWbYZ3ms6B6jijSNyu9ao8kanWE0XrP5mq%2B9xpnVPn9FyYN3FNILBlw9Av2lNPp9nra0fO11bIv83tcewBUzO8G7A3Atzx%2BOk58OES31QYMrYj3mEBJzmkhm0KjDZiwvRzbAw1bDVEsdo%2FzwivQowHrInYpV4OtixiWCv14Q3vBzWMN3bs7d0%2Ff7%2Fs5seBgd7dfCW%2BzLSkplxpyCv171%2FeNgrUxyy9c8GOTfDNe%2BStHAioa75v6LCIGAxgYbduqxA0DBIJM%3D\";s:15:\"HTTP_CONNECTION\";s:10:\"keep-alive\";s:4:\"PATH\";s:29:\"/usr/bin:/bin:/usr/sbin:/sbin\";s:16:\"SERVER_SIGNATURE\";s:0:\"\";s:15:\"SERVER_SOFTWARE\";s:6:\"Apache\";s:11:\"SERVER_NAME\";s:14:\"employment.dev\";s:11:\"SERVER_ADDR\";s:9:\"127.0.0.1\";s:11:\"SERVER_PORT\";s:2:\"80\";s:11:\"REMOTE_ADDR\";s:9:\"127.0.0.1\";s:13:\"DOCUMENT_ROOT\";s:36:\"/Applications/MAMP/htdocs/employment\";s:12:\"SERVER_ADMIN\";s:15:\"you@example.com\";s:15:\"SCRIPT_FILENAME\";s:46:\"/Applications/MAMP/htdocs/employment/index.php\";s:11:\"REMOTE_PORT\";s:5:\"49544\";s:17:\"GATEWAY_INTERFACE\";s:7:\"CGI/1.1\";s:15:\"SERVER_PROTOCOL\";s:8:\"HTTP/1.1\";s:14:\"REQUEST_METHOD\";s:3:\"GET\";s:12:\"QUERY_STRING\";s:0:\"\";s:11:\"REQUEST_URI\";s:21:\"/index.php/site-admin\";s:11:\"SCRIPT_NAME\";s:10:\"/index.php\";s:9:\"PATH_INFO\";s:11:\"/site-admin\";s:15:\"PATH_TRANSLATED\";s:19:\"redirect:/index.php\";s:8:\"PHP_SELF\";s:21:\"/index.php/site-admin\";s:18:\"REQUEST_TIME_FLOAT\";d:1390586854.032000064849853515625;s:12:\"REQUEST_TIME\";i:1390586854;s:4:\"argv\";a:0:{}s:4:\"argc\";i:0;}s:15:\"method_get_data\";a:0:{}s:16:\"method_post_data\";a:0:{}s:16:\"upload_file_data\";a:0:{}s:10:\"user_agent\";s:81:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:26.0) Gecko/20100101 Firefox/26.0\";}','http://employment.dev/index.php/site-admin','http://employment.dev/index.php/site-admin/login?rdr=http%3A%2F%2Femployment.dev%2Findex.php%2Fsite-admin','127.0.0.1',1390586854);

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
