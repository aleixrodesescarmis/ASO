param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomsOU,


    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)


Import-Module ActiveDirectory


foreach ($nomOU in $nomsOU) {


    try {
        $ou = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
    }
    catch {
        $ou = $null
    }


    if (-not $ou) {
        New-ADOrganizationalUnit -Name $nomOU -Path $ruta
    }
}