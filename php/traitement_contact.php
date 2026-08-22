<?php
/**
 * traitement_contact.php - Traitement du formulaire de contact direct
 */

require_once __DIR__ . '/config/connexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Nettoyage et sécurisation des entrées
    $nom = filter_input(INPUT_POST, 'nom', FILTER_SANITIZE_SPECIAL_CHARS);
    $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
    $sujet = filter_input(INPUT_POST, 'sujet', FILTER_SANITIZE_SPECIAL_CHARS);
    $message = filter_input(INPUT_POST, 'message', FILTER_SANITIZE_SPECIAL_CHARS);

    if ($nom && $email && $sujet && $message) {
        if ($pdo) {
            try {
                $stmt = $pdo->prepare("INSERT INTO messages_contact (nom, email, sujet, message, date_envoi) VALUES (:nom, :email, :sujet, :message, NOW())");
                $stmt->execute([
                    ':nom' => $nom,
                    ':email' => $email,
                    ':sujet' => $sujet,
                    ':message' => $message
                ]);
            } catch (\PDOException $e) {
                error_log("Erreur d'insertion dans la base: " . $e->getMessage());
            }
        }
        
        // Redirection vers la page de contact avec paramètre de succès
        header('Location: ../pages/contact.html?status=success');
        exit;
    } else {
        header('Location: ../pages/contact.html?error=invalid_data');
        exit;
    }
} else {
    header('Location: ../pages/contact.html');
    exit;
}
?>
