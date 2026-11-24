
param(
    [Parameter(Mandatory=$true)]
    [string]$fitxer,

    [Parameter(Mandatory=$false)]
    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory


function Comprovar-Ruta {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    try {
        $OU = Get-ADObject -Identity $ruta -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

function Comprovar-OU {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomOU,
        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

function Crear-OU {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomOU,
        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    try {
        New-ADOrganizationalUnit -Name $nomOU -Path $ruta -ErrorAction Stop
    }
    catch {
        return
    }
}

function Crear-OU-Si-No-Existeix {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomOU,
        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    $OU = Comprovar-OU -nomOU $nomOU -ruta $ruta

    if (-not $OU) {
        Crear-OU -nomOU $nomOU -ruta $ruta
    }
}

function Crear-OUs-Secundaries {
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$nomsOU,
        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    foreach ($nomOU in $nomsOU) {
        Crear-OU-Si-No-Existeix -nomOU $nomOU -ruta $ruta
    }
}

if (-not (Comprovar-Ruta -ruta $ruta)) {
    exit
}

$nomsOU = Get-Content $fitxer

Crear-OUs-Secundaries -nomsOU $nomsOU -ruta $ruta
