# Pràctica

## 1. Condicional

Crea:
```powershell
$port = 443
```
Mostra:
```
Port HTTPS
```
si el port és `443`.

Canvia després el valor de `$port` i comprova què passa.
```
$port = 443
if ($port -eq 443) {
    Write-Output "Port HTTPS"
}
```

>Si el port és 443, mostra Port HTTPS. Si canviem el valor, no mostra res.

## 2. if o switch

Crea:
```
$estat = 2
```
Fes que el programa mostri:

```
1 → Iniciant
2 → Executant
3 → Finalitzat
4 → En espera
qualsevol altre valor → Estat desconegut
```

Resol el problema utilitzant `if` i `switch`. Compara les dues solucions. 

>Amb IF:

```
$estat = 2

if ($estat -eq 1) {
    "Iniciant"
}
elseif ($estat -eq 2) {
    "Executant"
}
elseif ($estat -eq 3) {
    "Finalitzat"
}
elseif ($estat -eq 4) {
    "En espera"
}
else {
    "Estat desconegut"
}
```

>Amb SWITCH:

```
$estat = 2

switch ($estat) {
    1 { "Iniciant" }
    2 { "Executant" }
    3 { "Finalitzat" }
    4 { "En espera" }
    default { "Estat desconegut" }
}
```

>Els dos funcionen igual PERO switch és més curt.

## 3. Condicions combinades

Crea:

```powershell
$port = 443
$actiu = $true
```
Mostra:

```text
Servei disponible
```

només quan el port sigui el 443 i estigui actiu

>He fet el seguent codi:

```
$port = 443
$actiu = $true

if ($port -eq 443 -and $actiu -eq $true) {
    "Servei disponible"
}
```

## 4. Objectes

Quants serveis en el teu sistema estan configurats amb el servei d'arrencada automàtic quan s'inicia l'equip? 

Proposa diferents codis de resolució.

>Primera forma: Obté tots els serveis de l'ordinador i amb el Where-Object selecciona els que s'inicien automàticament. Després guarda els resultats a la variable $serveis i amb el .Count mostra quants serveis hi ha.



```
$serveis = Get-CimInstance Win32_Service | Where-Object {$_.StartMode -eq "Auto"}
$serveis.Count
```

>Segona forma: Agafa els serveis que s'inicien automàticament i els guarda a $serveis. Després amb el foreach recorre els serveis un per un i va sumant el comptador $total cada vegada.

```
$serveis = Get-CimInstance Win32_Service | Where-Object {$_.StartMode -eq "Auto"}
foreach ($servei in $serveis) {
    $total++
}
$total
```

# Conclusions

Explica amb les teves paraules:

1. Què representa la variable `$servei` en:
```powershell
$serveis = Get-Service
foreach ($servei in $serveis) {
    ...
}
```

> Cada servei que es va agafant de la llista un per un.

2. Quina diferència hi ha entre `foreach` i `ForEach-Object`?

>Foreach recorre una llista mentres ForEach-Object utilitza els objectes que rep pel pipeline.

3. Què representa `$_` dins de `ForEach-Object`?

>Representa l'objecte que esta utilitzant en aquell moment.