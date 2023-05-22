# Logbook du déroulement du stage
- [Logbook du déroulement du stage](#logbook-du-déroulement-du-stage)
  - [Semaine 1 :](#semaine-1-)
  - [Semaine 2 :](#semaine-2-)
  - [Semaine 3 :](#semaine-3-)
  - [Semaine 4 :](#semaine-4-)
  - [Semaine 5 :](#semaine-5-)
  - [Semaine 6 :](#semaine-6-)
  - [Semaine 7 :](#semaine-7-)
  - [Semaine 8 :](#semaine-8-)

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
```    bash
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
- Test des différent binaires obtenue par le build de la dérivation (fonctionnel mais manque les fichier de configuration nécessaire)
- Discution sur le fonctionnement de nur-kapack (pk nur et pas flakes ?)
- Discution sur le fonctionnement d'un tel systeme de packaging
- Correction du module de fonctionnement de base de beegfs. (Il permet notamment de creer les fichiers de configurations dans le /etc qui sont essentiel pour la 
fabrication de volume) (meta, storage, client, mgmtd)
- Comprehention du fonctionnement de beegfs et des différents roles possible pour le bon fonctionnement d'un volume distribué
- **Problème** :
  - Existance de dépendance a pkgs.beegfs présent dans le module (le paquet à été supprimer du dépot).
  - Ajout du path absolue donc **impure** afin de tester le bon fonctionnemet du module (toujous des problèmes notamment ligne 120 avec les makeWrappers)
  - **TODO** trouver un moyen de corriger ce probleme
- Test de fonctionnement du build dans nur-kapack.
- Création d'une nouvelle branche dans nur-kapack afin de tester l'upgrade de beegfs. (Avant 7.0 maintenant 7.3)
- Meme après l'upgrade nous avons toujous les meme probleme dans les bibliothèque libattr donc il faut toujours garder les substitution dans la `patchPhase`
- Test de fonctionnement dans plusieurs environnement de "l'upgrade" de beegfs
- Ajout du module beegfs dans nur-kapack. (cela permet de faciliter la compilation du module et le deploiement de l'application)
- Debug du module dans nur-kapack (probleme de path du au fait que **${pkgs.beegfs}** deviens **${pkgs.nur.repos.kapack.beegfs}** )
- Faire attention : il manque peux etre le module kernel sur beegfs (appel de ce module dans le module de base a voir si il est completement néessaire (je pense pas on peux faire un script plutot))
- Problème avec a la fonction makeWrapper dans le module de beegfs (`Cannot wrap '/run/current-system/sw/bin/beegfs-check-servers' because it is not an executable file`)
- **TODO** Faire la composition.nix de nixos-compose en utilisant le paquet pkgs de nur-kapack et pas nixpks "classique" (en train d'être fait)
- **TODO** continuer de corriger le module et tester le fonctionnement de l'application pour pouvoir la deployer.

## 05/05/23 :
- Correction du module de beegfs pour le faire fonctionner en local
- Creation d'un script nix de text qui va utiliser nur-kapack pour installer beegfs sur nixos-compose
- Creation de volumes beegfs et tentative de connexion des volume clients et serveurs
- Pas le bon path present dans le module : le lien est celui du raccourcie vers le binaire pas le binaire en lui meme d'ou l'erreur de wrapping
- (Discution avec les doctorants sur rust sont utilisation et son interet) (https://doc.rust-lang.org/book/title-page.html)
- Test de fonctionnement de creation de volume sans utiliser les wrapper (qui n'arrive a pas a localiser les executables)
- http://www.beegfs.io/wiki/ManualInstallWalkThrough (lien du site que j'ai utilisé)
- Test de fonctionnement uniquement avec nur-kapack pour le module 
- Reprise de l'exemple de oar sur oar-team (setup.toml (-s dev pour appeller tous les dev.* du setup))
- Creation de nouveau fichier de base de fonctionnement pour beegfs en utilisant nur-kappack (il va faloir que je mete tout dans un git)
- Etude de fonctionnement de oar sur oar-team (utilisation de nur-kapack)
- Creation d'un composition.nix qui va tester grace a un setup.toml le module et la derivation du nix (**[REPO](./nur_kapack/nur-kapack-branch-beegfs-7_3)**  |  **[DERIVATION](./nur_kapack/nur-kapack-branch-beegfs-7_3/pkgs/beegfs/default.nix)**  |  **[MODULE](./nur_kapack/nur-kapack-branch-beegfs-7_3/modules/services/beegfs_mod.nix)** )
- TODO : Verifier le module (je suis pas persuadé que pkgs.nur.kappack fonctionne car on fait pkgs.wrapper donc il faudra surement changer)
- Problèmes : Erreur de compilation (recursion infini qui proviens probablement du module)

---

## Semaine 4 :

## 09/05/23 :
- Demenagement dans le laboratoire 434
- Acceuil de Samuel dans le batiement et le laboratoire  
- Retour sur beegfs en utilisant nur-kappack
- Creation d'un fichier common config afin de pouvoir simplement tester le fonctionnement de l'appel des derivations de nur
- **Problemes** :
  - Recursion infini lors de l'execution du programme (peux etre du au module)
  - Correction des erreurs de syntaxe du programme et reecriture de setup.toml
  - si on fait [pkgs.nur.repos.kapack.beegfs] on a une erreur car le unpackage de l'application ne fonctonne pas et bloque donc logiquement dans la partie de patch
  - si on fait [nur.repos.kapack.beegfs] on a une erreur lors de la phase de build (unpackaing fonctionel et patch aussi) :
  ```bash
  make: Entering directory '/build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build'
  tar -C /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source -xzf /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source/mctp3.tar.gz        
  tar -C /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source -xzf /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source/GPI2-1.2.0.tar.gz
  cd /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source/GPI2-1.2.0 && ./install.sh -p /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source/GPI2-1.2.0/out --with-ethernet
  Installation path to be used: /build/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/build/../source/GPI2-1.2.0/out
  With Ethernet support
  Building GPI... done.
  Building tests...Compilation of tests failed (see install.log)
  Aborting...
  make: *** [Makefile:31: gpi] Error 1
  ```
  - ce fichier proviens de (/home/alex/Documents/TestNix)/nur-kapack/v7-7.0-d7fc807f40aea0e88afd714cbecee7a0dbadabf7/beeond_thirdparty/source/GPI2-1.2.0.tar.gz -> dans cette archive il a un Makefile qui ne marche pas dans notre cas.
  ```make
  DOXYGEN:=$(shell which doxygen)
  GFORTRAN:=$(shell which gfortran)
  all: gpi fortran tests

  gpi:
    $(MAKE) -C src gpi

  fortran:
    $(MAKE) -C src fortran

  mic:
    $(MAKE) -C src mic

  tests: gpi
    cd tests && $(MAKE) && cd ..

  docs:
    @if test "$(DOXYGEN)" = ""; then \
      echo "Doxygen not found."; \
      echo "Install doxygen to be able to generate documentation."; \
      echo "Or consult it online at: http://www.gpi-site.com/gpi2/docs/";\
      false; \
    fi
    doxygen Doxyfile

  clean:
    $(MAKE) -C src clean
    $(MAKE) -C tests clean

  .PHONY: all tests docs clean 
  ``` 
  - Je n'ai pas trop d'idée pour la correction de ce probleme donc je vais aller demander a un doctorant
- Creation de test simple afin d'essayer de comprendre ce qui ne marche pas
- Regard d'issue git existant pour voir si il n'a pas des personnes qui ont eu des problèmes similaires (infructueux)
- En autorisants les exception avec `set e+` alors on est capable de build
- **TODO** : verifier que le comportement de l'application est celui escompté malgré les erreurs dans les Makefile

## 10/05/23 :
- Correction de bug dans certains fichier du projet beegfs notamment le module
- Creation manuel de volume beegfs en utilisant un noeud mgmt, meta, storage, et client
- Maintenant capable d'appeler et de faire fonctionner le module et le package beegfs a partir de beegfs (tester en local seulement mais fonctionne aussi en ligne)
- Le projet compile avec le module en utilisant les fichier present sur le nur kapack
- Les binaire sont present et utilisable par les machine qui les importent
- Il manque cependant les fichier de configuation qui sont definie par le module (/data et les mounts...)
- **TODO** : verifier que le bon fonctionnement global du fichier module et le modifier pour qu'il puisse autogenerer le volume
- Sinon rajouter un script dans testScript (en modifiant l'architecture de la composition pour que testScript puisse utiliser les valeurs generer par le role) (la "balise" script de base ne permet de permet pas de recuperer les valeur et donc de faire une generation automatique modulable)
- Il faut donc trouver un moyen dans le composition.nix de faire un script qui va dependre des roles predefinies par le programmes
- Comprehention avancé du fonctionnement de l'appel des bibiliothèque (lien entre les flakes)
- Compréhention avancé du systeme de fonctionnement du setup (ici setup.toml). Afin de pouvoir creer facilement plusieurs configurations différente (ici test pour le "simuler" en local)
- Ecoute de la conférence sur les 20ans de G5K
- Lien utile : http://www.beegfs.io/wiki/ManualInstallWalkThrough
- Lecture approfondie de stdenv ( *The Standard Environnement* ) : https://ryantm.github.io/nixpkgs/stdenv/stdenv/

## 11/05/23 :
- Il va falloir rajouter des `systemd.service` afin de pouvoir rajouter script dans le module qui vont pouvoir "auto-generer" les différents fichier nécessiare pour le fonctionnement de beegfs (comportement que j'avais oublier dans les moodules nix)
- Lecture de la partie du manuel nixos sur les activation script : **[69.2. Activation script](https://nixos.org/manual/nixos/stable/index.html#sec-activation-script)** script executer avant meme systemd qui permet de faire du "pre-script sur les programmes nix". Cet outil ne sera probablement pas utile pour le corriger le module mais il sera surement utile a un autre moment.
- Continuation de la correction du module nix afin de faire fonctionner les modules nix:
- **Seminaire** : (14h-15h30) Frank Cappello - How can we reduce data without losing science
  - Importance of data in science -> bit the more it w need to analyse it the bigger it gets
  - Creation of a lossy compression app (compression that has the change of losing some part of the information)
  - Decorelation --> Approximation --> Coding (done by Shanon already)
  - Use of predictors use both for compression and decompression that tries to approxiamte the next value to compress it
  - SZ -> compression tool (only works for float value (or cast integer) and data sets)
  - We dont know the bound of compressability for a specific data set
  - Find a way to calculate the compresse size before doing it using Black-Box Statistical predictors
  - In search for the absolute compressibility
- **TODO** : Simplfifier le module afin de ne pas garder les phases inutile (dans notre cas) de la configuration
  
## 12/05/23 :
- Correction et notamment simplification du module afin de pourvoir en comprendre le fonctionnement
- Le code est capable de creer des script de configurationde base pour le client
- Rajout de roles dans la composition nxc qui correspondent a chaque compsant nécessaire de la fabricationde volume beegfs correct
- Il faut toujours trouver un moyen d'excuter le code `beegfs-setup-<service>` pour chaque service avec les bon parametres pour cela il faudra utiliser sytemd (site : https://www.freedesktop.org/wiki/Software/systemd/) pour cela on va utiliser l'exemple de ear :
```nix
systemd.services.oar-node-register = mkIf (cfg.node.register.enable) { ## IF BON MODULE (FAIRE UN NOM POUR CHAQUE SERVICES)
  wantedBy = [ "multi-user.target" ];  ## SERVICE UTILISE PAR BEEGFS (beegfs.mgmtd notamment) 
  after = [ "network.target" "oar-user-init.service" "oar-conf-init.service" "oar-node.service" ];
  serviceConfig.Type = "oneshot";
  path = [ pkgs.hostname ];
  script = concatStringsSep "\n" [
    (optionalString cfg.node.register.add  ### CODE A FAIRE
      "/run/wrappers/bin/oarnodesetting -a -s Alive")
    (optionalString (cfg.node.register.extraCommand != "") ''
      ${cfg.node.register.extraCommand}
    '')
  ];
};
``` 
- **TODO** : relire le code du module et en comprendre le code, apprentisage avance du langague. 
```nix
# Exemple :

systemd.services = systemdHelperd //
  foldr (a: b: a // b) {}
    (map (x: systemdEntry x.service x.cfgFile) serviceList);
```
- Pour cela ne pas hésiter a demander a des doctorant et a chercher grace a `git grep <nom_fonction> =` dans le nixpkgs
- Finir le systeme d'auto generation du volume pour dans le futur pour utiliser des script python afin de pouvoir tester l'efficacité de beegfs a la manière de NFS et pour donc les comparer.

---

## Semaine 5 :

## 15/05/23 :
- Discution sur le fonctionnement intrasect de Nix et sue le fonctionnement des dépenances
- Comprehention avancé des fonctions quisont utiliser par le module (notamment MapAttrs, MapAttrs' et nameValuePair)
```nix
  /* Apply a function to each element in an attribute set, creating a new attribute set.

     Example:
       mapAttrs (name: value: name + "-" + value)
          { x = "foo"; y = "bar"; }
       => { x = "x-foo"; y = "y-bar"; }

     Type:
       mapAttrs :: (String -> Any -> Any) -> AttrSet -> AttrSet
  */
  mapAttrs = builtins.mapAttrs or
    (f: set:
      listToAttrs (map (attr: { name = attr; value = f attr set.${attr}; }) (attrNames set)));


  /* Like `mapAttrs`, but allows the name of each attribute to be
     changed in addition to the value.  The applied function should
     return both the new name and value as a `nameValuePair`.

     Example:
       mapAttrs' (name: value: nameValuePair ("foo_" + name) ("bar-" + value))
          { x = "a"; y = "b"; }
       => { foo_x = "bar-a"; foo_y = "bar-b"; }

     Type:
       mapAttrs' :: (String -> Any -> { name :: String; value :: Any; }) -> AttrSet -> AttrSet
  */
  mapAttrs' =
    # A function, given an attribute's name and value, returns a new `nameValuePair`.
    f:
    # Attribute set to map over.
    set:
    listToAttrs (map (attr: f attr set.${attr}) (attrNames set));

```
```nix
  mkOverride = priority: content:
    { _type = "override";
      inherit priority content;
    };

  mkOptionDefault = mkOverride 1500; # priority of option defaults
  mkDefault = mkOverride 1000; # used in config sections of non-user modules to set a default
  defaultOverridePriority = 100;
  mkImageMediaOverride = mkOverride 60; # image media profiles can be derived by inclusion into host config, hence needing to override host config, but do allow user to mkForce
  mkForce = mkOverride 50;
  mkVMOverride = mkOverride 10; # used by ‘nixos-rebuild build-vm’

```
```nix
  /* “right fold” a binary function `op` between successive elements of
     `list` with `nul` as the starting value, i.e.,
     `foldr op nul [x_1 x_2 ... x_n] == op x_1 (op x_2 ... (op x_n nul))`.

     Type: foldr :: (a -> b -> b) -> b -> [a] -> b

     Example:
       concat = foldr (a: b: a + b) "z"
       concat [ "a" "b" "c" ]
       => "abcz"
       # different types
       strange = foldr (int: str: toString (int + 1) + str) "a"
       strange [ 1 2 3 4 ]
       => "2345a"
  */
  foldr = op: nul: list:
    let
      len = length list;
      fold' = n:
        if n == len
        then nul
        else op (elemAt list n) (fold' (n + 1));
    in fold' 0;

```
Code trouvable dans le fichier nixpkgs/lib/attrsets.nix
- Annalyse du fonctionnement de AttrSet et de la raison de sont utilisation dans le module en cours
- Analyse du foncionnement avancé du module Nix de beegfs
- Lecture des parties nécessaire du manuel systemd pour comprendre le fonctionnement du `systemd.services.<...>` afin de pouvoirexecuter les script bash au bon moment lors du flow d'execution
- Debut de l'ajout des script de chaque module en utilisant les services systemd
- Comprenhention basique des technique de set de submodule dans nix (a ameliorer)

## 16/05/23 :
- Correction des submodules de fichier de base de beegfs et mise a jours dans la branche de nur-kapack
- Comprehention de la creation et surtout de la manipulation des submodules en nix. Ainsi que des différentes facon d'architecturer les modules en nix (listes de submodules, attributeSet de submodules...)
- Visite du datacenter de l'imag :
  - Visite et presentation du systeme de fonctionnement de ce centre
  - Presentation et visualisation des serveur de fonctionnement de grid5000
  - Visualisation et tentative de correction d'un probleme d'ordre de grandeur dans la comsomation energetique de certaines machines
- Correction du fichier module pour simplifier les fonctions d'initialisation des différents services de beegfs (en faisant une fonction d'initialisation pour chaque service et non pas un seul generique qui a des risques a cause de mauvais ordonnancement des initilisation (mgmtd doit être prioritaire a tous les autres))
- **TODO** : Finaliser le script pour faire en sorte que les volume soit effectif dès le début de la composition (vérifier comment faire un volume car un petit problème à été détecté)
- Creation de script nix de base dans des projets a part afin de pouvoir simplifier le plus possible l'utilisation de scripts  

## 17/05/23 :
- Rajout de fichier nix et flake dans des projets github personel existant afin de faciliter au maximum la creation de l'environnement pour les machines possèdant nix et ou nixos
- Comprehention des fichiers de configuration manquant pour la creation de volume beegfs (pas marqué sur le manuel beegfs) mais demandé par les binaire en pratique
- Correction de certains services pour rajouter les différents fichier de configuration en les rajoutant dirrectant à l'initialisation de certain services systemd 
- Reunion avec des membre du groupe EnOSLib pour discuter sur le fonctionnement et la potentiel utilsation de cet outils par le labo
- Discution avec les membres du laboratoire sur des outils interessant a installer afin d'augmenter la productivité (IDE, languages, extentions...)
- Visite (avec samuel cette fois) de data center de l'imag :
  - Enlever une machine qui était disfonctionnel dans le centre de donnée

## 19/05/23 
- Lecture de docuementation avancé sur le fonctionnement des modules et des library en nix
- Test des modules et librairies nix en utilisant un clone de nixpkgs 
- Correction de quelque Bug sur le module
- Remarque : il manque des systemd dans les vm de beegfs je ne sais pas si c'est ce qu'il pose problème mais c'est un comportement incohérent
- Creation du fichier composition.nix final qui devrai (quand le module sera reparer) pouvoir creer tous les nodes nécessaire pour le bon fonctionnement de beegfs cad : *mgmtd(1), storage(1,\*), meta(1), client(1,\*), helperd(0,1)*
- Meta et mgmtd sont unique et essentiel storage doit etre present au une 1 fois et client aussi. Helperd est optionel.
- J'ai donc une composition simple qui utilise comme base le fichier node.yaml
```yaml
mgmtd: 1
client: 1
meta: 1
storage: 1
```
- Ce fichier pourra être ammenner a changer au fil des besoins

---

## Semaine 6 :

## 22/05/23 :
- Verification et certification de certain problème present dans la version actuelle de beegfs
- Notamment : **Problemes** :
  - Les services correspondant au différents élement de beegfs ne sont pas present dans les fichier mais sont present dans le store (étrange)
  - Il est donc impossible de les appeller et de faire fonctionner les volumes
  - Donc essai de regarder d'ou viens le problème et ce qui devrai les activer
  - C'est une ligne mise en commentaire d'un certain systemd qui induit ce problème 
  ```nix
  systemd.services = systemdHelperd //
  foldr (a: b: a // b) {}
    (map (x: systemdEntry x.service x.cfgFile) serviceList);
  ```
  - Probleme etant que cette ligne entre en conflit avec les fichier de configuration que j'ai creer au dessus
  - Il faut donc trouver un moyen d'executer quand meme ces commande mais elles sont différentes en fonction du service.
- Test de creation de volume manuellement afin de verifier qu'il ne manque pas de fichier en plus qu'il faudrai rajouter
- Mise en commentaire des rajout de systemd que j'ai realiser pour essayer de la "concatener" avec ce qui a deja été fait avant (Poblème d'ordre, surement)
- Verification du lancement sur plusieur "flavour" afin de s'assurer que le code est toujours efficace sur les différents deploiement possible

## 23/05/23 :

## 24/05/23 :

## 25/05/23 :

## 26/05/23 :

---

## Semaine 7 :

## 30/05/23 :

## 31/05/23 :

## 01/06/23 :

## 02/06/23 :

---

## Semaine 8 :
