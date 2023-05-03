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
- Continuation du "projet" glusterfs (FS distribué avec nixos compose)
- Test de fonctionnement du principe de base en utilisant les VM plutot que grid5000.
- Connexion et test de Glusterfs dans les VM (même constat que sur g5k). (Continuer à chercher)
- Premiere vision de NUR : **[depot offciel](https://github.com/nix-community/NUR)** | **[depot](https://github.com/oar-team/nur-kapack)**
- Lecture de la documentation NUR
- Test de NUR
- Lecture de l'issue beegfs sur nixos. Pour pouvoir reprendre les information pour implementer beegfs dans nixos-compose.
  - **issue** : https://github.com/NixOS/nixpkgs/pull/740
- Copie et analyse du default.nix et test.nix de beegfs avant la suppresion du dépot nixos.
- Essai de fonctionnement de beegfs sur nixos-compose en utilisant les ressources supprimé du dépot officiel.
- Creation de script de base (pas encore fonctionel)
- Analyse des dépots et de plusieurs issues github sur le sujet
- Correction de bug sur le script (notamment le problème du au fait que le package n'est plus existant et que son appel entraine une erreur ce qui fait qu'il faut renommer les services dans le module)
- Objectif :
  - Simplifier ce script afin de faire marcher un volume simple.
  - Puis améliorer ce script pour le rendre automatique (module et overlays)

## 28/04/23 :
- Continuation d'amelioration du script pour beegfs
- Lecture et Analyse du module kernel de l'issues github
- Simplification et correction de quelques bug sur le script
- Test de fonctionnement du script classique simple (encore quelque bug)
- **Problemes** : 
  - Le module depend encore d'un autre module qui n'existe plus
  - Donc je commence par juste essayer d'importer le default.nix pour voir si le paquet fonctionne
  - Probleme de packaging du default.nix de beegfs il est donc pas possible de l'importer pour le moment (default est une derivation)
  - Erreur me disant que le package n'est pas unfree ?? (sachant que ma configuration accept deja les paquets unfree) 
  - Le probleme viens du git?? C'est peut etre le fichier LICENSE.txt du git qui entraine ce comportement??
  - Le git utilisé (url = "https://git.beegfs.com/pub/v7/repository/archive.tar.bz2?ref=\$\{version\}";) n'est pas acessible (il semble que l'extention ne soie plus .com mais .io mais meme en faisant ce changement on posède un problème de license)
  - Reflexion sur des pistes de solutions sur le problème (*has an unfree license (‘unknown’), refusing to evaluate*)
- Le script de beegfs n'a vraiment plus l'air de marcher (je continue les tests cepandant)
- Lecture de multiples forums afin d'essayer de comprendre la raison du bug de license (https://discourse.nixos.org/t/allowunfree-predicate-does-not-apply-to-self-packages/21734/27)
- Correction du probleme de base et creation de la VM réussite.
- TODO : reussir a creer un volume fonctionel entre le client et le server

---

## Semaine 3 :

## 02/05/23 :
- Continuation du projet beegfs : **[REPO](./beegfs_test)**
- Correction de quelques bug (mais toujours non fonctionel du a des problemes)
- "Apprentissage" rapide de cmake afin de comprendre d'ou viennent les erreur de creation de la VM
- Probleme du au fait que le programme ne trouve pas cmake et egl-wayland. Ce probleme vien apparement du manque d'une librairie. Ajout de `environment.noXlibs = false;` pour les reactiver . Issue git : https://discourse.nixos.org/t/unable-to-install-paperless-ngx/19962  |  https://github.com/NixOS/nixpkgs/issues/179938
- Probleme de version dans openjdk. Par defaut c'est la version 17 qui est utiliser mais elle ne contien pas l'executable javah qui est nécessaire pour le fonctionnement de beegfs. Donc changement de la version et utilisation de openjdk8-bootsrapt et jr8 afin de s'assurer d'avoir l'executable.
-  Manque d'une bibliothèque si on enleve la ligne noXlib. Il semble donc bien manquer des bibliothèques dans les Xlib. ` Package requirements (cairo-xlib >= 1.6) were not met: No package 'cairo-xlib' found`. Issues git : https://github.com/Homebrew/linuxbrew-core/issues/7199  |  https://github.com/NixOS/nixpkgs/issues/102137  |  https://github.com/NixOS/nixpkgs/pull/189507
- Si on active noXlib il manque allors la presence d'un ficheir de header xattr.h qui viendrait apparement de la librairie libattr qui n'est pas presente sur nixpkgs. `fatal error: attr/xattr.h: No such file or directory`. Issues git : https://github.com/rrthomas/plptools/issues/4  |  https://github.com/pmem/pmemfile/pull/253  |  https://community.nxp.com/t5/i-MX-Processors/IMX8-fatal-error-attr-xattr-h-No-such-file-or-directory/m-p/1469852  |  https://stackoverflow.com/questions/11202056/xattrs-are-not-supported
- Test de chaque phase de compilation du default manuellement (pas de comportement différent a premiere vue)
- Changement de \<attr/xattr.h\> en \<sys/xattr.h\> sur tous les fichier qui importait cette bibliothèque en utilisant substituteInPlace. Mainteant erreur sur un flag : ` error: 'ENOATTR' was not declared in this scope; did you mean 'ENOTTY'?` TODO Corriger ça
- Quand ça fonctionnera on pourra essayer de mettre le projet dans nur-kapack afin de rendre le projet facilement recuperable et utilisable 
- Reprise de glusterfs en essayant de créer le volume dans une partition différente de celle de root. En regardant si on a toujours le problème de brick offline.

## 03/05/23 :
- Continuation du projet beegfs : **[REPO](./beegfs_test)**
- Apprentissage de l'utilisation de nur-kapack (Grace à l'aide de Monsieur Richard)
- Utilisation de l'outils de nur-kapack pour realiser les étapes de compilation manuellement afin de pouvoir facilement et rapidement corriger les erreurs.
- Liste de commandes :
  - Modification du nur.nix afin de rajouter le lien vers le projet que l'on veux rajouter (ici pkgs/beegfs)
  - Rajout du fichier default.nix dans le dossier. Ce fichier contient la dérivation que l'on veux tester.
  - `nix-shell . -A beegfs` afin de lancer un terminal avec les commandes utiles. (`declare -F` , `type function_name`)
  - `unpackPhase` afin de 'fetch' les sources
  - `configurationPhase`
  - `patchPhase`
  - `buildPhase`
  - `installPhase`
- Creation d'un bash de lancement de la partie build car `buildPhase` et `installPhase` cherche des makefiles or il n'y en a pas a la racine du projet. On fait donc le build "manuellement"
- Grace a cela le probleme de sources mal localisé à pu être modifier directement dans la patchPhase avec la commande bash `substituteInPlace`
- Probleme de test :
```    
> [----------] Global test environment tear-down
> [==========] 41 tests from 12 test cases ran. (5103 ms total)
> [  PASSED  ] 40 tests.
> [  FAILED  ] 1 test, listed below:
> [  FAILED  ] NIC.nic
>
>  1 FAILED TEST
>   YOU HAVE 12 DISABLED TESTS
```
- Le fichier TestNIC.cpp semble ne pas fonctionner ici. Test de fonctionnement en supprimant le test pendant la phase de patch.
- Build completed !
- **TODO** : Creer des volumes distribués sur des clients et servers (faire un fichier composition.nix efficace) et mettre le projet dans nur-kapack.

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
