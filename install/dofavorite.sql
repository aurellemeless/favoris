-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 31 Août 2015 à 17:06
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `dofavorite`
--

-- --------------------------------------------------------

--
-- Structure de la table `hga_category`
--

CREATE TABLE IF NOT EXISTS `hga_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `image` text,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hga_category_hga_category_idx` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `hga_category`
--

INSERT INTO `hga_category` (`id`, `title`, `image`, `parent`) VALUES
(2, 'juh;jhlkkhlkjlkkjkplji', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `hga_feature`
--

CREATE TABLE IF NOT EXISTS `hga_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=102 ;

--
-- Contenu de la table `hga_feature`
--

INSERT INTO `hga_feature` (`id`, `title`, `description`) VALUES
(1, '*', 'Controle totale'),
(99, 'visite.laboratoire', 'Module de laboratoire'),
(100, 'visite.radiologie', 'Module radiologie'),
(101, 'visite.candidats', 'Module candidats');

-- --------------------------------------------------------

--
-- Structure de la table `hga_group`
--

CREATE TABLE IF NOT EXISTS `hga_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` datetime NOT NULL,
  `modification` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `hga_group`
--

INSERT INTO `hga_group` (`id`, `title`, `description`, `creation`, `modification`) VALUES
(1, 'Super Administrateur', 'Super Administrateur', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Administrateur', 'Administrateur', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Contre visite', 'Contre visite', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Laboratoire', 'Laboratoire d''analyse médical', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Radiologie', 'Radiologie & imagerie', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `hga_group_feature`
--

CREATE TABLE IF NOT EXISTS `hga_group_feature` (
  `group_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`feature_id`),
  KEY `fk_bos_group_has_bos_ressource_bos_ressource1_idx` (`feature_id`),
  KEY `fk_bos_group_has_bos_ressource_bos_group1_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `hga_group_feature`
--

INSERT INTO `hga_group_feature` (`group_id`, `feature_id`) VALUES
(1, 1),
(4, 99),
(5, 100),
(3, 101);

-- --------------------------------------------------------

--
-- Structure de la table `hga_link`
--

CREATE TABLE IF NOT EXISTS `hga_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(110) NOT NULL,
  `url` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `screenshot` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `fk_hga_link_hga_category1_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `hga_message`
--

CREATE TABLE IF NOT EXISTS `hga_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bos_message_bos_user1_idx` (`sender_id`),
  KEY `fk_bos_message_bos_user2_idx` (`receiver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `hga_message`
--

INSERT INTO `hga_message` (`id`, `content`, `createdate`, `sender_id`, `receiver_id`, `read`) VALUES
(1, 'test message pur simple', '2015-05-30 12:01:51', 3, 3, 1),
(2, 'test message cool man', '2015-05-30 12:06:22', 3, 3, 1),
(3, 'cool test one', '2015-06-16 00:47:24', 3, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `hga_param`
--

CREATE TABLE IF NOT EXISTS `hga_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text,
  `app` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_UNIQUE` (`app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `hga_user`
--

CREATE TABLE IF NOT EXISTS `hga_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(110) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `professionnal` enum('YES','NO') DEFAULT NULL,
  `keyactivate` varchar(45) DEFAULT NULL,
  `sessionid` varchar(45) DEFAULT NULL,
  `appkey` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `createduser` int(11) DEFAULT NULL,
  `modifyuser` int(11) DEFAULT NULL,
  `active` enum('YES','NO') DEFAULT 'NO' COMMENT 'user status',
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `login` (`login`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `hga_user`
--

INSERT INTO `hga_user` (`id`, `login`, `password`, `email`, `lastname`, `firstname`, `professionnal`, `keyactivate`, `sessionid`, `appkey`, `createdate`, `modifydate`, `createduser`, `modifyuser`, `active`, `birthdate`) VALUES
(3, 'admin', '909ecde5825e31a0b4266173a7bc12348165a3bd', 'sergyleves@gmail.com', 'Administrator', 'Admin', 'YES', NULL, NULL, NULL, NULL, '2015-05-08 10:57:05', 1, 1, 'NO', '1990-12-21');

-- --------------------------------------------------------

--
-- Structure de la table `hga_user_group`
--

CREATE TABLE IF NOT EXISTS `hga_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `fk_user_has_group_group1_idx` (`group_id`),
  KEY `fk_user_has_group_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `hga_user_group`
--

INSERT INTO `hga_user_group` (`user_id`, `group_id`) VALUES
(3, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `hga_category`
--
ALTER TABLE `hga_category`
  ADD CONSTRAINT `fk_hga_category_hga_category` FOREIGN KEY (`parent`) REFERENCES `hga_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `hga_link`
--
ALTER TABLE `hga_link`
  ADD CONSTRAINT `fk_hga_link_hga_category1` FOREIGN KEY (`category_id`) REFERENCES `hga_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `hga_message`
--
ALTER TABLE `hga_message`
  ADD CONSTRAINT `fk_bos_message_bos_user1` FOREIGN KEY (`sender_id`) REFERENCES `hga_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bos_message_bos_user2` FOREIGN KEY (`receiver_id`) REFERENCES `hga_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
