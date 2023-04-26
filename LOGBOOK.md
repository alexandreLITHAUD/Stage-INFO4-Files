# Logbook du déroulement du stage
- [Logbook du déroulement du stage](#logbook-du-déroulement-du-stage)
  - [SEMAINE 1 :](#semaine-1)
  - [SEMAINE 2 :](#semaine-2)
  - [SEMAINE 3 :](#semaine-3)
  - [SEMAINE 4 :](#semaine-4)
  - [SEMAINE 5 :](#semaine-5)
  - [SEMAINE 6 :](#semaine-6)

---

## Semaine 1 :
## 17/04/23 :
- Cration des Git (Personel) qui stokerons mes avancées (Documentation et Code)
- Mise en place dans le laboratoire
- Mise en place + précision sur le sujet
- Lecture approfondie des informations sur le site NixOs + Installation du Langage et de L'OS.
- Recuperation de l'ISO de NixOs + Creation de Clé bootable
- Installation de NixOs sur un Ordinateur
- Test de fonctionnement de NixOs
- Pratique de fonctionne Nix dans l'envitonnement NixOs
- Creation des premières dérivation (simple Hello World)

## 18/04/23 :
- **REUNION** :
  - Mise a point du sujet
  - Explication de COMPASS
  - Compte Inria
  - Explication des différence de Workflow Grid-5000 / dev -> G5000(on veux assurer la remise a zero en cas de probleme : On privilegie la verfification a la rapidité) ; dev(On cherche la rapiditer avant tout)
  - Potentiel sujet (FileSystem, Gitlab-CI,...)
- Ajout dans les Gitlab des projets
- Continuation des Nix Pills
- Creation de dérivation autotools
- (Compréhention du system SHA256 (2^64 max OMG))
- Aprentissage du system nix-shell
- Comprention du Garbage Colector Nix
- Packaging d'application et de bibiolthèque de manière isolé et reproductive (grace a Nix)
- Familisarisation avec l'architecture de packaging conseiller pour les multiples paquets. (INPUTS design pattern)

## 19/04/23 :
- Continuation des Nix Pills
- Creation du Compte Grid-5000
- Apprentissage du pattern de packaging Nix dit **callPackage**
- Familiarisation avec le pattern **callPackage**
- Apprentissage du pattern **Override**
- Familiaridation avec le pattern **Override**
- Apprentissage basique du fonctionnement de nixpkgs
- Familiarisation avec le systeme de paquet NixOS
- Familiarisation avec le principe de package Overidding (+- design pattern)
- Familiarisation avec le nix  (aka les etape de "hashage" des fichiers dans le store sha256 -> rajout du path -> truncate 160 premier bits -> Base 32 codage)
- Comprehention du STDENV et du mkDerivation
- **TODO** - Nix Flakes 
- **TODO** - Grid-5000 

## 20/04/23 :
- Pour activer les Flakes sur NixOs : nix.settings.experimental-features = [ nix-command flakes ];
- Creation de mes premiers Flakes
- Comprehention des Nix Flakes
- Familiarisation avec le principe des Nix Flakes
- Test sur les Flakes (petit projet git de hello world en Go et mise a jour des paquets)
- **SEMINAIRE** : Tests Unitaires dans le Domaine HPC (14h->15h15)
  - Rapel de ce que le manque de test (notamment unitaire provoque) aka dette tehnique
  - Rapel sur l'interet des test unitaire et de ne pas abuser sur les test d'integrations
  - Avantage des test (Humain, Ecologique, Techique (reecriture, refactoring, monté en compétance...))
  - Importance de faire des test le plus rapidement possible afin de s'assurer une bonne architecture du projet.
- Discution du systeme de Flakes avec les doctorant et ingénieur du LIG.
- Reflexion sur le systeme du mkShell pour l'initialisation d'outils reproductible.

## 21/04/23 :
- Avancé suplementaire sur les Nix Flakes
- Lecture de Blog et Video plus avancé sur le sujet
- Creation de template de Flakes classique
- Comprehention du TOML (ou Tom's Obvious, Minimal Language)
- Lecture des informations importante concernant Grid5000 et son utilisation. (mais à continuer)
- Creation de Flakes de developppement classique en utilisant les Flakes utils (exemple installation d'environnement java)
- Initiation au bonne pratique des Nix Flakes
- Début du Tutorial NixOS Compose sur le git (https://gitlab.inria.fr/nixos-compose/tuto-nxc/-/tree/main/) (à continuer)
- Lecture de la documentation NixOS Compose

---

## Semaine 2 :

## 24/04/23 :
- Création de clés ssh sur les différents ordinateurs ammenés à devoir communiquer avec Grid5000
- Création d'un fichier de configuration pour les clés ssh en lien avec grid5000
- Connexion au réseau Grid5000 via plusieurs machines
- Continuation du tuto nixos-compose (en utilisant grid5000)
- Réalisation de la "formation" obligatoire du CNRS (prévention des risques et incendies) (environ 2h00) (Elle doit être réalisée sur le temps de travail.)
- Création de "jobs" sur le réseau de grid5000
- Deploiement de job dans la platforme grid5000 sur plusieur machines
- Connection et liberation de node du systeme grid5000
- Ajout de paquets suplementaire dans des environnement (simple) grid5000
- Apprentissage rapide du fonctionnement de tmux (ce qui sera utile notamment pour les liens ssh entre les machines)
  - Ctrl + b + % = switch into 2 panes verticalement (Ctrl + b -> \<direction\> pour changer)
  - Ctrl + b + " = switch into 2 panes horizontalement (Ctrl + b -> \<direction\> pour changer)
  - Ctrl + b -> c = créer une nouvelle fenetre (change le numero en bas) (* montre la fenetre actuelle comme git)
  - Ctrl + b -> \<num\> = change de fentre a celle avec le numero
  - Ctrl + b -> , = renommage de la fenetre actuelle
  - sur tmux les sessions correspond au processus et garde leur etat même en cas de perte de connexion par exemple donc très utilse en ssh
  - Ctrl + b -> d = détacher la session du terminal en cours
  - Ctrl + b -> s = Voir et choisir es différentes session a reprendre
  - tmux ls = voir tous les session tmux en cours
  - tmux attach -t \<nom ou num\> = pour reatacher la session
  - tmux rename session -t \<nom ou num\> \<nouveau nom\>
  - tmux new -S \<nouveau nom\> = creer une nouvelle session avec directement le nom
  - tmux kill-session -t \<nom ou num\> = détruit la session

## 25/04/23 :
- **REUNION :**
  - Rapel du premier objectif : implementation de nouveaux FS (PFS et pas NFS) notamment **[beegfs](https://github.com/NixOS/nixpkgs/tree/master/nixos/tests)**, **[gluster](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/glusterfs.nix)**, **[ceph](https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/ceph-multi-node.nix)** des FS present sur nixpkgs sauf pour beegfs.
  - PFS = Parallel File System: [NFS](https://github.com/NixOS/nixpkgs/tree/master/nixos/tests/nfs) = Network File System (Vu en cours)
  - L'objectif de l'implementation de nouveaux file system dans nixos compose est de regarder les performance du foldind.
  - Papier sue les performance sur le foldind : https://hal.science/hal-04038000/document
  - Foldind = Comme on ne veux / peux pas envoyer un cluster entier de machines dans grid5000 (beaucoup de machine nécessaire) on va en envoyer moins et "virtualiser" certaine machine dans d'autre (c'est le folding). On veux voir a quel point chaque FS est capable de folder avant d'avoir une perte de performance importante
  - Apres implementation des FS on pourras faire une "courte" phase de test de performance (ior, md2bench pour voir les performance (comme sur le tuto-nxc))
  - (Donc on essai de limiter le nombre de machine dans dans les calculateur pour la recherche donc ecologique)
- Continuation du tuto-nxc
- Maintenance de 8h30 à 18h00 de la platforme Gird5000 Grenoble.. (Donc reinstallation complete dans la platforme de nancy)
- Vision du language MPI (Message Passing Interface) (creation de topologie dans un systeme distribué)
- Finition de la partie de base du tuto-nxc (TODO : Faire la partie "To go further")
- Lecture des différents paquets de nixpkgs qui compose glusterfs (Dont le fichier de test)
- Analyse du depot de glusterfs et nfs sur nixos-compose
- Questionnement sur le fonctionnement de la creation de volume

## 26/04/23 :
- Question sur le sujet et sur les dépots deja existant
  - Commencer par faire les commandes à la main avant de tout automatiser
  - (commande git grep <>)
  - **TODO** : Lire et comprendre les modules nixos (utiliser pour l'automatisation des fileSystems)
  - **TODO** : Lire et comprendre le fonctionnement et comment travailler avec le systemd
  - **TODO** : Lire et comprendre les test nixos et comment les utiliser efficacement
- Lecture de la documentation sur systemd : **[Chapter 58. Service Management](https://nixos.org/manual/nixos/stable/index.html#sect-nixos-systemd-general)**
- Lecture de la documentation sur les modules nix : **[Chapter 67. Writing NixOS Modules](https://nixos.org/manual/nixos/stable/#sec-writing-modules)**
- Lecture de la documentation sur les test nix : **[Chapter 71. NixOS Tests](https://nixos.org/manual/nixos/stable/#sec-nixos-tests)**
- Création des premiers modules nixos. (after \[ ..., ... \] signifie de faire apres que les services sont vrai; oneshot = faire une seule fois même si erreur ou autre) (import -> importation d'autre modules; option -> description des valeur par défaut et du type des valeur du module; config -> la définition du module)
- Création des premiers test nixos (+- ce que fait composition.nix -> des node/client; des serveur; (role) et un script python, C'est ce quil y a dans nixos/pkgs/tests avec un import de test python)
- Creation d'un systeme de fichier PFS glusterfs et deploiement *manuel* sur grid5000
- Lecture du terme d'Overlay dans NixOs : **TODO** : relire la doc **[Chapter 3. Overlays](https://nixos.org/manual/nixpkgs/stable/#chap-overlays)**
- Test de facon de resoudre le problème de mauvaise brick lors de la creation de gluster dans grid5000 sans filesystem a part.

## 27/04/23 :

## 28/04/23 :

---

## Semaine 3 :

## 02/05/23 :

## 03/05/23 :

## 04/05/23 :

## 05/05/23 :

---

## Semaine 4 :

## 09/05/23 :

## 10/05/23 :

## 11/05/23 :

## 12/05/23 :

---

## Semaine 5 :

## 15/05/23 :

## 16/05/23 :

## 17/05/23 :

## 19/05/23 :

-- 

## Semaine 6 :
