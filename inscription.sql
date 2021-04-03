-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 25 mars 2021 à 12:58
-- Version du serveur :  8.0.18
-- Version de PHP :  7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `inscription`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210325061134', '2021-03-25 06:11:42', 744),
('DoctrineMigrations\\Version20210325062121', '2021-03-25 06:21:36', 7344),
('DoctrineMigrations\\Version20210325062257', '2021-03-25 06:23:04', 1438),
('DoctrineMigrations\\Version20210325094709', '2021-03-25 09:47:18', 354);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datenaiss` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee_bac` int(11) NOT NULL,
  `ecole` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `firstname`, `lastname`, `datenaiss`, `address`, `phone`, `email`, `serie`, `annee_bac`, `ecole`, `fichier_file`) VALUES
(1, 'Sandratra', 'RAKOTONARIVO', '09/11/1998', 'II B TER A Amboditsiry', 348406161, 'syraxrakotonarivo@gmail.com', 'D', 2016, 'Petit nid', 'instructions_utilisation.pdf'),
(2, 'Jisia', 'RAMANANTOANINA', '13/04/1999', 'C1c Ambohitrarahaba', 332848333, 'dimbisoajisia@gmail.com', 'C', 2015, 'Le Petit Nid', 'instructions_utilisation.pdf'),
(3, 'Manoa Fitiavana', 'ANDRIANJAFIMAHEFARINJO', '11/01/00', 'Lot 92D Tanetibe Ilafy', 349307683, 'manoaharinjo@gmail.com', 'A', 2014, 'Lycee Analamahintsy', 'instructions_utilisation.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

DROP TABLE IF EXISTS `filiere`;
CREATE TABLE IF NOT EXISTS `filiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id`, `nom`) VALUES
(1, 'BIO'),
(2, 'IGGLIA'),
(3, 'ISAIA'),
(4, 'ESIIA'),
(5, 'IMTICIA'),
(6, 'GCA'),
(7, 'EMII'),
(8, 'TEH'),
(9, 'ICMP'),
(10, 'CAA'),
(11, 'EMP'),
(12, 'FIC'),
(13, 'DTJA'),
(14, 'TEE');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_id` int(11) DEFAULT NULL,
  `filiere_id` int(11) DEFAULT NULL,
  `paiement_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UNIQ_5E90F6D6DDEAB1A3` (`etudiant_id`) USING BTREE,
  KEY `UNIQ_5E90F6D62A4C4478` (`paiement_id`) USING BTREE,
  KEY `UNIQ_5E90F6D6180AA129` (`filiere_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `etudiant_id`, `filiere_id`, `paiement_id`, `created_at`) VALUES
(15, 1, 4, 2, '2021-03-25 12:01:51'),
(16, 2, 2, 3, '2021-03-25 12:03:30'),
(17, 3, 4, 4, '2021-03-25 12:06:11');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode_paiement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `mode_paiement`) VALUES
(1, 'Airtel Money'),
(2, 'Orange Money'),
(3, 'Mvola'),
(4, 'Cheque'),
(5, 'Especes');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D6180AA129` FOREIGN KEY (`filiere_id`) REFERENCES `filiere` (`id`),
  ADD CONSTRAINT `FK_5E90F6D62A4C4478` FOREIGN KEY (`paiement_id`) REFERENCES `paiement` (`id`),
  ADD CONSTRAINT `FK_5E90F6D6DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
