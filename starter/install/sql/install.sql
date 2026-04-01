-- install.sql — CREATE TABLE statements ONLY

CREATE TABLE IF NOT EXISTS `bx_vendorstarter_entries` (
  `id`            int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author`        int(10) UNSIGNED NOT NULL DEFAULT 0,
  `added`         int(11) NOT NULL DEFAULT 0,
  `changed`       int(11) NOT NULL DEFAULT 0,
  `thumb`         int(11) NOT NULL DEFAULT 0,
  `title`         varchar(255) NOT NULL DEFAULT '',
  `text`          text NOT NULL,
  `allow_view_to` varchar(16) NOT NULL DEFAULT '3',
  `status`        enum('active','pending','hidden','failed') NOT NULL DEFAULT 'active',
  `status_admin`  enum('active','pending','hidden') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `added` (`added`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
