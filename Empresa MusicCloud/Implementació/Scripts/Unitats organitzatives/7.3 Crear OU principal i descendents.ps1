Import-Module ActiveDirectory

$domini = "DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "MusicCloud" -Path $domini

$principal = "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Usuaris" -Path $principal
New-ADOrganizationalUnit -Name "Equips" -Path $principal
New-ADOrganizationalUnit -Name "Grups" -Path $principal