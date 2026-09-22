# Fitxa 1 — Anàlisi inicial de MusicCloud

## Objectiu

MusicCloud necessita reorganitzar la seva infraestructura informàtica. Abans d'instal·lar o configurar cap servei, cal entendre:

- qui treballa a l'empresa;
    
- quines funcions té cada persona;
    
- quins recursos existeixen;
    
- qui necessita accedir a cada recurs;
    
- com podem gestionar aquests accessos de manera eficient.
    

---

# 1. Conèixer MusicCloud

Consulta la informació disponible sobre els departaments, treballadors i perfils d'usuari de MusicCloud.

Completa la taula següent.

| Persona | Departament | Funció / responsabilitat | Necessita privilegis especials? Per què? |
|---|---|---|---|
| Aina Ciurans | Direcció | Treballadora | No, necessita accés als recursos de Direcció per a la gestió general de l'empresa. |
| Rut Tornil | Direcció | Treballadora | No, necessita accés als recursos de Direcció per a la gestió general de l'empresa. |
| Dídac Gassó | Administració | Treballador | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Laia Macias | Administració | Cap de departament | Sí, necessita permisos de gestió sobre els recursos del seu departament. |
| Estel Birosta | Suport tècnic | Treballadora | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Aina Zuriguel | Suport tècnic | Treballadora | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Lluïsa Richart | Suport tècnic | Cap de departament | Sí, necessita permisos de gestió sobre els recursos del seu departament. |
| Roser Alberch | Producció musical | Treballadora | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Guillem Adella | Producció musical | Treballador | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Meritxell Reglat | Producció musical | Cap de departament | Sí, necessita permisos de gestió sobre els recursos del seu departament. |
| Alícia Monclús | Producció musical | Treballadora | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Carles Molins | Producció musical | Treballador | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Eulàlia Galcera | Producció musical | Treballadora | No, necessita accés als recursos del departament per realitzar les seves tasques. |
| Talia Costas | Informàtica | Cap de departament | Sí, necessita privilegis tècnics per administrar els sistemes i recursos informàtics. |
| Alex Soriano | Informàtica | Treballador | Sí, necessita privilegis tècnics per administrar els sistemes i recursos informàtics. |
| Pere Espinalt | Extern | Usuari extern | No, només necessita accés limitat als recursos que se li autoritzin. |
| Neus Bages | Extern | Usuària externa | No, només necessita accés limitat als recursos que se li autoritzin. |

### 1.1. Reflexió

Quines diferències observes entre un **treballador**, un **departament** i una **funció o responsabilitat**?

--- Un treballador és una persona que forma part de l'empresa i que té unes tasques assignades.

--- Un departament és un grup de treballadors que s'encarrega d'una àrea concreta de l'empresa, com ara Administració, Informàtica o Producció musical.

--- La funció o responsabilitat indica què fa cada treballador dins del seu departament. Per exemple, una persona pot ser treballadora d'Administració i, a més, ser el cap del departament.

Hi ha persones que, pel seu càrrec o funció, necessiten accessos diferents dels altres membres del seu departament?

X Sí  
☐ No

Posa'n algun exemple:

Sí. Els caps de departament necessiten alguns permisos addicionals perquè han de poder gestionar i consultar informació del seu departament que els altres treballadors no necessiten.

Per exemple, Laia Macias, com a cap d'Administració, té accés de gestió a la carpeta del seu departament. En canvi, Dídac Gassó, que és treballador d'Administració, té els permisos normals del departament.

En el cas d'Informàtica, Talia Costas i Alex Soriano necessiten privilegis tècnics amplis perquè són els encarregats de treballar amb els sistemes informàtics. També és necessari que tots dos puguin assumir les tasques de l'altre quan un no estigui disponible.

# 2. Recursos de l'empresa

Analitza l'estructura d'informació de MusicCloud.

Classifica alguns dels recursos següents segons la seva finalitat.

