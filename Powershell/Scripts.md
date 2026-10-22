# Scripts PowerShell

L'objectiu d'aquesta pràctica és integrar els conceptes treballats durant la introducció a PowerShell:

- variables;
    
- tipus de dades;
    
- arrays;
    
- pipeline;
    
- `Select-Object`;
    
- `Where-Object`;
    
- propietats dels objectes;
    
- `if`, `elseif`, `else` i `switch`;
    
- `foreach` i `ForEach-Object`;
    
- scripts `.ps1`.
    

> **Important:** abans d'incorporar una ordre al script, és recomanable provar-la directament a la consola de PowerShell.
# 1. Informació bàsica del sistema

Crea un script anomenat:

```
infoSistema.ps1
```

El script ha de mostrar:

- nom de l'equip;
    
- usuari actual;
    
- versió de PowerShell;
    
- data i hora actuals;
    
- directori actual.
    

La sortida ha de ser clara i llegible.

Per exemple:

```
===== INFORMACIÓ DEL SISTEMA =====

Equip: ...
Usuari: ...
PowerShell: ...
Data: ...
Directori actual: ...
```
1. Adjunta el script final.
2. Explica el procés que has seguit o operacions que has executat abans d'obtenir el script final.

>Script i explicació:

```
$equip = $env:COMPUTERNAME
$usuari = $env:USERNAME
$versio = $PSVersionTable.PSVersion
$data = Get-Date
$directori = Get-Location

Write-Host "===== INFORMACIÓ DEL SISTEMA ====="
Write-Host "Nom de l'equip: $equip"
Write-Host "Usuari actual: $usuari"
Write-Host "Versió de PowerShell: $versio"
Write-Host "Data i hora: $data"
Write-Host "Directori actual: $directori"
```
>He guardat en variables la informació principal del sistema, com el nom de l'equip, l'usuari actual, la versió de PowerShell, la data i el directori actual. Després, he utilitzat Write-Host per mostrar totes les dades de manera ordenada.

# 2. Estat dels serveis

Crea:

```
estatServeis.ps1
```

El script ha de:

1. obtenir tots els serveis del sistema;
    
2. comptar quants estan en execució;
    
3. comptar quants no estan en execució;
    
4. mostrar el total de serveis;
    
5. mostrar els resultats al final.
    

Exemple:

```
===== ESTAT DELS SERVEIS =====

Total: 230
Running: 95
Not running: 135
```

>Script i explicació:


```
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
```
>Primer, he utilitzat Get-Service per obtenir tots els serveis de l'ordinador. Després, amb Where-Object, he separat els serveis que estan en execució dels que no ho estan. He guardat els resultats en variables i he utilitzat .Count per comptar cada grup i mostrar-ne el total.

# 3. Processos amb més consum de CPU

Crea:

```
topProcessos.ps1
```

El script ha de mostrar els **10 processos amb més consum de CPU**.

La sortida ha de mostrar únicament:

```
Name
Id
CPU
```

Després mostra també:

```
Nombre total de processos: ...
```

>Script i explicació:

```
$processos = Get-Process
$totalProcessos = $processos.Count
$processosOrdenats = $processos | Sort-Object CPU -Descending
$processosPrincipals = $processosOrdenats | Select-Object -First 10 Name, Id, CPU

Write-Host "===== 10 PROCESSOS AMB MÉS ÚS DE CPU ====="
$processosPrincipals | Format-Table -AutoSize

Write-Host "Nombre total de processos: $totalProcessos"
```

>He utilitzat Get-Process per obtenir tots els processos i els he guardat en una variable. Després, amb Sort-Object, els he ordenat de més a menys ús de CPU. Amb Select-Object -First 10, he seleccionat els deu primers i n'he mostrat el nom, l'identificador i el temps de CPU. Finalment, he mostrat el nombre total de processos.

# 4. Anàlisi de fitxers d'una carpeta

Crea:

```
analitzaCarpeta.ps1
```

El script ha de treballar amb la carpeta des d'on s'executa.

