Import-Module ActiveDirectory

$domini = "DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "MusicCloud" -Path $domini