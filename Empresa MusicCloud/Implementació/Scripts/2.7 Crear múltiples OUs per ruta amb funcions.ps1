param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomsOU,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory


function Comprovar-OU {
    param($nomOU, $ruta)

    try {
        Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
    }
    catch {
        $null
    }
}

function Crear-OU {
    param($nomOU, $ruta)

    New-ADOrganizationalUnit -Name $nomOU -Path $ruta
}

function Crear-OU-Si-No-Existeix {
    param($nomOU, $ruta)

    if (-not (Comprovar-OU $nomOU $ruta)) {
        Crear-OU $nomOU $ruta
    }
}

function Crear-OUs-Secundaries {
    param($nomsOU, $ruta)

    foreach ($nomOU in $nomsOU) {
        Crear-OU-Si-No-Existeix $nomOU $ruta
    }
}

Crear-OUs-Secundaries $nomsOU $ruta