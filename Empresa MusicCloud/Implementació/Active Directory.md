# Activitat: del disseny a l’arquitectura d’AD DS

# Context

MusicCloud ja ha completat el disseny lògic del seu servei de directori.  

Abans d’instal·lar Active Directory Domain Services, cal comprovar que l’alumnat identifica correctament els components que s’hauran d’implantar.  

# Identificació dels components

A partir de l’arquitectura prevista, indiqueu:

1.   Quin serà el nom del bosc.  

>MusicCloud
    
2.   Quin serà el nom del domini.  

>MusicCloud.local
    
3.   Quin servidor actuarà com a controlador de domini.  

>SRV-DC-01
    
4.   Quin servidor proporcionarà DNS.  

>SRV-DC-01
    
5.   Quin protocol s’utilitzarà principalment per a l’autenticació.  

>Kerberos
    
6.   Quin protocol permetrà consultar els objectes.  

>LDAP
      
7.   7. Quin servei de Windows emmagatzema i administra els objectes del domini?

>Active Directory Domain Services
    

# Anàlisi de l’arquitectura

Responeu breument:

1.   Per què el servidor `SRV-DC-01` necessita una adreça IP fixa?

>Perquè els clients puguin trobar sempre el servidor i connectar-se al domini correctament. Si la IP canvies podrien aparèixer problemes amb el DNS i domini.
    
2.   Per què els clients del domini han d’utilitzar un servidor DNS capaç de resoldre la zona d’Active Directory?

>Perquè puguin trobar el controlador de domini i els serveis per iniciar sessió i autenticar-se al domini.
    
3.   Què passaria si `SRV-DC-01` estigués apagat?

>Els usuaris no podrien iniciar sessió i accedir als recursos del domini. També deixaria d’estar disponible el servei de DNS i altres serveis, ja que els dona el mateix servidor.

    
4.   Per què un únic controlador de domini és acceptable al laboratori però insuficient en una empresa real?

>Perquè al "laboratori" és suficient per fer les pràctiques i entendre com funciona tot.... En una empresa fan falta diversos controladors de domini per tenir redundància i evitar que una avaria deixi el servei sense funcionar, ja que al tenir-ne 2 l'altre continuaria funcionant.

    
5.   Per què els departaments no s’han creat com a dominis diferents?

>Perquè es poden organitzar com a unitats organitzatives (OU) dins del mateix domini, lo que facilita la gestió dels usuaris, els grups i els permisos.

    

# Planificació de la implantació

Ordeneu les accions següents:

- crear els usuaris.  
    
- comprovar el DNS.  
    
- assignar els usuaris als grups.  
    
- instal·lar AD DS.  
    
- crear les unitats organitzatives.  
    
- preparar la xarxa del servidor.  
    
- unir el client al domini.  
    
- crear el bosc i el domini.  
    
- crear els grups.  
    
- comprovar el funcionament del domini.  
    

Justifiqueu breument l’ordre escollit.  

>Ordenat:

```
1. Preparar la xarxa del servidor:
Perquè el servidor tingui la xarxa ben configurada i una IP fixa abans de començar a instal·lar res.

2. Instal·lar AD DS:
Perquè és el servei que necessitem per poder crear el domini i gestionar els usuaris i els equips.

3. Crear el bosc i el domini:
Per deixar creada l'estructura principal on s'organitzarà tot el sistema de l'AD.

4. Comprovar el DNS:
Per assegurar-nos que els ordinadors puguin trobar el servidor i connectar-se al domini sense problemes.

5. Comprovar el funcionament del domini:
Per veure que tot funciona correctament abans de continuar configurant la resta.

6. Crear les unitats organitzatives:
Per tenir els usuaris i els grups ben ordenats segons els departaments de l'empresa.

7. Crear els grups:
Per poder organitzar els usuaris i facilitar l'assignació dels permisos.

8. Crear els usuaris:
Perquè cada treballador tingui el seu propi compte per entrar al domini i utilitzar els recursos.

9. Assignar els usuaris als grups:
Perquè cada usuari tingui els permisos que necessita segons el seu departament o projecte o...

10. Unir el client al domini:
Perquè l'ordinador formi part de la xarxa del domini i els usuaris puguin iniciar sessió amb els seus comptes.
```