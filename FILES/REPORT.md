# Rapport d'avancement : Alexandre LITHAUD - LIG

- [Rapport d'avancement : Alexandre LITHAUD - LIG](#rapport-davancement--alexandre-lithaud---lig)
  - [Mise en contexte](#mise-en-contexte)
  - [Ce qui à été fait](#ce-qui-à-été-fait)
    - [Monté en Compétences](#monté-en-compétences)
    - [NixOS Compose](#nixos-compose)
    - [Nur-Kapack](#nur-kapack)
    - [BeegFS](#beegfs)
    - [Regale Upgrade](#regale-upgrade)
  - [Ce qu'il reste a faire](#ce-quil-reste-a-faire)

---

Ce fichier est un mini rapport qui va condenser et synthétiser les tâches réalisés ainsi que les difficultés rencontrées pendant mon stage au Laboratoire Informatique de Grenoble (LIG) dans l'équipe DATAMOVE. 

Ce fichier est séparé en grande phase du stage qui va correspondre au grande missions que j'ai eu à réaliser.

Ce fichier n'est qu'un résumé très succin des taches réalisées. Pour voir les informations précisément, il est préférable de regarder le LOGBOOK qui est mis à jour quotidiennement. **[[LIEN](../LOGBOOK.md)]**

---
## Mise en contexte

Le sujet de mon stage consiste a étudier l’écosystème Nix et NixOS et de contribuer au projet de NixOS Compose qui permet de deployer des noeuds (où machines) dans différent écosystèmes comme dans un VM ou dans Grid5000. De plus il consiste à aider l'équipe DATAMOVE en maintenant certain outils ou en réalisant divers démonstrateurs de composition pour **Nxc** (NixOS Compose) 

---
## Ce qui à été fait

### Monté en Compétences

Pendant les premières semaines de mon stage il a été important de prendre connaissance des différentes technologies qui ont été essentiel durant l'intégralité du stage.

Travaillant sur Nix il a été important de bien comprendre tous les différents aspect de Nix.

Afin de ce faire j'ai réalisé de nombreux programmes utilisant le langage de programmation fonctionnel qu'est Nix. Ces programmes ont été réaliser en suivant de nombreux tutoriels disponible sur internet, le wiki de NixOs et plus particulièrement les **Nix Pills**.

J'ai de plus, lors de mon stage installé sur une machine l'OS NixOS afin de pouvoir analyser son comportement et son fonctionnement. J'ai rapidement été passionné par le fonctionnement de la configuration system de NixOS et sur les différentes possibilités quelles entraînes. Si bien que j'ai réaliser dans mon temps libre un configuration Nix et Home manger utilisant les différents outils que j'ai utilisé lors du stage et que je continue d'utiliser aujourd'hui. (*ranger, zsh, tmux, neovim, fzf*) **[[LIEN DU GIT EN QUESTION](https://github.com/alexandreLITHAUD/my-nix-configuration)]**

Enfin, j'ai aussi étudié le fonctionnement ainsi que créé des fichiers spéciaux Nix appelé les ***flakes***. C'est fichiers, qui sont toujours expérimentaux bien que massivement utilisé, permettent de facilement et fonctionnellement créer des environnement ou des "compositions" qui sont parfaitement reproductible car ciblant en input des fichier ou dépôts distants en assurant le téléchargement de la bonne version en utilisant des hash. Cette partie à été l'une des plus importante car elle traite d'un fondement de base de nix aujourd'hui et qui essentiel dans de nombreux dépôts comme NixOs Compose par exemple.

(L'outils des flakes sont si puissant selon moi que j'ai créé quelque flake.nix dans des dépôts git afin de pouvoir automatiquement utiliser les bonne version des mise a jours grâce au Nix présent dans mon ordinateur Ubuntu)

---
### NixOS Compose

Suite à la phase de "formation" au différentes technologies nécessaire j'ai commencé à étudier le programme et le fonctionnement de NixOS Compose pour ce faire j'ai suivie un git tutoriel permettant de comprendre rapidement comment utiliser l'outils et les différentes possibilités. De plus, j'ai pu demandé directement des informations à son mainteneur et co-créateur Quentin Guilloteau.

J'ai créé quelques compositions classiques en utilisant des dépendances simple afin de tester le fonctionnement de l'outils. J'ai déployé ses applications sur plusieurs "saveur" différentes comme VM, RamDisk, Grid5000-Image ou Grid5000-nfs-store.

Les "saveurs" ou flavours est le nom donné pour les différentes options de déploiement dans grid5000.  

J'ai donc réalisé des applications simple permettant de deployer plusieurs machine possédant différents comportement en utilisant le principe de role inhérent à NixOS Compose. Ces machines communiquai entre elle a travers le réseaux Grid-5000 en utilisant le protocole NFS.

Afin de pouvoir efficacement utiliser grid-5000 j'ai du apprendre des outils comme tmux (un multiplexeur de terminal très utile pour utiliser ssh), ssh et rsync. Ces outils se son révélé essentiel afin d’accroître ma productivité sur Nxc dans le cas de déploiement de compositions de G5K.

---
### Nur-Kapack

Nix utilise un git spécial afin de stocker toutes les dérivations nécessaire afin d'installer un paquets ce git est nommé Nixpkgs **[[LIEN](https://github.com/NixOS/nixpkgs)]**. Ce dépôt est au centre du gestionnaire de paquet qu'est Nix. Cependant nixpkgs n'est pas le seul moyen de télécharger des paquets. Il existe aussi le principe de NUR. NUR est un répertoire de package Nix gérer par le communauté, les paquets sont build a partir de la source contrairement a nixpkgs et surtout les paquets de NUR ne sont pas review par des membres de nixpkgs. Tous le monde est donc libre de partager des paquets Nix sur NUR.

J'ai été amenées à étudier le fonctionnement de NUR en utilisant un dépôt distant de l'équipe OAR nommé Nur-Kapack. **[[LIEN](https://github.com/oar-team/nur-kapack)]** J'ai pu tester le fonctionnement et faire des choses qui n'était pas possible avec nixpkgs. Comme par exemple, lancer les phases de compilations d'un outils les une après les autres. Ce qui est très utile dans le cadre de mise a jour et/ou de création de paquets cela assure une bonne capacité de debug en ciblant directement les phases de compilations qui sont problématiques.

J'ai donc pu tester toutes ces fonctionnalités avec le paquet OAR dans le NUR-Kapack.

---
### BeegFS



---
### Regale Upgrade

---
## Ce qu'il reste a faire
