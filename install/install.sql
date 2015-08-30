-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2015 at 12:10 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `numerikashop`
--

-- --------------------------------------------------------

--
-- Table structure for table `hous_account`
--

CREATE TABLE IF NOT EXISTS `hous_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` float DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_account_hous_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hous_account`
--

INSERT INTO `hous_account` (`id`, `credit`, `user_id`) VALUES
(2, 467660, 12),
(3, 42920, 13),
(4, 92920, 14);

-- --------------------------------------------------------

--
-- Table structure for table `hous_category`
--

CREATE TABLE IF NOT EXISTS `hous_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT NULL,
  `trashed` enum('YES','NO') DEFAULT NULL,
  `application` varchar(45) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  `createduser` int(11) NOT NULL,
  `modifyuser` int(11) NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `featured` enum('YES','NO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_category_hous_form1_idx` (`form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `hous_category`
--

INSERT INTO `hous_category` (`id`, `title`, `description`, `image`, `published`, `trashed`, `application`, `parent`, `createdate`, `modifydate`, `createduser`, `modifyuser`, `form_id`, `featured`) VALUES
(1, 'Marché', 'Rayon 1 : Marché', NULL, 'YES', 'NO', 'ecom', NULL, '2015-04-22 11:53:08', '2015-04-30 09:39:36', 3, 3, NULL, 'NO'),
(2, 'Légumes', 'Légumes ', NULL, 'YES', 'NO', 'ecom', 1, '2015-04-22 11:53:56', '2015-04-22 11:53:56', 3, 3, NULL, 'NO'),
(3, 'Légumes de saison, Panier de légumes ', 'Légumes de saison, Panier de légumes ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 11:54:23', '2015-04-22 11:54:23', 3, 3, NULL, 'NO'),
(4, 'Tomates', 'Tomates', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:06:18', '2015-04-22 12:06:18', 3, 3, NULL, 'NO'),
(5, 'Aubergines, Courgettes, Poivrons ', 'Aubergines, Courgettes, Poivrons ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:06:36', '2015-04-22 12:06:36', 3, 3, NULL, 'NO'),
(6, 'Avocats, Concombres, Radis, Celeris, Fenouil ', 'Avocats, Concombres, Radis, Celeris, Fenouil ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:31:46', '2015-04-22 12:31:46', 3, 3, NULL, 'NO'),
(7, 'Salades, Endives, Herbes ', 'Salades, Endives, Herbes ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:46:18', '2015-04-22 12:46:18', 3, 3, NULL, 'NO'),
(8, 'Légumes verts, Asperges, Champignons ', 'Légumes verts, Asperges, Champignons ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:47:13', '2015-04-22 12:47:13', 3, 3, NULL, 'NO'),
(9, 'Carottes, Poireaux, Navets, Potirons, Choux ', 'Carottes, Poireaux, Navets, Potirons, Choux ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:47:32', '2015-04-22 12:47:32', 3, 3, NULL, 'NO'),
(10, 'Pommes de Terre ', 'Pommes de Terre ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:47:56', '2015-04-22 12:47:56', 3, 3, NULL, 'NO'),
(11, 'Ails, Oignons, Echalotes', 'Ails, Oignons, Echalotes', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:48:12', '2015-04-22 12:48:12', 3, 3, NULL, 'NO'),
(12, 'Soupes Fraîches, Prêts à l''emploi, Légumes se', 'Soupes Fraîches, Prêts à l''emploi, Légumes secs ', NULL, 'YES', 'NO', 'ecom', 2, '2015-04-22 12:48:50', '2015-04-22 12:48:50', 3, 3, NULL, 'NO'),
(13, 'Fruits ', 'Fruits ', NULL, 'YES', 'NO', 'ecom', 1, '2015-04-22 12:49:14', '2015-04-22 12:49:14', 3, 3, NULL, 'NO'),
(14, 'Jus de Fruits frais', 'Jus de Fruits frais', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:49:32', '2015-04-22 12:49:32', 3, 3, NULL, 'NO'),
(15, 'Fruits de saison, Panier de fruits ', 'Fruits de saison, Panier de fruits ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:49:58', '2015-04-22 12:49:58', 3, 3, NULL, 'NO'),
(16, 'Agrumes ', 'Agrumes ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:50:17', '2015-04-22 12:50:17', 3, 3, NULL, 'NO'),
(17, 'Pommes, Poires ', 'Pommes, Poires ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:50:34', '2015-04-22 12:50:34', 3, 3, NULL, 'NO'),
(18, 'Bananes, Fruits exotiques ', 'Bananes, Fruits exotiques ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:50:52', '2015-04-22 12:50:52', 3, 3, NULL, 'NO'),
(19, 'Raisins, Prunes, Nectarines ', 'Raisins, Prunes, Nectarines ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:51:07', '2015-04-22 12:51:07', 3, 3, NULL, 'NO'),
(20, 'Fraises, Cerises, Framboises, Fruits Rouges ', 'Fraises, Cerises, Framboises, Fruits Rouges ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:51:24', '2015-04-22 12:51:24', 3, 3, NULL, 'NO'),
(21, 'Fruits Secs et Prêts à l''Emploi ', 'Fruits Secs et Prêts à l''Emploi ', NULL, 'YES', 'NO', 'ecom', 13, '2015-04-22 12:51:44', '2015-04-22 12:51:44', 3, 3, NULL, 'NO'),
(22, 'Boucherie - Volaille ', 'Boucherie - Volaille ', NULL, 'YES', 'NO', 'ecom', 1, '2015-04-22 12:52:12', '2015-04-22 12:52:12', 3, 3, NULL, 'NO'),
(23, 'Steaks Hachés ', 'Steaks Hachés ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:52:36', '2015-04-22 12:52:36', 3, 3, NULL, 'NO'),
(24, 'Les pièces du Boucher ', 'Les pièces du Boucher ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:52:56', '2015-04-22 12:52:56', 3, 3, NULL, 'NO'),
(25, 'Bœuf ', 'Bœuf ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:53:26', '2015-04-22 12:53:26', 3, 3, NULL, 'NO'),
(26, 'Porc, Veau, Agneau ', 'Porc, Veau, Agneau ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:54:06', '2015-04-22 12:54:06', 3, 3, NULL, 'NO'),
(27, 'Poulet, Dinde, Autres Volailles ', 'Poulet, Dinde, Autres Volailles ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:54:32', '2015-04-22 12:54:32', 3, 3, NULL, 'NO'),
(28, 'Saucisse, Viandes Cuisinées, Snack, Sauce ', 'Saucisse, Viandes Cuisinées, Snack, Sauce ', NULL, 'YES', 'NO', 'ecom', 22, '2015-04-22 12:55:56', '2015-04-22 12:55:56', 3, 3, NULL, 'NO'),
(29, 'Produits de la mer', 'Produits de la mer', NULL, 'YES', 'NO', 'ecom', 1, '2015-04-22 12:56:22', '2015-04-22 12:56:22', 3, 3, NULL, 'NO'),
(30, 'Pains - Viennoiseries ', 'Pains - Viennoiseries ', NULL, 'YES', 'NO', 'ecom', 1, '2015-04-22 12:56:48', '2015-04-22 12:56:48', 3, 3, NULL, 'NO'),
(31, 'Poissons Frais ', 'Poissons Frais ', NULL, 'YES', 'NO', 'ecom', 29, '2015-04-22 12:57:10', '2015-04-22 12:57:10', 3, 3, NULL, 'NO'),
(32, 'Poissons Fumés ', 'Poissons Fumés ', NULL, 'YES', 'NO', 'ecom', 29, '2015-04-22 12:58:26', '2015-04-22 12:58:26', 3, 3, NULL, 'NO'),
(33, 'Produits Apéritifs ', 'Produits Apéritifs ', NULL, 'YES', 'NO', 'ecom', 29, '2015-04-22 12:58:53', '2015-04-22 12:58:53', 3, 3, NULL, 'NO'),
(34, 'Fruits de mer ', 'Fruits de mer ', NULL, 'YES', 'NO', 'ecom', 29, '2015-04-22 12:59:17', '2015-04-22 12:59:17', 3, 3, NULL, 'NO'),
(35, 'Surimi ', 'Surimi ', NULL, 'YES', 'NO', 'ecom', 29, '2015-04-22 12:59:39', '2015-04-22 12:59:39', 3, 3, NULL, 'NO'),
(36, 'Pains, Pains de mie', 'Pains, Pains de mie ', NULL, 'YES', 'NO', 'ecom', 30, '2015-04-22 13:06:32', '2015-04-22 13:06:32', 3, 3, NULL, 'NO'),
(37, 'Pains à garnir ', 'Pains à garnir ', NULL, 'YES', 'NO', 'ecom', 30, '2015-04-22 13:07:22', '2015-04-22 13:07:22', 3, 3, NULL, 'NO'),
(38, 'Brioches et Viennoiseries ', 'Brioches et Viennoiseries ', NULL, 'YES', 'NO', 'ecom', 30, '2015-04-22 13:08:19', '2015-04-22 13:08:19', 3, 3, NULL, 'NO'),
(39, 'Accueil', 'Accueil', NULL, 'YES', 'NO', 'blog', NULL, '2015-04-24 11:09:34', '2015-04-24 11:09:34', 3, 3, NULL, 'NO'),
(40, 'Charcuterie traiteur', 'Rayon 2 : Charcuterie traiteur', NULL, 'YES', 'NO', 'ecom', NULL, '2015-04-27 11:24:19', '2015-04-30 09:40:12', 3, 3, NULL, 'NO'),
(41, 'Charcuterie ', 'Charcuterie', NULL, 'YES', 'NO', 'ecom', 40, '2015-04-27 11:25:35', '2015-04-27 11:25:35', 3, 3, NULL, 'NO'),
(42, 'Jambons ', 'Jambons ', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:26:01', '2015-04-27 11:26:01', 3, 3, NULL, 'NO'),
(43, 'Jambons de volaille ', 'Jambons de volaille ', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:26:36', '2015-04-27 11:26:36', 3, 3, NULL, 'NO'),
(44, 'Knacks - Cocktails ', 'Knacks - Cocktails ', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:27:18', '2015-04-27 11:27:18', 3, 3, NULL, 'NO'),
(45, 'Lardons, Dés, Bacon', 'Lardons, Dés, Bacon', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:27:45', '2015-04-27 11:27:45', 3, 3, NULL, 'NO'),
(46, 'Saucissons, Saucisses et Boudins', 'Saucissons, Saucisses et Boudins', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:28:12', '2015-04-27 11:28:12', 3, 3, NULL, 'NO'),
(47, 'Patés, Rillettes, Terrines ', 'Patés, Rillettes, Terrines ', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:28:47', '2015-04-27 11:28:47', 3, 3, NULL, 'NO'),
(48, 'Les tranchés ', 'Les tranchés ', NULL, 'YES', 'NO', 'ecom', 41, '2015-04-27 11:29:13', '2015-04-27 11:29:13', 3, 3, NULL, 'NO'),
(49, 'Traiteur', 'Traiteur', NULL, 'YES', 'NO', 'ecom', 40, '2015-04-27 11:30:30', '2015-04-27 11:30:30', 3, 3, NULL, 'NO'),
(50, 'Entrées, Apéritifs ', 'Entrées, Apéritifs ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:30:59', '2015-04-27 11:30:59', 3, 3, NULL, 'NO'),
(51, 'Salades Composées, Crudités, Soupes ', 'Salades Composées, Crudités, Soupes ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:31:26', '2015-04-27 11:31:26', 3, 3, NULL, 'NO'),
(52, 'Hot Dog, Burgers, Croques ', 'Hot Dog, Burgers, Croques ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:31:48', '2015-04-27 11:31:48', 3, 3, NULL, 'NO'),
(53, 'Cordons Bleus, Nuggets, Grignottes ', 'Cordons Bleus, Nuggets, Grignottes ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:32:14', '2015-04-27 11:32:14', 3, 3, NULL, 'NO'),
(54, 'Pizzas, Tartes, Quiches ', 'Pizzas, Tartes, Quiches ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:32:44', '2015-04-27 11:32:44', 3, 3, NULL, 'NO'),
(55, 'Gnocchi, Pâtes Fraîches, Quenelles ', 'Gnocchi, Pâtes Fraîches, Quenelles', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:33:15', '2015-04-27 11:33:15', 3, 3, NULL, 'NO'),
(56, 'Plats cuisinés ', 'Plats cuisinés', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:33:48', '2015-04-27 11:33:48', 3, 3, NULL, 'NO'),
(57, 'Pâtes à Tarte et à Gâteaux ', 'Pâtes à Tarte et à Gâteaux ', NULL, 'YES', 'NO', 'ecom', 49, '2015-04-27 11:34:10', '2015-04-27 11:34:10', 3, 3, NULL, 'NO'),
(58, 'Traiteur de la Mer ', 'Traiteur de la Mer ', NULL, 'YES', 'NO', 'ecom', 40, '2015-04-27 11:34:37', '2015-04-27 11:34:37', 3, 3, NULL, 'NO'),
(59, 'Poissons Fumés ', 'Poissons Fumés ', NULL, 'YES', 'NO', 'ecom', 58, '2015-04-27 11:35:07', '2015-04-27 11:35:07', 3, 3, NULL, 'NO'),
(60, 'Produits Apéritifs ', 'Produits Apéritifs ', NULL, 'YES', 'NO', 'ecom', 58, '2015-04-27 11:35:24', '2015-04-27 11:35:24', 3, 3, NULL, 'NO'),
(61, 'Surimis, Poissons panés ', 'Surimis, Poissons panés ', NULL, 'YES', 'NO', 'ecom', 58, '2015-04-27 11:36:12', '2015-04-27 11:36:12', 3, 3, NULL, 'NO'),
(62, 'Poissons Frais', 'Poissons Frais', NULL, 'YES', 'NO', 'ecom', 58, '2015-04-27 11:36:35', '2015-04-27 11:36:35', 3, 3, NULL, 'NO'),
(63, 'Surgelés', 'Rayon 3 : Surgelés', NULL, 'YES', 'NO', 'ecom', NULL, '2015-05-11 17:13:16', '2015-05-11 17:13:16', 3, 3, NULL, 'NO'),
(64, 'Apéritifs, Entrées, Snacks ', 'Apéritifs, Entrées, Snacks ', NULL, 'YES', 'NO', 'ecom', 63, '2015-05-11 17:13:55', '2015-05-11 17:13:55', 3, 3, NULL, 'NO'),
(65, 'Apéritifs, Petits fours ', 'Apéritifs, Petits fours ', NULL, 'YES', 'NO', 'ecom', 64, '2015-05-11 17:14:20', '2015-05-11 17:14:20', 3, 3, NULL, 'NO'),
(66, 'Crêpes, Feuilletés ', 'Crêpes, Feuilletés ', NULL, 'YES', 'NO', 'ecom', 64, '2015-05-11 17:15:22', '2015-05-11 17:15:22', 3, 3, NULL, 'NO'),
(67, 'Bun''s, Burgers ', 'Bun''s, Burgers ', NULL, 'YES', 'NO', 'ecom', 64, '2015-05-11 17:15:40', '2015-05-11 17:15:40', 3, 3, NULL, 'NO'),
(68, 'Coquilles, Escargots', 'Coquilles, Escargots', NULL, 'YES', 'NO', 'ecom', 64, '2015-05-11 17:16:01', '2015-05-11 17:16:01', 3, 3, NULL, 'NO'),
(69, 'Pizzas, Tartes, Plats cuisinés', 'Pizzas, Tartes, Plats cuisinés', NULL, 'YES', 'NO', 'ecom', 63, '2015-05-11 17:16:25', '2015-05-11 17:16:25', 3, 3, NULL, 'NO'),
(70, 'Pizzas ', 'Pizzas ', NULL, 'YES', 'NO', 'ecom', 69, '2015-05-11 17:16:43', '2015-05-11 17:16:43', 3, 3, NULL, 'NO'),
(71, 'Tartes, Quiches', 'Tartes, Quiches', NULL, 'YES', 'NO', 'ecom', 69, '2015-05-11 17:17:00', '2015-05-11 17:17:00', 3, 3, NULL, 'NO'),
(72, 'Plats Cuisinés ', 'Plats Cuisinés ', NULL, 'YES', 'NO', 'ecom', 69, '2015-05-11 17:17:25', '2015-05-11 17:17:25', 3, 3, NULL, 'NO'),
(73, 'Viandes, Produits de la Mer', 'Viandes, Produits de la Mer', NULL, 'YES', 'NO', 'ecom', 63, '2015-05-11 17:18:09', '2015-05-11 17:18:09', 3, 3, NULL, 'NO'),
(74, 'Viandes ', 'Viandes ', NULL, 'YES', 'NO', 'ecom', 73, '2015-05-11 17:18:26', '2015-05-11 17:18:26', 3, 3, NULL, 'NO'),
(75, 'Steacks hachés', 'Steacks hachés', NULL, 'YES', 'NO', 'ecom', 73, '2015-05-11 17:18:44', '2015-05-11 17:18:44', 3, 3, NULL, 'NO'),
(76, 'Produits de la Mer', 'Produits de la Mer', NULL, 'YES', 'NO', 'ecom', 73, '2015-05-11 17:19:03', '2015-05-11 17:19:03', 3, 3, NULL, 'NO'),
(77, 'Légumes, Pommes de Terre, Herbes', 'Légumes, Pommes de Terre, Herbes', NULL, 'YES', 'NO', 'ecom', 63, '2015-05-11 17:19:23', '2015-05-11 17:19:23', 3, 3, NULL, 'NO'),
(78, 'Légumes, Soupes', 'Légumes, Soupes', NULL, 'YES', 'NO', 'ecom', 77, '2015-05-11 17:19:44', '2015-05-11 17:19:44', 3, 3, NULL, 'NO'),
(79, 'Frites, Pommes de Terre', 'Frites, Pommes de Terre', NULL, 'YES', 'NO', 'ecom', 77, '2015-05-11 17:20:03', '2015-05-11 17:20:03', 3, 3, NULL, 'NO'),
(80, 'Herbes Aromatiques, sauces', 'Herbes Aromatiques, sauces', NULL, 'YES', 'NO', 'ecom', 77, '2015-05-11 17:20:31', '2015-05-11 17:20:31', 3, 3, NULL, 'NO'),
(81, 'Glaces, Patisseries, Viennoiseries ', 'Glaces, Patisseries, Viennoiseries ', NULL, 'YES', 'NO', 'ecom', 63, '2015-05-11 17:20:53', '2015-05-11 17:20:53', 3, 3, NULL, 'NO'),
(82, 'Glaces Individuelles', 'Glaces Individuelles', NULL, 'YES', 'NO', 'ecom', 81, '2015-05-11 17:21:10', '2015-05-11 17:21:10', 3, 3, NULL, 'NO'),
(83, 'Glaces à Partager ', 'Glaces à Partager ', NULL, 'YES', 'NO', 'ecom', 81, '2015-05-11 17:21:30', '2015-05-11 17:21:30', 3, 3, NULL, 'NO'),
(84, 'Pâtisseries, Viennoiseries', 'Pâtisseries, Viennoiseries', NULL, 'YES', 'NO', 'ecom', 81, '2015-05-11 17:21:52', '2015-05-11 17:21:52', 3, 3, NULL, 'NO'),
(85, 'Accompagnements, Fruits', 'Accompagnements, Fruits', NULL, 'YES', 'NO', 'ecom', 81, '2015-05-11 17:22:10', '2015-05-11 17:22:10', 3, 3, NULL, 'NO'),
(86, 'Enfants', 'Enfants', NULL, 'YES', 'NO', 'ecom', 81, '2015-05-11 17:22:32', '2015-05-11 17:22:32', 3, 3, NULL, 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `hous_category_tagtype`
--

CREATE TABLE IF NOT EXISTS `hous_category_tagtype` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `tagtype_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`tagtype_id`),
  KEY `fk_hous_category_has_hous_tagtype_hous_tagtype1_idx` (`tagtype_id`),
  KEY `fk_hous_category_has_hous_tagtype_hous_category1_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hous_comment`
--

CREATE TABLE IF NOT EXISTS `hous_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `valid` int(1) DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT NULL,
  `trashed` enum('YES','NO') DEFAULT NULL,
  `archived` enum('YES','NO') DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_comment_hous_user1_idx` (`user_id`),
  KEY `fk_hous_comment_hous_post1_idx` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hous_commune`
--

CREATE TABLE IF NOT EXISTS `hous_commune` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `abidjan` enum('YES','NO') DEFAULT 'NO',
  `published` enum('YES','NO') DEFAULT 'NO',
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_commune_hous_zone1_idx` (`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `hous_commune`
--

INSERT INTO `hous_commune` (`id`, `title`, `abidjan`, `published`, `zone_id`) VALUES
(1, 'Adjamé', 'YES', 'NO', 1),
(2, 'Abobo', 'YES', 'NO', 1),
(3, 'Attécoubé', 'YES', 'NO', 1),
(4, 'Marcory', 'YES', 'NO', 1),
(5, 'Treichville', 'YES', 'NO', 1),
(6, 'Koumassi', 'YES', 'NO', 1),
(7, 'Port-Bouët', 'YES', 'NO', 1),
(8, 'Cocody', 'YES', 'NO', 1),
(9, 'Plateau', 'YES', 'NO', 1),
(10, 'Youpougon', 'YES', 'NO', 1),
(11, 'Yamoussoukro', 'NO', 'NO', 2),
(12, 'Dabou', 'NO', 'NO', 2),
(13, 'Sikensi', 'NO', 'NO', 2),
(14, 'Tiassalé', 'NO', 'NO', 2),
(15, 'Anyama', 'NO', 'NO', 2),
(16, 'Vavoua', 'NO', 'NO', 2),
(17, 'Bongouanou', 'NO', 'NO', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hous_credit`
--

CREATE TABLE IF NOT EXISTS `hous_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_credit_hous_user1_idx` (`owner_id`),
  KEY `fk_hous_credit_hous_user2_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hous_credit`
--

INSERT INTO `hous_credit` (`id`, `amount`, `createdate`, `owner_id`, `user_id`) VALUES
(1, 5000, '2015-05-27 22:15:25', 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hous_delivery`
--

CREATE TABLE IF NOT EXISTS `hous_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(110) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_delivery_hous_user1_idx` (`user_id`),
  KEY `fk_hous_delivery_hous_commune1_idx` (`commune_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_delivery`
--

INSERT INTO `hous_delivery` (`id`, `title`, `tel`, `address`, `user_id`, `commune_id`) VALUES
(1, 'Mon domicile', '09130834', 'cool bannn', 12, 12),
(2, 'Mon domicile 2', '09130834', 'Résidence Pailler', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hous_group`
--

CREATE TABLE IF NOT EXISTS `hous_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` datetime NOT NULL,
  `modification` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hous_group_ressource`
--

CREATE TABLE IF NOT EXISTS `hous_group_ressource` (
  `group_id` int(11) NOT NULL,
  `ressource_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`ressource_id`),
  KEY `fk_hous_group_has_hous_ressource_hous_ressource1_idx` (`ressource_id`),
  KEY `fk_hous_group_has_hous_ressource_hous_group1_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hous_label`
--

CREATE TABLE IF NOT EXISTS `hous_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT NULL,
  `trashed` enum('YES','NO') DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `hous_label`
--

INSERT INTO `hous_label` (`id`, `title`, `description`, `published`, `trashed`, `image`) VALUES
(1, 'Samsung', 'Samsung  ', 'YES', 'NO', 'Samsung5537819e8a703.png'),
(2, 'LG', 'LG', 'YES', 'NO', 'LG553782701507e.gif'),
(3, 'Louis Vuitton', 'Louis Vuitton', 'YES', 'NO', 'Louis_Vuitton553783021806a.png'),
(4, 'NIVEA', 'NIVEA', 'YES', 'NO', 'NIVEA553785a0d7220.png'),
(5, 'Pampers', 'Pampers', 'YES', 'NO', 'Pampers553785b2b3275.png'),
(6, 'burberry 2014', 'gdgdhdhff', 'YES', 'YES', NULL),
(7, 'NUMERIKA', 'IT, SECURITY, SOFTWARE, NETWORK', 'YES', 'NO', 'NUMERIKA5537c9d609a6f.png'),
(8, 'qsff', 'qfqfdf', 'YES', 'YES', NULL),
(9, 'zdazfaef', '', 'YES', 'YES', NULL),
(10, 'qfczedfds', '', 'YES', 'YES', NULL),
(11, 'sssssqxvdxv', '', 'YES', 'YES', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hous_old`
--

CREATE TABLE IF NOT EXISTS `hous_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monthes` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `hous_old`
--

INSERT INTO `hous_old` (`id`, `monthes`, `title`) VALUES
(1, 1, '1 mois'),
(2, 2, '2 mois'),
(3, 3, '3 mois'),
(4, 4, '4 mois'),
(5, 5, '5 mois'),
(6, 6, '6 mois'),
(7, 7, '7 mois'),
(8, 8, '8 mois'),
(9, 9, '9 mois'),
(10, 10, '10 mois'),
(11, 11, '11 mois'),
(12, 12, '1 ans'),
(13, 24, '2 ans'),
(14, 36, '3 ans'),
(15, 48, '4 ans'),
(16, 60, '5 ans'),
(17, 72, '6 ans'),
(18, 84, '7 ans'),
(19, 96, '8 ans'),
(20, 108, '9 ans'),
(21, 120, '10 ans'),
(22, 132, '11 ans'),
(23, 144, '12 ans'),
(24, 156, '13 ans'),
(25, 168, '14 ans'),
(26, 180, '15 ans'),
(27, 192, '16 ans'),
(28, 204, '17 ans'),
(29, 216, '18 ans'),
(30, 228, '19 ans'),
(31, 240, '20 ans'),
(32, 252, '21 ans'),
(33, 264, '22 ans'),
(34, 276, '23 ans'),
(35, 288, '24 ans'),
(36, 300, '25 ans'),
(37, 312, '26 ans'),
(38, 324, '27 ans'),
(39, 336, '28 ans'),
(40, 348, '29 ans'),
(41, 360, '30 ans'),
(42, 372, '31 ans'),
(43, 384, '32 ans'),
(44, 396, '33 ans'),
(45, 408, '34 ans'),
(46, 420, '35 ans'),
(47, 432, '36 ans'),
(48, 444, '37 ans'),
(49, 456, '38 ans'),
(50, 468, '39 ans'),
(51, 480, '40 ans'),
(52, 492, '41 ans'),
(53, 504, '42 ans'),
(54, 516, '43 ans'),
(55, 528, '44 ans'),
(56, 540, '45 ans'),
(57, 552, '46 ans'),
(58, 564, '47 ans'),
(59, 576, '48 ans'),
(60, 588, '49 ans'),
(61, 600, '50 ans'),
(62, 612, '51 ans'),
(63, 624, '52 ans'),
(64, 636, '53 ans'),
(65, 648, '54 ans'),
(66, 660, '55 ans'),
(67, 672, '56 ans'),
(68, 684, '57 ans'),
(69, 696, '58 ans'),
(70, 708, '59 ans'),
(71, 720, '60 ans'),
(72, 732, '61 ans'),
(73, 744, '62 ans'),
(74, 756, '63 ans'),
(75, 768, '64 ans'),
(76, 780, '65 ans'),
(77, 792, '66 ans'),
(78, 804, '67 ans'),
(79, 816, '68 ans'),
(80, 828, '69 ans'),
(81, 840, '70 ans'),
(82, 852, '71 ans'),
(83, 864, '72 ans'),
(84, 876, '73 ans'),
(85, 888, '74 ans'),
(86, 900, '75 ans'),
(87, 912, '76 ans'),
(88, 924, '77 ans'),
(89, 936, '78 ans'),
(90, 948, '79 ans'),
(91, 960, '80 ans'),
(92, 972, '81 ans'),
(93, 984, '82 ans'),
(94, 996, '83 ans'),
(95, 1008, '84 ans'),
(96, 1020, '85 ans'),
(97, 1032, '86 ans'),
(98, 1044, '87 ans'),
(99, 1056, '88 ans'),
(100, 1068, '89 ans'),
(101, 1080, '90 ans'),
(102, 1092, '91 ans'),
(103, 1104, '92 ans'),
(104, 1116, '93 ans'),
(105, 1128, '94 ans'),
(106, 1140, '95 ans'),
(107, 1152, '96 ans'),
(108, 1164, '97 ans'),
(109, 1176, '98 ans'),
(110, 1188, '99 ans'),
(111, 1200, '100 ans'),
(112, 1212, '101 ans'),
(113, 1224, '102 ans'),
(114, 1236, '103 ans'),
(115, 1248, '104 ans'),
(116, 1260, '105 ans'),
(117, 1272, '106 ans'),
(118, 1284, '107 ans'),
(119, 1296, '108 ans'),
(120, 1308, '109 ans'),
(121, 1320, '110 ans'),
(122, 1332, '111 ans'),
(123, 1344, '112 ans'),
(124, 1356, '113 ans'),
(125, 1368, '114 ans'),
(126, 1380, '115 ans'),
(127, 1392, '116 ans'),
(128, 1404, '117 ans'),
(129, 1416, '118 ans'),
(130, 1428, '119 ans'),
(131, 1440, '120 ans');

-- --------------------------------------------------------

--
-- Table structure for table `hous_order`
--

CREATE TABLE IF NOT EXISTS `hous_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  `createduser` int(11) NOT NULL,
  `modifyuser` int(11) NOT NULL,
  `trashed` enum('NO','YES') DEFAULT 'NO',
  `user_id` int(11) NOT NULL,
  `cost` float DEFAULT NULL,
  `transport` float DEFAULT NULL,
  `commune_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `statut_id` int(11) DEFAULT NULL,
  `tel` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `sold` enum('YES','NO') DEFAULT 'NO',
  PRIMARY KEY (`id`),
  KEY `fk_hous_indent_hous_user1_idx` (`user_id`),
  KEY `fk_hous_indent_hous_commune1_idx` (`commune_id`),
  KEY `payment_id` (`payment_id`),
  KEY `statut_id` (`statut_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_order`
--

INSERT INTO `hous_order` (`id`, `createdate`, `modifydate`, `createduser`, `modifyuser`, `trashed`, `user_id`, `cost`, `transport`, `commune_id`, `payment_id`, `statut_id`, `tel`, `address`, `sold`) VALUES
(1, '2015-05-20 13:57:49', '2015-05-20 13:57:49', 12, 12, 'NO', 12, 51000, 5000, 1, 2, 1, '09130834', 'Résidence Pailler bat 15 , appt 233', 'NO'),
(2, '2015-05-29 15:02:48', '2015-05-29 15:02:48', 12, 12, 'NO', 12, 6000, 5000, 8, 1, 1, '47972733', 'riviera palmeraie', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `hous_order_product`
--

CREATE TABLE IF NOT EXISTS `hous_order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `rprice` float NOT NULL DEFAULT '0' COMMENT 'reduce price',
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_hous_order_has_hous_product_hous_product1_idx` (`product_id`),
  KEY `fk_hous_order_has_hous_product_hous_order1_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hous_order_product`
--

INSERT INTO `hous_order_product` (`order_id`, `product_id`, `qty`, `price`, `rprice`) VALUES
(1, 1, 2, 3000, 1500),
(1, 3, 3, 15000, 15000),
(2, 1, 2, 3000, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `hous_order_product_tax`
--

CREATE TABLE IF NOT EXISTS `hous_order_product_tax` (
  `order_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  PRIMARY KEY (`order_id`,`tax_id`,`product_id`),
  KEY `fk_hous_order_has_hous_tax_hous_tax1_idx` (`tax_id`),
  KEY `fk_hous_order_has_hous_tax_hous_order1_idx` (`order_id`),
  KEY `fk_hous_order_has_hous_tax_hous_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hous_order_product_tax`
--

INSERT INTO `hous_order_product_tax` (`order_id`, `tax_id`, `product_id`, `rate`) VALUES
(1, 1, 1, 18),
(1, 2, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `hous_payment`
--

CREATE TABLE IF NOT EXISTS `hous_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `published` enum('YES','NO') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hous_payment`
--

INSERT INTO `hous_payment` (`id`, `title`, `published`) VALUES
(1, 'Cash à la livraison', 'YES'),
(2, 'Credit Gouabo (Prépayé)', 'YES'),
(4, 'Orange Money', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `hous_post`
--

CREATE TABLE IF NOT EXISTS `hous_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(110) NOT NULL,
  `slug` varchar(300) DEFAULT NULL,
  `content` text,
  `author` varchar(60) DEFAULT NULL,
  `order` int(2) DEFAULT NULL,
  `edit_number` int(11) DEFAULT '0',
  `meta_description` varchar(200) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `meta_robots` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT 'YES',
  `featured` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `views` int(2) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `slug` (`slug`),
  KEY `fk_hous_post_hous_user_idx` (`user_id`),
  KEY `fk_hous_post_hous_category1_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hous_post`
--

INSERT INTO `hous_post` (`id`, `title`, `slug`, `content`, `author`, `order`, `edit_number`, `meta_description`, `meta_keywords`, `meta_robots`, `created`, `modified`, `published`, `featured`, `views`, `user_id`, `startdate`, `enddate`, `category_id`) VALUES
(8, 'Conditions d''utilisation', 'conditions-generales', '<h1 class="page-heading">Terms and conditions of use</h1>\r\n<h3 class="page-subheading">Rule 1<img id="__mcenew" src="/gouabo/www/images/blog/logo-login.png" alt="" width="180" height="180" /></h3>\r\n<p class="bottom-indent">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<h3 class="page-subheading">Rule 2</h3>\r\n<p class="bottom-indent">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam?</p>\r\n<h3 class="page-subheading">Rule 3</h3>\r\n<p class="bottom-indent">Tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam?</p>', NULL, NULL, 8, NULL, NULL, NULL, '2015-04-24 13:35:05', '2015-05-11 11:26:28', 'YES', '', 0, 3, NULL, NULL, 39),
(9, 'Nos Contacts', 'nos-contacts', '<p>Nos Contacts<br/></p>', NULL, NULL, 0, NULL, NULL, NULL, '2015-04-24 13:43:11', '2015-04-24 13:43:11', 'YES', 'NO', 0, 3, NULL, NULL, 39),
(10, 'Mentions Légales', 'mentions-legales', '<p>Mentions L&eacute;gales</p>', NULL, NULL, 0, NULL, NULL, NULL, '2015-05-08 09:04:36', '2015-05-08 09:04:36', 'YES', 'NO', 0, 3, NULL, NULL, 39),
(11, 'Partenariat', 'partenariat', '<p>Partenariat</p>', NULL, NULL, 0, NULL, NULL, NULL, '2015-05-08 09:05:05', '2015-05-08 09:05:05', 'YES', 'NO', 0, 3, NULL, NULL, 39),
(12, 'Cookies', 'cookies', '<p>Cookies</p>', NULL, NULL, 0, NULL, NULL, NULL, '2015-05-08 09:05:24', '2015-05-08 09:05:24', 'YES', 'NO', 0, 3, NULL, NULL, 39),
(13, 'A propos', 'a-propos', '<p>Apropos</p>', NULL, NULL, 0, NULL, NULL, NULL, '2015-05-08 09:05:46', '2015-05-08 09:05:46', 'YES', 'NO', 0, 3, NULL, NULL, 39);

-- --------------------------------------------------------

--
-- Table structure for table `hous_pricing`
--

CREATE TABLE IF NOT EXISTS `hous_pricing` (
  `zone_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`zone_id`,`step_id`),
  KEY `fk_hous_zone_has_hous_step_hous_step1_idx` (`step_id`),
  KEY `fk_hous_zone_has_hous_step_hous_zone1_idx` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hous_pricing`
--

INSERT INTO `hous_pricing` (`zone_id`, `step_id`, `price`) VALUES
(1, 4, 5000),
(1, 6, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `hous_product`
--

CREATE TABLE IF NOT EXISTS `hous_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` text,
  `other` text,
  `price` float DEFAULT '0',
  `image` varchar(300) DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT NULL,
  `trashed` enum('YES','NO') DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `modifydate` datetime NOT NULL,
  `createduser` int(11) NOT NULL,
  `modifyuser` int(11) NOT NULL,
  `weight` float DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `label_id` int(11) DEFAULT NULL,
  `start_old_id` int(11) DEFAULT NULL,
  `end_old_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_product_hous_category1_idx` (`category_id`),
  KEY `fk_hous_product_hous_label1_idx` (`label_id`),
  KEY `fk_hous_product_hous_old1_idx` (`start_old_id`),
  KEY `fk_hous_product_hous_old2_idx` (`end_old_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hous_product`
--

INSERT INTO `hous_product` (`id`, `title`, `description`, `other`, `price`, `image`, `published`, `trashed`, `createdate`, `modifydate`, `createduser`, `modifyuser`, `weight`, `category_id`, `label_id`, `start_old_id`, `end_old_id`) VALUES
(1, 'Poulet Numerika ', '<p>Le Lorem Ipsum est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</p>\r\n', '<p>Aucune</p>\r\n', 3000, '{"0":"5537ce26a63217.44220099.jpg"}', 'YES', 'NO', '2015-04-22 16:34:46', '2015-05-19 12:40:08', 3, 3, 4, 27, 7, 16, 96),
(2, 'Tomates Numerika ', '<p>les meilleures tomates du march&eacute;</p>\r\n', '<p>les meilleures tomates du march&eacute;</p>\r\n', 500, '{"0":"5538dea3036d18.50090553.jpg"}', 'YES', 'NO', '2015-04-23 11:59:30', '2015-05-19 12:14:12', 3, 3, 0.5, 4, NULL, NULL, NULL),
(3, 'Carpes rouges frais Numerika', '<p>Decouvrez le poisson numerika</p>\r\n', '<p>Decouvrez le poisson numerika</p>\r\n', 15000, '{"0":"555375ff41ac93.48063148.jpg"}', 'YES', 'NO', '2015-05-13 16:04:14', '2015-05-18 11:09:24', 3, 3, 1, 31, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hous_product_tag`
--

CREATE TABLE IF NOT EXISTS `hous_product_tag` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `fk_hous_product_has_tag_tag1_idx` (`tag_id`),
  KEY `fk_hous_product_has_tag_hous_product_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hous_product_tax`
--

CREATE TABLE IF NOT EXISTS `hous_product_tax` (
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `fk_hous_product_has_tax_tax1_idx` (`tax_id`),
  KEY `fk_hous_product_has_tax_hous_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hous_product_tax`
--

INSERT INTO `hous_product_tax` (`product_id`, `tax_id`) VALUES
(1, 1),
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hous_promo`
--

CREATE TABLE IF NOT EXISTS `hous_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` float DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `published` enum('YES','NO') DEFAULT 'NO' COMMENT 'user status',
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_promo_hous_product1_idx` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_promo`
--

INSERT INTO `hous_promo` (`id`, `rate`, `startdate`, `enddate`, `published`, `product_id`) VALUES
(1, 50, '1899-11-30 00:00:00', '2015-11-30 00:00:00', 'YES', 1),
(2, 10, '1899-11-30 00:00:00', '2015-05-18 00:00:00', 'YES', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hous_ressource`
--

CREATE TABLE IF NOT EXISTS `hous_ressource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hous_statut`
--

CREATE TABLE IF NOT EXISTS `hous_statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hous_statut`
--

INSERT INTO `hous_statut` (`id`, `title`) VALUES
(4, 'Abandonne'),
(1, 'En attente de confirmation'),
(2, 'En attente de livraison'),
(3, 'Livre');

-- --------------------------------------------------------

--
-- Table structure for table `hous_step`
--

CREATE TABLE IF NOT EXISTS `hous_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `start` varchar(45) DEFAULT NULL,
  `end` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hous_step`
--

INSERT INTO `hous_step` (`id`, `title`, `start`, `end`) VALUES
(4, 'poids lourd', '15', '6'),
(6, 'poids', '0.5', '5');

-- --------------------------------------------------------

--
-- Table structure for table `hous_tag`
--

CREATE TABLE IF NOT EXISTS `hous_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `tagtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hous_tag_hous_tagtype1_idx` (`tagtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_tag`
--

INSERT INTO `hous_tag` (`id`, `title`, `tagtype_id`) VALUES
(1, 'Femme', 1),
(2, 'Homme', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hous_tagtype`
--

CREATE TABLE IF NOT EXISTS `hous_tagtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_tagtype`
--

INSERT INTO `hous_tagtype` (`id`, `title`, `description`) VALUES
(1, 'Sexe', 'Sexe'),
(2, 'Taille', 'Taille');

-- --------------------------------------------------------

--
-- Table structure for table `hous_tax`
--

CREATE TABLE IF NOT EXISTS `hous_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `published` enum('YES','NO') NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_tax`
--

INSERT INTO `hous_tax` (`id`, `title`, `rate`, `published`) VALUES
(1, 'TVA', 18, 'YES'),
(2, 'LUXURE', 10, 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `hous_user`
--

CREATE TABLE IF NOT EXISTS `hous_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(110) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `nickname` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `hous_user`
--

INSERT INTO `hous_user` (`id`, `login`, `password`, `email`, `lastname`, `firstname`, `phone`, `nickname`, `professionnal`, `keyactivate`, `sessionid`, `appkey`, `createdate`, `modifydate`, `createduser`, `modifyuser`, `active`, `birthdate`) VALUES
(3, 'admin@gouabo.dev', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'sergyleves@gmail.com', 'Administrator', 'Admin', NULL, 'superman', 'YES', NULL, NULL, NULL, NULL, '2015-05-08 10:57:05', 1, 1, 'YES', '1990-12-21'),
(12, 'aurelle.meless@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'aurelle.meless@gmail.com', 'Super', 'Administrateur', NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-04 17:22:20', '2015-05-29 12:58:15', NULL, NULL, 'NO', '1990-05-04'),
(13, 'danny.mukenge@numerika-group.com', '8cb2237d0679ca88db6464eac60da96345513964', 'danny.mukenge@numerika-group.com', 'MUK', 'DAn', NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-08 11:02:49', '2015-05-08 12:12:45', NULL, NULL, 'NO', '1993-03-14'),
(14, 'kyfreddy@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'kyfreddy@gmail.com', 'ESSA', 'ESSAI', NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-08 11:42:15', '2015-05-08 12:21:27', NULL, NULL, 'NO', '1977-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `hous_user_group`
--

CREATE TABLE IF NOT EXISTS `hous_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `fk_user_has_group_group1_idx` (`group_id`),
  KEY `fk_user_has_group_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hous_voucher`
--

CREATE TABLE IF NOT EXISTS `hous_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(110) NOT NULL,
  `code` varchar(45) NOT NULL,
  `activatedate` date NOT NULL,
  `duration` int(11) NOT NULL,
  `voucher` enum('NO','YES') NOT NULL,
  `reduction` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `qty` int(11) NOT NULL,
  `used` enum('NO','YES') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hous_voucher`
--

INSERT INTO `hous_voucher` (`id`, `title`, `code`, `activatedate`, `duration`, `voucher`, `reduction`, `createdate`, `qty`, `used`) VALUES
(1, 'Promo fête des mères', 'OMOD0PCE', '2015-05-13', 60, 'YES', 25000, '2015-05-13 09:44:42', 3, 'NO'),
(2, 'Pentecôte', 'SNLT9M87', '2015-05-13', 2, 'YES', 5000, '2015-05-13 10:37:33', 2, 'NO'),
(3, 'Fete des peres', 'XUGPGTSB', '2015-05-15', 60, 'NO', 30, '2015-05-15 17:20:00', 50, 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `hous_voucher_order`
--

CREATE TABLE IF NOT EXISTS `hous_voucher_order` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`voucher_id`,`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `fk_hous_voucher_has_hous_order_hous_order1_idx` (`order_id`),
  KEY `fk_hous_voucher_has_hous_order_hous_voucher1_idx` (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hous_zone`
--

CREATE TABLE IF NOT EXISTS `hous_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `price` float DEFAULT NULL,
  `published` enum('YES','NO') DEFAULT 'NO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hous_zone`
--

INSERT INTO `hous_zone` (`id`, `title`, `price`, `published`) VALUES
(1, 'Abidjan', NULL, 'NO'),
(2, 'Intérieur du pays', NULL, 'NO');

-- --------------------------------------------------------

--
-- Stand-in structure for view `products`
--
CREATE TABLE IF NOT EXISTS `products` (
`id` int(11)
,`title` varchar(45)
,`description` text
,`other` text
,`price` float
,`image` varchar(300)
,`published` enum('YES','NO')
,`trashed` enum('YES','NO')
,`createdate` datetime
,`modifydate` datetime
,`createduser` int(11)
,`modifyuser` int(11)
,`weight` float
,`category_id` int(11)
,`label_id` int(11)
,`start_old_id` int(11)
,`end_old_id` int(11)
,`label_title` varchar(45)
,`category_title` varchar(45)
,`category_parent` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `product_list`
--
CREATE TABLE IF NOT EXISTS `product_list` (
`id` int(11)
,`title` varchar(45)
,`description` text
,`other` text
,`price` float
,`image` varchar(300)
,`published` enum('YES','NO')
,`trashed` enum('YES','NO')
,`createdate` datetime
,`modifydate` datetime
,`createduser` int(11)
,`modifyuser` int(11)
,`weight` float
,`category_id` int(11)
,`label_id` int(11)
,`start_old_id` int(11)
,`end_old_id` int(11)
,`label_title` varchar(45)
,`category_title` varchar(45)
,`category_parent` int(11)
,`parent_parent` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `products`
--
DROP TABLE IF EXISTS `products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products` AS (select `p`.`id` AS `id`,`p`.`title` AS `title`,`p`.`description` AS `description`,`p`.`other` AS `other`,`p`.`price` AS `price`,`p`.`image` AS `image`,`p`.`published` AS `published`,`p`.`trashed` AS `trashed`,`p`.`createdate` AS `createdate`,`p`.`modifydate` AS `modifydate`,`p`.`createduser` AS `createduser`,`p`.`modifyuser` AS `modifyuser`,`p`.`weight` AS `weight`,`p`.`category_id` AS `category_id`,`p`.`label_id` AS `label_id`,`p`.`start_old_id` AS `start_old_id`,`p`.`end_old_id` AS `end_old_id`,`l`.`title` AS `label_title`,`cat`.`title` AS `category_title`,`cat`.`parent` AS `category_parent` from ((`hous_product` `p` left join `hous_label` `l` on((`p`.`label_id` = `l`.`id`))) join `hous_category` `cat` on((`p`.`category_id` = `cat`.`id`))));

-- --------------------------------------------------------

--
-- Structure for view `product_list`
--
DROP TABLE IF EXISTS `product_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_list` AS (select `p`.`id` AS `id`,`p`.`title` AS `title`,`p`.`description` AS `description`,`p`.`other` AS `other`,`p`.`price` AS `price`,`p`.`image` AS `image`,`p`.`published` AS `published`,`p`.`trashed` AS `trashed`,`p`.`createdate` AS `createdate`,`p`.`modifydate` AS `modifydate`,`p`.`createduser` AS `createduser`,`p`.`modifyuser` AS `modifyuser`,`p`.`weight` AS `weight`,`p`.`category_id` AS `category_id`,`p`.`label_id` AS `label_id`,`p`.`start_old_id` AS `start_old_id`,`p`.`end_old_id` AS `end_old_id`,`l`.`title` AS `label_title`,`cat`.`title` AS `category_title`,`cat`.`parent` AS `category_parent`,`catparent`.`parent` AS `parent_parent` from (((`hous_product` `p` left join `hous_label` `l` on((`p`.`label_id` = `l`.`id`))) join `hous_category` `cat` on((`p`.`category_id` = `cat`.`id`))) left join `hous_category` `catparent` on((`cat`.`parent` = `catparent`.`id`))));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hous_account`
--
ALTER TABLE `hous_account`
  ADD CONSTRAINT `fk_hous_account_hous_user1` FOREIGN KEY (`user_id`) REFERENCES `hous_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_category_tagtype`
--
ALTER TABLE `hous_category_tagtype`
  ADD CONSTRAINT `fk_hous_category_has_hous_tagtype_hous_category1` FOREIGN KEY (`category_id`) REFERENCES `hous_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_category_has_hous_tagtype_hous_tagtype1` FOREIGN KEY (`tagtype_id`) REFERENCES `hous_tagtype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_commune`
--
ALTER TABLE `hous_commune`
  ADD CONSTRAINT `fk_hous_commune_hous_zone1` FOREIGN KEY (`zone_id`) REFERENCES `hous_zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_credit`
--
ALTER TABLE `hous_credit`
  ADD CONSTRAINT `fk_hous_credit_hous_user1` FOREIGN KEY (`owner_id`) REFERENCES `hous_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_credit_hous_user2` FOREIGN KEY (`user_id`) REFERENCES `hous_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_delivery`
--
ALTER TABLE `hous_delivery`
  ADD CONSTRAINT `fk_delivery_hous_user1` FOREIGN KEY (`user_id`) REFERENCES `hous_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_delivery_hous_commune1` FOREIGN KEY (`commune_id`) REFERENCES `hous_commune` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_order_product`
--
ALTER TABLE `hous_order_product`
  ADD CONSTRAINT `fk_hous_order_has_hous_product_hous_order1` FOREIGN KEY (`order_id`) REFERENCES `hous_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_order_has_hous_product_hous_product1` FOREIGN KEY (`product_id`) REFERENCES `hous_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_order_product_tax`
--
ALTER TABLE `hous_order_product_tax`
  ADD CONSTRAINT `fk_hous_order_has_hous_tax_hous_order1` FOREIGN KEY (`order_id`) REFERENCES `hous_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_order_has_hous_tax_hous_product1` FOREIGN KEY (`product_id`) REFERENCES `hous_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_order_has_hous_tax_hous_tax1` FOREIGN KEY (`tax_id`) REFERENCES `hous_tax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_post`
--
ALTER TABLE `hous_post`
  ADD CONSTRAINT `fk_hous_post_hous_category1` FOREIGN KEY (`category_id`) REFERENCES `hous_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_pricing`
--
ALTER TABLE `hous_pricing`
  ADD CONSTRAINT `fk_hous_zone_has_hous_step_hous_step1` FOREIGN KEY (`step_id`) REFERENCES `hous_step` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_zone_has_hous_step_hous_zone1` FOREIGN KEY (`zone_id`) REFERENCES `hous_zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_product`
--
ALTER TABLE `hous_product`
  ADD CONSTRAINT `fk_hous_product_hous_category1` FOREIGN KEY (`category_id`) REFERENCES `hous_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_product_hous_label1` FOREIGN KEY (`label_id`) REFERENCES `hous_label` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_product_hous_old1` FOREIGN KEY (`start_old_id`) REFERENCES `hous_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_product_hous_old2` FOREIGN KEY (`end_old_id`) REFERENCES `hous_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_product_tag`
--
ALTER TABLE `hous_product_tag`
  ADD CONSTRAINT `fk_hous_product_has_tag_hous_product` FOREIGN KEY (`product_id`) REFERENCES `hous_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_product_has_tag_tag1` FOREIGN KEY (`tag_id`) REFERENCES `hous_tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_product_tax`
--
ALTER TABLE `hous_product_tax`
  ADD CONSTRAINT `fk_hous_product_has_tax_hous_product1` FOREIGN KEY (`product_id`) REFERENCES `hous_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_product_has_tax_tax1` FOREIGN KEY (`tax_id`) REFERENCES `hous_tax` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_promo`
--
ALTER TABLE `hous_promo`
  ADD CONSTRAINT `fk_promo_hous_product1` FOREIGN KEY (`product_id`) REFERENCES `hous_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_tag`
--
ALTER TABLE `hous_tag`
  ADD CONSTRAINT `fk_hous_tag_hous_tagtype1` FOREIGN KEY (`tagtype_id`) REFERENCES `hous_tagtype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hous_voucher_order`
--
ALTER TABLE `hous_voucher_order`
  ADD CONSTRAINT `fk_hous_voucher_has_hous_order_hous_order1` FOREIGN KEY (`order_id`) REFERENCES `hous_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hous_voucher_has_hous_order_hous_voucher1` FOREIGN KEY (`voucher_id`) REFERENCES `hous_voucher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
