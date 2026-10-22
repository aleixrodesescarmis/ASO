$equip = $env:COMPUTERNAME
$usuari = $env:USERNAME
$versio = $PSVersionTable.PSVersion
$data = Get-Date
$directori = Get-Location

Write-Host "===== INFORMACIÓ DEL SISTEMA ====="
Write-Host "Nom de l'equip: $equip"
Write-Host "Usuari actual: $usuari"
Write-Host "Versió de PowerShell: $versio"
Write-Host "Data i hora: $data"
Write-Host "Directori actual: $directori"