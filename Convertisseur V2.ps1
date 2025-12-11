# Nettoyer l'écran
Clear-Host

# Choix de la langue
Write-Host "Choisissez la langue / Choose language :" -ForegroundColor Cyan
Write-Host "1 - Français"
Write-Host "2 - English"

$lang = Read-Host "Votre choix / Your choice"

# Messages selon la langue
if ($lang -eq "1") {
    $msgTitle = "=== Convertisseur d'argent ==="
    $msgDirection = "Voulez-vous convertir :"
    $msgOption1 = "1 - Euro vers une autre monnaie"
    $msgOption2 = "2 - Une autre monnaie vers Euro"
    $msgPrompt = "Choisissez une option (1 ou 2)"
    $msgInvalid = "Choix invalide."
    $msgAmount = "Entrez le montant"
    $msgContinue = "Voulez-vous refaire une conversion ? (o/n)"
} else {
    $msgTitle = "=== Money Converter ==="
    $msgDirection = "Do you want to convert:"
    $msgOption1 = "1 - Euro to another currency"
    $msgOption2 = "2 - Another currency to Euro"
    $msgPrompt = "Choose an option (1 or 2)"
    $msgInvalid = "Invalid choice."
    $msgAmount = "Enter the amount"
    $msgContinue = "Do you want to convert again? (y/n)"
}

# Taux de change (exemples)
$euroToDollar = 1.08
$euroToPound  = 0.86
$euroToYen    = 170.50
$euroToCHF    = 0.95
$euroToCAD    = 1.48

# Emojis
$emojiDollar = "💵"
$emojiPound  = "💷"
$emojiYen    = "💴"
$emojiCHF    = "🇨🇭"
$emojiCAD    = "🇨🇦"
$emojiEuro   = "💶"

# Boucle principale
do {
    Clear-Host
    Write-Host $msgTitle -ForegroundColor Cyan
    Write-Host $msgDirection -ForegroundColor Yellow
    Write-Host $msgOption1 -ForegroundColor Yellow
    Write-Host $msgOption2 -ForegroundColor Yellow

    $direction = Read-Host $msgPrompt

    # Affichage menu des devises
    Write-Host "`nChoisissez la devise :" -ForegroundColor Yellow
    Write-Host "1 - Dollar $emojiDollar" -ForegroundColor Yellow
    Write-Host "2 - Pound $emojiPound" -ForegroundColor Yellow
    Write-Host "3 - Yen $emojiYen" -ForegroundColor Yellow
    Write-Host "4 - Franc Suisse $emojiCHF" -ForegroundColor Yellow
    Write-Host "5 - Dollar Canadien $emojiCAD" -ForegroundColor Yellow

    $choix = Read-Host "Option (1 à 5)"
    $montant = Read-Host $msgAmount

    # Conversion
    switch ($direction) {
        "1" { # Euro -> autre monnaie
            switch ($choix) {
                "1" { $resultat = [float]$montant * $euroToDollar; $emoji=$emojiDollar }
                "2" { $resultat = [float]$montant * $euroToPound;  $emoji=$emojiPound }
                "3" { $resultat = [float]$montant * $euroToYen;    $emoji=$emojiYen }
                "4" { $resultat = [float]$montant * $euroToCHF;    $emoji=$emojiCHF }
                "5" { $resultat = [float]$montant * $euroToCAD;    $emoji=$emojiCAD }
                default { Write-Host $msgInvalid -ForegroundColor Red; continue }
            }
            Write-Host "`nRésultat : $montant € → $resultat $emoji" -ForegroundColor Green
        }
        "2" { # autre monnaie -> Euro
            switch ($choix) {
                "1" { $resultat = [float]$montant / $euroToDollar; $emoji=$emojiEuro; $devise=$emojiDollar }
                "2" { $resultat = [float]$montant / $euroToPound;  $emoji=$emojiEuro; $devise=$emojiPound }
                "3" { $resultat = [float]$montant / $euroToYen;    $emoji=$emojiEuro; $devise=$emojiYen }
                "4" { $resultat = [float]$montant / $euroToCHF;    $emoji=$emojiEuro; $devise=$emojiCHF }
                "5" { $resultat = [float]$montant / $euroToCAD;    $emoji=$emojiEuro; $devise=$emojiCAD }
                default { Write-Host $msgInvalid -ForegroundColor Red; continue }
            }
            Write-Host "`nRésultat : $montant $devise → $resultat € $emoji" -ForegroundColor Green
        }
        default {
            Write-Host $msgInvalid -ForegroundColor Red
            continue
        }
    }

    # Refaire une conversion ?
    $reponse = Read-Host "`n$msgContinue"
} while ($reponse -eq "o" -or $reponse -eq "O" -or $reponse -eq "y" -or $reponse -eq "Y")
