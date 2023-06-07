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

TODO
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

---
### Nur-Kapack

---
### BeegFS

---
### Regale Upgrade

---
## Ce qu'il reste a faire
