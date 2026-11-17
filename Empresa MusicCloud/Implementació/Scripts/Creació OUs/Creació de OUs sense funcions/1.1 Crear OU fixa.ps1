Import-Module ActiveDirectory

$nomOU = "MusicCloud"
$ruta = "DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name $nomOU -Path $ruta