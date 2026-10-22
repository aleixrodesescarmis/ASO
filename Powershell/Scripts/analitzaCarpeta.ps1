$elements = Get-ChildItem
$fitxers = $elements | Where-Object {-not $_.PSIsContainer}
$totalElements = $elements.Count
$totalFitxers = $fitxers.Count
$fitxersOrdenats = $fitxers | Sort-Object Length -Descending
$cincFitxersMesGrans = $fitxersOrdenats | Select-Object -First 5 Name, Length

Write-Host "===== ANÀLISI DE LA CARPETA ====="
Write-Host "Total d'elements: $totalElements"
Write-Host "Total de fitxers: $totalFitxers"
Write-Host "===== ELS 5 FITXERS MÉS GRANS ====="
$cincFitxersMesGrans | Format-Table -AutoSize