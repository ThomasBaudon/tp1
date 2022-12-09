-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 09 déc. 2022 à 09:40
-- Version du serveur : 5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221207154304', '2022-12-07 15:43:24', 92);

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `id` int(11) NOT NULL,
  `pilote_id` int(11) DEFAULT NULL,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`id`, `pilote_id`, `nom`, `prenom`, `email`) VALUES
(2, 2, 'Baudon', 'Thomas', 'thomas@thomasbaudon.fr'),
(4, 3, 'Baudon-Nevens', 'Mathias', 'mathias@thomasbaudon.fr'),
(5, 5, 'Nevens', 'Marion', 'marion@thomasbaudon.fr'),
(6, 4, 'Baudon', 'Anaïs', 'anais@thomasbaudon.fr'),
(7, 6, 'Nevens', 'Jarvis', 'jarvis@hotmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `qualification`
--

CREATE TABLE `qualification` (
  `id` int(11) NOT NULL,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `qualification`
--

INSERT INTO `qualification` (`id`, `code`, `libelle`) VALUES
(2, 'COM', 'Commandant de Bord'),
(3, 'STW', 'Stewart'),
(4, 'HOT', 'Hôtesse de l\'air'),
(5, 'COP', 'Copilote'),
(6, 'PNC', 'Personnel Navigant Commercial');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A3254DDF510AAE9` (`pilote_id`);

--
-- Index pour la table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pilote`
--
ALTER TABLE `pilote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD CONSTRAINT `FK_6A3254DDF510AAE9` FOREIGN KEY (`pilote_id`) REFERENCES `qualification` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
