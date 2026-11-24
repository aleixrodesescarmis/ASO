param(
    [Parameter(Mandatory=$false)]
    [string]$fitxer = (Join-Path $PSScriptRoot "..\Dades\grups.csv"),
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
        $objecte = Get-ADObject -Identity $ruta -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

function Comprovar-Grup {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomGrup,

        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    try {
        $grup = Get-ADGroup -Identity "CN=$nomGrup,$ruta" -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

function Crear-Grup {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomGrup,

        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    try {
        $grup = New-ADGroup -Name $nomGrup -Path $ruta -GroupScope Global -GroupCategory Distribution -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

function Crear-Grup-Si-No-Existeix {
    param(
        [Parameter(Mandatory=$true)]
        [string]$nomGrup,

        [Parameter(Mandatory=$true)]
        [string]$ruta
    )

    $grup = Comprovar-Grup -nomGrup $nomGrup -ruta $ruta

    if (-not $grup) {
        Crear-Grup -nomGrup $nomGrup -ruta $ruta
    }
}

function Crear-Grups-Secundaris {
    param(
        [Parameter(Mandatory=$true)]
        [object[]]$nomsGrup
    )

    foreach ($nomGrup in $nomsGrup) {

        $rutaGrup = $nomGrup.Ruta

        if (-not $rutaGrup) {
            $rutaGrup = $ruta
        }

        if (Comprovar-Ruta -ruta $rutaGrup) {
            Crear-Grup-Si-No-Existeix -nomGrup $nomGrup.Nom -ruta $rutaGrup
        }
    }
}

if (-not (Test-Path $fitxer)) {
    exit
}

$nomsGrup = Import-Csv $fitxer

Crear-Grups-Secundaris -nomsGrup $nomsGrup