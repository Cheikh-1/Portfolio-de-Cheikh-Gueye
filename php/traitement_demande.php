<?php
/**
 * traitement_demande.php - Traitement du formulaire de demande de projet
 */

require_once __DIR__ . '/config/connexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Nettoyage et sécurisation des données
    $nomClient = filter_input(INPUT_POST, 'nom_client', FILTER_SANITIZE_SPECIAL_CHARS);
    $emailClient = filter_input(INPUT_POST, 'email_client', FILTER_VALIDATE_EMAIL);
    $typeProjet = filter_input(INPUT_POST, 'type_projet', FILTER_SANITIZE_SPECIAL_CHARS);
    $budget = filter_input(INPUT_POST, 'budget', FILTER_SANITIZE_SPECIAL_CHARS);
    $description = filter_input(INPUT_POST, 'description_projet', FILTER_SANITIZE_SPECIAL_CHARS);

    if ($nomClient && $emailClient && $typeProjet && $description) {
        if ($pdo) {
            try {
                $stmt = $pdo->prepare("INSERT INTO demandes_projet (nom, email, type_projet, budget_estime, description) VALUES (:nom, :email, :type_projet, :budget_estime, :description)");
                $stmt->execute([
                    ':nom' => $nomClient,
                    ':email' => $emailClient,
                    ':type_projet' => $typeProjet,
                    ':budget_estime' => $budget,
                    ':description' => $description
                ]);
            } catch (\PDOException $e) {
                error_log("Erreur d'enregistrement de la demande: " . $e->getMessage());
            }
        }

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