function Show-MessageBox {
    param (
        [string]$Message,
        [string]$WindowTitle = "Information",
        [System.Windows.Forms.MessageBoxButtons]$Buttons = [System.Windows.Forms.MessageBoxButtons]::OKCancel
    )

    Add-Type -AssemblyName System.Windows.Forms
    $result = [System.Windows.Forms.MessageBox]::Show($Message, $WindowTitle, $Buttons)
    return $result
}

$response = Show-MessageBox -Message "This script will need the Mailbox csv export." -WindowTitle "Attention!" -Buttons OKCancel
if ($response -eq 'Cancel') {
    exit
}

$parameters = @{
    Message = "Do you want to continue?"
    Parameters = @{
        Continue = @{ Prompt = "Type 'yes' to continue"; Default = 'no'; IsMandatory = $true }
    }
}

$response = $Host.UI.PromptForChoice("Confirmation", "Do you want to continue?", @('&Yes', '&No'), 1)
if ($response -eq 1) {
    exit
}

# Rest of your script...
