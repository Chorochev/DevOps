# connect to Azure
# Connect-AzAccount

# Deleting all resources
Get-AzResourceGroup | ForEach-Object {     
    Write-Host "`nDeleting the resource group '"$_.ResourceGroupName"'!!!`n" -ForegroundColor Red 
    Remove-AzResourceGroup -Name $_.ResourceGroupName     
}

# Disconnect-AzAccount