Ha de mostrar:

- nombre total d'elements;
    
- els cinc fitxers més grans;
    
- nom i mida d'aquests fitxers.
    

Investiga les propietats retornades per:

```
Get-ChildItem
```

i utilitza-les per construir el pipeline.

> Tingues en compte que pots trobar tant fitxers com carpetes.

>Script i explicació:

```
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
```

>Primer, he utilitzat Get-ChildItem per obtenir tots els elements de la carpeta actual. Després, amb Where-Object, he separat els fitxers de les carpetes. He comptat el total d'elements i de fitxers amb .Count. Finalment, he ordenat els fitxers segons la seva mida i he mostrat els cinc més grans.

# 5. Diagnosi bàsica del sistema

Crea:

```
diagnosi.ps1
```
Ha de mostrar almenys quatre apartats.

## Processos

Mostra els cinc processos amb més CPU.

Propietats:

```
Name
Id
CPU
```

## Serveis

Mostra:

```
Total de serveis
Serveis en execució
Serveis no executats
```
## Fitxers

Mostra els tres fitxers més grans de la carpeta actual.

Propietats:

```
Name
Length
```

## Estat final

Al final mostra un petit resum:

```
===== RESUM =====

Processos analitzats: ...
Serveis analitzats: ...
Fitxers analitzats: ...
```

Organitza el script perquè sigui fàcil de llegir.

Pots utilitzar comentaris per separar els diferents blocs:

```
# =====================
# PROCESSOS
# =====================
```

>Script i explicació:

```
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
```

>He combinat les comandes dels exercicis anteriors per analitzar els processos, els serveis i els fitxers de la carpeta actual. He seleccionat els cinc processos amb més ús de CPU, he comptat els serveis en execució i els que no ho estan, i he mostrat els tres fitxers més grans. Al final, he fet un resum amb els totals de cada grup.

# 6. Processos pare

Fes un script que per cada procés del sistema ens monstri:
- El nom i id del procés (entre = a l'exemple).
- El total de threads associats al procés
- L'identificador i el temps de processador de cada thread. Es pot donar la circumstància que aquesta última dada no estigui informada o el seu valor sigui 00:00:00.

Exemple de sortida

```text
============================== svchost (2772) ==============================

Total threads: 5

ID: 2776 CPU TIME: 00:00:00.0156250  
ID: 2784 CPU TIME: 00:00:00  
ID: 2788 CPU TIME: 00:00:00.1718750  
ID: 2804 CPU TIME: 00:00:00  
ID: 4864 CPU TIME: 00:00:00

============================== wininit (780) ==============================

Total threads: 1

ID: 784 CPU TIME:

============================== winlogon (852) ==============================

Total threads: 2

ID: 856 CPU TIME: 00:00:00.156250  
ID: 1184 CPU TIME: 00:00:00.0156250

============================== wlms (1828) ==============================

Total threads: 2

ID: 2548 CPU TIME: 00:00:00.0156250  
ID: 3092 CPU TIME: 00:00:00.0156250
```
# Requisits generals

Tots els scripts han de:

1. tenir extensió `.ps1`;
    
2. executar-se amb PowerShell 7;
    
3. utilitzar noms de variables descriptius;
    
4. tenir el codi correctament indentat;
    
5. incloure algun comentari quan sigui necessari;
    
6. evitar codi que no sigui necessari;
    
7. mostrar una sortida comprensible per a l'usuari.
    

Abans de donar un script per acabat:

```
prova cada part a la consola
        ↓
comprova el resultat
        ↓
incorpora-la al script
        ↓
executa el script complet
```

>Script i explicació:

```
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
```

>Primer, he utilitzat Get-Process per obtenir tots els processos de l'ordinador. Amb foreach, he recorregut cada procés i n'he mostrat el nom, l'identificador i el nombre de fils. Després, he recorregut els fils per mostrar-ne l'identificador i el temps de CPU. També he utilitzat try i catch per intentar continuar l'execució si alguna dada no es pot consultar.