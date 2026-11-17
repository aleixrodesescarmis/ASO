
param(
    [Parameter(Mandatory=$true)]
    [string]$fitxer,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory


function Comprovar-Grup {
    param($nomGrup, $ruta)

    try {
        Get-ADGroup -Identity "CN=$nomGrup,$ruta" -ErrorAction Stop
    }
    catch {
        $null
    }
}

function Crear-Grup {
    param($nomGrup, $ruta)

    New-ADGroup -Name $nomGrup -Path $ruta -GroupScope Global -GroupCategory Distribution
}

function Crear-Grup-Si-No-Existeix {
    param($nomGrup, $ruta)

    if (-not (Comprovar-Grup $nomGrup $ruta)) {
        Crear-Grup $nomGrup $ruta
    }
}

function Crear-Grups-Secundaris {
    param($nomsGrup, $ruta)

    foreach ($nomGrup in $nomsGrup) {
        Crear-Grup-Si-No-Existeix $nomGrup $ruta
    }
}

$nomsGrup = Get-Content $fitxer

Crear-Grups-Secundaris $nomsGrup.Nom $ruta