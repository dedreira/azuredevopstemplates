param
(
    [Parameter(Mandatory=$true)]
    [System.String]$vaultName,
    [Parameter(Mandatory=$true)]
    [System.String]$resourceGroupName,
    [Parameter(Mandatory=$true)]
    [System.String]$location  
)
$keyVault = Get-AzureRmKeyVault -VaultName $vaultName -ResourceGroupName $resourceGroupName

if($keyVault -eq $null){
    Write-Host 'Key Vault do not exists'    
    $keyVault = New-AzureRmKeyVault -VaultName $vaultName -ResourceGroupName $resourceGroupName -Location $location
    Write-Host 'Created Key Vault '$vaultName
}else{
    Write-Host 'Key Vault exists'
}