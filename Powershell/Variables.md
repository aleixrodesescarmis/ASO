> **Nota**: Els exercicis/pràctiques t'han de servir per a familiarizar-te amb el llenguatge Powershell. Aprofita per a realitzar diverses proves i veure què passa. Documenta també aquestes proves i resultats.
# Treballar amb variables

## 1. Crear variables

Crea les variables següents:

```
$nom
$servidor
$ip
$port
```

Assigna-hi valors.

Per exemple:

```
$nom = "Pere"
```

Mostra després el contingut de cadascuna de les variables.

---


```powershell
$nom = "Pere"
$servidor = "SRV01"
$ip = "192.168.1.10"
$port = 8080

$nom
$servidor
$ip
$port
```

**Resultat:** Es mostren els valors assignats a les quatre variables: Pere, SRV01, 192.168.1.10 i 8080.

![Descripción de la imagen](/Fotos/Powershell/Variables/Power1.png)

## 2. Modificar una variable

Crea:

```
$servidor = "SRV01"
```

Mostra el seu valor.

Després canvia'l per:

```
SRV02
```

Comprova quin valor conserva la variable.

---


```powershell
$servidor = "SRV01"
$servidor

$servidor = "SRV02"
$servidor
```

**Resultat:** Primer apareix SRV01 i després SRV02. La variable conserva l'últim valor assignat.

![Descripción de la imagen](/Fotos/Powershell/Variables/Power2.png)

## 3. Operacions

Crea dues variables:

```
$num1 = 20
$num2 = 5
```

Crea una tercera variable que guardi:

- la suma;
- la resta;
- la multiplicació;
- la divisió.

Per exemple:

```
$resultat = $num1 + $num2
```

Mostra cada resultat.

---


```powershell
$num1 = 20
$num2 = 5

$resultat = $num1 + $num2
$resultat

$resultat = $num1 - $num2
$resultat

$resultat = $num1 * $num2
$resultat

$resultat = $num1 / $num2
$resultat
```

**Resultats:**
- Suma: 25
- Resta: 15
- Multiplicació: 100
- Divisió: 4

![Descripción de la imagen](/Fotos/Powershell/Variables/Power3.png)

## 4. Variables dins d'un text

Crea:

```
$nom = "Anna"
$servidor = "SRV01"
```

Intenta obtenir aquesta sortida:

```
L'usuari Anna està treballant amb el servidor SRV01
```

utilitzant les variables dins del text.

---


```powershell
$nom = "Anna"
$servidor = "SRV01"

Write-Host "L'usuari $nom està treballant amb el servidor $servidor"
```

**Resultat:**

L'usuari Anna està treballant amb el servidor SRV01

![Descripción de la imagen](/Fotos/Powershell/Variables/Power4.png)

## 5. Cometes

Executa:

```
$servidor = "SRV01"
```

Després:

```
Write-Host "Servidor: $servidor"
```

i:

```
Write-Host 'Servidor: $servidor'
```

Respon:

**Quina diferència observes? Per què creus que passa?**

---


```powershell
$servidor = "SRV01"

Write-Host "Servidor: $servidor"
Write-Host 'Servidor: $servidor'
```

**Resultat:**

```text
Servidor: SRV01
Servidor: $servidor
```

**Diferència:** Les cometes dobles substitueixen la variable pel seu valor. Les cometes simples mostren el text literal, sense interpretar la variable.

![Descripción de la imagen](/Fotos/Powershell/Variables/Power5.png)

## 6. Guardar el resultat d'una ordre

Executa:

```
$serveis = Get-Service
```

Després:

```
$serveis
```

Respon:

- Què creus que conté $serveis?
- La variable conté un únic valor o diversos elements?

Fes el mateix amb:

```
$processos = Get-Process
```

i comprova el seu contingut.

---


```powershell
$serveis = Get-Service
$serveis

$processos = Get-Process
$processos
```

**Resultat:** 

La variable $serveis conté una col·lecció de serveis de Windows, amb informació com el nom i l'estat. No conté un únic valor, sinó diversos elements.

La variable $processos conté una col·lecció dels processos de l'equip, amb informació com el nom, l'identificador i el consum de recursos.

![Descripción de la imagen](/Fotos/Powershell/Variables/Power6.png)

## 7. Aplicació a administració

Crea una variable:

```
$nomServei = "Spooler"
```

Utilitza aquesta variable per consultar el servei amb:

```
Get-Service -Name ...
```

L'objectiu és obtenir el mateix resultat que:

```
Get-Service -Name Spooler
```

però **sense escriure `Spooler` directament en el cmdlet**.


---


```powershell
$nomServei = "Spooler"

Get-Service -Name $nomServei
```

**Resultat:** Es consulta el servei Spooler utilitzant la variable, sense escriure directament el seu nom dins del cmdlet. Es mostra el seu nom i estat, que pot ser en execució o aturat.

![Descripción de la imagen](/Fotos/Powershell/Variables/Power7.png)