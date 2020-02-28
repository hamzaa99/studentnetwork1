-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 28 Février 2020 à 13:56
-- Version du serveur :  5.7.29-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `studentnetwork`
--

-- --------------------------------------------------------

--
-- Structure de la table `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

CREATE TABLE `publication` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ratio` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `publication`
--

INSERT INTO `publication` (`id`, `titre`, `contenu`, `image`, `ratio`, `date`, `user_id`) VALUES
(1, 'ma premiere', 'loldflgodfdgdfdf', NULL, NULL, '2020-02-25', 10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `photo_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `motdepasse` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `username`, `email`, `date_naissance`, `photo_profile`, `motdepasse`) VALUES
(1, 'medjnoun', 'nassim', 'nassim009', 'nassimmedjnoun@gmail.com', '1999-08-06', NULL, '123456'),
(2, 'wayne', 'john', 'johnwayne', 'johnwayne@gmail.com', '1985-01-01', NULL, '789123'),
(4, 'wayne', 'john', 'johnwayne2', 'johnwayne2@gmail.com', '1985-01-01', NULL, '456789'),
(5, 'kent', 'clark', 'superman', 'superman@gmail.com', '1943-10-14', NULL, '123456'),
(6, 'stark', 'Anthony', 'ironman', 'ironman@gmail.com', '1980-09-13', NULL, 'pepper99'),
(7, 'Wayne', 'Bruce', 'batman', 'batman-contact@gmail.com', '1953-07-26', NULL, '$2y$10$9t/53uo3btv/Zm4HipZgTuksD3msAD.kJV39zroeHgH7Mru9SQ8/C'),
(8, 'bidule', 'machin', 'pseudo', 'emailauhasard@gmail.com', '1900-01-01', NULL, '$2y$10$/CvEkm9bfh5XpGtSf3EIL..8bmttXxsLk1dn/hgnUu6jWDUC4CRHS'),
(10, 'toto', 'toto', 'pseudo2', 'mail@gmail.com', '1916-09-11', NULL, '$2y$10$nNXyes/jeuUwJCHpdbNHFuAL7RTHGOxBM/eN0XyuGekq01mfS5F4m');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`user_id`,`friend_user_id`),
  ADD KEY `IDX_21EE7069A76ED395` (`user_id`),
  ADD KEY `IDX_21EE706993D1119E` (`friend_user_id`);

--
-- Index pour la table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AF3C6779A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `FK_21EE706993D1119E` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_21EE7069A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `FK_AF3C6779A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
