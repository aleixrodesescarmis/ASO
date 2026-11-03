param(
    [Parameter(Mandatory=$true)]
    [string]$nomOU,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

New-ADOrganizationalUnit -Name $nomOU -Path $ruta