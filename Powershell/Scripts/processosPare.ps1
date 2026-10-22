$processos = Get-Process
$totalProcessos = $processos.Count

Write-Host "===== INFORMACIÓ DELS PROCESSOS I DELS FILS ====="
Write-Host "Total de processos: $totalProcessos"

foreach ($proces in $processos) {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "Nom del procés: $($proces.ProcessName)"
    Write-Host "ID del procés: $($proces.Id)"

    try {
        $fils = $proces.Threads
        $totalFils = $fils.Count
        Write-Host "Total de fils: $totalFils"

        foreach ($fil in $fils) {
            try {
                $idFil = $fil.Id
                $tempsCPU = $fil.TotalProcessorTime
                Write-Host "ID del fil: $idFil - Temps de CPU: $tempsCPU"
            }
            catch {
                Write-Host "No s'ha pogut obtenir el temps de CPU del fil."
            }
        }
    }
    catch {
        Write-Host "No s'ha pogut obtenir la informació dels fils d'aquest procés."
    }
}