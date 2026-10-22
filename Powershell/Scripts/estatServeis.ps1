$serveis = Get-Service
$serveisEnExecucio = $serveis | Where-Object {$_.Status -eq "Running"}
$serveisNoExecutats = $serveis | Where-Object {$_.Status -ne "Running"}

$totalServeis = $serveis.Count
$totalEnExecucio = $serveisEnExecucio.Count
$totalNoExecutats = $serveisNoExecutats.Count

Write-Host "===== ESTAT DELS SERVEIS ====="
Write-Host "Total de serveis: $totalServeis"
Write-Host "Serveis en execució: $totalEnExecucio"
Write-Host "Serveis que no estan en execució: $totalNoExecutats"