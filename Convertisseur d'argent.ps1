
Write-Host "=== Convertisseur d'argent ==="
Write-Host "1 - Convertir Euro vers Dollar"
Write-Host "2 - Convertir Euro vers Pound "
Write-Host "3 - Convertir Euro vers Yen Japonais"
Write-Host "4 - Convertir Euro vers Franc Suisse"
Write-Host "5 - Convertir Euro vers Dollar Canadien"

$choix = Read-Host "Choisissez une option (1 ou 5)"

$euroToDollar = 1.08
$euroToPound = 0.86
$euroToYen   = 170.50
$euroToCHF   = 0.95
$euroToCAD   = 1.48

switch ($choix) {
    "1" {
        $montant = Read-Host "Entrez le montant en Euro"
        $resultat = [float]$montant * $euroToDollar
        Write-Host "$montant € = $resultat $"
    }
    
    "2" {
        $montant = Read-Host "Entrez le montant en Euro"
        $resultat = [float]$montant * $euroToPound
        Write-Host "$montant € = £$resultat"
    }

    "3" {
        $montant = Read-Host "Entrez le montant en Euro"
        $resultat = [float]$montant * $euroToYen
        Write-Host "$montant € = ¥$resultat"
    }

    "4" {
        $montant = Read-Host "Entrez le montant en Euro"
        $resultat = [float]$montant * $euroToCHF
        Write-Host "$montant € = $resultat CHF"
    }

    "5" {
        $montant = Read-Host "Entrez le montant en Euro"
        $resultat = [float]$montant * $euroToCAD
        Write-Host "$montant € = $resultat CAD"
    }
    
    default {
        Write-Host "Choix invalide."
    }
}