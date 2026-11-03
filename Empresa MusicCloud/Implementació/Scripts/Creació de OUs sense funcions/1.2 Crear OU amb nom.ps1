Import-Module ActiveDirectory

$nomOU = Read-Host "Introdueix el nom de l'OU"
$ruta = "DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name $nomOU -Path $ruta