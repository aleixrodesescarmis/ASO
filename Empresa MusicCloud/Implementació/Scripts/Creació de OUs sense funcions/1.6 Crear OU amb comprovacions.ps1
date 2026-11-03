param(
    [Parameter(Mandatory=$true)]
    [string]$nomOU,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

$objecte = Get-ADObject -Filter "Name -eq '$nomOU'" -SearchBase $ruta -ErrorAction SilentlyContinue

if (-not $objecte) {
    New-ADOrganizationalUnit -Name $nomOU -Path $ruta
}