| Recurs | Qui creus que l'hauria d'utilitzar? | Per a què? |
|---|---|---|
| `/empresa/comu/intercanvi` | Tots els treballadors i usuaris externs | Per intercanviar temporalment documents amb persones de fora de l'empresa. |
| `/empresa/comu/comunicats` | Tots els treballadors interns | Per consultar comunicats i informació general de l'empresa. |
| `/empresa/departaments/administracio/compartida` | Treballadors d'Administració | Per guardar i compartir documents que necessiten els membres del departament. |
| `/empresa/departaments/administracio/gestio_departament` | Laia Macias, cap d'Administració | Per gestionar informació i documents propis de la gestió del departament. |
| `/empresa/projectes/campanya_estiu` | Usuaris assignats al projecte | Per treballar i compartir els documents relacionats amb la campanya d'estiu. |
| `/empresa/administracio_sistema/backups` | Personal d'Informàtica amb permisos d'administració | Per guardar i gestionar les còpies de seguretat dels sistemes i dades de l'empresa. |

---

# 3. Qui ha de poder fer què?

Per a cada situació, indica quin nivell d'accés consideres adequat.

Utilitza:

- **NA** → sense accés
    
- **L** → lectura
    
- **L/E** → lectura i escriptura
    
- **ADM** → administració
    

No busquis encara una solució tècnica. Pensa només en les necessitats de l'empresa.

| Situació | Accés proposat | Justificació |
|---|---|---|
| Dídac accedeix a la carpeta compartida d'Administració | L/E | Necessita consultar, crear i modificar documents del seu departament. |
| Laia accedeix a la gestió del departament d'Administració | L/E | Com a cap del departament, necessita gestionar els documents i la informació del seu equip. |
| Pere, treballador extern, accedeix als comunicats interns | NA | Els comunicats contenen informació interna i els usuaris externs no hi tenen accés. |
| Talia accedeix als backups del sistema | ADM | Com a responsable d'Informàtica, necessita gestionar i mantenir les còpies de seguretat. |
| Un membre de Producció musical accedeix a la carpeta d'Administració | NA | No necessita accedir a la informació pròpia d'un altre departament. |
| Un participant de `campanya_estiu` accedeix als fitxers del projecte | L/E | Necessita consultar i modificar els fitxers per poder treballar en el projecte. |

---

# 4. Primer problema: com assignem els permisos?

Imagina que MusicCloud té només quatre treballadors:

- Anna
    
- Biel
    
- Carla
    
- David
    

Tots quatre treballen al mateix departament i necessiten accedir a la mateixa carpeta.

Una possible solució seria configurar:

```text
Anna  → lectura/escriptura
Biel  → lectura/escriptura
Carla → lectura/escriptura
David → lectura/escriptura
```

### 4.1.

***Què passaria si l'empresa tingués **100 treballadors** amb el mateix tipus d'accés?***

Si hi hagués 100 treballadors, seria molt complicat gestionar els permisos un per un. També augmentaria la possibilitat de cometre errors o oblidar algun usuari.


### 4.2.

***Què passaria cada vegada que s'incorporés una persona nova?***

Cada vegada que s'incorporés una persona nova, hauríem de configurar manualment els seus permisos. Això faria que la gestió fos més lenta i poc pràctica.


### 4.3.

***Què passaria quan una persona canviés de departament?***

Hauríem de modificar manualment els permisos de la persona i treure-li els accessos que ja no necessita. Amb molts treballadors, aquesta tasca podria provocar errors.


### 4.4.

***Proposa una manera de gestionar aquestes persones conjuntament.***

***No cal que coneguis encara el nom tècnic de la solució.***


Una millor opció seria agrupar les persones segons el departament o les seves funcions i assignar els permisos al grup en lloc de fer-ho persona per persona.

D'aquesta manera, quan entra una persona nova, només cal afegir-la al grup corresponent i ja tindrà els permisos necessaris.

# 5. Canvis a MusicCloud

