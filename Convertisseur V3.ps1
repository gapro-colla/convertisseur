Add-Type -AssemblyName System.Windows.Forms

# Fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Convertisseur d'argent"
$form.Size = New-Object System.Drawing.Size(500,300)   # fenêtre plus large
$form.StartPosition = "CenterScreen"

# Sens de conversion
$rbEuro = New-Object System.Windows.Forms.RadioButton
$rbEuro.Text = "Euro → Autre"
$rbEuro.Location = New-Object System.Drawing.Point(20,20)
$rbEuro.Width = 180   # largeur suffisante pour voir tout le texte
$rbEuro.Checked = $true
$form.Controls.Add($rbEuro)

$rbOther = New-Object System.Windows.Forms.RadioButton
$rbOther.Text = "Autre → Euro"
$rbOther.Location = New-Object System.Drawing.Point(220,20)
$rbOther.Width = 180
$form.Controls.Add($rbOther)

# Label Montant
$labelAmount = New-Object System.Windows.Forms.Label
$labelAmount.Text = "Montant :"
$labelAmount.Location = New-Object System.Drawing.Point(20,70)
$form.Controls.Add($labelAmount)

# TextBox Montant large
$txtAmount = New-Object System.Windows.Forms.TextBox
$txtAmount.Location = New-Object System.Drawing.Point(120,65)
$txtAmount.Width = 250        # largeur confortable
$txtAmount.TextAlign = 'Left'
$form.Controls.Add($txtAmount)

# Label Devise
$labelCurrency = New-Object System.Windows.Forms.Label
$labelCurrency.Text = "Devise :"
$labelCurrency.Location = New-Object System.Drawing.Point(20,120)
$form.Controls.Add($labelCurrency)

# ComboBox Devise large
$comboCurrency = New-Object System.Windows.Forms.ComboBox
$comboCurrency.Location = New-Object System.Drawing.Point(120,115)
$comboCurrency.Width = 250
$comboCurrency.Items.AddRange(@("Dollar","Pound","Yen","Franc Suisse","Dollar Canadien"))
$comboCurrency.SelectedIndex = 0
$form.Controls.Add($comboCurrency)

# Label Résultat
$labelResult = New-Object System.Windows.Forms.Label
$labelResult.Text = ""
$labelResult.Location = New-Object System.Drawing.Point(20,180)
$labelResult.AutoSize = $true
$form.Controls.Add($labelResult)

# Taux de change
$rates = @{
    "Dollar" = 1.08
    "Pound" = 0.86
    "Yen" = 170.50
    "Franc Suisse" = 0.95
    "Dollar Canadien" = 1.48
}

$amount = 0

# Bouton Convertir
$btnConvert = New-Object System.Windows.Forms.Button
$btnConvert.Text = "Convertir"
$btnConvert.Location = New-Object System.Drawing.Point(200,150)
$btnConvert.Width = 80
$btnConvert.Add_Click({
    # Vérification que le montant est numérique
    if (-not [double]::TryParse($txtAmount.Text,[ref]$amount)) {
        [System.Windows.Forms.MessageBox]::Show("Montant invalide !","Erreur")
        return
    }

    $currency = $comboCurrency.SelectedItem
    $rate = $rates[$currency]

    if ($rbEuro.Checked) {
        $result = $amount * $rate
        $labelResult.Text = "$amount € → $result $currency"
    } else {
        $result = $amount / $rate
        $labelResult.Text = "$amount $currency → € $result"
    }
})

$form.Controls.Add($btnConvert)

# Afficher la fenêtre
[void]$form.ShowDialog()
