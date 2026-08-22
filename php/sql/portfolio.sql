-- ============================================================================
-- Script SQL d'initialisation de la Base de Données du Portfolio
-- Base de données : portfolio_db
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `portfolio_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `portfolio_db`;

-- --------------------------------------------------------
-- Table 1 : `messages_contact` (Formulaire de contact direct)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `messages_contact` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR(100) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `sujet` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `date_envoi` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `lu` BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table 2 : `demandes_projet` (Formulaire de devis / demande de projet)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `demandes_projet` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nom_client` VARCHAR(100) NOT NULL,
    `email_client` VARCHAR(150) NOT NULL,
    `type_projet` VARCHAR(100) NOT NULL,
    `budget` VARCHAR(50) DEFAULT NULL,
    `description_projet` TEXT NOT NULL,
    `statut` ENUM('En attente', 'En cours', 'Accepté', 'Refusé') DEFAULT 'En attente',
    `date_demande` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table 3 : `projets` (Gestion dynamique future des projets)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `projets` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `titre` VARCHAR(150) NOT NULL,
    `categorie` VARCHAR(50) NOT NULL,
    `description` TEXT NOT NULL,
    `image_url` VARCHAR(255) NOT NULL,
    `tags` VARCHAR(255) NOT NULL,
    `lien_demo` VARCHAR(255) DEFAULT NULL,
    `lien_github` VARCHAR(255) DEFAULT NULL,
    `date_creation` DATE DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table 4 : `competences` (Gestion dynamique des compétences)
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `competences` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR(100) NOT NULL,
    `categorie` ENUM('Frontend', 'Backend', 'Database', 'DevOps', 'Autre') NOT NULL,
    `niveau_pourcentage` INT NOT NULL,
    `icone_fa` VARCHAR(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de test / Données initiales (Jeu d'essai)
-- --------------------------------------------------------

INSERT INTO `projets` (`titre`, `categorie`, `description`, `image_url`, `tags`, `lien_github`) VALUES
('MerchFlow - Plateforme E-Commerce', 'Web', 'Plateforme complète de gestion des ventes, inventaires et analytiques temps réel.', 'images/projets/projet1.jpg', 'PHP, MySQL, JavaScript, Chart.js', 'https://github.com'),
('PayWallet - Application Banque Mobile', 'Mobile', 'Application mobile de portefeuille numérique permettant les transferts instantanés.', 'images/projets/projet2.jpg', 'React Native, Node.js, REST API', 'https://github.com'),
('Synapse AI - Dashboard d\'Analyse IA', 'Fullstack', 'Outil d\'exploration visuelle de données complexes exploitant des modèles prédictifs.', 'images/projets/projet3.jpg', 'Python, FastAPI, React, Tailwind', 'https://github.com'),
('Nexus Studio - Site 3D Immersif', 'UI/UX', 'Site vitrine d\'agence créative avec des maillages 3D fluides et animations interactives.', 'images/projets/projet4.jpg', 'Three.js, WebGL, GSAP, HTML5', 'https://github.com');

INSERT INTO `competences` (`nom`, `categorie`, `niveau_pourcentage`, `icone_fa`) VALUES
('HTML5 / CSS3', 'Frontend', 95, 'fa-html5'),
('JavaScript ES6+', 'Frontend', 90, 'fa-js'),
('React / Next.js', 'Frontend', 85, 'fa-react'),
('PHP 8 / POO', 'Backend', 88, 'fa-php'),
('Node.js / Express', 'Backend', 80, 'fa-node-js'),
('MySQL / PDO', 'Database', 85, 'fa-database'),
('Git / GitHub', 'DevOps', 90, 'fa-git-alt');
