$processos = Get-Process
$serveis = Get-Service
$elements = Get-ChildItem
$fitxers = $elements | Where-Object {-not $_.PSIsContainer}

$processosOrdenats = $processos | Sort-Object CPU -Descending
$cincProcessos = $processosOrdenats | Select-Object -First 5 Name, Id, CPU

$serveisEnExecucio = $serveis | Where-Object {$_.Status -eq "Running"}
$serveisNoExecutats = $serveis | Where-Object {$_.Status -ne "Running"}

$fitxersOrdenats = $fitxers | Sort-Object Length -Descending
$tresFitxersMesGrans = $fitxersOrdenats | Select-Object -First 3 Name, Length

$totalProcessos = $processos.Count
$totalServeis = $serveis.Count
$totalEnExecucio = $serveisEnExecucio.Count
$totalNoExecutats = $serveisNoExecutats.Count
$totalElements = $elements.Count
$totalFitxers = $fitxers.Count

Write-Host "===== DIAGNOSI GENERAL ====="

Write-Host "===== PROCESSOS AMB MÉS CPU ====="
$cincProcessos | Format-Table -AutoSize

Write-Host "===== ESTAT DELS SERVEIS ====="
Write-Host "Total de serveis: $totalServeis"
Write-Host "Serveis en execució: $totalEnExecucio"
Write-Host "Serveis que no estan en execució: $totalNoExecutats"

Write-Host "===== FITXERS MÉS GRANS ====="
$tresFitxersMesGrans | Format-Table -AutoSize

Write-Host "===== RESUM FINAL ====="
Write-Host "Total de processos: $totalProcessos"
Write-Host "Total de serveis: $totalServeis"
Write-Host "Total d'elements de la carpeta: $totalElements"
Write-Host "Total de fitxers: $totalFitxers"