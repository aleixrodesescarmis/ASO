Import-Module ActiveDirectory

$base = "OU=MusicCloud,DC=musiccloud,DC=local"

Get-ADOrganizationalUnit -SearchBase $base -SearchScope Subtree -Filter * | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false

Set-ADOrganizationalUnit -Identity $base -ProtectedFromAccidentalDeletion $false

Remove-ADOrganizationalUnit -Identity $base -Recursive -Confirm:$false