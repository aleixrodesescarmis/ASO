param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomsOU,


    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)


Import-Module ActiveDirectory


foreach ($nomOU in $nomsOU) {


    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
    }
    catch {
        $OU = $null
    }


    if (-not $OU) {
        New-ADOrganizationalUnit -Name $nomOU -Path $ruta
    }
}