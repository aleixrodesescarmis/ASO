param(
    [string]$nomOU,
    [string]$ruta
)

Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name $nomOU -Path $ruta