Ara es produeixen aquests tres canvis:

### Cas A

Dídac deixa Administració i passa a Producció musical.

***Quins accessos hauria de perdre?***

Hauria de perdre els accessos propis del departament d'Administració, ja que ja no hi treballarà.

***Quins accessos hauria d'obtenir?***

Hauria d'obtenir els accessos corresponents a Producció musical, incloent-hi les carpetes compartides i els recursos que necessiti per fer la seva feina. I altres com permisos de certs projectes només si fa falta.

### Cas B

S'incorpora una nova treballadora al departament d'Administració.

***Quins accessos caldria configurar?***

Caldria afegir-la al grup d'Administració perquè tingui els mateixos accessos que la resta de treballadors del departament. També hauria de tenir la seva carpeta personal.

### Cas C

Pere Espinalt deixa de col·laborar amb MusicCloud.

***Què hauríem de fer amb els seus accessos?***

Hauríem de retirar tots els seus accessos als recursos de MusicCloud, ja que deixa de col·laborar amb l'empresa. També caldria desactivar el seu compte per evitar que pugui tornar a accedir-hi.

# 6. Busquem una solució millor

Suposa ara que podem crear conjunts de persones que comparteixen unes mateixes necessitats d'accés.

Per exemple:

```text
Administració
    ├── Dídac
    ├── Laia
    └── Roser
```

I podem donar permisos directament al conjunt:

```text
Administració → carpeta_administracio → L/E
```

### 6.1.

***Quin avantatge té aquesta solució respecte a donar permisos persona per persona?***

El principal avantatge és que la gestió és més fàcil i ordenada. En lloc de configurar els permisos de cada persona, els configurem una vegada per al grup i després vas afegint o treient a que fagi falta.

### 6.2.

***Si Dídac passa d'Administració a Producció musical, què caldria modificar?***

Només caldria treure Dídac del grup d'Administració i afegir-lo al grup de Producció musical. Així obtindria automàticament els nous permisos.

### 6.3.

***Com anomenaries aquests conjunts de persones?***

Els anomenaria departaments, ja que agrupen treballadors que pertanyen a la mateixa àrea de l'empresa i comparteixen necessitats d'accés.

# 7. Primera proposta per a MusicCloud

A partir de l'organització de l'empresa, proposa els primers conjunts de persones que crearies.

**No cal trobar encara la solució definitiva.**

|Nom proposat|Qui hi pertanyeria?|Per què existeix aquest conjunt?|
|---|---|---|
||||
||||
||||
||||
||||

---

# 8. Cas que complica el model

Laia treballa al departament d'Administració, però també és la responsable del departament.

És suficient que pertanyi només al conjunt `Administració`?

☐ Sí  
☐ No

Per què?

---

---

Quina possible solució proposes?

---

---

---

# 9. Un altre cas

Diverses persones de departaments diferents participen temporalment en el projecte:

```text
Campanya Estiu
```

Creus que hauríem de canviar-les de departament?

☐ Sí  
☐ No

Si no, com podríem donar-los accés als recursos del projecte?

---

---

---

# 10. Conclusions

Completa les frases amb les teves paraules.

### Usuari

Un usuari representa:

---

### Recurs

Un recurs és:

---

### Permís

Un permís determina:

---

### Grup

Un grup serveix per:

---

---

# 11. Regla de mínim privilegi

Analitza aquesta afirmació:

> Un usuari només hauria de tenir els permisos estrictament necessaris per realitzar la seva feina.

Explica amb les teves paraules què significa.

---

---

Posa un exemple relacionat amb MusicCloud.

---

---

---

# 12. Pregunta final

Imagina que demà MusicCloud passa de 14 treballadors a 500.

Quina de les dues estratègies consideres més adequada?

☐ Assignar permisos individualment a cada usuari.

☐ Organitzar els usuaris segons les seves necessitats i assignar permisos a aquests conjunts.

Justifica la resposta.


