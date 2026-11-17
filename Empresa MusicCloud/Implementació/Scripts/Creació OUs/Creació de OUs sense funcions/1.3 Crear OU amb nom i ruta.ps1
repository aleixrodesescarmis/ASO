Import-Module ActiveDirectory

$nomOU = Read-Host "Introdueix el nom de l'OU"
$ruta = Read-Host "Introdueix la ruta de l'OU"

New-ADOrganizationalUnit -Name $nomOU -Path $ruta