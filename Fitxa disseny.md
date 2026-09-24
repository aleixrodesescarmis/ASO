# Fitxa 2 — Organització del servei de directori de MusicCloud

## Objectiu

En aquesta sessió hem decidit com organitzar els diferents objectes de MusicCloud dins d'un servei de directori.

Aquesta fitxa forma part de la **documentació de disseny del sistema**. Les decisions que hi indiquis s'utilitzaran posteriorment durant la implantació.
# 1. Objectes que hem de gestionar

MusicCloud necessita gestionar de manera centralitzada diferents tipus d'objectes.

Indica quins tipus d'objectes consideres que ha de contenir el servei de directori.


# 1. Objectes que hem de gestionar

| Tipus d'objecte | Exemples a MusicCloud |
|---|---|
| Usuaris | Treballadors dels departaments i usuaris externs, com Pere Espinalt i Neus Bages.|
| Grups | Direcció, Administració, Suport tècnic, Producció musical, Informàtica, responsables i Campanya Estiu. |
| Equips | Ordinadors de sobretaula (PC), portàtils, Mac, mobils... |
| Servidors | Servidor de fitxers i del servei de directori. |
| Comptes d'aplicacions o serveis | Comptes per als serveis, com les còpies de seguretat. |

***Hi afegiries algun altre tipus d'objecte?***

Sí, dispusitius en  xarxa.

---
# 2. Organització mitjançant unitats organitzatives

Proposa les **unitats organitzatives (OU)** principals que utilitzaries a MusicCloud.

| OU | Què contindrà? | Per què la crees? |
|---|---|---|
| Usuaris | Treballadors dels departaments i usuaris externs. | Per organitzar i gestionar els comptes. |
| Grups | Grups de departaments, responsables i projectes. | Per organitzar els grups de permisos. |
| Equips | PC, portàtils, Mac i altres equips. | Per gestionar els dispositius de l'empresa. |
| Servidors | Servidors de fitxers i del servei de directori. | Per administrar els servidors per separat. |
| Comptes_Servei | Comptes d'aplicacions i serveis. | Per separar-los dels comptes dels treballadors. |

## 2.1. Organització dels usuaris

Dibuixa l'estructura que utilitzaries per organitzar els usuaris de MusicCloud.

```text
MusicCloud
│
└── Usuaris
    ├── Direccio
    │   ├── Aina Ciurans
    │   └── Rut Tornil
    │
    ├── Administracio
    │   ├── Didac Gasso
    │   └── Laia Macias
    │
    ├── Suport_Tecnic
    │   ├── Estel Birosta
    │   ├── Aina Zuriguel
    │   └── Lluisa Richart
    │
    ├── Produccio_Musical
    │   ├── Roser Alberch
    │   ├── ...
    │
    ├── Informatica
    │   ├── Talia Costas
    │   └── Alex Soriano
    │
    └── Externs
        ├── Pere Espinalt
        └── Neus Bages
```
---

# 3. OU o grup?

Indica quina opció utilitzaries principalment en cada cas.

| Necessitat | OU | Grup |
|---|:-:|:-:|
| Organitzar els treballadors d'Administració | X | |
| Donar accés a la carpeta d'Administració | | X |
| Organitzar els ordinadors clients | X | |
| Identificar les persones que participen en Campanya Estiu | | X |
| Organitzar els servidors | X | |
| Donar privilegis als administradors del sistema | | X |
| Organitzar els comptes utilitzats per aplicacions | X | |

### Explica amb les teves paraules la diferència principal entre una OU i un grup.

***OU:***

Serveix per organitzar els usuaris, equips i altres objectes del directori i facilitar-ne l'administració.


***Grup:***

Serveix per agrupar usuaris amb necessitats semblants i assignar-los permisos sense haver de fer-ho un per un.

---

# 4. Un mateix usuari: ubicació i pertinença

Considera aquest cas:

***Dídac Gassó***

- treballa a Administració;
    
- participa en el projecte Campanya Estiu.
    

Indica:

***En quina OU ubicaries el seu compte?***

A `MusicCloud/Usuaris/Administracio`, perquè és el departament on treballa.

***A quins grups podria pertànyer?***

Als grups `Administracio` i `Campanya_Estiu`, per accedir als recursos del seu departament i als del projecte.

### Per què no és contradictori que estigui en una OU però pertanyi a diversos grups?

Perquè la OU serveix per organitzar el seu compte, mentre que els grups determinen els seus permisos. Així pot participar en diferents projectes sense canviar de departament.


---

# 5. Servei de directori

***Explica breument què entens per **servei de directori**.***

És un servei que permet organitzar i gestionar de manera centralitzada els usuaris, grups, equips i altres recursos d'una xarxa.

Quin problema resol a MusicCloud?

Facilita la gestió dels comptes i permisos des d'un mateix lloc, sense haver de configurar cada usuari o equip per separat. Això estalvia temps i millora la seguretat.


---

# 6. LDAP

Completa les frases següents.

***LDAP és:***

Un protocol que permet accedir, consultar i modificar la informació d'un servei de directori a través de la xarxa.

***LDAP no és:***

Un servei de directori en si mateix, ni és el mateix que Active Directory.

***Indica si les afirmacions són certes o falses.***

| Afirmació | C | F |
|---|:-:|:-:|
| LDAP és sinònim d'Active Directory | | X |
| LDAP permet accedir i consultar informació d'un directori | X | |
| OpenLDAP és una implementació d'un servei de directori | X | |
| Active Directory utilitza LDAP, entre altres tecnologies | X | |

---

# 7. DIT de MusicCloud

Dibuixa la proposta final de **Directory Information Tree (DIT)** de MusicCloud.

Ha de mostrar, com a mínim:

- usuaris;
    
- grups;
    
- equips;
    
- servidors;
    
- comptes d'aplicacions o serveis;
    
- les subdivisions que consideris necessàries.
    

```text
MusicCloud
│
│
│
│
│
```

---

# 8. Justificació del disseny

Escull **dues decisions** del teu DIT que consideris importants i justifica-les.

### Decisió 1

---

**Justificació:**

---

---

### Decisió 2

---

**Justificació:**

---

---

---

# 9. Comprovació final

Respon breument.

### a) Per què no seria una bona idea guardar tots els usuaris, grups, equips i servidors al mateix nivell sense organitzar-los?

---

---

### b) Per què no hauríem d'utilitzar les OU per substituir els grups de permisos?

---

---

### c) Si MusicCloud passa de 14 a 500 treballadors, quina característica del disseny que has fet avui facilitarà més l'administració?

---

---

---

# Documentació final del sistema

A partir de les decisions preses durant la sessió, deixa definida la proposta que utilitzarem inicialment per a MusicCloud.

## Estructura d'unitats organitzatives

```text
MusicCloud
│
│
│
│
```

## Criteri utilitzat per organitzar els objectes

---

---

## Criteri utilitzat per diferenciar OU i grups
