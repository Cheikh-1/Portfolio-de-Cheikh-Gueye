<?php
/**
 * connexion.php - Fichier de connexion PDO à la base de données MySQL
 */

$host = 'localhost';
$dbname = 'portfolio';
$username = 'root';
$password = ''; // Par défaut dans XAMPP
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$dbname;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $username, $password, $options);
} catch (\PDOException $e) {
    // Si la base n'existe pas encore ou en cas d'erreur de connexion
    // Ne pas bloquer l'affichage frontend si MySQL n'est pas démarré
    $pdo = null;
    error_log("Erreur de connexion MySQL : " . $e->getMessage());
}
?>
