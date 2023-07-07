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
  - [Semaine 9 :](#semaine-9-)
  - [Semaine 10 :](#semaine-10-)
  - [Semaine 11 :](#semaine-11-)
  - [Semaine 12 :](#semaine-12-)
  - [Semaine 13 :](#semaine-13-)
  - [Semaine 14 :](#semaine-14-)
  - [Semaine 15 :](#semaine-15-)

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
- Modification du flake afin de pouvoir directement recupere les Full commandes de nxc directtement depuis la composition beegfs
- Discution avec Quentin sur les fichier de configurations de beegfs et comment pouvoir les recuperer et les modifier directement.
- Donc modification de la creation des services beegfs afin qu'il utilse les fichiers de configurations de /etc/beegfs qui sont modifier et non pas les ficheir present dans le store qui sont incomplets et immutables.
```nix
systemdEntry = service: cfgFile: (mapAttrs' ( name: cfg:
  (nameValuePair "beegfs-${service}-${name}" (mkIf cfg.${service}.enable {
  wantedBy = [ "multi-user.target" ];
  requires = [ "network-online.target" ];
  after = [ "network-online.target" ];
  serviceConfig = rec {
    # pkgs.beegfs n'existe pas
    # On tente des technologies ici
    # ${pkgs.beegfs}/bin/beegfs-${service} \
    ExecStart = ''
        ${pkgs.nur.repos.kapack.beegfs}/bin/beegfs-${service} \
        cfgFile="/etc/beegfs/beegfs-${service}.conf" \
        pidFile="${PIDFile}"
    '';
    PIDFile = "/run/beegfs-${service}-${name}.pid";
    TimeoutStopSec = "300";
  };
```
- Ajout d'un formatage automatique sur les fichier nix en utilsant nixpkgs-fmt et en le reliant a l'EDI (ici vscode)
- Lancement reussi du service de management mgmtd
- *TODO* : Finir un script (en utilisant systemd) pour lancer le service automatiquement 

## 24/05/23 :
- Creation de script capable de faire toutes les initilisation nécessaire pour la creation des fichier s de configuration et leur bonne modification (il faut juste lancer la commande finale a revoir)
- Le service mgmtd est fonctionnel, storage aussi et le lien entre les deux s'effectue correctement
- Cependant il y a un problème avec le serveur de metadonnée (dernier service manquant)
```bash
MGMTD -> SUCCESS
==============================================================================
(0) May24 11:45:56 Main [StoragePoolStore.cpp:565] >> Could not open storage pool mappings file. storePath: storagePools; sysErr: No such file or directory (2)
(0) May24 11:45:56 Main [MgmtdTargetStateStore.cpp:448] >> Could not read states. NodeType: beegfs-storage; Error: Path does not exist
(0) May24 11:45:56 Main [MgmtdTargetStateStore.cpp:448] >> Could not read states. NodeType: beegfs-meta; Error: Path does not exist
(1) May24 11:45:56 Main [App] >> Version: 23.5-git9
(2) May24 11:45:56 Main [App] >> LocalNode: beegfs-mgmtd mgmt1 [ID: 1]
(2) May24 11:45:56 Main [App] >> Usable NICs: eth1(TCP) eth1(TCP) eth0(TCP) 
==============================================================================
MGMTD -> STORAGE INITIALIZED (LINE ADDED) -> SUCCESS
==============================================================================
(2) May24 11:56:05 DGramLis [Node registration] >> New node: beegfs-storage sto1 [ID: 99]; Ver: 23.5-9; Source: 192.168.1.4
(2) May24 11:56:06 XNodeSync [Assign target to capacity pool] >> Storage target capacity pool assignment updated. NodeID: 99; TargetID: 399; Pool: Emergency;  Reason: No capacity report received.
(2) May24 11:56:08 Worker1 [Change consistency states] >> Storage target is coming online. ID: 399
==============================================================================
```
STORAGE
```bash
STORAGE -> SUCCESS
==============================================================================
(3) May24 11:56:05 Main [RegDGramLis] >> Listening for UDP datagrams: Port 8003                                        
(1) May24 11:56:05 Main [App] >> Waiting for beegfs-mgmtd@mgmt1:8008...                                                
(2) May24 11:56:05 RegDGramLis [Heartbeat incoming] >> New node: beegfs-mgmtd mgmt1 [ID: 1];                           
(3) May24 11:56:05 Main [NodeConn (acquire stream)] >> Connected: beegfs-mgmtd@192.168.1.3:8008 (protocol: TCP)        
(1) May24 11:56:05 Main [App] >> Version: 23.5-git9                                                                    
(2) May24 11:56:05 Main [App] >> LocalNode: beegfs-storage sto1 [ID: 99]                                               
(2) May24 11:56:05 Main [App] >> Usable NICs: eth1(TCP) eth1(TCP) eth0(TCP)                                            
(2) May24 11:56:05 Main [App] >> Storage targets: 1                                                                    
(3) May24 11:56:05 Main [RegDGramLis] >> Listening for UDP datagrams: Port 8003                                        
(2) May24 11:56:05 Main [Register node] >> Node registration successful.                                               
(2) May24 11:56:05 Main [InternodeSyncer.cpp:618] >> Storage targets registration successful.                          
(3) May24 11:56:05 Main [App] >> Registration and management info download complete.                                   
(3) May24 11:56:05 Main [DGramLis] >> Listening for UDP datagrams: Port 8003                                           
(3) May24 11:56:05 Main [ConnAccept] >> Listening for TCP connections: Port 8003                          
(3) May24 11:56:05 Main [App] >> 0 sessions restored.
==============================================================================
```

Metadonnée
```bash
METADATA -> FAIL
==============================================================================
(3) May24 11:46:37 Main [App.cpp:656] >> Limiting number of xattrs per inode.
(1) May24 11:46:37 Main [App] >> This appears to be a new storage directory. Creating a new root dir.
(0) May24 11:46:37 Main [Directory (store initial metadata file)] >> Unable to store directory xattr metadata: inodes/38/51/root. Did you enable extended attributes (user_xattr) on the underlying file system?
(0) May24 11:46:37 Main [App] >> Failed to store root directory. Unable to proceed.
(0) May24 11:46:37 Main [App] >> Failed to store root directory
==============================================================================

TENTATIVE ->
[root@meta1:/]# sudo tune2fs -o user_xattr /dev/vdb
tune2fs 1.46.5 (30-Dec-2021)
tune2fs: No such file or directory while trying to open /dev/vdb
Couldnt find valid filesystem superblock.

[root@meta1:/]# mount | grep root
overlay on /nix/store type overlay (rw,relatime,lowerdir=/mnt-root/nix/.ro-store,upperdir=/mnt-root/nix/.rw-store/store,workdir=/mnt-root/nix/.rw-store/work)
overlay on /nix/store type overlay (ro,relatime,lowerdir=/mnt-root/nix/.ro-store,upperdir=/mnt-root/nix/.rw-store/store,workdir=/mnt-root/nix/.rw-store/work)

DANS LA COMPOSITION ->
boot.initrd.postDeviceCommands = ''
${pkgs.e2fsprogs}/bin/mkfs.ext4 -L data /dev/vdb
```

## 25/05/23 :
- Réorganisation du git et de l'architecture de ma machine afin de facilité l'efficacité de travail
- Il n'est pas possible dans le flavour vm de faire fonctionner le service de metadonnée dans l'état actuel des choses car il n'y a pas de disque physique. Afin de pouvoir faire fonctionner le service il faut l'attribut user_xattr, or comme tous est en ROM il utilise un tmpfs (temporary file system) qui est imcompatible avec user_xattr. Il faut donc rajouter un disque sur les vm pour que cela devienne possible.
- Utilisation de rsync (https://www.grid5000.fr/w/SSH) afin de pouvoir faire le liens du projet beegfs jusqu'a g5k.
- Deploiement de beegfs dans g5k avec la flavour g5k-nfs-store et regard des différent disque potentiellement utilisable.
```
/dev/sda
├──/dev/sda1 -> 3.7G -> swap
├──/dev/sda2 -> 28.9G -> fs
├──/dev/sda3 -> 31.7G -> fs
├──/dev/sda4 -> 953M -> fs 
├──/dev/sda5 -> 158.4G -> fs
/dev/sdb
```
Ce sont les disk present quand on fait lsblk.

On pourra utiliser en regardant dans **/dev/disk/** by-partlabel

-> On trouve a l'intérieur un fichier nomé **KDPL_TMP_disk0** qu'on pourrai (je croie) utiliser.

- Installation et customization de zsh afin de facilité le deplacement dans le PC (grace a oh my zsh) et ce de manière pur en utilisant les mettant dans la configuration.nix
- Commencement de l'utilisation des flake pour la configuration nix `nixos-rebuild switch --flake .#<TODO>`
- Rajouter home manager pour facilité le deploiement sur différentes machines
- Installation et customization de ranger pour les mêmes raisons
- Avec g5k il sera tout a fait possible (après avoir compris quel disque utilisé) de creer un nouveau fs avec les extra attributes activés, de faire une copie, de mount et de l'utiliser dans le storeDir du service metadata.

## 26/05/23 :
## **FONCTIONNEMENT DE BBEGFS**
- Lancement de la composition nixos-compose dans g5k afin de pouvoir potentiellement faire fonctionner le serveur de metadonnées.
- Etude et Comprehention du fonctionnement des disks et file systems en géneral et dans g5k (principe exactement similaire)
- En faisant ls -al dans le dossier /dev/disk/by-partlabel/ on remaque que  **KDPL_TMP_disk0** est relier a sda5 c'est donc ce file system que nous allons utiliser pour stocker les données du service de meta données
- En faisant la commande `dd if=/dev/zero of=/dev/sda5 bs=1M` on s'assure de vider complement le fs (pas necessaire sachant qu'on va le "supprmier" après mais cela evite des warning)
- On initialise ensuite le filesystem (si il a été vidé) dans le format ext4 avec la commande `mkfs.ext4 /dev/sda5`
- On monte ensuite le file system au reperttoire voulu en oubliant pas d'activer user_xattr (l'option que l''on voulai depuis le debut) avce la commande `mount -o user_xattr /dev/sda5 <store directory>`
- On lance finalement le setup du serveur de metadonnée avec la commande ` beegfs-setup-meta -p <store directory> -s 66 -m <name of the managment server>`
- On peux enfin lancer le service avec la commande `beegfs-meta cfgFile=/etc/beegfs/beegfs-meta.conf pidFile=/run/beegfs-meta-default.pid` 

- Fichier de log
```bash
MGMTD

(0) May26 12:36:54 Main [StoragePoolStore.cpp:565] >> Could not open storage pool mappings file. storePath: storagePools; sysErr: No such file or directory (2)
(0) May26 12:36:54 Main [MgmtdTargetStateStore.cpp:448] >> Could not read states. NodeType: beegfs-storage; Error: Path does not exist
(0) May26 12:36:54 Main [MgmtdTargetStateStore.cpp:448] >> Could not read states. NodeType: beegfs-meta; Error: Path does not exist
(1) May26 12:36:54 Main [App] >> Version: 23.5-git25
(2) May26 12:36:54 Main [App] >> LocalNode: beegfs-mgmtd mgmt1 [ID: 1]
(2) May26 12:36:54 Main [App] >> Usable NICs: enp24s0f0(TCP) 
>> STORAGE
(2) May26 12:38:09 DGramLis [Node registration] >> New node: beegfs-storage sto1 [ID: 99]; Ver: 23.5-25; Source: 172.16.20.5
(2) May26 12:38:12 DirectWorker1 [Change consistency states] >> Storage target is coming online. ID: 399
>> META
(1) May26 13:06:44 DGramLis [HBeatMgr] >> New root directory metadata node: beegfs-meta meta1 [ID: 66]
(2) May26 13:06:44 DGramLis [Node registration] >> New node: beegfs-meta meta1 [ID: 66]; Ver: 23.5-25; Source: 172.16.20.31
(2) May26 13:06:47 Worker4 [Change consistency states] >> Metadata node is coming online. ID: 66
```

```bash
META

(1) May26 13:06:44 Main [App] >> This appears to be a new storage directory. Creating a new root dir.
(3) May26 13:06:44 Main [RegDGramLis] >> Listening for UDP datagrams: Port 8005
(1) May26 13:06:44 Main [App] >> Waiting for beegfs-mgmtd@mgmt1:8008...
(2) May26 13:06:44 RegDGramLis [Heartbeat incoming] >> New node: beegfs-mgmtd mgmt1 [ID: 1]
(3) May26 13:06:44 Main [RegDGramLis] >> Listening for UDP datagrams: Port 8005
(2) May26 13:06:44 Main [Register node] >> Node registration successful.
(3) May26 13:06:44 Main [NodeConn (acquire stream)] >> Connected: beegfs-mgmtd@172.16.20.4:8008 (protocol: TCP)
(1) May26 13:06:44 Main [InternodeSyncer.cpp:673] >> Root node ID (from sync results): 66
(2) May26 13:06:44 Main [printSyncResults] >> Nodes added (sync results): 1 (Type: beegfs-storage)
(3) May26 13:06:44 Main [App] >> Registration and management info download complete.
(3) May26 13:06:44 Main [DGramLis] >> Listening for UDP datagrams: Port 8005
(3) May26 13:06:44 Main [ConnAccept] >> Listening for TCP connections: Port 8005
(1) May26 13:06:44 Main [App] >> Version: 23.5-git25
(2) May26 13:06:44 Main [App] >> LocalNode: beegfs-meta meta1 [ID: 66]
(2) May26 13:06:44 Main [App] >> Usable NICs: enp24s0f0(TCP)
```
- Ensuite il ne manque plus qu'a monter le client sur le serveur mgmtd et le file system est fonctionel
---

## Semaine 7 :

## 30/05/23 :
- **REUNION** :
  - Declaration des attentes quant au fonctionnement de beegfs
  - Recherche du module kernel de beegfs avant sa supreesion de nixpkgs
  - Il faut finaliser le module kernel du client dans la semaine pour pouvoir ensuite passer au projet regale
  - Documentaion du code + Suppression des elements inutiles
- Listes des essaies de fonctionnement d'implementation du module kernel :

```bash
extraModulePackages = [ "${pkgs.nur.repos.kapack.modules.beegfs_kenel}" ];

error: builder for '/nix/store/riaxj3gp92f7w69bsiyzg6pn6f6b79sc-kernel-modules.drv' failed with exit code 2;
       last 1 log lines:
       > error: The store path /nix/store/67l671b9j448k8f6y2gq749cg5dkdzhc-beegfs_ker.nix is a file and can't be merged into an environment using pkgs.buildEnv! at /nix/store/yznq148yxflnvvafmdljbxf689vzrf7q-builder.pl line 122.
       For full logs, run 'nix log /nix/store/riaxj3gp92f7w69bsiyzg6pn6f6b79sc-kernel-modules.drv'.
error: 1 dependencies of derivation '/nix/store/w3pkapmsjs41d60zb6qjwwmxi1rvk3yp-nixos-system-unnamed-22.11pre-git.drv' failed to build
error: 1 dependencies of derivation '/nix/store/07dcnd09a9r26mgs44mnil4nnq8a5s3n-closure-info.drv' failed to build
error: 1 dependencies of derivation '/nix/store/vs73ajh8h7m3is2p4407d14gl3m2rk4r-compose-info.json.drv' failed to build

==========================================================================================================================

extraModulePackages = [ pkgs.nur.repos.kapack.modules.beegfs_kenel ];

error: A definition for option `boot.extraModulePackages."[definition 1-entry 1]"' is not of type `package'. Definition values:
       - In `/nix/store/clh33vqcg869sjgansaxm2kg3f2imf3x-source/modules/services/beegfs_mod.nix': /nix/store/clh33vqcg869sjgansaxm2kg3f2imf3x-source/modules/services/beegfs_ker.nix
(use '--show-trace' to show detailed location information)'
Error: Build return code: 1

==========================================================================================================================

extraModulePackages = with config.boot.kernelPackages; [ pkgs.nur.repos.kapack.modules.beegfs_kenel ]; # NUR

SAME

==========================================================================================================================

extraModulePackages = [ pkgs.nur.repos.kapack.beegfs_kernel ]; # NUR 

MISE DANS PKGS ET PAS DANS MODULE COMME C''ETAIT DEJA A LA BASE

error: Function called without required argument "kernel" at /nix/store/1bjxspddgmyll5902ia02apmjms7kva8-source/pkgs/beegfs/beegfs_ker.nix:3, did you mean "fennel"?
(use '--show-trace' to show detailed location information)

==========================================================================================================================

extraModulePackages = with config.boot.kernelPackages; [ pkgs.nur.repos.kapack.beegfs_kernel ]; # NUR

error: syntax error, unexpected '}'

       at /nix/store/8rbvwv7j261cb2wrv8a379ipjkhgw7cv-source/nur.nix:45:82:

           44|   beegfs = pkgs.callPackage ./pkgs/beegfs { };
           45|   beegfs_kernel = pkgs.callPackage ./pkgs/beegfs/beegfs_ker.nix { inherit kernel };
             |                                                                                  ^
           46|
(use '--show-trace' to show detailed location information)

==========================================================================================================================

beegfs_kernel = kernel:
    pkgs.callPackage ./pkgs/beegfs/beegfs_ker.nix {inherit kernel};

extraModulePackages = [ pkgs.nur.repos.kapack.beegfs_kernel config.boot.kernelPackages ]; # NUR

error: A definition for option `boot.extraModulePackages."[definition 1-entry 1]"' is not of type `package'. Definition values:
       - In `/nix/store/rhr1qmcxrv2ndg47yfwsxysvhm7bmr46-source/modules/services/beegfs_mod.nix': <function>
(use '--show-trace' to show detailed location information)'

==========================================================================================================================

extraModulePackages = [ "${pkgs.nur.repos.kapack.beegfs_kernel boot.config.kernelPackages}" ]; # NUR

error: attribute 'lib' missing

       at /nix/store/4dm8ws0sg7blxshcd3aqkwkjvmykknfz-source/pkgs/beegfs/beegfs_ker.nix:39:15:

           38|
           39|   meta = with stdenv.lib; {
             |               ^
           40|     description = "High performance distributed filesystem with RDMA support";
(use '--show-trace' to show detailed location information)



==========================================================================================================================

(MISE EN COMMENTAIRE DE LA VAR meta)

error: undefined variable 'boot'

       at /nix/store/n81231yl0h0l6jck23gzb6yqjr5dl1c8-source/modules/services/beegfs_mod.nix:361:72:

          360|         kernelModules = [ "beegfs" ]; ## FIXME ??
          361|         extraModulePackages = [ "${pkgs.nur.repos.kapack.beegfs_kernel boot.config.kernelPackages}" ]; # NUR
             |                                                                        ^
          362|       };
(use '--show-trace' to show detailed location information)

==========================================================================================================================

extraModulePackages = [ "${pkgs.nur.repos.kapack.beegfs_kernel pkgs.linuxPackages.kernel}" ]; # NUR

error: builder for '/nix/store/frcbv0qhf3j4y203256v7aq094fhs43q-beegfs-module-7.3-5.15.80.drv' failed with exit code 2;
       last 10 log lines:
       > mkdir: cannot create directory '.tmp_1139': Permission denied
       > mkdir: cannot create directory '.tmp_1141': Permission denied
       > mkdir: cannot create directory '.tmp_1143': Permission denied
       > ln: failed to create symbolic link 'source': Permission denied
       > make[2]: *** [/nix/store/kcarlxzyvjv9ny81spv6szc7vzkg2816-linux-5.15.80-dev/lib/modules/5.15.80/source/Makefile:574: outputmakefile] Error 1
       > make[1]: *** [/nix/store/kcarlxzyvjv9ny81spv6szc7vzkg2816-linux-5.15.80-dev/lib/modules/5.15.80/source/Makefile:739: include/config/auto.conf.cmd] Error 2
       > make[1]: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/autoconf.h'
       > make[1]: unlink: include/generated/autoconf.h: Permission denied
       > make[1]: Leaving directory '/nix/store/kcarlxzyvjv9ny81spv6szc7vzkg2816-linux-5.15.80-dev/lib/modules/5.15.80/build'
       > make: *** [Makefile:143: module] Error 2
       For full logs, run 'nix log /nix/store/frcbv0qhf3j4y203256v7aq094fhs43q-beegfs-module-7.3-5.15.80.drv'.
error: 1 dependencies of derivation '/nix/store/nmp3qz15ajczyscy0yzflmmbzw98xvrl-kernel-modules.drv' failed to build
error: 1 dependencies of derivation '/nix/store/ljhxkkz74jvk0rn3751scpi1y2hjd0sq-linux-5.15.80-modules.drv' failed to build
error: 1 dependencies of derivation '/nix/store/s2yn2v4f6i0kr8y8whrl47jqgmm7qhcx-nixos-system-unnamed-22.11pre-git.drv' failed to build
error: 1 dependencies of derivation '/nix/store/8niilj6l0v1h36zmc1lg1cn70mqd8x42-closure-info.drv' failed to build
error: 1 dependencies of derivation '/nix/store/3di86jizyhb0frr87fagldwkiqzzi2j1-compose-info.json.drv' failed to build
Error: Build return code: 1
```
Le module kernel n'est en lien mais il semble y avoir des problème de permission dans le projet.

## 31/05/23 :
- Session de code avec Monsieur Richard pour essayer de faire fonctionner le module kernel de beegfs
- Deploiement ou Unpack du projet beegfs afin de pouvoir analyser les différentes chaines de compilations du module kernel de beegfs
- Facilitation du lien entre le module et le module kernel en ecrivant de toute piece le dossier voulu
- Analyse complete du Makefile du module client afin d'essayer d'en comprendre le fonctionnement et d'ou viens le problème
- Rajout de différent flag pour le makefile afin d'essayer de faire compiler le driver : 
```bash
"KERNELRELEASE=${kernel.modDirVersion}"
"KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/"

"KSRCDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/source/" ## WO -> PERMISSION DENIED || /source
"YOP=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
"INSTALL_MOD_PATH=$(out)"
"RELEASE_PATH=$(out)" 
```
- Modification du Makefile afin de copier les document dans un repertoire qui n'est pas sécurisé (/nix/store) et doonc de pour faire les modification nécessaire
- On se retrouve avec des problèmes de configuration kernel (aka Kconfig)
- Apres verification il semble manquer un fichier lors du cp, un certain fichier nommé **.config** qui stoke la configuration kernel du systeme
- Tentative de hack en creant un fichier .config avant la manipulation
- Il semble anormal de tombé dans le cas du Kconfig car la compilation du kernel linux n'a pas besoin d'etre refaite pour le module il semble donc y avoir un problème

## 01/06/23 :
- Modification du fichier afin d'isoler directement la compilation du driver (module kernel) du client 
- Site de Beegfs etait down la matiné donc je n'ai pas pu faire tous les test possible -> j'ai donc utilisé la version de beegfs que je possèdait en mémoire (7.3)
- Test de fonctionnement de l'isolation du driver en utilisant un module kernel d'une version antérieur 4.19, 4.14, 4.9...
- Site de beegfs est revenue
- Test de fonctionnemet dans les conditions de fonctionemant dans nixpkgs. En reprenant un commit de nixpkgs et la version utilsé a l'époque. Il semble y avoir un problème de taille quand on essaye d'utiliser la version 7.3 de beegfs : 
- **Erreur** :
```
error: builder for '/nix/store/k9cjkpx0m18m8v98zdfwcxlq1ydwv550-beegfs-module-7.3-5.15.107.drv' failed with exit code 1;
    last 10 log lines:
    > ./meta/build/dist/etc/init.d/beegfs-meta.init: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > ./meta/build/dist/sbin/beegfs-setup-meta: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > ./storage/build/make-deb: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > ./storage/build/make-rpm: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > ./storage/build/dist/etc/init.d/beegfs-storage.init: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > ./storage/build/dist/sbin/beegfs-setup-storage: interpreter directive changed from "#!/bin/bash" to "/nix/store/cdfwlj71yd6p5bmxsk2gk9xqc0friykg-bash-5.1-p16/bin/bash"
    > configuring
    > no configure script, doing nothing
    > building
    > /nix/store/ifiygfv17dzpbssxwrld6a57iclzrb09-stdenv-linux/setup: line 87: cd: beegfs_client_module/build: No such file or directory
    For full logs, run 'nix log /nix/store/k9cjkpx0m18m8v98zdfwcxlq1ydwv550-beegfs-module-7.3-5.15.107.drv'.
```
Ce problème survient systematiquement indépendamment de la version du kernel : Les tests on été fait avec les version 4.9, 4.14, 4.19, 5.18
- **SEMINAIRE** Difference and convergence of HPC and Cloud by Dan Milroy:
  - Renand Law (the power needed decrease as the transistor size decreses) and Moore's Law (Number of transistor double every 2 year) has ended.
  - Since then, Complexity of computing has skyrocketed
  - OpenAI number flop need has also skyrocketed
  - Now there is a "war" between Kuberneted (one if not the most successful open source project) for Cloud and Flux for instance for HPC but both of those options has flaws than can be corrected by the other assets. So why not try to use them both ??
  - Hard but doable -> good for bootstrap but scheduling problem
  - MPI jobs are not perfect and are to be perfected in the future
- Utilisation du kernel 4.14 avec beefgfs 7.3 et garde la configuration initiliale (pas de modification dans Makefile pour que ça compile)
- Ajout de la nouvelle version du kernel dans la composition pour que tous les services utilise cette version. (Client compile correctement)
- **TODO** : Verfier le bon fonctionnement des autres services malgré le changement 

## 02/06/23 :
- Test de fonctionnement des difféerents services en utilisant une version du kernel qui est antérieur
- Il semble avoir un probleme dans cet aspect, quand on essai de faire cette manipulation, cela semble empacher un certain service seentiel de ce lancer et rend donc l'outils inutilisable
- Test de fonctionnement dans le cas le plus simple possible (une composition classique trouvable dans le dossier exemple/kernel de nixos-compose)
- Il semble avoir quelques problèmes qui deviendont surement des issues github dans le future
  - Il y a un problème sur le fonctionnement des options quand on possède une composition multiple. En effet il faut absoluement faire : `-c <nom>::<flavour>` mais lors de ce cas -f ne fait rien du tout seul l'option -c est important. Il serai plus ergonomique de faire en sorte que cela marche de cette façon : `-c <nom> -f <flavour>`.
  - Il ne semble pas possible dans la flavour vm de modifier la version du kernel sans causé le crash d'un service essentiel au fonctionnement de l'outils nixos-compose. Le soucis ne semble pas occurir en utilisant d'autre flavour comme celle de grid5000 par exemple.
- Test de fonctionnement dans l'environnement grid500. Cela semble marcher très correctement. Pas de problème rencontré pendant les quelques phases de tests.
- Reecriture et supression des passage inutiles dans les fichier de beegfs. Ecriture de docuementation afin de facilité la comprehention du code pour les prochains utilisateurs.
- Clonage du projet Regale 
- Analyse du projet Regale et lecture des différents ressouces sur le Sujet. (ainsi que quelque question posé a Adrien qui maintient actuellement le projet)
- Test de fonctionnement simple de Regale 

---

## Semaine 8 :

## 05/06/23 :
- Test de fonctionnement de regale (en utilisant grid5000)
- Verification u bon fonctionnemement de beegfs das grid5000
- Problème de lancement du module kernel (driver) : `modprobe beegfs` ne marche pas car il utilse toujours le module kernel 5.15.80 alors que la version a été changer au boot de la composition.
- En faisant `uname -r` on obtient 5.15.80. Il ne prend donc pas par defaut la bonne version
- Le module creé se trouve dans le dossier `/home/alithaud/.local/share/nix/root/nix/store/1yjyi8jxb464kxbl9mang5ky55dij8ym-beegfs-module-7.3-4.14.300/lib/module/4.14.300/extras/fs/beegfs/beegfs.ko`
- On peux assayer de resoudre ce problème avec les options de modprobe
  - `-d /home/alithaud/.local/share/nix/root/nix/store/1yjyi8jxb464kxbl9mang5ky55dij8ym-beegfs-module-7.3-4.14.300` permet de remplacer le dossier de base par celui donnée en parametre
  - `-S ou --set-version=4.14.300` permet de remplcer le uname -r par default par la vresion donnée en parametre
  - Cependant même dans cette configuration on se retrouve avec un erreur :
  ```
  modprobe: FATAL: Module beegfs not found in directory /home/alithaud/.local/share/nix/root/nix/store/1yjyi8jxb464kxbl9mang5ky55dij8ym-beegfs-module-7.3-4.14.300/lib/modules/4.14.300/
  ```
  - Ce soucie viens probablement du fait qu'il n'y ai pas tous les lien symbolique dans le dossier creé par notre fichier du module kernel
- Regard de quelque liens sur internet et issues git en tout genre pour essayre de trouver un moyen de lancer le module directement
- Test de deploiement de l'application avec beegfs (pour voir si c'est un problème de nxc)
- Test de deploiement en utilisant kadeploy.
  - Commande : `nxc build -f g5k-image` on genere beegfs en mode kadeploy
  - Commande : `export $(oarsub -l nodes=4,walltime=1:0:0 "$(nxc helper g5k_script) 1h" -t deploy | grep OAR_JOB_ID)` afin de demander les nodes au service grid5000, il fait faire -t deploy pour faire fonctionner kadeploy
  - Commande : `oarstat -u -J | jq --raw-output "to_entries | .[0].value.assigned_network_address | .[]" > machines` pour recuperer les nodes que g5k nous as donnés
  - Commande : `nxc start -m machine node.yaml` pour lancer la composition sur les noeud modifié.
- Avec kadeploy on a le même resultat cela est donc surement due a NixOs-Compose.

## 06/06/23 :
- Test de fonctionnement de regale et test des vresion supéreieur.
- Test de fonctionnement de regale en utilisant un commit antérieur de nur kappack
- Test de deploiement de multiple applications à partir d'un nur local
- Questionnement sur le fonctionnement de nixpks
- Questionnement sur le fonctionnement des overlays nix
- Test de fonctionnement de plusieurs overlays nix
- Question sur le fonctionnement de oar a Adrien
- Creation d'une configuration home manager pour la machine

## 07/06/23 :
- Mise a jour du repo regale pour utiliser la version 22.11 de nix ou lieu de la version 22.05
- Test de mise a jour en utilisant la nouvelle version de nix 23.05
  - Lors de ce test il y a un soucis avec poetry sur oar
  ```
    trace: warning: The option `services.openssh.permitRootLogin' defined in `/nix/store/cifg2pk34y6b3r54gak2qarw73c6wgrc-source/nix/flavours/shared/installation-device.nix' has been renamed to `services.openssh.settings.PermitRootLogin'.
  trace: warning: The option `services.openssh.permitRootLogin' defined in `/nix/store/cifg2pk34y6b3r54gak2qarw73c6wgrc-source/nix/flavours/shared/installation-device.nix' has been renamed to `services.openssh.settings.PermitRootLogin'.
  trace: warning: The option `services.openssh.permitRootLogin' defined in `/nix/store/cifg2pk34y6b3r54gak2qarw73c6wgrc-source/nix/flavours/shared/installation-device.nix' has been renamed to `services.openssh.settings.PermitRootLogin'.
  trace: warning: The option `services.openssh.permitRootLogin' defined in `/nix/store/cifg2pk34y6b3r54gak2qarw73c6wgrc-source/nix/flavours/shared/installation-device.nix' has been renamed to `services.openssh.settings.PermitRootLogin'.
  error: builder for '/nix/store/vhm9g9npqgbm6d1rng9g8c4ca6498rw6-python3.10-oar-3.0.0.drv' failed with exit code 2;
        last 10 log lines:
        >   File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
        >   File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
        >   File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
        >   File "<frozen importlib._bootstrap_external>", line 883, in exec_module
        >   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
        >   File "/nix/store/kn15n62v6g10yk2ka3q5qbq8dp0syq77-python3.10-poetry-1.4.2/lib/python3.10/site-packages/poetry/masonry/api.py", line 3, in <module>
        >     from poetry.core.masonry.api import build_sdist
        > ModuleNotFoundError: No module named 'poetry.core'
        > 
        > 
        For full logs, run 'nix log /nix/store/vhm9g9npqgbm6d1rng9g8c4ca6498rw6-python3.10-oar-3.0.0.drv'.
  error: 1 dependencies of derivation '/nix/store/d71qj1k984kzf2n6vdhnhwhvnh8igxwn-python3-3.10.11-env.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/gd58w400h70qc6jvz4yxv64nx71fnzv2-add_resources.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/wzsh49b83ryxdpkgxax9jfilcgwp0d1d-unit-oar-db-init.service.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/0n1rklwb9aw4c6bkkhsxq7f0d912zv5b-system-units.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/c04bvmw9mpprmkw9bw3p7k02bdhadm5j-etc.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/mf80yhmqgaj0hkprjbxy1qxd79adx6di-nixos-system-unnamed-23.05pre-git.drv' failed to build
  error: 1 dependencies of derivation '/nix/store/031hyzk9a8v77y66i1i3k65f8wnlz09s-closure-info.drv' failed to build
  error (ignored): error: cannot unlink '/tmp/nix-build-NPB-3.4.2.drv-1': Directory not empty
  error (ignored): error: cannot unlink '/tmp/nix-build-maturin-0.14.17.drv-2/maturin-0.14.17-vendor.tar.gz/winapi-x86_64-pc-windows-gnu/lib': Directory not empty
  error: 1 dependencies of derivation '/nix/store/3k0ysyg20ayim7xmipjcczji6qaqcwya-compose-info.json.drv' failed to build
  ```
  - Ce preoblème vien apparement du module poetry.core qui a été modifier lors de la derniere majeur de poetry (1.1.0). Elle change le module en namespace module ce qui change la facon de l'importer dans Python 3.10.
- On va donc garder la version 22.11 de oar.
- Utilisation de la branche regale-2211 de nur kapack créer par adrien qui tien a jour oar et permet donc d'avoir une chaine de compilation utilant uniquement 22.11.
- **OBJECTIF :**
  - Faire en sorte que chaque depot de regale utilise la version 22.11 ou plus (bdpo, bdpo-oar, bebida, ear, ear, oar, examon, melissa-oar-ear, melissa-oar, oar).
  - Verifier leur bon fonctionnement grace au test disponible ou en faire (les tests sont ceux des composition.nix -> testScript) qui sont utilisé la CI gitlab.
  - pour ce faire on peux utiliser la commande `nxc driver -t` afin de lancer le testScript efficacement. (Prendre exemple sur la CI gitlab yaml)    

## 08/06/23 :
- Lancement de test de fonctionnement pour OAR avec la commande `nxc driver -t`
- Pour pouvoir tester le fonctionnement il faut avoir fait `nxc start` au préalable
- Echec de lancement du test :
```
Platform detection:
      no particular platform detected, local mode will be used
run the test script
additionally exposed symbols:
    frontend, node1, node2, server,
    ,
    start_all, test_script, machines, driver, log, os, subtest, run_tests, join_all, retry, serial_stdout_off, serial_stdout_on, Machine
frontend: must succeed: echo "mpirun --hostfile \$OAR_NODEFILE -mca pls_rsh_agent oarsh -mca btl tcp,self cg.C.mpi" > /users/user1/test.sh
(finished: must succeed: echo "mpirun --hostfile \$OAR_NODEFILE -mca pls_rsh_agent oarsh -mca btl tcp,self cg.C.mpi" > /users/user1/test.sh, in 0.67 seconds)
frontend: must succeed: chmod 755 /users/user1/test.sh && chown user1 /users/user1/test.sh
(finished: must succeed: chmod 755 /users/user1/test.sh && chown user1 /users/user1/test.sh, in 0.45 seconds)
frontend: must succeed: su - user1 -c "cd && oarsub -l nodes=2 ./test.sh"
frontend: output: 
Error: command `su - user1 -c "cd && oarsub -l nodes=2 ./test.sh"` failed (exit code 1)
```
- Upgrade de melissa-ear-oar de 22.05 à 22.11.
- Manque de droit pour acceder a un outils de ear ou melissa :
```
warning: Git tree '/home/alex/dev/regale-nixos-compose' is dirty
evaluating derivation 'git+file:///home/alex/dev/regale-nixos-compose?dir=melissa-ear-oar#packages.x86_64-linux.composition::vm'remote: 
remote: ========================================================================
remote: 
remote: The project you were looking for could not be found or you don't have permission to view it.
remote: 
remote: ========================================================================
remote: 
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
warning: could not read HEAD ref from repo at 'ssh://git@gricad-gitlab.univ-grenoble-alpes.fr/regale/tools/ExaMon_Server.git', using 'master'
fetching Git repository 'ssh://git@gricad-gitlab.univ-grenoble-alpes.fr/regale/tools/ExaMon_Server.git'remote: 
remote: ========================================================================
remote: 
remote: The project you were looking for could not be found or you don't have permission to view it.
remote: 
remote: ========================================================================
remote: 
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
error: program 'git' failed with exit code 128
``` 
- Continuation du rapport d'avancement du stage

## 09/06/23 :
- Finition et envoie du rapport d'avancement **[[LIEN](./FILES/REPORT.pdf)]**
- Un problème sur oar est sur venue : (il ne marche plus maintenant)
- Tentative de correction du problème, changement de branche et test simple en divisant le problème
- Test de reproductivité du problème avec Monsieur Richard
- Tentative de correction.
- Erreur sur les hash son survenue sur un hash qui n'est présent dans aucun .lock ou fichier connue
- Le problème viens en fait d'un code ajouter par Adriend qui permet de refaire fojnctionner l'API de OAR.
- le code rajouté override une partie des attributs et rentre en collision avec le pricipe d'override de NXC.
- Entrainant donc le problème de hash car le hash proviens d'un fichier juste recemment rajouté
- Ce problème est interessant a analyser et fera surement l'object d'une issue dans le future
- Analyse d'une composition d'Adrien qui pourrai résoudre le problème **[[LIEN](https://gitlab.inria.fr/adfaure/nixos-compositions/-/tree/master)]**

---

## Semaine 9 :

## 12/06/23 :
- Modification de nur-kapack afin de résoudre le problème de hash lors de l'utilisation de NixOS Compose, l'attribut override de l'api rest a été supprimer.
- Push des changements dans la branche regale de nur-kapack (CI failed)
- Suppression de la branche regale-2211 apèrs son merge avec la branche regale
- Utilisation et Analyse du fichier de composition de oar fait par Adrien Faure
- Le fichier semble similaire mais il n'utilise plus php 74 qui est devenue décrécie avec Nix 22.11
- Commit des changemnt de oar dans regale
- Maintenant que j'ai les droits sur la prupart des project de regale je peux tester les compositions dans lesqueles je n'avais pas les droits
- Test de fonctionnement de **bdpo-oar** dans regale en utilisant Nix 22.11
- Test de fonctionnement de **bdpo** dans regale en utilisant Nix 22.11
- Test de fonctionnement de **Melissa-ear-oar** dans regale en utilisant Nix 22.11
- Test de fonctionnement de **ear** dans regale en utilisant Nix 22.11
- Il ne manque plus que **bebida**, **examon** et  **ear-oar**.

## 13/06/23 :
- Modification de regale pour faire en sorte que bebida et ear-oar fonctionnent en 22.11
- Examon ne marche pas car il manque un service, mais ce problème ne provient pas de la version de nix car il ne marche deja pas en version 22.05. Il manque le service serive.examon qui a surement été supprimer de nixpkgs ou nur-kappack
- Push de la version de la branch dans nur kapack dans la branch update-2211.
- La pipiline a fail sur ces commit car les test de oar ne marche pas correctement, mais le comportement général de oar semble correct
- **TODO** verifier quand meme le bon focntionnement de oar et de ear dans plusieur "saveurs"
- Projet suivant : 'Ear' ou 'irods' (git utile ici : https://github.com/irods/irods_demo)
- Comprehention du principe de irods
- Lecture du code de irods et de la demo afin de comprendre les grandes étapes de fonctionnement ainsi que le moyen de communication
- irods est present sur le nixpkgs il ne manquera surement que de faire les services (comme sur beegfs)

## 14/06/23 :
- Lecture de toute la docuementation autour de irods : https://docs.irods.org/4.3.0/
- Test de fonctionnement de la demo de iRODS : https://github.com/irods/irods_demo/tree/main
- Creation d'un docuement qui synthétise toutes les informations interessante sur IRODS de son installation a ses dépendances.
- Test de fonctionnement du paquet nixpkgs de iRODS
- **PROBLEME** :
  - Le paquet ne fonctionne pas
  ```
    In file included from /build/source/server/core/src/catalog_utilities.cpp:9:
    In file included from /nix/store/3rvc9ma7xli9jh0yxrk8pm9p08c9sp9r-fmt-8.1.1-dev/include/fmt/format.h:48:
    /nix/store/3rvc9ma7xli9jh0yxrk8pm9p08c9sp9r-fmt-8.1.1-dev/include/fmt/core.h:1727:3: error: static_assert failed due to requirement 'formattable' "Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt"
      static_assert(
      ^
    /nix/store/3rvc9ma7xli9jh0yxrk8pm9p08c9sp9r-fmt-8.1.1-dev/include/fmt/core.h:1853:23: note: in instantiation of function template specialization 'fmt::v8::detail::make_arg<true, fmt::v8::basic_format_context<fmt::v8::appender, char>, fmt::v8::detail::type::custom_type, const irods::experimental::catalog::entity_type &, 0>' requested here
            data_{detail::make_arg<
                          ^
    /nix/store/3rvc9ma7xli9jh0yxrk8pm9p08c9sp9r-fmt-8.1.1-dev/include/fmt/core.h:1872:10: note: in instantiation of function template specialization 'fmt::v8::format_arg_store<fmt::v8::basic_format_context<fmt::v8::appender, char>, irods::experimental::catalog::entity_type>::format_arg_store<const irods::experimental::catalog::entity_type &>' requested here
      return {std::forward<Args>(args)...};
            ^
    /nix/store/3rvc9ma7xli9jh0yxrk8pm9p08c9sp9r-fmt-8.1.1-dev/include/fmt/core.h:3119:28: note: in instantiation of function template specialization 'fmt::v8::make_format_args<fmt::v8::basic_format_context<fmt::v8::appender, char>, const irods::experimental::catalog::entity_type &>' requested here
      return vformat(fmt, fmt::make_format_args(args...));
                              ^
    /build/source/server/core/src/catalog_utilities.cpp:121:44: note: in instantiation of function template specialization 'fmt::v8::format<const irods::experimental::catalog::entity_type &>' requested here
                    irods::log(LOG_ERROR, fmt::format("Invalid entity type [entity_type => {}]", _entity_type));
                                              ^
    1 error generated.
    make[2]: *** [CMakeFiles/irods_server.dir/build.make:2148: CMakeFiles/irods_server.dir/server/core/src/catalog_utilities.cpp.o] Error 1
    make[2]: *** Waiting for unfinished jobs....
    make[1]: *** [CMakeFiles/Makefile2:748: CMakeFiles/irods_server.dir/all] Error 2
    make: *** [Makefile:156: all] Error 2
  ```
  - Le problème vient surement de fmt mais il n'y a pas de facon claire de résoudre le problème
  - Lien de quelque issues : https://github.com/fmtlib/fmt/issues/627 ; https://github.com/gabime/spdlog/issues/2345
  - Le problème peux venir de l'opérateur << qui n'est pas réconnue si on importe pas la bibliotèque `fmt/ostream.h`
  - On pourrai le résoudre si on avais access au source comme sur nur-kapack en utilisant cette commande par exemple : `sed 18 a #include <fmt/ostream.h>`.
  - Mais il n'est pas possible de modifier les sources de nixpkgs directement
  - **TODO** Discuter avec Monsieur Richard et Quentin pour savoir quoi faire et sinon faire une issue git sur fmt

## 15/06/23 :
- Comme le paquets nixpkgs ne fonctionne pas, Creation et modification d'un clone de nixpkgs pour y refaire marcher irods.
- Si le resultat final fonctionne et que je reussit a refaire fonctonner irods je pourrais rpoposer un pull-requets
- Test de fonctionnement de la demo de irods.
- Il y a un problème evec docker compose dans la demo (la version utilisé de docker compose venai de unstable)
```
=> CANCELED [metalnx 2/5] RUN apt-get update &&     apt-get install -y         netcat         postgresql-client     &&     apt-get clean                                                                      28.9s
 => [nginx-reverse-proxy 2/2] COPY irods_client_rest_cpp_reverse_proxy.conf /etc/nginx/conf.d/default.conf                                                                                                      0.8s
 => [irods-client-zmt internal] load build definition from Dockerfile                                                                                                                                           0.0s
 => => transferring dockerfile: 2B                                                                                                                                                                              0.0s
 => CANCELED [irods-client-zmt internal] load .dockerignore                                                                                                                                                     0.0s
 => => transferring context:                                                                                                                                                                                    0.0s
failed to solve: rpc error: code = Unknown desc = failed to solve with frontend dockerfile.v0: failed to read dockerfile: open /var/lib/docker/tmp/buildkit-mount2688283715/Dockerfile: no such file or directory

```
- **TODO** : faire un test de fonctionnement du docker-compose irods dans g5k en utilisant kdeploy3 pour initialiser un noeud dasn une machine virtuelle Ubuntu ou Debian 
- Relecture Rapide des nix-pills
- Creation de quelque flake et derivation pour des projets
- Test de fonctionnement des overlays nix

## 16/06/23 :
- Test de fonctionneemnt de irods dans nxc avec kadeploy dans un Ubuntu (Fonctionel)
- Lecture approfondie de la documentation Ceph afin d'essayer d'en faire une composition
- Lecture des différentes ressources disposible sur ceph
  - Test Simple : https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/ceph-single-node.nix
  - Test Multi : https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/ceph-multi-node.nix
  - Test Aprrofindie : https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/ceph-single-node-bluestore.nix
  - Dérivation : https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/filesystems/ceph/default.nix
  - Module : https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/ceph.nix
- Création d'une composition de qui va servir de base pour y faire fonctionner ceph
- Modification de la composition de base pour y rajouter les roles important de Ceph

---

## Semaine 10 :

## 19/06/23 :
- Creation de la composition ceph
- Il y a un problème de compilation
  - Le noeud ne s'active pas si on active le système dhcpcd dans le networking `dhcpcd.enable = false;`
- Creation de systeème de test sur la composition en reprensant ceux déja créé dans nixpkgs
- Creation d'une note Mardown qui synthétise les informations importante de ceph, sont fonctionnement et les dépendances
- Afin de pouvoir faire un FS ceph et non pas un système ceh il va falloir rrajouter un serveur de métadonnées dans la composition nix
- Ce système n'as pas été tester dans nix il va donc falloir le faire a la main
- Il existe cepandant dans la configuration un moyen d'activer des serveur de métadonnées.
- Test de fonctionnement d'un système plus complexe qui utilse tous les noeud de ceh et essaye de les faire fonctionner ensemble sur le réseaux.
- Finalization d'u systeme ceph pour des initlisation simple a un seul noeud
- Je ne sais pas si il sera possible de faire plusieur role ou si un role va tout contenir (à voir mais un role semble plus simple) (mais pas en accord avec nxc)

## 20/06/23 :
- Meilleur apprentissage de G5K (comment fonctionne oar...)
- Meilleur apprentissage de tmux (pour le faire fonctionner avec g5k et ssh)
- Creation d'une composition simple pour faire fonctionner ceph (ne peux pas marcher par il n'y a pas de disk avec les vm)
- Test de fonctionnement de cette composition dans g5k
  - g5k-nfs-store ne fonctionne pas il faut donc utiliser g5k-ramdisk
  - ne pas oublier de faire `oarsub -I` pour faire le build dans un noeud et non pas dans la frontale !!!
- Il y a des problème avec les IP (je les avais mise au harsard en prié mais il y a un serveur dhcp et un accès a l'extérieur cela ne peux donc pas marcher)
  - Discutution avec Olivier pour ce problème : utiliser les activations script pour récuperer l'adresse IP directement avant même le systemd
- Il y aussi un questionemment avec les osd sur comment faire pour que chaque role puisse utiliser des "identifiant différent"
  - Deux Solutions :
  - Faire une fonction dans le let et append le tout dans la set roles de nxc
  - Ou trouver un code nix capable de générer un uuid et key dans le bon format (et ce de mannière unique)
- Creation d'une liste des technologies rencontrer (avec ceux qu'il aut que je fasse une petite docuementation)   

## 21/06/23 :
- Test de fonctionnement des modules dhcp dans g5k
- Creation d'un module nix dans la composition afin de pourvoir configurer l'ip de chaque machine directement a l'initilisation
- Creation d'un code python permttant d'auto generer des uuid v4
- Creation d'un code python permettant d'auto générer des keys ceph
- Creation d'un test pour voir si le role va creer des uuid différents pour chaque insatnce de ce role
- **TODO** : corriger le bug qui refuse d'executer le code python
- Creation de multiple version de module systemd afin de savoir lequel est le plus efficace

## 22/06/23 :
- Mise a jour de la composition nix
  - Correction du service systemd de recuperation de l'adresse IP pour utiliser le chier ip_addr dans le dossier etc/nix afin de pouvoir quand même faire une configuration de ceph même si il y a plusieurs instances d'un même role
  - Ajout des fonction python de generation de uuid et de key : **Problème** :
  - Les valeur sont identique malgré le fait qu'il soie générer directement dans le role
  - Pour résoudre ce problème je pense soie créer l'uuid et la key dans un service le problème sera que nxc n'aura pas les informations
  - Ou trouver une autre soluction
- Lecture intensive du code nixos compose afin d'essayer de voir si il n'y a pas un moyen de le faire quand meme dans nxc
- **SEMINAIRE** : FGPA dans les HPC, Olivier Richard et Olivier Muller (14h->15h50)
  - Les FPGA sont des architectures reconfigurable
  - Utilise des LUT -> cad les plus petite unité recoonfigurable -> Utilise d'autre trucs BRAM (mémoire) et DSP (unité de calcul) 
  - On peux reconfigurer en utilisant des langages spécifique, VHDL, Verilog
  - Longue chaine de travail (workflow); environ 48h
  - On peux mainteant utiliser C et C++ pour faire de la configuration fpga
  - Les fpga peuvent accelerer le code si il est adapté (parrallèle)
  - Les fpga consomme moins par opération qu'un cpu ou gpu
  - Il commence a avoir un rapprochement entre gpu et fpga
  - Il y mainteant des api propriétaire qui permtte de ne plus tout devoir faire a la main
  - Cela depend beacoups des composant et machines
  - Pour faire du fpga il faut accepter de changé ses algo (remplacer les flottant par des entiers)
  - FPGA commence enfin à être un peux accessible 
- Debut de l'implementation de la martie multi node dans la composition ceph
- **TODO** : finir cette partie
- **TODO** : faire une common config afin de facilité la lecture

## 23/06/23 :
- Discution sur le problème d'autogénération des osd ceph
- Pour ce faire on va essayer de creer la même mecanique que dans nixos compose
- Donc en utilisant une méthode makeMany qui va créer un certain nombre de fois la set donnée en paramètre
- On pourras ensuite "append" ces valeurs au set role afin de pouvoir créer leur noeud
- Cette méthode est plutot simple mais le programme ne pourra pas être capable de changer de nombre d'osd à la volé sans recompiler
- On va donc mettre une valeur dans le setup.toml qui va pemettre de choisir le nombre d'osd voulu
- Mais il faudra recompiler entre chaque changement

---

## Semaine 11 :

## 26/06/23 :
- Debuggage des différentes fonctions a rajouter pour pouvoir faire des osd modulable
- Creation d'autres fonctionnement pour les même raisons
- Correction de certaines fonction
- Implementation de ces solutions dans la composition pour essayer de fauire fonctionner parfaitement
- Aide Adrien pour des test de oar avec g5k -> Priblème avec g5k-image et la fonction makeMany de nixosCompose
- Test du programme dans g5k

## 27/06/23 :
- Ecriture de Documentation et commentaire sur le code de la composition
- Ecriture de tests python nix afin de tester le bon fonctionnement de nxc
- Creation du dépot pour stocker le code la composition ceph : https://gitlab.inria.fr/nixos-compose/hpc-io/ceph-fs/-/tree/main/

## 28/06/23 :
- Lecture intensive du script python de fonctionnement de nsf
- Comphréntion de ce code
- Lecture de la docuementation de execo
- Documentation du code de ceph

## 29/06/23 :
- Correction d'un bug sur ceph
  - Une clé est créer mais doit être présente sur tous les autres noeud or il n'y a pas de communication
  - Pour ce faire utiliser les commande ceph pour utiliser une clé deja creer dans un service systemd
  - Lecture intensive de la doc ceph et des différentes commandes possible pour résoudre ce problème
- Continuation du rapport de stage

## 30/06/23 :
- Redaction du rapport
- Creation du script de base
- Test des fonctionnalitées importante ce ceph dans grid500
- Creation d'un script de test complet afin de verifier le bon fonctionnement de cephfs

---

## Semaine 12 :

## 03/07/23
- **Réunion**
  - Continuation de l'intrumentation du code de ceph
  - Push du dépot beegfs
  - Push du dépot glusterfs
  - Lecture intensive du code de orangefs pour le script execo
  - Creation d'un script de base pour "mettre en place" ceph
  - Creation de schema du workflow de packaging de FS dans nxc
- **TODO**
  - Documentation (dans le readme par exemple) de beegfs, ou on en ai, comment ça marche et raison d'arret
  - Documentation (dans le readme par exemple) de cephfs, ou on en ai, comment ça marche et raison d'arret
  - Creation d'un docuementation spécialisé pour les différent cas (systemd, activation scrip, MakmanyById...) 

## 04/07/23
- Creation d'un scrpt python de test pour tester les performances de cephfs dans g5k
- Il va falloir adapter ce code et surtout rajouter des script pour bien mettre en place ceph avant les test
- Creation de schéma mermaid pour représenter les différents fs et fonctionnement de certaines parties clé de mon stage
- Ceph a un problème de décodage de base64 dans la partie osd (a tester en au-générant puis a essayer d'automatisé)
- Avancement sur le rapport de stage (création de la table de matières + Résumé/Abstract)
- Migration du rapport de stage sur latex en utilisant rubber et pandoc

## 05/07/23
- Creation d'un shema general sur mon flow de pensé pour rajouter un Fs dans nxc
- **TODO** : Faire un shema général qui traite les cas d'utiliation de script et de role pour rajouter des services dans NXC
- Test de fonctionnement de ceph
- Lecture de la docuementation et tentative de reiinstallation complete sans suivre le test nixpkgs
- Aide Adrien a résudre le problème de g5k-image
  - Creation de l'issue du problème : https://gitlab.inria.fr/nixos-compose/nixos-compose/-/issues/33
  - Problème de déploiement même dans le cas le plus simple avec le role distribution
  - Test en 22.05 (moi), 22.11 et 23.05 (Adrien)
  - Problème semble venir de nisos compose et de la version
  - l'issues git est résolu
  - Aide de résolution de oar régale (ma branche a ete merge mais elle est pas forcement bonne)

## 06/07/23
- Mise à jour de ceph pour mettre a jour makeMany afin de commancer au bon ID les osd Ceph
- Redaction de documentation NixOS-Compose qui traite du cas d'usage d'utilisation des spcrit en NixOS-Compose
- **TODO** Faire le schéma général
- **TODO** Faire La doc pour les role
- **TODO** Finir redaction de la doc script
- Essai de rajout des mds et client dans ceph afin de le faire fonctionner
- Discution avec Adrien sur le fonctionnement des role en nxc, sur leur avantage et les closure que certaines peuvent générer

## 07/07/23
- Creation de noeud mds dans ceph et test de fonctionnement
- MDS Semble fonctionner correctment
- Je j'ai fait dans la meme machine que mon et mgr et ça semble être le plus simple
- Creation d'un Fs simple 
- Creation de pool ceph (je n'ai pas compris comment ça marche il faut revoir ça)
- Il ne manque plus que de faire un noeud simple client et essayer de monter le fs dessus
- Quand ce sera finis j'essaierai de modifier le fs pour le rendre mieux en fonction des parametre données (pgr...)
- Si tout est bon il ne manquera plus que l'automatiser et tester les performances

--- 

## Semaine 13 :

## 10/07/23

## 11/07/23

## 12/07/23

## 13/07/23

---

## Semaine 14 :

## 17/07/23

## 18/07/23

## 19/07/23

## 20/07/23

## 21/07/23

---

## Semaines 15 :

## 24/07/23

## 25/07/23

## 26/07/23

## 27/07/23

## 28/07/23