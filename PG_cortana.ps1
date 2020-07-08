Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Cortana'
$form.Size = New-Object System.Drawing.Size(800,400)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(230,260)
$OKButton.Size = New-Object System.Drawing.Size(150,46)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(390,260)
$CancelButton.Size = New-Object System.Drawing.Size(150,46)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(600,70)
$label.Font = New-Object System.Drawing.Font("Arial",11,[System.Drawing.FontStyle]::Regular)
$label.Text = 'Enter the text you want Cortana to speak.'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,100)
$textBox.MinimumSize = New-Object System.Drawing.Size(700,40)
$textbox.Font = New-Object System.Drawing.Font("Arial",20,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::Cancel)
{

    exit
}

[Reflection.Assembly]::LoadWithPartialName('System.Speech') | Out-Null
    $object = New-Object System.Speech.Synthesis.SpeechSynthesizer 
    $object.Speak($textbox.Text)







