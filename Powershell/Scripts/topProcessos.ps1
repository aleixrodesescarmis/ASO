$processos = Get-Process
$totalProcessos = $processos.Count
$processosOrdenats = $processos | Sort-Object CPU -Descending
$processosPrincipals = $processosOrdenats | Select-Object -First 10 Name, Id, CPU

Write-Host "===== 10 PROCESSOS AMB MÉS ÚS DE CPU ====="
$processosPrincipals | Format-Table -AutoSize

Write-Host "Nombre total de processos: $totalProcessos"