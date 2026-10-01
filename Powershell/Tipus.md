> **Nota**: Els exercicis/pràctiques t'han de servir per a familiarizar-te amb el llenguatge Powershell. Aprofita per a realitzar diverses proves i veure què passa. Documenta també aquestes proves i resultats.
# Tipus de dades

## 1. Identificar tipus

Crea les variables següents:
```powershell
$nom = "Servidor01"
$port = 443
$actiu = $true
$espai = 12.5
```
Consulta el tipus de cadascuna amb:
```powershell
.GetType()
```
Completa una taula com aquesta:

| Variable | Valor | Tipus |
|---|---|---|
| $nom | `Servidor01` | String |
| $port | `443` | Int32 |
| $actiu | $true | Boolean |
| $espai | `12.5` | Double |

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power1.png)

## 2. Número o text?

Executa:
```powershell
$a = 10
$b = 5

$a + $b
```
Després:
```powershell
$a = "10"
$b = "5"

$a + $b
```
Respon:

- Quin resultat obtens en cada cas?

**Primer cas:** el resultat és **15**, perquè les variables són números i es fa una suma.

**Segon cas:** el resultat és **105**, perquè les variables són textos i s'uneixen els dos valors.

- Per què no és el mateix?
Mostra després el contingut de cadascuna de les variables.

Perquè en el primer cas les variables són números i el signe + fa una suma. En el segon cas són textos i el signe + uneix els dos textos.

- Quin tipus tenen $a i $b en cada cas?

En el primer cas, $a i $b són **Int32**. En el segon cas, són **String**.

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power2.png)

## 3. Canviar el tipus d'una variable

Executa:
```powershell
$valor = 100
```
Consulta:
```powershell
$valor.GetType()
```
Ara executa:
```powershell
$valor = "100"
```
i torna a consultar:
```powershell
$valor.GetType()
```
Respon:

**Ha canviat el valor? Ha canviat el tipus?**

### Resultat

- **Valor:** No ha canviat, continua sent 100.
- **Tipus:** Sí que ha canviat. Primer era Int32 i després passa a ser String.

Per tant, el valor es veu igual, però el tipus de dada és diferent.

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power3.png)

## 4. Tipus explícits

Executa:
```powershell
[int]$port = 443
```
Comprova el tipus:
```powershell
$port.GetType()
```
Ara prova:
```
[string]$portText = 443
```
Consulta també:
```powershell
$portText.GetType()
```
Respon:

**Tot i que visualment els dos valors semblen `443`, són del mateix tipus?**

No, no són del mateix tipus. $port és Int32 i $portText és String, encara que els dos mostrin 443.

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power4.png)

## 5. Booleans

Crea:
```powershell
$serveiActiu = $true
$servidorDisponible = $false
```
Consulta els tipus.

Després mostra un missatge amb:
```
Write-Host "Servei actiu: $serveiActiu"
Write-Host "Servidor disponible: $servidorDisponible"
```

Les dues variables són de tipus Boolean. Es mostra que el servei està actiu (True) i que el servidor no està disponible (False).

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power5.png)

## 6. General

Crea variables per representar un servidor amb aquesta informació:
```
Nom: SRV-WEB01
Port: 443
Espai lliure: 125.7 GB
Actiu: True
```
Després:

1. mostra el valor de totes les variables;
2. consulta el tipus de cadascuna;
3. indica quin tipus de dada has utilitzat per cada valor.

- SRV-WEB01 - String - Text per al nom del servidor.
- 443 - Int32 - Número enter per al port.
- 125.7 - Double - Número decimal per a l'espai lliure.
- True - Boolean - Valor lògic per indicar si està actiu.

![Descripción de la imagen](/Fotos/Powershell/Tipus/Power6.png)
