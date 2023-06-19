---
geometry: margin=2cm
---
# Note Ceph - https://docs.ceph.com/en/quincy/

Ceph peut-être utilisé pour créer un Stockage d'Objet dans des plateforme Cloud. Il peux aussi être utilisé pour créer des Systèmes de blocks dans des plateforme cloud.

Tout les Clusters de Stockage Ceph commence par mettre en place les noeuds Ceph et initialisé le réseaux.

Un cluster Ceph a besoin d'un Ceph Monitor, et au moins un Ceph Manager. Et au moins autant de Ceph OSD qu'il y a de copie d'un objet stocké dans le cluster Ceph.

**Il existe aussi un Noeud Ceph Metadata Server qui est nécessaire pour faire fonctionner le client du système de fichier Ceph**

**C'est une bonne pratique d'avoir un Ceph Manager par monitor (mais pas nécessaire)**

---
## Vocabulaire

- **Monitor / MON** : Son but est de maintenir l’état des map et du cluster. Cad - la map monitor, manager, OSD, MDS et CRUSH (algo de stockage efficace avec hachage). Ces map sont essentiel car il garde l'tat des différentes fonction requise par le daemon Ceph pour coordonnée. Les moniteur son aussi responsable de l'authentification entre les daemons et les clients. *(3 sont nécessaire au minimum pour garantir la redondance et la présence (règle des 9))*
- **Manager / MGR** : Ll est responsable de prendre en note les différentes métriques du système et de l'état courant du cluster Ceph. Comme l'utilisation du stockage, les performances et le stress du système. Les informations son disponible avec un dashboard en ligne et a une API REST. *(2 manager sont nécessaire pour garantir la redondance et la présence (règle des 9))*
- **Object Storage Demon / OSD** : Il stocke les données, gère les duplications de données, balancement et donne des information de fonctionnement au manager en regardant l'état des autre OSD's.
- **Metadata Server / MDS** : Il stocke les métadonnées pour le Système de Fichier Ceph. Le server de métadonnées permet (POSIX) d’exécuter des commandes basiques comme ls ou find sans trop affecter le cluster Ceph. 

---
## Système de Fichier Ceph - https://docs.ceph.com/en/quincy/cephfs/

![shema fs ceph](https://docs.ceph.com/en/quincy/_images/cephfs-architecture.svg)

`ceph fs volume create <fs name>`

---
## Système de Blocs Ceph - https://docs.ceph.com/en/quincy/rbd/

![schema archi](https://docs.ceph.com/en/quincy/_images/ditaa-9c4dce3fc347721433a81021ea03daac92997c1a.png)
