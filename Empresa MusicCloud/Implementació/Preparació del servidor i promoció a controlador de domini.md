# Pràctica

## Objectiu

Preparar el servidor `SRV-DC-01` i promocionar-lo com a primer controlador de domini del domini `musiccloud.local`.
## Escenari

L’empresa **MusicCloud** vol iniciar la implantació d’Active Directory Domain Services.

El servidor Windows Server que s’utilitzarà com a controlador de domini serà:
```text
SRV-DC-01
```
El domini que es crearà serà:
```text
musiccloud.local
```
Aquest servidor també proporcionarà el servei DNS del domini.
## Tasques

### Part 1. Configuració inicial del servidor

Configureu el servidor perquè compleixi els requisits següents:

| Element           | Valor              |
| ----------------- | ------------------ |
| Nom del servidor  | `SRV-DC-01`        |
| Adreça IP         | fixa               |
| DNS preferit      | el mateix servidor |
| Connexió de xarxa | operativa          |
| Zona horària      | correcta           |
| Hora del sistema  | correcta           |
La configuració IP concreta dependrà de la xarxa del laboratori. Anoteu els valors utilitzats.

Completeu la taula següent:

| Paràmetre        | Valor configurat |
| ---------------- | ---------------- |
| Adreça IP        |10.0.2.15         |
| Màscara          |/24               |
| Porta d’enllaç   |10.0.2.1          |
| DNS preferit     |10.0.2.2          |
| Nom del servidor |SRV-DC-01         |


### Part 2. Instal·lació del rol AD DS

Localitzeu i utilitzeu el procediment adequat per instal·lar el rol AD DS i promocionar el servidor a controlador de domini. Documenteu breument les comandes o passos utilitzats.

>He instal·lat el rol Active Directory Domain Services i les eines d’administració amb la seguent comanda:

```Install-WindowsFeature AD-Domain-Services -IncludeManagementTools```

>Després he comprovat que el rol s’hagi instal·lat correctament amb:

```Get-WindowsFeature AD-Domain-Services```

El rol AD DS permet convertir el servidor en un controlador de domini mitjançant el procés de promoció.

### Part 3. Promoció a controlador de domini
Promocioneu el servidor a controlador de domini amb les opcions següents:

| Opció                                  | Valor              |
| -------------------------------------- | ------------------ |
| Tipus d’implantació                    | Crear un nou bosc  |
| Nom del domini arrel                   | `musiccloud.local` |
| Servidor DNS                           | Sí                 |
| Catàleg global                         | Sí                 |
| Nom NetBIOS                            | `MUSICCLOUD`       |
| Controlador de domini de només lectura | No                 |
| Reinici final                          | Sí                 |
Definiu una contrasenya segura per al mode de restauració de serveis de directori.
### Part 4. Verificació

Després del reinici, comproveu:

1. Que el servidor s’anomena `SRV-DC-01`.
    
2. Que el domini `musiccloud.local` existeix.
    
3. Que el servidor és controlador de domini.
    
4. Que el servei DNS està instal·lat.
    
5. Que el DNS resol correctament el domini.
    
    
Completeu la taula següent. Adjunta la comanda que has utilitzat per a cada una de les comprovacions.

| Comprovació | Comanda utilitzada | Resultat |
|---|---|---|
| Nom del servidor | `hostname` | SRV-DC-01 |
| IP fixa configurada | `Get-NetIPAddress -InterfaceAlias "Ethernet" -AddressFamily IPv4` | 10.0.2.15    PrefixLength 24    PrefixOrigin Manual |
| AD DS instal·lat | `Get-WindowsFeature AD-Domain-Services` | Installed |
| Domini creat | `Get-ADDomain` | DNSRoot: musicclour.local i NetBIOSName: MUSICCLOUD |
| DNS instal·lat | `Get-WindowsFeature DNS` | Installed |
| Resolució de `musiccloud.local` | `Resolve-DnsName musiccloud.local -Server 10.0.2.15` | Name: musiccloud.local Type: A TTL: 600 Section: Answer IPAddress: 10.0.2.15 |
| Eines d'Active Directory disponibles | `Get-Module -ListAvailable ActiveDirectory` | Manifest 1.0.1.0 ActiveDirectory Add-ADCentralAccessPolicyMember, Add-AD... |

## Preguntes

Responeu breument:

1. Per què `SRV-DC-01` necessita una IP fixa?

>Perquè els altres ordinadors puguin trobar sempre el servidor, sino la IP canviaria, i podrien tenir problemes per connectar-se al domini.
    
2. Per què és necessari DNS en un domini Active Directory?

>Perquè els clients puguin trobar el DC i els serveis que necessiten per iniciar sessió, autenticar-se...
    
3. Quina diferència hi ha entre instal·lar AD DS i promocionar el servidor a controlador de domini?

>Instal·lar AD DS afegeix el servei al Windows Server, i promocionar-lo incorpora el servidor al domini i el converteix en controlador de domini.
    
4. Quin és el nom del domini creat?

>musiccloud.local
    
5. Quin és el nom NetBIOS del domini?

>MUSICCLOUD
    
6. Per què no és recomanable que els clients del domini utilitzin un DNS extern com a DNS principal?
    
>Perquè un DNS extern no coneix els registres interns del domini. Els clients podrien no trobar el controlador de domini ni els serveis necessaris per iniciar sessió o treballar amb normalitat. Per això, han d'utilitzar el DNS intern de MusicCloud proporcionat per el AD.
